
package Controller;

import DAO.CookieHandle;
import DAO.UserHandle;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import Model.Cart;
import Model.User_Info;

/**
 *
 * @author win
 */
@WebServlet(name = "ShopCart", urlPatterns = {"/shop-cart"})
public class ShopCart extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CookieHandle chl = new CookieHandle();
        List<Cart> cartList = chl.getAllCartList(request);
        request.setAttribute("cartList", cartList);
        request.getRequestDispatcher("/main/cart/shop-card.jsp").forward(request, response);
    }

    public String handleString(String s){
        return s.substring(0, s.length()-1);
    }
    
    public boolean handleFilmid(HttpServletRequest request, HttpServletResponse response, PrintWriter out,
            String[] xid) {
        String[] xfilmId = xid;
        SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
        Date date = new Date();
        Cookie[] arr = request.getCookies();
        String txt = "", txtRs = "";
        boolean checkExist = false;

        if (arr != null) {
            for (Cookie o : arr) {
                if (o.getName().equals("cart")) {
                    txt += o.getValue();
                    o.setMaxAge(0);
                    response.addCookie(o);
                }
            }
        }
        
        for(String filmId: xfilmId){
            checkExist = false;
            txtRs = "";
            if ((filmId != null && !filmId.equals(""))) {
                if (txt.isEmpty()) {
                    txtRs = filmId + ":" + formatter.format(date);
                } else {
                    String[] s = txt.split("/");
                    for (String item : s) {
                        if(item != null && !item.equals("")){
                            String[] n = item.split(":");
                            String id = n[0];
                            if (id.equals(filmId)) {
                                checkExist = true;
                                System.out.println(1);
                                continue;
                            }
                            txtRs += n[0] + ":" + n[1]+"/";
                        }
                    }
                    if (!checkExist) {
                        txtRs += filmId + ":" + formatter.format(date) + "/";
                    }
                }

            }
            txt = txtRs;
//            txtRs = handleString(txtRs);
        }
        Cookie c = new Cookie("cart", txtRs);
        c.setMaxAge(2 * 24 * 60 * 60);
        response.addCookie(c);
        return checkExist;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String action = request.getParameter("action");

        if (action.equals("handle-shopcart-cookie")) {
            String[] xid = request.getParameter("id").split(",");
            boolean eixsted = handleFilmid(request, response, out, xid);
            if (eixsted) {
                out.print("delete");
            } else {
                out.print("add");
            }
        } else if (action.equals("check-out")) {
            HttpSession session = request.getSession();
            User_Info ui = (User_Info) session.getAttribute("user_info");
            double currentMoney = ui.getAcc_money();

            String xidList = request.getParameter("idList");
            String xmoney = request.getParameter("money");
            String[] idList = xidList.split(",");
            double money = Double.parseDouble(xmoney);

            //handle update money
            if (money > currentMoney) {
                out.print("Failure");
            } else if (money <= currentMoney) {
                UserHandle urd = new UserHandle();

                //add to movie_userInfo
                urd.addMovieUserInfo(ui, idList);

                handleFilmid(request, response, out, idList);

                urd.updateUserInfoMoney(ui, (currentMoney - money));

                //update session for userinfo
                User_Info uiUpdate = urd.getUserInfoByUser_InfoId(ui.getId());
                session.setAttribute("user_info", uiUpdate);

                out.print("Success");
                
            } 

        }

//        request.getRequestDispatcher("movies").forward(request, response); => them vao thi khong tra ve data dc
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
