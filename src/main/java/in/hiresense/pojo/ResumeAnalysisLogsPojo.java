package in.hiresense.pojo;

import jakarta.persistence.*;


@Entity
@Table(name = "resume_analysis_logs")
public class ResumeAnalysisLogsPojo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(name = "user_id")
    private int userId;
    @Column(name = "result_json")
    private String jsonResult;
    @Column(name = "created_at", insertable = false)
    private String createdAt;


    public ResumeAnalysisLogsPojo(int id, int userId, String jsonResult, String createdAt) {
        this.id = id;
        this.userId = userId;
        this.jsonResult = jsonResult;
        this.createdAt = createdAt;
    }

    public ResumeAnalysisLogsPojo() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getJsonResult() {
        return jsonResult;
    }

    public void setJsonResult(String jsonResult) {
        this.jsonResult = jsonResult;
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }

    @Override
    public String toString() {
        return "ResumeAnalysisLogsPojo{" +
                "id=" + id +
                ", userId=" + userId +
                ", jsonResult='" + jsonResult + '\'' +
                ", createdAt='" + createdAt + '\'' +
                '}';
    }
}
