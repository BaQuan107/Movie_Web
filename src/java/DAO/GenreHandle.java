
package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import Model.Genre;

public class GenreHandle extends DBContext{
    
    //get All genre
    public List<Genre> getAllGenre() {
        List<Genre> list = new ArrayList<>();
        String sql = "select * from genre";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Genre g = new Genre(rs.getInt(1), rs.getString(2));
                list.add(g);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    //add new genre
    public void addNewGenre(Genre d) {
        String sql = "insert into genre values(?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, d.getGenre_name());
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    //find genre by genre d
    public Genre getGenre(Genre d) {
        String sql = "Select * from genre where genre_name = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, d.getGenre_name());
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Genre a = new Genre(rs.getInt(1), rs.getString(2));
                return a;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    
    //get genre by name
    public List<Genre> getSearchGenre(String input) {
        List<Genre> list = new ArrayList<>();
        String sql = "select * from genre where genre_name like ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, ("%"+input+"%"));
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Genre g = new Genre(rs.getInt(1), rs.getString(2));
                list.add(g);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    // get genre by genreId
    public Genre getGenreById(int id) {
        String sql = "select * from genre where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Genre g = new Genre(rs.getInt(1), rs.getString(2));
                return g;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    
    public ArrayList<String> getStringGenre(List<Genre> listG){
        ArrayList<String> list = new ArrayList<>();
        for(Genre g:listG)
            list.add(g.getGenre_name());
        return list;
    }
    
    //get genre by movie id
    public List<Genre> getGenreByMovieId(int id) {
        List<Genre> list = new ArrayList<>();
        String sql = "select genre.* from genre join movie_genre on genre.id = movie_genre._genre_id"
                + " where movie_genre._movie_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Genre g = new Genre(rs.getInt(1), rs.getString(2));
                list.add(g);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    //delete genre by movie id
    public void deleteGenreByMovieId(int id) {
        String sql = "delete from movie_genre where _movie_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
