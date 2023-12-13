
package Controller;

import DAO.CookieHandle;
import DAO.GenreHandle;
import DAO.MovieHandle;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import Model.Genre;
import Model.Movie;

/**
 *
 * @author win
 */
@WebServlet(name="MovieServlet", urlPatterns={"/movie"})
public class MovieServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        MovieHandle mrd = new MovieHandle();
        GenreHandle ghd = new GenreHandle();
        CookieHandle chl = new CookieHandle();
        List<Integer> listId = chl.getAllIdList(request);
        List<Genre> listGenre = ghd.getAllGenre();
        List<Movie> listMovieTmp = mrd.getAllMovie();
        
        int page, numperpage = 8;
        int size = listMovieTmp.size();
        int num = (size%8==0?(size/8):((size/8)+1));
        String xpage = request.getParameter("page");
        if(xpage==null){
            page=1;
        } else {
            page = Integer.parseInt(xpage);
        }
        int start, end;
        start = (page-1)*numperpage;
        end = Math.min(page*numperpage, size);
        
        List<Movie> listMovie = mrd.getMovieByPage(listMovieTmp, start, end);
        request.setAttribute("listGenre", listGenre);
        request.setAttribute("listMovie", listMovie);
        request.setAttribute("listId", listId);
        request.setAttribute("page", page);
        request.setAttribute("num", num);
        
        request.getRequestDispatcher("main/movie/index.jsp").forward(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
