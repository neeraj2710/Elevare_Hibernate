package in.hiresense.services;

import in.hiresense.dao.JobDao;
import in.hiresense.dbutils.DBConnection;
import in.hiresense.pojo.JobPojo;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

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

    public static void toggleJobStatus(int jobId)throws Exception{
        Transaction t = null;
        try(Session s = DBConnection.getDBSession().openSession()){
            t = s.beginTransaction();
            JobDao.toggler(s, jobId);
            t.commit();
        } catch (Exception e) {
            if(t != null) t.rollback();
            throw new RuntimeException(e);
        }
    }

    public static boolean deleteJob(int jobId)throws Exception{
        Session s = DBConnection.getDBSession().openSession();
        Transaction t = s.beginTransaction();
        try{
            JobPojo job = JobServices.getJobById(jobId);
            if(job == null){
                t.rollback();
                return false;
            }
            JobDao.remove(s,job);
            t.commit();
            return true;
        } catch (Exception e) {
            t.rollback();
            throw e;
        }finally {
            s.close();
        }
    }
}