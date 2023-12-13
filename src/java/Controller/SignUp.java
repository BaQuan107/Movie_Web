
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
import Model.User_Info;

@WebServlet(name="SignUp", urlPatterns={"/signup"})
public class SignUp extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session = request.getSession();
        if(session.getAttribute("account")!=null){
            response.sendRedirect("/Movie_Web/");
            return;
        }
        request.getRequestDispatcher("/main/account/signup.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String password_confirmation = request.getParameter("password_confirmation");
        
        if(username=="" || password=="" || password_confirmation==""){
            if(username=="")
                request.setAttribute("errorU", "Input required!");
            if(password=="")
                request.setAttribute("errorP", "Input required!");
            if(password_confirmation=="")
                request.setAttribute("errorRP", "Input required!");
            request.getRequestDispatcher("/main/account/signup.jsp").forward(request, response);
            return;
        }
        
        if(!password.equals(password_confirmation)){
            request.setAttribute("errorRP", "Password confirmation wrong!");
            request.getRequestDispatcher("/main/account/signup.jsp").forward(request, response);
            return;
        }
        
        HttpSession session = request.getSession();
        UserHandle uad = new UserHandle();
        User_Acc ua = uad.FindExistUserAcc(username);
        if(ua!=null){
            request.setAttribute("errorU", "Username existed!");
            request.getRequestDispatcher("/main/account/signup.jsp").forward(request, response);
            return;
        }
        uad.addSignUpAcc(username, password);
        User_Acc newAcc = uad.findAcc(username, password);
        uad.addDefaultInfo(newAcc.getId());
        User_Info ui = uad.getUserInfoByUser_AccId(newAcc.getId());
        session.setAttribute("account", newAcc);
        session.setAttribute("user_info", ui);
        response.sendRedirect("my-info");
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
