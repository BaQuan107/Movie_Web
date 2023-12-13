
package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import Model.Director;

/**
 *
 * @author win
 */
public class DirectorHandle extends DBContext {

    //add new director
    public void addNewDirector(Director d) {
        String sql = "insert into director values(?,?,?)";
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

    //find director by Director d
    public Director getDirector(Director d) {
        String sql = "Select * from director where fullname=? and birth=? and nationality=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, d.getFullName());
            st.setDate(2, d.getBirth());
            st.setString(3, d.getNationality());
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Director a = new Director(rs.getInt(1), rs.getString(2), rs.getDate(3), rs.getString(4));
                return a;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    
    //get director by movieid
    public Director getDirecById(int id) {
        String sql = "Select * from director where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Director d = new Director(rs.getInt(1), rs.getString(2), rs.getDate(3), rs.getString(4));
                return d;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    
    //get director by director name
    public List<Director> getDirecByDName(String name) {
        List<Director> list = new ArrayList<>();
        String sql = "Select * from director where fullname like ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, ("%" + name + "%"));
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Director d = new Director(rs.getInt(1), rs.getString(2), rs.getDate(3), rs.getString(4));
                list.add(d);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
}
