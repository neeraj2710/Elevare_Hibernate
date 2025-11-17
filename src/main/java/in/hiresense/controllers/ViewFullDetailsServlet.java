package in.hiresense.controllers;

import in.hiresense.pojo.ApplicationPojo;
import in.hiresense.pojo.ResumeAnalysisLogsPojo;
import in.hiresense.services.ApplicationService;
import in.hiresense.services.ResumeAnalysisLogService;
import in.hiresense.utils.AffindaAPI;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "ViewFullDetailsServlet", value = "/ViewFullDetailsServlet")
public class ViewFullDetailsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if(session.getAttribute("userId") == null || !session.getAttribute("userRole").equals("employer")){
            response.sendRedirect("login.jsp");
            return;
        }

        int id = Integer.parseInt(request.getParameter("id"));
        int jobId = Integer.parseInt(request.getParameter("jobId"));
        try{
            List<ResumeAnalysisLogsPojo> list = ResumeAnalysisLogService.getLogsByUser(id);
            String resultJson = list.get(0).getJsonResult();
            String summary = AffindaAPI.extractSummary(resultJson);
            String personalDetails = AffindaAPI.extractPersonalDetails(resultJson);
            String education = AffindaAPI.extractEducation(resultJson);
            String workEx = AffindaAPI.extractWorkExperience(resultJson);
            List<String> skills = AffindaAPI.extractSkills(resultJson);

            request.setAttribute("summary" , summary);
            request.setAttribute("personalDetails", personalDetails);
            request.setAttribute("education", education);
            request.setAttribute("workEx", workEx);
            request.setAttribute("skills", skills);
            request.setAttribute("jobId", jobId);

            request.getRequestDispatcher("viewFullDetails.jsp").forward(request, response);

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}
 