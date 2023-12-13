package Controller;

import DAO.UserHandle;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import Model.User_Acc;
import Model.User_Info;

/**
 *
 * @author win
 */
@WebServlet(name = "AdminHandleAcc", urlPatterns = {"/admin-handleacc"})
public class AdminHandleAcc extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("main/admin/admin-handle-acc.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        UserHandle urd = new UserHandle();
        PrintWriter out = response.getWriter();

        
        if (action.equals("search-acc")) {

            String table = "", pagination = "";

            String select = request.getParameter("select");
            String input = request.getParameter("input");
            String xpage = request.getParameter("page");

            List<User_Info> UiListTmp = new ArrayList<>();
            if (input != null && !input.equals("")) {
                for (User_Info user_Info : urd.getSearchedUserInfo(select, input)) {
                    if(!user_Info.getPhone().equals("0912851955")) UiListTmp.add(user_Info);
                }
                
                
            }

            //page
            int page, numperpage = 9;
            int start, end;
            int size = UiListTmp.size();
            int num = (size % 9 == 0 ? (size / 9) : ((size / 9) + 1));
            if (xpage == null || xpage.equals("")) {
                page = 1;
            } else {
                page = Integer.parseInt(xpage);
            }
            start = (page - 1) * numperpage;
            end = Math.min(page * numperpage, size);

            List<User_Info> UiList = urd.getUserInfoByPage(UiListTmp, start, end);

            table = "<table class=\"table table-striped table-hover custom-label-ip\">\n"
                    + "                                <thead class=\"\">\n"
                    + "                                    <tr>\n"
                    + "                                        <th scope=\"col\">#</th>\n"
                    + "                                        <th scope=\"col\">FullName</th>\n"
                    + "                                        <th scope=\"col\">Email</th>\n"
                    + "                                        <th scope=\"col\">Phone</th>\n"
                    + "                                        <th scope=\"col\">Gender</th>\n"
                    + "                                        <th scope=\"col\">Birth</th>\n"
                    + "                                        <th scope=\"col\">Acc Money</th>\n"
                    + "                                        <th scope=\"col\">State</th>\n"
                    + "                                    </tr>\n"
                    + "                                </thead>\n"
                    + "                                <tbody class=\"customm-tableBody\">";

            for (User_Info u : UiList) {
                User_Acc ua = urd.getUaByUaId(u.getUser_id());
                table += "<tr>\n"
                        + "                                        <th scope=\"row\">" + u.getId() + "</th>\n"
                        + "                                        <td>" + u.getFullname() + "</td>\n"
                        + "                                        <td>" + u.getEmail() + "</td>\n"
                        + "                                        <td>" + u.getPhone() + "</td>\n"
                        + "                                        <td>" + (u.isGender() == true ? "Male" : "Female") + "</td>\n"
                        + "                                        <td>" + u.getBirth() + "</td>\n"
                        + "                                        <td>" + u.getAcc_money() + "</td>\n"
                        + "                                        <td>\n"
                        + (ua.getState() == 1
                        ? "<i data-id=\"" + ua.getId() + "\" data-type=\"Block\" onclick=\"handleAjaxChangeStateUserAcc(this)\" class=\"fas fa-lock\"></i>\n"
                        : "<i data-id=\"" + ua.getId() + "\" data-type=\"Unblock\" onclick=\"handleAjaxChangeStateUserAcc(this)\" class=\"fas fa-lock-open\"></i>\n")
                        + "                                        </td>\n"
                        + "                                    </tr>";
            }
            table += "</tbody>\n"
                    + "                            </table>";

            if (num > 1) {
                pagination += "<nav id=\"pagination\" aria-label=\"Page navigation\">\n"
                        + "                                <ul class=\"pagination custom-nav\">";
                if (page > 1) {
                    pagination += "<li data-id=\"" + (page - 1) + "\" onclick=\"handleAjaxSearchAcc(this)\" class=\"page-item disabled\">\n"
                            + "                                        <a class=\"page-link\" href=\"#\" aria-label=\"Previous\">\n"
                            + "                                            <span aria-hidden=\"true\">&laquo;</span>\n"
                            + "                                            <span class=\"sr-only\">Previous</span>\n"
                            + "                                        </a>\n"
                            + "                                    </li>";
                }
                for (int i = 1; i <= num; i++) {
                    pagination += "<li data-id=\"" + i + "\" onclick=\"handleAjaxSearchAcc(this)\" "
                            + "class=\"page-item " + (i == page ? "active" : "") + "\"><a class=\"page-link\" href=\"#\">" + i + "</a></li>";
                }
                if (page < num) {
                    pagination += "<li data-id=\"" + (page + 1) + "\" onclick=\"handleAjaxSearchAcc(this)\" class=\"page-item\">\n"
                            + "                                        <a class=\"page-link\" href=\"#\" aria-label=\"Next\">\n"
                            + "                                            <span aria-hidden=\"true\">&raquo;</span>\n"
                            + "                                            <span class=\"sr-only\">Next</span>\n"
                            + "                                        </a>\n"
                            + "                                    </li>";
                }
                pagination += "</ul>\n"
                        + "                            </nav>";
            }

            out.println(table + pagination);
        } else if (action.equals("update-state")) {
            String id = request.getParameter("id");
            String type = request.getParameter("type");

            urd.BlockAUnBlock(type, Integer.parseInt(id));
            if (type.equals("Block")) {
                out.println("<i data-id=\"" + id + "\" data-type=\"Unblock\" onclick=\"handleAjaxChangeStateUserAcc(this)\" class=\"fas fa-lock-open\"></i>\n");
            } else if (type.equals("Unblock")) {
                out.println("<i data-id=\"" + id + "\" data-type=\"Block\" onclick=\"handleAjaxChangeStateUserAcc(this)\" class=\"fas fa-lock\"></i>\n");
            }
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
