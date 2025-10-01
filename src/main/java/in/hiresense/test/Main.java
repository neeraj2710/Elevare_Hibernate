package in.hiresense.test;

import in.hiresense.dao.ApplicationDao;
import in.hiresense.dao.JobDao;
import in.hiresense.dao.UserDao;
import in.hiresense.dbutils.DBConnection;
import in.hiresense.pojo.ApplicationPojo;
import in.hiresense.pojo.JobPojo;
import in.hiresense.services.ApplicationService;
import in.hiresense.services.JobServices;
import in.hiresense.services.UserService;

import java.util.List;

public class Main {
    public static void main(String[] args) throws Exception {
        DBConnection.openDBSession();


        List<ApplicationPojo> applicationsByUser = ApplicationService.getApplicationsByJobAndStatus(7, "applied");
        for(ApplicationPojo app : applicationsByUser){
            System.out.println(app);
        }

    }
}
