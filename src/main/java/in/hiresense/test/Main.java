package in.hiresense.test;

import in.hiresense.dbutils.DBConnection;
import in.hiresense.services.JobServices;

public class Main {
    public static void main(String[] args) throws Exception {
        DBConnection.openDBSession();
        JobServices.toggleJobStatus(4);
    }
}
