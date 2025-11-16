package in.hiresense.dbutils;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class DBConnection {
    private static SessionFactory sf;
    public static void openDBSession(){
        Configuration config = new Configuration();
        config.addAnnotatedClasses(in.hiresense.pojo.JobPojo.class);
        config.addAnnotatedClasses(in.hiresense.pojo.UserPojo.class);
        config.addAnnotatedClasses(in.hiresense.pojo.ApplicationPojo.class);
        config.addAnnotatedClasses(in.hiresense.pojo.ResumeAnalysisLogsPojo.class);
        config.configure();
        sf = config.buildSessionFactory();
    }
    public static SessionFactory getDBSession(){
        return sf;
    }
    public static void closeDBSession(){
        sf.close();
    }
}
