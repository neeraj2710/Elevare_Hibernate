package in.hiresense.services;

import in.hiresense.dao.UserDao;
import in.hiresense.dbutils.DBConnection;
import in.hiresense.pojo.UserPojo;
import org.hibernate.Session;
import org.hibernate.Transaction;

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
            e.printStackTrace();
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
            e.printStackTrace();
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
            e.printStackTrace();
        }finally{
            return user;
        }
    }
}
