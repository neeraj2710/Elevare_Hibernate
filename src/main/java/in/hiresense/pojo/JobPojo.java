package in.hiresense.pojo;

import jakarta.persistence.*;

import java.util.Date;
@Entity
@Table(name = "jobs")
public class JobPojo {
    @Id
    @Column(name = "id", insertable = false)
    private int id;
    @Column(name = "title")
    private String title;
    @Column(name = "description")
    private String description;
    @Column(name = "skills")
    private String skills;
    @Column(name = "company")
    private String company;
    @Column(name = "location")
    private String location;
    @Column(name = "experience")
    private String experience;
    @Column(name = "package_lpa")
    private String packageLpa;
    @Column(name = "vacancies")
    private int vacancies;
    @Column(name = "employer_id")
    private int employerId;
    @Column(name = "created_at",insertable = false)
    private Date createdAt;
    @Column(name = "status", insertable = false)
    private String status;
    @Transient
    private int applicantCount;
    @Transient
    private double score;

    public JobPojo(int id, String title, String description, String skills, String company, String location, String experience, String packageLpa, int vacancies, int employerId, Date createdAt, String status, int applicantCount, double score) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.skills = skills;
        this.company = company;
        this.location = location;
        this.experience = experience;
        this.packageLpa = packageLpa;
        this.vacancies = vacancies;
        this.employerId = employerId;
        this.createdAt = createdAt;
        this.status = status;
        this.applicantCount = applicantCount;
        this.score = score;
    }

    public JobPojo() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getSkills() {
        return skills;
    }

    public void setSkills(String skills) {
        this.skills = skills;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getExperience() {
        return experience;
    }

    public void setExperience(String experience) {
        this.experience = experience;
    }

    public String getPackageLpa() {
        return packageLpa;
    }

    public void setPackageLpa(String packageLpa) {
        this.packageLpa = packageLpa;
    }

    public int getVacancies() {
        return vacancies;
    }

    public void setVacancies(int vacancies) {
        this.vacancies = vacancies;
    }

    public int getEmployerId() {
        return employerId;
    }

    public void setEmployerId(int employerId) {
        this.employerId = employerId;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getApplicantCount() {
        return applicantCount;
    }

    public void setApplicantCount(int applicantCount) {
        this.applicantCount = applicantCount;
    }

    public double getScore() {
        return score;
    }

    public void setScore(double score) {
        this.score = score;
    }

    @Override
    public String toString() {
        return "JobPojo{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", description='" + description + '\'' +
                ", skills='" + skills + '\'' +
                ", company='" + company + '\'' +
                ", location='" + location + '\'' +
                ", experience='" + experience + '\'' +
                ", packageLpa='" + packageLpa + '\'' +
                ", vacancies=" + vacancies +
                ", employerId=" + employerId +
                ", createdAt=" + createdAt +
                ", status='" + status + '\'' +
                ", applicantCount=" + applicantCount +
                ", score=" + score +
                '}';
    }
}
