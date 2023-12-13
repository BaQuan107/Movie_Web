
package Controller;

import DAO.UserHandle;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.List;
import Model.User_Acc;
import Model.User_Info;

@WebServlet(name="MyInfo", urlPatterns={"/my-info"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 50, // 50MB
        maxRequestSize = 1024 * 1024 * 50) // 50MB
public class MyInfo extends HttpServlet {
    private String rootPath = "D:\\code\\prj\\Movie_Web\\web\\images";
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        request.getRequestDispatcher("/main/account/my-info.jsp").forward(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        UserHandle urd = new UserHandle();
        User_Acc ua = (User_Acc) session.getAttribute("account");
        
        int _user_id = ua.getId();
        String fullName = request.getParameter("fullname");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String gender_raw = request.getParameter("gender");
        String birth_raw = request.getParameter("birthday");
        boolean gender=true;
        if(gender_raw.equals("0")) gender = false;
        Date birth = null;
        try {
            birth = Date.valueOf(birth_raw);;
        } catch (Exception e) {
            System.out.println(e);
        }
        String fileName;
        User_Info oldUser = urd.getUserInfoByUser_AccId(_user_id);
        fileName = oldUser.getAvatar();
        
        Part part = request.getPart("avatar");
        String fileNameTmp = extractFileName(part);
        System.out.println(fileNameTmp);
        if(!fileNameTmp.equals("")){
            deleteImg("\\"+ fileName);
            fileNameTmp = new File(fileNameTmp).getName();
            fileName = "User_Img/"+fileNameTmp;
            part.write(this.getFolderUpload().getAbsolutePath() + File.separator + fileName);
        }
        
        List<Integer> movieOwn=null;
        User_Info ui = new User_Info(0, _user_id, fileName, fullName, email, phone, gender, birth, 0, movieOwn);
        urd.updateInfo(ui);
        User_Info uiTmp = urd.getUserInfoByUser_AccId(ua.getId());
        session.setAttribute("user_info", uiTmp);
        User_Info uiUpdate = (User_Info) session.getAttribute("user_info");
        out.print("./images/"+uiUpdate.getAvatar());
        //response.sendRedirect("my-info");
    }
    
    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }

    public File getFolderUpload() {
        File folderUpload = new File(rootPath);
        if (!folderUpload.exists()) {
            folderUpload.mkdirs();
        }
        return folderUpload;
    }
    
    public void deleteImg(String oldImgPath) {
        File oldPath = new File(rootPath+oldImgPath);
        if(oldPath.exists()&&oldImgPath.contains("User")) {
            oldPath.delete();
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
