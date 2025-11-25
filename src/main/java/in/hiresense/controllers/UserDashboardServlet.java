package in.hiresense.controllers;

import in.hiresense.pojo.ApplicationPojo;
import in.hiresense.pojo.JobPojo;
import in.hiresense.pojo.ResumeAnalysisLogsPojo;
import in.hiresense.services.ApplicationService;
import in.hiresense.services.JobServices;
import in.hiresense.services.ResumeAnalysisLogService;
import in.hiresense.utils.AffindaAPI;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.json.JSONObject;

import java.io.IOException;
import java.util.*;

@WebServlet(name = "UserDashboardServlet", value = "/UserDashboardServlet")
public class UserDashboardServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request,response);
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        HttpSession session = request.getSession(false);
        if(session == null || session.getAttribute("userId") == null){
            response.sendRedirect("login.jsp");
            return;
        }

        int userId = (Integer)session.getAttribute("userId");
        String search = request.getParameter("search");
        String sort = request.getParameter("sort");
        String location = request.getParameter("location");
        String experience = request.getParameter("experience");
        String packageLpa = request.getParameter("packageLpa");

        try{
            List<ResumeAnalysisLogsPojo> logs = ResumeAnalysisLogService.getLogsByUser(userId);
            boolean resumeUploaded = !logs.isEmpty();
            System.out.println(resumeUploaded);
            List<String> userSkills = null;
            if(resumeUploaded){
                JSONObject obj = new JSONObject(logs.get(0).getJsonResult());
                userSkills = AffindaAPI.extractSkills(obj.toString());
            }
            List<JobPojo> jobs = JobServices.getAllJobsForUserDashboard(
                    search,
                    sort,
                    location,
                    experience,
                    packageLpa);
            if(resumeUploaded && userSkills!=null){
                for(JobPojo job : jobs){
                    int score = AffindaAPI.calculateMatchScore(job.getSkills(), userSkills);
                    job.setScore(score);
                }
            }
            List<ApplicationPojo> applicationList = ApplicationService.getApplicationsByUser(userId);
            Map<Integer,String> appliedJobIds = new HashMap<>();
            for(ApplicationPojo app : applicationList){
                appliedJobIds.put(app.getJobId(),app.getStatus());
            }
            request.setAttribute("jobs", jobs);
            request.setAttribute("appliedJobIds", appliedJobIds);
            request.setAttribute("search", search);
            request.setAttribute("location", location);
            request.setAttribute("sort", sort);
            request.setAttribute("experience", experience);
            request.setAttribute("packageLpa", packageLpa);
            request.setAttribute("resumeUploaded", resumeUploaded);
            request.setAttribute("success",request.getParameter("success"));
            request.getRequestDispatcher("userDashboard.jsp").forward(request, response);

        } catch (Exception e) {
            response.sendRedirect("error.jsp");
        }

    }
    
}
 