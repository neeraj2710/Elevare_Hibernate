package in.hiresense.controllers;

import in.hiresense.pojo.JobPojo;
import in.hiresense.pojo.UserPojo;
import in.hiresense.services.JobServices;
import in.hiresense.services.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "AdminPanelServlet", value = "/AdminPanelServlet")
public class AdminPanelServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        System.out.println("in adminpanel servlet user id :" +session.getAttribute("userId"));
        System.out.println("in adminpanel servlet user role :" +session.getAttribute("userRole"));
        if( session.getAttribute("userId") == null || !"admin".equals(session.getAttribute("userRole"))){
            response.sendRedirect("login.jsp");
            return;
        }
        int userId = (Integer) session.getAttribute("userId");
        String search = request.getParameter("search");
        String  role = request.getParameter("role");
        String status = request.getParameter("status");

        try{
            List<UserPojo> userList = UserService.getFilteredUsers(search, role, status);
            List<JobPojo> jobList = JobServices.getAllJobsWithEmployerAndApplicantCount();

            request.setAttribute("search", search);
            request.setAttribute("role", role);
            request.setAttribute("status", status);
            request.setAttribute("userList", userList);
            request.setAttribute("jobList", jobList);
            request.setAttribute("userSuccess", request.getParameter("userSuccess"));
            request.setAttribute("delete", request.getParameter("delete"));

            request.getRequestDispatcher("adminPanel.jsp").forward(request, response);
        } catch (Exception e) {
            System.out.println("Error in AdminPanelServlet "+e.getMessage());
            e.printStackTrace();
        }
    }

}
 