
package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import Model.Comment;

/**
 *
 * @author win
 */
public class CommentHandle extends DBContext{
    //get comment by movieid
    public List<Comment> getCmtById(int id) {
        MovieHandle mhd = new MovieHandle();
        UserHandle uhd = new UserHandle();
        List<Comment> list = new ArrayList<>();
        
        String sql = "select * from comment where _movie_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Comment g = new Comment(rs.getInt(1), uhd.getUiByCmtId(rs.getInt(2)), mhd.getMovieById(rs.getInt(3)),rs.getString(4), rs.getDate(5));
                list.add(g);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    //get segment comment
    public List<Comment> getCmtSegment(List<Comment> allCmt, int start, int end){
        List<Comment> list = new ArrayList<>();
        for(int i = start; i<end; i++){
            list.add(allCmt.get(i));
        }
        return list;
    }
    
    //add cmt to dtb
    public void addCmt(Comment c){
        String sql = "insert into comment values(?, ?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, c.getUi().getId());
            st.setInt(2, c.getMovie().getId());
            st.setString(3, c.getCmt());
            st.setDate(4, c.getTimeCmt());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
}
