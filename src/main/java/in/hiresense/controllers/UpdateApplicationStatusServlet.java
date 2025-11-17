package in.hiresense.controllers;

import in.hiresense.services.ApplicationService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "UpdateApplicationStatus", value = "/UpdateApplicationStatus")
public class UpdateApplicationStatusServlet extends HttpServlet {
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

        int appId = Integer.parseInt(request.getParameter("appId"));
        int jobId = Integer.parseInt(request.getParameter("jobId"));
        String status = request.getParameter("status");

        try{
            boolean result = ApplicationService.updateApplicationStatus(appId, status);
            request.setAttribute("jobId", jobId);
            if(result){
                request.getRequestDispatcher("ViewApplicantsServlet?update=1&jobId="+jobId).forward(request, response);
            }else {
                request.getRequestDispatcher("ViewApplicantsServlet?update=0&jobId="+jobId).forward(request, response);
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}
 