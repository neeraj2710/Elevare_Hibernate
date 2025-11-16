package in.hiresense.services;

import in.hiresense.dao.ResumeAnalysisLogDao;
import in.hiresense.dbutils.DBConnection;
import in.hiresense.pojo.ResumeAnalysisLogsPojo;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

public class ResumeAnalysisLogService {

    public static void saveLog(int userId, String resultJson) throws Exception {
        Transaction t = null;
        try (Session s = DBConnection.getDBSession().openSession()) {
            t = s.beginTransaction();
            ResumeAnalysisLogDao.saveLog(s, userId,resultJson);
            t.commit();
        } catch (Exception e) {
            if (t != null) t.rollback();
            System.out.println("Error in ResumeAnalysisLogService saveLog() : " + e.getMessage());
            e.printStackTrace();
        }
    }

    public static List<ResumeAnalysisLogsPojo> getLogsByUser(int userId) throws Exception {
        try (Session s = DBConnection.getDBSession().openSession()) {
            return ResumeAnalysisLogDao.getLogsByUser(s, userId);
        } catch (Exception e) {
            System.out.println("Error in ResumeAnalysisLogService getLogsByUser() : " + e.getMessage());
            e.printStackTrace();
            throw e;
        }
    }

}
