
package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import Model.Actor;

public class ActorHandle extends DBContext{
    //add new actor
    public void addNewActor(Actor d) {
        String sql = "insert into actor values(?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, d.getFullName());
            st.setDate(2, d.getBirth());
            st.setString(3, d.getNationality());
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    //find actor by actor d
    public Actor getActor(Actor d) {
        String sql = "Select * from actor where fullname=? and birth=? and nationality=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, d.getFullName());
            st.setDate(2, d.getBirth());
            st.setString(3, d.getNationality());
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Actor a = new Actor(rs.getInt(1), rs.getString(2), rs.getDate(3), rs.getString(4));
                return a;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    
    //get actor by movieid
    public List<Actor> getActorById(int id) {
        List<Actor> list = new ArrayList<>();
        String sql = "select actor.id, fullname, birth, nationality from actor join "
                + "movie_actor on actor.id = movie_actor._actor_id where _movie_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Actor g = new Actor(rs.getInt(1), rs.getString(2), rs.getDate(3), rs.getString(4));
                list.add(g);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    //get director by director name
    public List<Actor> getActorByDName(String name) {
        List<Actor> list = new ArrayList<>();
        String sql = "Select * from actor where fullname like ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, ("%" + name + "%"));
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Actor d = new Actor(rs.getInt(1), rs.getString(2), rs.getDate(3), rs.getString(4));
                list.add(d);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    //delete actor by movie id
    public void deleteActorByMovieId(int id) {
        String sql = "delete from movie_actor where _movie_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
