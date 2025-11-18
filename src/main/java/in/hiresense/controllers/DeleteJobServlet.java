package in.hiresense.controllers;

import in.hiresense.services.JobServices;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "DeleteJobServlet", value = "/DeleteJobServlet")
public class DeleteJobServlet extends HttpServlet {
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
        if( session.getAttribute("userId") == null || !"admin".equals(session.getAttribute("userRole"))){
            response.sendRedirect("login.jsp");
            return;
        }

        int jobId = Integer.parseInt(request.getParameter("jobId"));
        try{
            if(JobServices.deleteJob(jobId)){
                response.sendRedirect("AdminPanelServlet?delete=1");
            }else{
                response.sendRedirect("AdminPanelServlet?delete=0");
            }
        } catch (Exception e) {
            System.out.println("Error in delete job servlet "+e.getMessage());
            e.printStackTrace();

        }

    }

}
 