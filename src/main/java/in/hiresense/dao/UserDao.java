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

    public static String updateStatus(Session s,int userId,String status)throws Exception{
            UserPojo user = s.find(UserPojo.class, userId);
            user.setStatus(status);
            UserPojo p = s.merge(user);
            return p.getStatus();
    }

    public static List<UserPojo> getFilteredUsers(Session s, String search, String role, String status) throws Exception {
        StringBuilder hql = new StringBuilder("FROM UserPojo WHERE role != 'admin'");

        // Dynamic filters
        if (search != null && !search.trim().isEmpty()) {
            hql.append(" AND (name LIKE :search OR email LIKE :search)");
        }
        if (role != null && !role.trim().isEmpty() && !role.equalsIgnoreCase("all")) {
            hql.append(" AND role = :role");
        }
        if (status != null && !status.trim().isEmpty() && !status.equalsIgnoreCase("all")) {
            hql.append(" AND status = :status");
        }

        hql.append(" ORDER BY createdAt DESC");

        Query<UserPojo> query = s.createQuery(hql.toString(), UserPojo.class);

        // Set dynamic parameters
        if (search != null && !search.trim().isEmpty()) {
            query.setParameter("search", "%" + search.trim() + "%");
        }
        if (role != null && !role.trim().isEmpty() && !role.equalsIgnoreCase("all")) {
            query.setParameter("role", role);
        }
        if (status != null && !status.trim().isEmpty() && !status.equalsIgnoreCase("all")) {
            query.setParameter("status", status);
        }

        return query.list();
    }
}
