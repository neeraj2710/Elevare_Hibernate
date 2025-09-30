package in.hiresense.dao;


import in.hiresense.pojo.JobPojo;
import org.hibernate.Session;
import org.hibernate.query.Query;

import java.util.ArrayList;
import java.util.List;

public class JobDao {

    public static boolean save(Session s, JobPojo job) throws Exception {
        s.persist(job);
        return job.getId() > 0;
    }

    public static JobPojo findById(Session s, int id) throws Exception {
        return s.find(JobPojo.class, id);
    }

    public static List<JobPojo> FindAllByEmployerId(Query query) throws Exception {
        List<Object[]> results = query.getResultList();
        List<JobPojo> jobList = new ArrayList<>();
        for (Object[] result : results) {
            JobPojo job = (JobPojo) result[0];
            Long applicantCount = (Long) result[1];
            job.setApplicantCount(applicantCount.intValue());
            jobList.add(job);
        }
        return jobList;
    }

    public static void toggler(Session s, int jobId)throws Exception{
        Query<?> q = s.createQuery(
                "update JobPojo set status = case when status = 'active' then 'inactive' else 'active' end where id = :id"
        );
        q.setParameter("id", jobId);
        q.executeUpdate();
    }

    public static void remove(Session s, JobPojo job)throws Exception{

            Query<?> deleteApplications = s.createQuery("delete from ApplicationPojo where jobId = :jobId");
            deleteApplications.setParameter("jobId", job.getId());
            deleteApplications.executeUpdate();
            s.remove(job);

    }
}
