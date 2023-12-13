
package Controller;

import DAO.ActorHandle;
import DAO.DirectorHandle;
import DAO.GenreHandle;
import DAO.MovieHandle;
import java.io.IOException;
import java.io.PrintWriter;
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

@WebServlet(name = "AdminAddMovie", urlPatterns = {"/admin-addmovie"})
public class AdminAddMovie extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("main/admin/admin-add-movie.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        MovieHandle mrd = new MovieHandle();
        GenreHandle ghd = new GenreHandle();
        DirectorHandle dhd = new DirectorHandle();
        ActorHandle ahd = new ActorHandle();
        
        String action = request.getParameter("action");
        if (action.equals("search-director")) {
            String input = request.getParameter("inputSearch").trim();
            if (input == null || input == "") {
                return;
            }

            List<Director> DList = dhd.getDirecByDName(input);
            String data = "";

            for (Director d : DList) {
                data += "<tr onclick=\"handleFind(this, 'director')\">\n"
                        + "                <th scope=\"row\">" + d.getId() + "</th>\n"
                        + "                <td>" + d.getFullName() + "</td>\n"
                        + "                <td>" + d.getBirth() + "</td>\n"
                        + "                <td>" + d.getNationality() + "</td>\n"
                        + "            </tr>";
            }

            out.println(data);
        } else if (action.equals("search-actor")) {
            String input = request.getParameter("inputSearch").trim();
            if (input == null || input == "") {
                return;
            }

            List<Actor> DList = ahd.getActorByDName(input);
            String data = "";

            for (Actor a : DList) {
                data += "<tr onclick=\"handleFind(this, 'actor')\">\n"
                        + "                <th scope=\"row\">" + a.getId() + "</th>\n"
                        + "                <td>" + a.getFullName() + "</td>\n"
                        + "                <td>" + a.getBirth() + "</td>\n"
                        + "                <td>" + a.getNationality() + "</td>\n"
                        + "            </tr>";
            }

            out.println(data);
        } else if (action.equals("search-genre")) {
            String input = request.getParameter("inputSearch").trim();
            if (input == null || input == "") {
                return;
            }

            List<Genre> DList = ghd.getSearchGenre(input);
            String data = "";

            for (Genre a : DList) {
                data += "<tr onclick=\"handleFind(this, 'genre')\">\n"
                        + "               <th scope=\"row\">"+a.getId()+"</th>\n"
                        + "               <td>"+a.getGenre_name()+"</td>\n"
                        + "           </tr>";
            }

            out.println(data);
        } else if (action.equals("add-movie")) {
            DirectorHandle dh = new DirectorHandle();
            ActorHandle ah = new ActorHandle();
            GenreHandle gh = new GenreHandle();

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
            
            Movie movieTmp = new Movie(-1, movieName, d, Date.valueOf(realseYear), Integer.parseInt(length), country, 
                    Integer.parseInt(rating), Integer.parseInt(price), src, 0, description, GList, AList);
            mrd.addNewMovie(movieTmp);
            Movie movie = mrd.getMovie(movieTmp);
            movie.setGenreL(GList);
            movie.setActorL(AList);
            mrd.addActorAndGenre(movie);
            
//            out.println(movie.getId()+"|"+movie.getName());
            response.sendRedirect("movie-detail?id="+movie.getId());
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
