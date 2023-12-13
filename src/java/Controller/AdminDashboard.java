
package Controller;

import DAO.StatisticHandle;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name="AdminDashboard", urlPatterns={"/admin-dashboard"})
public class AdminDashboard extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        StatisticHandle std = new StatisticHandle();
        List<Integer> listGeneralStatistic = new ArrayList<>();
        String stringCreateAcc = "", stringMFAcc="", stringGenreMovie="", stringMovieViewer="", stringStatisticMoney = "";
        
        listGeneralStatistic.add(std.countUserAcc());
        listGeneralStatistic.add(std.countMovie());
        listGeneralStatistic.add(std.sumAllMoneyMovie());
        listGeneralStatistic.add(std.countDirectorAndActor());
        stringCreateAcc = std.getArrayStringCreateAcc();
        stringMFAcc = std.getArrayStringMFAcc();
        stringGenreMovie = std.getArrayStringGenM();
        stringMovieViewer = std.getArrayStringMoiveViewer();
        stringStatisticMoney = std.getArrayStringStatisticMoney();
        
        request.setAttribute("listGeneralStatistic", listGeneralStatistic);
        request.setAttribute("stringCreateAcc", stringCreateAcc);
        request.setAttribute("stringGenreMovie", stringGenreMovie);
        request.setAttribute("stringMovieViewer", stringMovieViewer);
        request.setAttribute("stringMFAcc", stringMFAcc);
        request.setAttribute("stringStatisticMoney", stringStatisticMoney);
        
        request.getRequestDispatcher("main/admin/admin-dashboard.jsp").forward(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
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
