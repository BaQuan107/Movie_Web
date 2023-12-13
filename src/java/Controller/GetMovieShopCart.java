/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import DAO.MovieHandle;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.Date;
import Model.Movie;

/**
 *
 * @author win
 */
@WebServlet(name="GetMovieShopCart", urlPatterns={"/get-movie-sc"})
public class GetMovieShopCart extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        MovieHandle mhd = new MovieHandle();
        SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
        String cartCk = request.getParameter("cartCk");
        String[] cartItems = cartCk.split("/");
        String result = "";
        
        for(String x: cartItems){
            if(x!=null && !x.equals("")){
                int id = Integer.parseInt(x.split(":")[0]);
                Movie m = mhd.getMovieById(id);
                String distanceDate = "";
                try {
                    Date dateNowTmp = new Date();
                    Date dateNow = formatter.parse(formatter.format(dateNowTmp));
                    Date dateInput = formatter.parse(x.split(":")[1]);

                    long day = (dateNow.getTime()-dateInput.getTime())/(1000*3600*24);
                    distanceDate = day+"";
                } catch (Exception ex) {
                    System.out.println(ex);
                }

                result += id+":"+m.getSrc()+":"+m.getName()+":"+distanceDate+"/";
            }
        }
        out.println(result.substring(0, result.length()-1));
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
