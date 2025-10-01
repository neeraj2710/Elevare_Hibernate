package in.hiresense.dao;

import in.hiresense.dbutils.DBConnection;
import in.hiresense.pojo.UserPojo;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import java.util.ArrayList;
import java.util.List;


public class UserDao {
    public static int save(Session s, UserPojo user)throws Exception{
        s.persist(user);
        if(user.getId() != 0) return 1;
        return 0;
    }
    public static UserPojo findByEmail(Session s, String email)throws Exception{
        UserPojo user = null;
        Query<UserPojo> q = s.createQuery("from UserPojo where email = :email", UserPojo.class);
        q.setParameter("email", email);
        user = (UserPojo) q.uniqueResult();
        return user;
    }

    public static UserPojo findById(Session s, int id)throws Exception{
        return s.find(UserPojo.class, id);
    }

    public static List<UserPojo> getAllUsers(Query query)throws Exception {
        return query.list();
    }

    public static void updateStatus(Session s,int userId,String status)throws Exception{
            UserPojo user = s.find(UserPojo.class, userId);
            user.setStatus(status);
            s.merge(user);
    }
}
