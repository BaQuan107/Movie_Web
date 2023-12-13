package Controller;

import DAO.UserHandle;
import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import GoogleCommon.GooglePojo;
import GoogleCommon.GoogleUtils;
import Model.User_Acc;
import Model.User_Info;
import jakarta.servlet.http.HttpSession;
import java.io.PrintWriter;

@WebServlet("/login-google")
public class LoginGoogleController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public LoginGoogleController() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String code = request.getParameter("code");
        PrintWriter out = response.getWriter();

        if (code == null || code.isEmpty()) {
            RequestDispatcher dis = request.getRequestDispatcher("/main/account/login.jsp");
            dis.forward(request, response);
        } else {
            String accessToken = GoogleUtils.getToken(code);
            GooglePojo googlePojo = GoogleUtils.getUserInfo(accessToken);
            out.println(googlePojo.getId());
            
            out.println(googlePojo.getEmail());
            out.println(googlePojo.getGiven_name());
            out.println(googlePojo.getPicture());
            String username = "";
            int atIndex = googlePojo.getEmail().indexOf('@');

            // Kiểm tra xem có ký tự "@" trong chuỗi không
            if (atIndex != -1) {
                // Sử dụng phương thức substring để lấy phần trước ký tự "@"
                String u = googlePojo.getEmail().substring(0, atIndex);
                username = u;
            }
            out.println(username);

//            HttpSession session = request.getSession();
//            UserHandle uad = new UserHandle();
//            User_Acc ua = uad.FindExistUserAcc(username);
//            if (ua != null) {
//                request.setAttribute("errorU", "Username existed!");
//                request.getRequestDispatcher("/main/account/signup.jsp").forward(request, response);
//                return;
//            }
//            uad.addSignUpAcc(googlePojo.getEmail(), "109082865770665662454");
//            User_Acc newAcc = uad.findAcc(username, password);
//            uad.addDefaultInfo(newAcc.getId());
//            User_Info ui = uad.getUserInfoByUser_AccId(newAcc.getId());
//            session.setAttribute("account", newAcc);
//            session.setAttribute("user_info", ui);
//            response.sendRedirect("my-info");
            
            
//            UserHandle uad = new UserHandle();
//            User_Acc ua = uad.findAcc(username, password);
//            HttpSession session = request.getSession();
//            if (ua == null) {
//                request.setAttribute("error", "Wrong username or password!");
//                request.getRequestDispatcher("/main/account/login.jsp").forward(request, response);
//            } //being block
//            else if (ua.getState() == 1) {
//                request.setAttribute("error", "Your account are being blocked!");
//                request.getRequestDispatcher("/main/account/login.jsp").forward(request, response);
//            } else {
//                session.setAttribute("account", ua);
//                User_Info ui = uad.getUserInfoByUser_AccId(ua.getId());
//                session.setAttribute("user_info", ui);
//                response.sendRedirect("/Movie_Web/");
//            }
        }

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}
