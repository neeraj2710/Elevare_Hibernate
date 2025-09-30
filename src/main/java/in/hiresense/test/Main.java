package in.hiresense.test;

import in.hiresense.dao.JobDao;
import in.hiresense.dbutils.DBConnection;
import in.hiresense.pojo.JobPojo;
import in.hiresense.services.JobServices;

import java.util.List;

public class Main {
    public static void main(String[] args) throws Exception {
        DBConnection.openDBSession();
        List<JobPojo> list = JobServices.getAllJobsWithEmployerAndApplicationCount();
        for(JobPojo job : list) System.out.println(job);
    }
}
