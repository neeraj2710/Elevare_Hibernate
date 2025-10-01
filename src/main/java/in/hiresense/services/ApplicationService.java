package in.hiresense.services;

import in.hiresense.dao.ApplicationDao;
import in.hiresense.dbutils.DBConnection;
import in.hiresense.pojo.ApplicationPojo;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.ArrayList;
import java.util.List;

public class ApplicationService {

    public static void apply(ApplicationPojo application) throws Exception{
        Session s = null;
        Transaction t = null;
        try{
            s = DBConnection.getDBSession().openSession();
            t = s.beginTransaction();
            ApplicationDao.persist(s, application);
            t.commit();
        } catch (Exception e) {
            if(t != null) t.rollback();
            System.out.println("Error in ApplicationService : "+e.getMessage());
            throw e;
        }finally{
            if(s != null) s.close();
        }
    }

    public static List<ApplicationPojo> getApplicationsByUser(int userid) throws Exception{
        Session s = null;
        List<ApplicationPojo> appList = new ArrayList<>();
        try{
            s = DBConnection.getDBSession().openSession();
            String qry = "FROM ApplicationPojo WHERE userId = :userid";
            Query<ApplicationPojo> query = s.createQuery(qry, ApplicationPojo.class);
            query.setParameter("userid", userid);
            appList = ApplicationDao.byUserId(query);
        } catch (Exception e) {
            System.out.println("Error in ApplicationService : "+e.getMessage());
            throw e;
        }finally {
            if(s != null) s.close();
            return appList;
        }
    }

    public static List<ApplicationPojo> getApplicationsByJobAndStatus(int jobId, String status)throws Exception {
       Session s = null;
       List<ApplicationPojo> appList = new ArrayList<>();
       try{
           s = DBConnection.getDBSession().openSession();
           String qry = "FROM ApplicationPojo WHERE jobId = :jobId AND status = :status";
           Query<ApplicationPojo> query = s.createQuery(qry, ApplicationPojo.class);
           query.setParameter("jobId", jobId);
           query.setParameter("status", status);
           appList = ApplicationDao.byJobIdAndStatus(query);
       }catch (Exception e) {
           System.out.println("Error in ApplicationService : "+e.getMessage());
           throw e;
       }finally {
           if(s != null) s.close();
           return appList;
       }
    }

    public static boolean updateApplicationStatus(int id, String status)throws Exception{
        Session s = null;
        boolean res = false;
        Transaction t = null;
        try{
            s = DBConnection.getDBSession().openSession();
            t = s.beginTransaction();
            String qry = "UPDATE ApplicationPojo SET status = :status WHERE id = :id";
            Query query = s.createQuery(qry);
            query.setParameter("status", status);
            query.setParameter("id", id);
            res = ApplicationDao.updateStatus(query);
            t.commit();
        }catch (Exception e) {
            if(t != null) t.rollback();
            System.out.println("Error in ApplicationService : "+e.getMessage());
            throw e;
        }finally {
            if(s != null) s.close();
            return res;
        }
    }

}
