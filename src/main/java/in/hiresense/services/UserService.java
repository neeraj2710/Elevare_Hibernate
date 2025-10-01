package in.hiresense.services;

import in.hiresense.dao.UserDao;
import in.hiresense.dbutils.DBConnection;
import in.hiresense.pojo.UserPojo;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.ArrayList;
import java.util.List;

public class UserService {
    public static int registerUser(UserPojo user)throws Exception{
        Transaction t = null;
        int res = 0;
        try(Session s = DBConnection.getDBSession().openSession()){
            t = s.beginTransaction();
            res = UserDao.save(s,user);
            t.commit();
        } catch (Exception e) {
            if(t != null) t.rollback();
            System.out.println("Error in registerUser() UserService: "+e.getMessage());
            throw e;
        }finally {
            return res;
        }
    }

    public static UserPojo getUserByEmail(String email)throws Exception{
        UserPojo user = null;
        try(Session s = DBConnection.getDBSession().openSession()){
            user = UserDao.findByEmail(s,email);
        } catch (Exception e) {
            System.out.println("Error in getUserByEmail() UserService: "+e.getMessage());
            throw e;
        }finally{
            return user;
        }
    }

    public static UserPojo getUserById(int id)throws Exception{
        UserPojo user = null;
        try(Session s = DBConnection.getDBSession().openSession()){
            user = UserDao.findById(s,id);
        } catch (Exception e) {
            System.out.println("Error in getUserById() UserService: "+e.getMessage());
            throw e;
        }finally{
            return user;
        }
    }

    public static List<UserPojo> getAllUsers()throws Exception{
        Session s = null;
        List<UserPojo> userList = new ArrayList<>();
        try{
            s = DBConnection.getDBSession().openSession();
            Query<UserPojo> q = s.createQuery("from UserPojo", UserPojo.class);
            userList = UserDao.getAllUsers(q);
        }catch (Exception e) {
            System.out.println("Error in UserService: "+e.getMessage());
            throw e;
        }finally{
            return userList;
        }
    }

    public static void updateStatus(int id, String status)throws Exception{
        Session s = null;
        Transaction t = null;
        try{
            s = DBConnection.getDBSession().openSession();
            t = s.beginTransaction();
            UserDao.updateStatus(s,id, status);
            t.commit();
        }catch (Exception e) {
            t.rollback();
            System.out.println("Error in UserService: "+e.getMessage());
            throw e;
        }finally{
            if(s!=null) s.close();
        }
    }
}
