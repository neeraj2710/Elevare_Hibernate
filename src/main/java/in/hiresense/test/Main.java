package in.hiresense.test;

import in.hiresense.dao.JobDao;
import in.hiresense.dbutils.DBConnection;
import in.hiresense.services.JobServices;

public class Main {
    public static void main(String[] args) throws Exception {
        DBConnection.openDBSession();
        System.out.println(JobServices.deleteJob(6));
    }
}
