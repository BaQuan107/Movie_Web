/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import DAO.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author baqua
 */
@WebServlet(name="LoginController", urlPatterns={"/login"})
public class LoginController extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
    } 

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String account =request.getParameter("account");
            String pass =request.getParameter("pass");
            // nhờ model xử lý 
            UserDAO u = new UserDAO();
            boolean check = u.checkLogin(account, pass);
            if(u.checkLogin(account, pass) ){
                //login thanh cong
                
                
                request.getRequestDispatcher("index.html").forward(request, response);
                
                
            }
            else{
                
                    request.getRequestDispatcher("index1.html").forward(request, response);
                  
                }
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
