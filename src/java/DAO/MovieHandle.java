
package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import Model.Actor;
import Model.Genre;
import Model.Movie;

public class MovieHandle extends DBContext {
  
    //get all movie
    public List<Movie> getAllMovie() {
        ActorHandle ahd = new ActorHandle();
        DirectorHandle dhd = new DirectorHandle();
        GenreHandle ghd = new GenreHandle();
        List<Movie> list = new ArrayList<>();
        
        String sql = "select * from movie";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Movie g = new Movie(rs.getInt(1), rs.getString(2), dhd.getDirecById(rs.getInt(3)), 
                        rs.getDate(4), rs.getInt(5), rs.getString(6), rs.getInt(7), 
                        rs.getInt(8), rs.getString(9), rs.getInt(10), rs.getString(11), 
                        ghd.getGenreByMovieId(rs.getInt(1)), ahd.getActorById(rs.getInt(1)));
                list.add(g);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    // sort movie by type
    public List<Movie> sortMovieList(List<Movie> listMv, String type){
        Collections.sort(listMv, new Comparator<Movie>() {
            @Override
            public int compare(Movie o1, Movie o2) {
                if(type.equals("nameUP"))return o1.getName().compareTo(o2.getName());
                if(type.equals("nameDown"))return -o1.getName().compareTo(o2.getName());
                if(type.equals("priceUP")) return o1.getPrice() - o2.getPrice();
                if(type.equals("priceDown")) return o2.getPrice() - o1.getPrice();
                return 0;
            }
        });
        return listMv;
    } 
    
    // sort movie by gemre
    public List<Movie> getMovieByGenre(List<Movie> listMv, List<Genre> listG){
        GenreHandle ghd = new GenreHandle();
        List<Movie> listMvRs = new ArrayList<>();
        for(Movie m: listMv){
            ArrayList<String> movieGList = ghd.getStringGenre(m.getGenreL());
            ArrayList<String> gList = ghd.getStringGenre(listG);
            if(movieGList.containsAll(gList))
                listMvRs.add(m);
        }
        return listMvRs;
    } 
    
    // get movie follow by num of page
    public List<Movie> getMovieByPage(List<Movie> allM, int start, int end){
        List<Movie> list = new ArrayList<>();
        for(int i = start; i<end; i++){
            list.add(allM.get(i));
        }
        return list;
    }

    //get movie by movieid
    public Movie getMovieById(int id) {
        ActorHandle ahd = new ActorHandle();
        DirectorHandle dhd = new DirectorHandle();
        GenreHandle ghd = new GenreHandle();
        
        String sql = "select * from movie where id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Movie g = new Movie(rs.getInt(1), rs.getString(2), dhd.getDirecById(rs.getInt(3)), 
                        rs.getDate(4), rs.getInt(5), rs.getString(6), rs.getInt(7), 
                        rs.getInt(8), rs.getString(9), rs.getInt(10), rs.getString(11), 
                        ghd.getGenreByMovieId(rs.getInt(1)), ahd.getActorById(rs.getInt(1)));
                return g;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    //get result from search
    public List<Movie> getSearchedMovie(String type, String input) {
        ActorHandle ahd = new ActorHandle();
        DirectorHandle dhd = new DirectorHandle();
        GenreHandle ghd = new GenreHandle();
        List<Movie> list = new ArrayList<>();
        
        if(type.equals("Name") || type.equals("Country") || type.equals("Actor") || type.equals("Director")) {
            String sql ="";
            if(type.equals("Name")){
                sql = "select * from movie where name like ?";
            } else if(type.equals("Country")) {
                sql = "select * from movie where country like ?";
            } else if(type.equals("Actor")) {
                sql = "select  movie.* from movie join movie_actor on movie.id = movie_actor._movie_id"
                        + "  join actor on actor.id = movie_actor._actor_id where actor.fullname like ?";
            } else {
                sql = "select  movie.* from movie join director on movie._director_id = director.id "
                        + "where director.fullname like ?";
            }
            try {
                PreparedStatement st = connection.prepareStatement(sql);
                st.setString(1, ("%" + input + "%"));
                ResultSet rs = st.executeQuery();
                while (rs.next()) {
                    Movie g = new Movie(rs.getInt(1), rs.getString(2), dhd.getDirecById(rs.getInt(3)), 
                        rs.getDate(4), rs.getInt(5), rs.getString(6), rs.getInt(7), 
                        rs.getInt(8), rs.getString(9), rs.getInt(10), rs.getString(11), 
                        ghd.getGenreByMovieId(rs.getInt(1)), ahd.getActorById(rs.getInt(1)));
                    list.add(g);
                }
            } catch (SQLException e) {
                System.out.println(e);
            }
            return list;
        }
        if (type.equals("Price")) {
            String sql = "select * from movie where price=?";
            int inputInt = -1;
            try {
                inputInt = Integer.parseInt(input);
            } catch (Exception e) {
            }
            try {
                PreparedStatement st = connection.prepareStatement(sql);
                st.setInt(1, inputInt);
                ResultSet rs = st.executeQuery();
                while (rs.next()) {
                    Movie g = new Movie(rs.getInt(1), rs.getString(2), dhd.getDirecById(rs.getInt(3)), 
                        rs.getDate(4), rs.getInt(5), rs.getString(6), rs.getInt(7), 
                        rs.getInt(8), rs.getString(9), rs.getInt(10), rs.getString(11), 
                        ghd.getGenreByMovieId(rs.getInt(1)), ahd.getActorById(rs.getInt(1)));
                    list.add(g);
                }
            } catch (SQLException e) {
                System.out.println(e);
            }
            return list;
        }

        if (type.equals("All")) {
            String sql = "select distinct movie.* from movie \n"
                    + "join director on movie._director_id = director.id \n"
                    + "join movie_actor on movie.id = movie_actor._movie_id  join actor on actor.id = movie_actor._actor_id\n"
                    + "where actor.fullname like ? or director.fullname like ? or movie.price=? or movie.country like ? or movie.name like ?";
            int inputInt = -1;
            try {
                inputInt = Integer.parseInt(input);
            } catch (Exception e) {
            }
            try {
                PreparedStatement st = connection.prepareStatement(sql);
                st.setString(1, ("%" + input + "%"));
                st.setString(2, ("%" + input + "%"));
                st.setInt(3, inputInt);
                st.setString(4, ("%" + input + "%"));
                st.setString(5, ("%" + input + "%"));
                ResultSet rs = st.executeQuery();
                while (rs.next()) {
                    Movie g = new Movie(rs.getInt(1), rs.getString(2), dhd.getDirecById(rs.getInt(3)), 
                        rs.getDate(4), rs.getInt(5), rs.getString(6), rs.getInt(7), 
                        rs.getInt(8), rs.getString(9), rs.getInt(10), rs.getString(11), 
                        ghd.getGenreByMovieId(rs.getInt(1)), ahd.getActorById(rs.getInt(1)));
                    list.add(g);
                }
            } catch (SQLException e) {
                System.out.println(e);
            }
            return list;
        }

        return null;
    }
    
    // get List id of movie by userinfo id
    public List<Integer> getMovieIdByUserInfoId(int id){
        List<Integer> list = new ArrayList<>();
        String sql = "select movie_userInfo._movie_id from user_info join movie_userInfo "
                + "on movie_userInfo._user_info_id = user_info.id where user_info.id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(rs.getInt(1));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    // get movie list paid
    public List<Movie> getMoviePaid(List<Integer> UiMovieIdList, List<Movie> mList, String paid){
        if(paid.equals("false")){
            return mList;
        }
        List<Movie> listMvRs = new ArrayList<>();
        for(Movie m: mList){
            if(UiMovieIdList.contains(m.getId()))
                listMvRs.add(m);
        }
        return listMvRs;
    }
    
    //add new movie
    public void addNewMovie(Movie m) {
        String sql = "insert into movie values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, m.getName());
            st.setInt(2, m.getDirector().getId());
            st.setDate(3, m.getRealse_year());
            st.setInt(4, m.getLength());
            st.setString(5, m.getCountry());
            st.setInt(6, m.getRating());
            st.setInt(7, m.getPrice());
            st.setString(8, m.getSrc());
            st.setInt(9, m.getNumberView());
            st.setString(10, m.getDescription());
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    //find movie by movie d
    public Movie getMovie(Movie m) {
        DirectorHandle dhd = new DirectorHandle();
        List<Actor> AList = new ArrayList<>();
        List<Genre> GList = new ArrayList<>();
        String sql = "Select * from movie where name=? and _director_id=? and realse_year=? and "
                + "movie_length=? and country=? and rating_avarage=? and price=? and src=? and number_view=? and description=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, m.getName());
            st.setInt(2, m.getDirector().getId());
            st.setDate(3, m.getRealse_year());
            st.setInt(4, m.getLength());
            st.setString(5, m.getCountry());
            st.setInt(6, m.getRating());
            st.setInt(7, m.getPrice());
            st.setString(8, m.getSrc());
            st.setInt(9, m.getNumberView());
            st.setString(10, m.getDescription());
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Movie a = new Movie(rs.getInt(1), rs.getString(2), dhd.getDirecById(rs.getInt(3)), 
                        rs.getDate(4), rs.getInt(5), rs.getString(6), rs.getInt(7), 
                        rs.getInt(8), rs.getString(9), rs.getInt(10), rs.getString(11), 
                        GList, AList);
                return a;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    
    //update movie-actor and movie-genre
    public void addActorAndGenre(Movie m){
        List<Actor> AList = m.getActorL();
        for(Actor a: AList){
            String sql = "insert into movie_actor values(?, ?)";
            try {
                PreparedStatement st = connection.prepareStatement(sql);
                st.setInt(1, a.getId());
                st.setInt(2, m.getId());
                st.executeUpdate();
            } catch (SQLException e) {
                System.out.println(e);
            }
        }
        
        List<Genre> GList = m.getGenreL();
        for(Genre g: GList){
            String sql = "insert into movie_genre values(?, ?)";
            try {
                PreparedStatement st = connection.prepareStatement(sql);
                st.setInt(1, g.getId());
                st.setInt(2, m.getId());
                st.executeUpdate();
            } catch (SQLException e) {
                System.out.println(e);
            }
        }
    }
    
    // update information from movie
    public void updateMovie(Movie m){
        String sql = "update movie set name=?, _director_id=?, realse_year=?, "
                + "movie_length=?, country=?, rating_avarage=?, price=?, src=?, description=? where id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, m.getName());
            st.setInt(2, m.getDirector().getId());
            st.setDate(3, m.getRealse_year());
            st.setInt(4, m.getLength());
            st.setString(5, m.getCountry());
            st.setInt(6, m.getRating());
            st.setInt(7, m.getPrice());
            st.setString(8, m.getSrc());
            st.setString(9, m.getDescription());
            st.setInt(10, m.getId());
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    //delete movie by movieid
    public void deleteMovieByMovieId(int id) {
        ActorHandle ah = new ActorHandle();
        GenreHandle gh = new GenreHandle();
        
        ah.deleteActorByMovieId(id);
        gh.deleteGenreByMovieId(id);
        
        String sql = "delete from movie where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
