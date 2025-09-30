package in.hiresense.services;

import in.hiresense.dao.JobDao;
import in.hiresense.dbutils.DBConnection;
import in.hiresense.pojo.JobPojo;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.ArrayList;
import java.util.List;

public class JobServices {
    public static boolean postJob(JobPojo job) throws Exception {
        Transaction t = null;
        boolean res = false;
        try (Session s = DBConnection.getDBSession().openSession()) {
            t = s.beginTransaction();
            res = JobDao.save(s, job);
            t.commit();
        } catch (Exception e) {
            if (t != null) t.rollback();
            System.out.println("Error in JobService postJob() : " + e.getMessage());
            e.printStackTrace();
        } finally {
            return res;
        }
    }

    public static JobPojo getJobById(int id) throws Exception {
        JobPojo job = null;
        try (Session s = DBConnection.getDBSession().openSession()) {
            job = JobDao.findById(s, id);
        } catch (Exception e) {
            System.out.println("Error in JobService getJobById() : " + e.getMessage());
            e.printStackTrace();
        } finally {
            return job;
        }
    }

    public static List<JobPojo> getJobsByEmployer(int employerId, String search, String status, String sort) throws Exception {
        Session session = null;
        try {
            // Get a session from DBConnection
            session = DBConnection.getDBSession().openSession();

            // Base HQL query to fetch job details along with the count of applications
            StringBuilder hql = new StringBuilder(
                    "SELECT j, (SELECT COUNT(a) FROM ApplicationPojo a WHERE a.jobId = j.id) " +
                            "FROM JobPojo j WHERE j.employerId = :employerId"
            );

            // Add search condition if the search term is provided
            if (search != null && !search.trim().isEmpty()) {
                hql.append(" AND j.title LIKE :search");
            }

            // Add a job status filter if provided
            if (status != null && !status.trim().isEmpty()) {
                hql.append(" AND j.status = :status");
            }

            // Handle sorting based on the applicant count or created_at
            if ("asc".equalsIgnoreCase(sort)) {
                hql.append(" ORDER BY (SELECT COUNT(a) FROM ApplicationPojo a WHERE a.jobId = j.id) ASC");
            } else if ("desc".equalsIgnoreCase(sort)) {
                hql.append(" ORDER BY (SELECT COUNT(a) FROM ApplicationPojo a WHERE a.jobId = j.id) DESC");
            } else {
                hql.append(" ORDER BY j.createdAt DESC");
            }
            // Create a query
            Query<Object[]> query = session.createQuery(hql.toString(), Object[].class);

            // Set parameters
            query.setParameter("employerId", employerId);

            if (search != null && !search.trim().isEmpty()) {
                query.setParameter("search", "%" + search + "%");
            }

            if (status != null && !status.trim().isEmpty()) {
                query.setParameter("status", status);
            }
            return JobDao.FindAllByEmployerId(query);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static void toggleJobStatus(int jobId) throws Exception {
        Transaction t = null;
        try (Session s = DBConnection.getDBSession().openSession()) {
            t = s.beginTransaction();
            JobDao.toggler(s, jobId);
            t.commit();
        } catch (Exception e) {
            if (t != null) t.rollback();
            throw new RuntimeException(e);
        }
    }

    public static boolean deleteJob(int jobId) throws Exception {
        Session s = DBConnection.getDBSession().openSession();
        Transaction t = s.beginTransaction();
        try {
            JobPojo job = JobServices.getJobById(jobId);
            if (job == null) {
                t.rollback();
                return false;
            }
            JobDao.remove(s, job);
            t.commit();
            return true;
        } catch (Exception e) {
            t.rollback();
            throw e;
        } finally {
            s.close();
        }
    }

    public static List<JobPojo> getAllJobsForUserDashboard(String search, String sort, String location, String experience, String packageLpa) throws Exception {
        Session s = null;
        List<JobPojo> jobList = new ArrayList<>();
        try {
            s = DBConnection.getDBSession().openSession();

            StringBuilder hql = new StringBuilder("FROM JobPojo j WHERE j.status = :status");

//            search condition
            if (search != null && !search.trim().isEmpty())
                hql.append(" AND(j.title LIKE :search OR j.company LIKE :search)");

//            location filter
            if (location != null && !location.trim().isEmpty()) hql.append(" AND j.location = :location");

//            Experience filter
            if (experience != null && !experience.trim().isEmpty()) hql.append(" AND j.experience = :experience");

//            packageLpa filter
            if (packageLpa != null && !packageLpa.trim().isEmpty()) hql.append(" AND j.package_lpa = :packageLpa");

//            sorting
            if ("asc".equalsIgnoreCase(sort)) {
                hql.append(" ORDER BY j.vacancies ASC");
            } else if ("desc".equalsIgnoreCase(sort)) {
                hql.append(" ORDER BY j.vacancies DESC");
            } else {
                hql.append(" ORDER BY j.createdAt DESC");
            }

            // Query creates
            Query<JobPojo> query = s.createQuery(hql.toString(), JobPojo.class);
            query.setParameter("status", "active");

            // Parameters set
            if (search != null && !search.trim().isEmpty()) {
                String keyword = "%" + search.trim() + "%";
                query.setParameter("search", keyword);
            }

            if (location != null && !location.trim().isEmpty()) {
                query.setParameter("location", location.trim());
            }

            if (experience != null && !experience.trim().isEmpty()) {
                query.setParameter("experience", experience.trim());
            }

            if (packageLpa != null && !packageLpa.trim().isEmpty()) {
                query.setParameter("packageLpa", packageLpa.trim());
            }

            jobList = JobDao.getAllJobs(s, query);

        } catch (Exception e) {
            System.out.println("Error in JobService class");
            throw new Exception("Error fetching jobs", e);
        } finally {
            if (s != null) {
                s.close();
            }
            return jobList;
        }
    }

    public static List<JobPojo> getAllJobsWithEmployerAndApplicationCount()throws Exception{
        Session s = null;
        List<JobPojo> jobList = new ArrayList<>();
        try{

            s = DBConnection.getDBSession().openSession();
            String hql = "SELECT j,(SELECT COUNT(a) FROM ApplicationPojo a WHERE a.jobId = j.id) FROM JobPojo j";

            Query qry = s.createQuery(hql);
            jobList = JobDao.getAllJobsWithEmployerAndApplicationCount(qry);
        } catch (Exception e) {
            System.out.println("Error in JobService: "+e.getMessage());
            e.printStackTrace();
            throw e;
        }finally {
            if(s != null) s.close();
            return jobList;
        }
    }
}
