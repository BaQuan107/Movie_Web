
package Controller;

import DAO.CookieHandle;
import DAO.GenreHandle;
import DAO.MovieHandle;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import Model.Genre;
import Model.Movie;
import Model.User_Acc;
import Model.User_Info;

@WebServlet(name = "SearchMovie", urlPatterns = {"/search-movie"})
public class SearchMovie extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User_Acc ua = (User_Acc) session.getAttribute("account");
        User_Info ui = (User_Info) session.getAttribute("user_info");
        
        String selectSearch = request.getParameter("selectSearch");
        String inputSearch = request.getParameter("inputSearch");
        String searchHeader = "", searchContent = "", pagination = "";
        
        MovieHandle mrd = new MovieHandle();
        GenreHandle ghd = new GenreHandle();
        List<Movie> listMovieTmp0 = mrd.getSearchedMovie(selectSearch, inputSearch);
        String xpage = request.getParameter("page");
        String selectSort = request.getParameter("selectSort");
        String paid = request.getParameter("isPaid");
        
        //isPaid
        List<Integer> listMOwn = new ArrayList<>();;
        List<Movie> listMovieTmp1 = new ArrayList<>();
        if(paid==null || paid.equals("")) paid = "false";
        if(ui==null){
            listMovieTmp1 = mrd.getMoviePaid(listMOwn, listMovieTmp0, paid);
        } else{
            listMovieTmp1 = mrd.getMoviePaid(ui.getMovieOwn(), listMovieTmp0, paid);
        }
        
        //sort
        if(selectSort==null || selectSort.equals(""))
            selectSort="nameUP";
        mrd.sortMovieList(listMovieTmp1, selectSort);
        
        //type of film
        String typeOfFilm = request.getParameter("typeOfFilm");
        if(typeOfFilm==null || typeOfFilm.equals("")) typeOfFilm="-1,-2";
        String[] listType = typeOfFilm.split(",");
        List<Genre> listG = new ArrayList<>();
        for(String l: listType){
            int id=-3;
            try {
                id=Integer.parseInt(l);
            } catch (Exception e) {
            }
            if(ghd.getGenreById(id)!=null)
                listG.add(ghd.getGenreById(id));
        }
        List<Movie> listMovieTmp2 = mrd.getMovieByGenre(listMovieTmp1, listG);
        
        //page
        int page, numperpage = 8;
        int start, end;
        int size = listMovieTmp2.size();
        int num = (size % 8 == 0 ? (size / 8) : ((size / 8) + 1));
        if (xpage == null || xpage.equals("")) {
            page = 1;
        } else {
            page = Integer.parseInt(xpage);
        }
        start = (page-1)*numperpage;
        end = Math.min(page*numperpage, size);
        List<Movie> listMovie = mrd.getMovieByPage(listMovieTmp2, start, end);
        
        // read cookie
        CookieHandle chl = new CookieHandle();
        List<Integer> listId = chl.getAllIdList(request);
        
        PrintWriter out = response.getWriter();
        searchHeader = "<div class=\"RC-search-header\">\n"
                + "                    <form>\n"
                + "                        <select name=\"RC-search-type\">\n"
                + "                            <option " + (selectSearch.equals("All") == true ? "selected" : "") + " value=\"All\">All</option>\n"
                + "                            <option " + (selectSearch.equals("Name") == true ? "selected" : "") + " value=\"Name\">Name</option>\n"
                + "                            <option " + (selectSearch.equals("Actor") == true ? "selected" : "") + " value=\"Actor\">Actor</option>\n"
                + "                            <option " + (selectSearch.equals("Director") == true ? "selected" : "") + " value=\"Director\">Director</option>\n"
                + "                            <option " + (selectSearch.equals("Country") == true ? "selected" : "") + " value=\"Country\">Country</option>\n"
                + "                            <option " + (selectSearch.equals("Price") == true ? "selected" : "") + " value=\"Price\">Price</option>\n"
                + "                        </select>\n"
                + "                        <div class=\"RC-search_wrapper\">\n"
                + "                            <input onkeydown=\"handleInputSubmit(event, this)\" id =\"somebutton\" type=\"text\" name=\"RC-ip-search\" value=\"" + inputSearch + "\" id=\"\" placeholder=\"Find ...\">\n"
                + "                        </div>\n"
                + "                    </form>\n"
                + "                </div>\n"
                + "                <div class=\"RC-search-content\">\n"
                + "                    <div class=\"row\">\n";

        for (Movie m : listMovie) {
            String movieItemAbove = "<div class=\"col-lg-3 col-md-4 col-sm-6 col-12\">\n"
                    + "                                <div class=\"movie-img-wrapper\">\n"
                    + "                                    <a href=\"movie-detail?id=" + m.getId() + "\">\n"
                    + "                                        <div>\n"
                    + "                                            <img src=\"https://i.ytimg.com/vi/" + m.getSrc() + "/maxresdefault.jpg\" alt=\"movie-img\">\n"
                    + "                                        </div>\n"
                    + "                                    </a>\n"
                    + "                                </div>\n"
                    + "                                <div class=\"movie-description\">\n"
                    + "                                    <h6><a href=\"movie-detail?id=${m.id}\">" + m.getName() + "</a></h6>\n"
                    + "                                    <p>" + m.getRealse_year() + ", " + m.getCountry() + ", Action</p>\n";
            String movieItemMid = "<div class=\"description-star\">\n";
            for (int i = 1; i <= 5; i++) {
                if (i < m.getRating()) {
                    movieItemMid += "<i class=\"fas fa-star voted\"></i>\n";
                } else {
                    movieItemMid += "<i class=\"fas fa-star\"></i>\n";
                }
            }
            String movieItemAction = "<div class=\"movie-action\">\n"
                    +"             <span data-id=\""+m.getId()+"\" onclick=\"handleGetDataUpdate(this)\"><i class=\"fas fa-edit\"></i></span>\n"
                    +"             <span data-id=\""+m.getId()+"\" onclick=\"handleGetDataDelete(this)\"><i class=\"fas fa-trash-alt\"></i></span>\n"
                    +"         </div>";
            if(ui!=null && ui.getMovieOwn().contains(m.getId())){
                movieItemMid += "</div>\n"
                    + "<div class=\"movie-price\">\n"
                    + "            <p>$" + m.getPrice() + "</p>\n"
                    + "             <span class=\"movie-paid\">PAID</span>"
                    + "      </div>\n"
                    + ((ua!=null && ua.getRole()==1)? movieItemAction:"")
                    +"    </div>\n"
                    + "</div>\n";
            }else{
                movieItemMid += "</div>\n"
                        + "<div class=\"movie-price\">\n"
                        + "            <p>$" + m.getPrice() + "</p>\n"
                        + "            <span onclick=\"handleAjaxShopCart(this)\" data-id=\""+m.getId()+"\" >"+(listId.contains(m.getId())?"CANCEL CART":"ADD TO CART")+"</span>\n"
                        + "      </div>\n"
                        + ((ua!=null && ua.getRole()==1)? movieItemAction:"")
                        +"    </div>\n"
                        + "</div>\n";
            }
            searchContent += movieItemAbove + movieItemMid;
        }
        searchContent += "</div>\n"
                + "</div>\n";

        pagination = "<div class=\"RC-pagination\">\n";
        if (num > 1) {
            if(page>1){
                 pagination+= "<a onclick=\"handleAjaxMain(this)\" data-index=\""+(page-1)+"\">&laquo;</a>";
            }
            for(int i=1; i<=num; i++){
                pagination+= "<a onclick=\"handleAjaxMain(this)\" class=\""+(i==page?"active":"")+"\" data-index=\""+i+"\">"+i+"</a>\n";
            }
            if(page<num){
                 pagination+= "<a onclick=\"handleAjaxMain(this)\" data-index=\""+(page+1)+"\">&raquo;</a>";
            }
        }
        pagination+="</div>\n";
        
        out.println(searchHeader + searchContent+pagination);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
