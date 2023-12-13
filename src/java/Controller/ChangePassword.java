
package Controller;

import DAO.UserHandle;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import Model.User_Acc;

@WebServlet(name="ChangePassword", urlPatterns={"/change-password"})
public class ChangePassword extends HttpServlet {
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        request.getRequestDispatcher("/main/account/change-password.jsp").forward(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String oldPw = request.getParameter("oldPassword");
        String newPw = request.getParameter("newPassword");
        String cf_newPw = request.getParameter("cfNewPassword");
        
        if(!newPw.equals(cf_newPw)){
            request.setAttribute("mess", "Confirm password error!");
            request.getRequestDispatcher("/main/account/change-password.jsp").forward(request, response);
            return;
        }
        
        HttpSession session = request.getSession();
        UserHandle urd = new UserHandle();
        User_Acc ua = (User_Acc) session.getAttribute("account");
        
        if(!oldPw.equals(ua.getPassword())){
            request.setAttribute("mess", "Wrong old password!");
            request.getRequestDispatcher("/main/account/change-password.jsp").forward(request, response);
            return;
        }
        
        urd.changePw(newPw, ua.getId());
        request.setAttribute("mess", "Change successfully!");
        request.getRequestDispatcher("/main/account/change-password.jsp").forward(request, response);
        return;
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
