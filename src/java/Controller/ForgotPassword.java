/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.UserHandle;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Properties;
import java.util.Random;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import Model.User_Acc;
import Model.User_Info;

/**
 *
 * @author win
 */
@WebServlet(name = "ForgotPassword", urlPatterns = {"/forgot-pw"})
public class ForgotPassword extends HttpServlet {

    public String genConfirm() {
        Random random = new Random();
        String rs = "";
        for (int i = 0; i < 5; i++) {
            rs += "" + random.nextInt(10);
        }
        return rs;
    }

    public Properties mailProperties() {
        Properties props = new Properties();

        props.setProperty("mail.transport.protocol", "smtp");
        props.setProperty("mail.smtp.host", "smtp.gmail.com");
        props.setProperty("mail.smtp.port", "587");
        props.setProperty("mail.smtp.auth", "true");
        props.setProperty("mail.smtp.starttls.enable", "true");
        props.setProperty("mail.smtp.ssl.protocols", "TLSv1.2");

        return props;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/main/account/forgot-pw.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        UserHandle uhd = new UserHandle();
        if (action.equals("find-acc")) {
            String username = request.getParameter("username");
            User_Acc ua = uhd.FindExistUserAcc(username);
            User_Info ui = uhd.getUserInfoByUser_AccId(ua.getId());

            if (ua == null) {
                request.setAttribute("errorU", "Can't find this account");
                request.getRequestDispatcher("/main/account/forgot-pw.jsp").forward(request, response);
            } else {
                // Recipient's email ID needs to be mentioned.
                String to = ui.getEmail();

                // Sender's email ID needs to be mentioned
                String from = "********";

                // Get system properties
                Properties props = mailProperties();

                // Get the default Session object.
                Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {
                    @Override
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(
                                "ba.quan10073@gmail.com", "Quan10072002");// Specify the Username and the PassWord
                    }
                });

                try {
                    String requireCode = genConfirm();
                    // Create a default MimeMessage object.
                    MimeMessage message = new MimeMessage(mailSession);

                    // Set From: header field of the header.
                    message.setFrom(new InternetAddress(from));

                    // Set To: header field of the header.
                    message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

                    // Set Subject: header field
                    message.setSubject("Forgot Password mess!");

                    // Now set the actual message
                    message.setText("Your confirm code: " + requireCode);
                    
                    //update code to db
                    uhd.updateReceiptCode(username, requireCode);
                    
                    // Send message
                    Transport.send(message);
                    
                    
                } catch (MessagingException mex) {
                    mex.printStackTrace();
                }

                request.setAttribute("mess", username);
                request.getRequestDispatcher("/main/account/forgot-pw.jsp").forward(request, response);
            }
        } else if (action.equals("get-forgot-pw")) {
            String code = request.getParameter("code");
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String password_confirmation = request.getParameter("password_confirmation");

            if (code == "" || password == "" || password_confirmation == "") {
                if (code == "") {
                    request.setAttribute("errorC", "Input required!");
                }
                if (password == "") {
                    request.setAttribute("errorP", "Input required!");
                }
                if (password_confirmation == "") {
                    request.setAttribute("errorRP", "Input required!");
                }
                request.setAttribute("mess", username);
                request.getRequestDispatcher("/main/account/forgot-pw.jsp").forward(request, response);
                return;
            }

            if(!code.equals(uhd.getReceptCode(username))){
                request.setAttribute("mess", username);
                request.setAttribute("errorC", "Wrong email code!");
                request.getRequestDispatcher("/main/account/forgot-pw.jsp").forward(request, response);
                return;
            }
            
            if (!password.equals(password_confirmation)) {
                request.setAttribute("mess", username);
                request.setAttribute("errorRP", "Password confirmation wrong!");
                request.getRequestDispatcher("/main/account/forgot-pw.jsp").forward(request, response);
                return;
            }
            
            uhd.updateReceiptCode(username, "0");
            User_Acc ua = uhd.FindExistUserAcc(username);
            uhd.changePw(password, ua.getId());
            
            response.sendRedirect("login");
            return;
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
