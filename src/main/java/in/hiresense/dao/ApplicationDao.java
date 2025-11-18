package in.hiresense.dao;

import in.hiresense.pojo.ApplicationPojo;
import jakarta.ws.rs.core.Application;
import org.hibernate.Session;
import org.hibernate.query.Query;

import java.util.List;

public class ApplicationDao {

    public static void persist(Session s, ApplicationPojo application)throws Exception{
        s.persist(application);
    }

    public static List<ApplicationPojo> byUserId(Query query)throws Exception{
        return query.getResultList();
    }

    public static List<ApplicationPojo> byJobIdAndStatus(Query query)throws Exception{
        return query.getResultList();
    }

    public static boolean updateStatus(Query query)throws Exception{
        return query.executeUpdate()>0;
    }

    public static ApplicationPojo findById(Session s,int appId)throws Exception{
        return s.find(ApplicationPojo.class, appId);
    }
}
