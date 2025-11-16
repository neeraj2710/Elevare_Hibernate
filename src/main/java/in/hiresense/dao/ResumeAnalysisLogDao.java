package in.hiresense.dao;

import in.hiresense.pojo.ResumeAnalysisLogsPojo;
import jakarta.transaction.Transactional;
import org.hibernate.Session;
import org.hibernate.query.Query;
import java.util.List;

public class ResumeAnalysisLogDao {
    @Transactional
    public static void saveLog(Session s, int userId, String resultJson) throws Exception {
        ResumeAnalysisLogsPojo log = new ResumeAnalysisLogsPojo();
        log.setUserId(userId);
        log.setJsonResult(resultJson);
        s.persist(log);
    }

    public static List<ResumeAnalysisLogsPojo> getLogsByUser(Session s, int userId) throws Exception {
        Query<ResumeAnalysisLogsPojo> q = s.createQuery(
            "from ResumeAnalysisLogsPojo where userId = :userId order by createdAt DESC",
            ResumeAnalysisLogsPojo.class
        );
        q.setParameter("userId", userId);
        return q.list();
    }
}
