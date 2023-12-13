
package Controller;

import DAO.ActorHandle;
import DAO.DirectorHandle;
import DAO.GenreHandle;
import DAO.MovieHandle;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import Model.Actor;
import Model.Director;
import Model.Genre;
import Model.Movie;

/**
 *
 * @author win
 */
@WebServlet(name = "AdminUpdateDeleteMovie", urlPatterns = {"/admin-handleUDmovie"})
public class AdminUpdateDeleteMovie extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        MovieHandle mrd = new MovieHandle();

        String action = request.getParameter("action");
        int id = Integer.parseInt(request.getParameter("id"));
        Movie movie = mrd.getMovieById(id);

        if (action.equals("update")) {
            request.setAttribute("movie", movie);
            request.getRequestDispatcher("main/admin/admin-update-movie.jsp").forward(request, response);
        }
        else if(action.equals("delete")){
            mrd.deleteMovieByMovieId(id);
            response.sendRedirect("movie");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        MovieHandle mrd = new MovieHandle();
        DirectorHandle dh = new DirectorHandle();
        ActorHandle ah = new ActorHandle();
        GenreHandle gh = new GenreHandle();
        
        String movieId = request.getParameter("movieId");
        String movieName = request.getParameter("movieName");
        String realseYear = request.getParameter("realseYear");
        String length = request.getParameter("length");
        String country = request.getParameter("country");
        String rating = request.getParameter("rating");
        String price = request.getParameter("price");
        String src = request.getParameter("src");
        String description = request.getParameter("description");
        String directorData = request.getParameter("directorData");
        String actorData = request.getParameter("actorData");
        String genreData = request.getParameter("genreData");
        Director d = new Director();
        List<Actor> AList = new ArrayList<>();
        List<Genre> GList = new ArrayList<>();

        if (directorData != null && !directorData.equals("")) {
            Director dTmp = new Director();
            String[] directorDataTmp = directorData.split(":");
            if (directorDataTmp[0].equals("None")) {
                dTmp.setId(0);
                dTmp.setFullName(directorDataTmp[1]);
                dTmp.setBirth(Date.valueOf(directorDataTmp[2]));
                dTmp.setNationality(directorDataTmp[3]);

                dh.addNewDirector(dTmp);
                d = dh.getDirector(dTmp);
            } else {
                d.setId(Integer.parseInt(directorDataTmp[0]));
                d.setFullName(directorDataTmp[1]);
                d.setBirth(Date.valueOf(directorDataTmp[2]));
                d.setNationality(directorDataTmp[3]);
            }
        }

        if (actorData != null && !actorData.equals("")) {
            String[] actorDataSplit = actorData.split("\\|");
            for (int i = 0; i < actorDataSplit.length; i++) {
                String[] actorDataRaw = actorDataSplit[i].split(":");
                int idTmp = -1;
                try {
                    idTmp = Integer.parseInt(actorDataRaw[0]);
                } catch (Exception e) {
                }
                Actor aTmp = new Actor(idTmp, actorDataRaw[1], Date.valueOf(actorDataRaw[2]), actorDataRaw[3]);
                Actor a = new Actor();
                if (idTmp == -1) {
                    ah.addNewActor(aTmp);
                    a = ah.getActor(aTmp);
                    AList.add(a);
                } else {
                    AList.add(aTmp);
                }
            }
        }

        if (genreData != null && !genreData.equals("")) {
            String[] genreDataSplit = genreData.split("\\|");
            for (int i = 0; i < genreDataSplit.length; i++) {
                String[] genreDataRaw = genreDataSplit[i].split(":");
                int idTmp = -1;
                try {
                    idTmp = Integer.parseInt(genreDataRaw[0]);
                } catch (Exception e) {
                }
                Genre aTmp = new Genre(idTmp, genreDataRaw[1]);
                Genre a = new Genre();
                if (idTmp == -1) {
                    gh.addNewGenre(aTmp);
                    a = gh.getGenre(aTmp);
                    GList.add(a);
                } else {
                    GList.add(aTmp);
                }
            }
        }

        Movie movie = new Movie(Integer.parseInt(movieId), movieName, d, Date.valueOf(realseYear), Integer.parseInt(length), country,
                Integer.parseInt(rating), Integer.parseInt(price), src, 0, description, GList, AList);
        mrd.updateMovie(movie);
        ah.deleteActorByMovieId(movie.getId());
        gh.deleteGenreByMovieId(movie.getId());
        mrd.addActorAndGenre(movie);
        
        response.sendRedirect("movie-detail?id="+movie.getId());
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
