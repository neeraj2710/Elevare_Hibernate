package in.hiresense.controllers;

import in.hiresense.services.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "UpdateUserStatusServlet", value = "/UpdateUserStatusServlet")
public class UpdateUserStatusServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("userId"));
        String status = request.getParameter("status");

        try{
            String result = UserService.updateStatus(userId, status);
            if(result!=null && result.equals(status)){
                response.sendRedirect("AdminPanelServlet?userSuccess=1");
            }else{
                response.sendRedirect("AdminPanelServlet?userSuccess=0");
            }

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}
 