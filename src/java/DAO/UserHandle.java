
package DAO;

import Model.User_Acc;
import Model.User_Info;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;


public class UserHandle extends DBContext{
    //Check when login
    public User_Acc findAcc(String username, String password){
	String sql="Select * from user_acc where username=? and password=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            if(rs.next()){
                User_Acc a = new User_Acc(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5));
                return a;
            }
        } catch (SQLException e) {
        System.out.println(e);
        }
        return null;
    }
    
    // check username when sign up
    public User_Acc FindExistUserAcc(String username){
        String sql="Select * from user_acc where username=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            if(rs.next()){
                User_Acc a = new User_Acc(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5));
                return a;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    
    // get user_acc by useracc id
    public User_Acc getUaByUaId(int id){
        String sql="Select * from user_acc where id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if(rs.next()){
                User_Acc a = new User_Acc(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5));
                return a;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    public User_Info getUIByUaId(int id){
        String sql="Select u.id, u.acc_money  from user_info as u  where _user_id= ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if(rs.next()){
                User_Info a = new User_Info(rs.getInt(1),rs.getDouble(2));
                return a;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    
    
    //get Userinfo cmt by userinfo id
    public User_Info getUiByCmtId(int id) {
        MovieHandle mhd = new MovieHandle();
        String sql = "Select * from user_info where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User_Info a = new User_Info(rs.getInt(1), rs.getInt(2),
                        rs.getString(3), rs.getString(4), rs.getString(5),
                        rs.getString(6), rs.getBoolean(7), rs.getDate(8),
                        rs.getDouble(9), mhd.getMovieIdByUserInfoId(rs.getInt(1)));
                return a;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    
    // add new account to dtb
    public void addSignUpAcc(String username, String password){
        java.sql.Date date = new java.sql.Date(Calendar.getInstance().getTime().getTime());
        String sql = "insert into user_acc values(?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            st.setInt(3, 0);
            st.setInt(4, 0);
            st.setDate(5, date);
            st.setInt(6, 0);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    // add default info for account just create
    public void addDefaultInfo(int user_id){
        String sql = "insert into user_info (_user_id, avatar , acc_money) values(?, 'avatar_default.jpg', 500 ) ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, user_id);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    // get info by user_acc id
    public User_Info getUserInfoByUser_AccId(int user_id){
        MovieHandle mhd = new MovieHandle();
        String sql = "Select * from user_info where _user_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, user_id);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                User_Info a = new User_Info(rs.getInt(1), rs.getInt(2), 
                        rs.getString(3), rs.getString(4), rs.getString(5), 
                        rs.getString(6), rs.getBoolean(7), rs.getDate(8), 
                        rs.getDouble(9), mhd.getMovieIdByUserInfoId(rs.getInt(1)));
                return a;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    
    // get info by user_info id
    public User_Info getUserInfoByUser_InfoId(int id){
        MovieHandle mhd = new MovieHandle();
        String sql = "Select * from user_info where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                User_Info a = new User_Info(rs.getInt(1), rs.getInt(2), 
                        rs.getString(3), rs.getString(4), rs.getString(5), 
                        rs.getString(6), rs.getBoolean(7), rs.getDate(8), 
                        rs.getDouble(9), mhd.getMovieIdByUserInfoId(rs.getInt(1)));
                return a;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    
    // update information from my-info
    public void updateInfo(User_Info ui){
        String sql = "update user_info set avatar=?, fullname=?, email=?, phone=?, gender=?, birth=? where _user_id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, ui.getAvatar());
            st.setString(2, ui.getFullname());
            st.setString(3, ui.getEmail());
            st.setString(4, ui.getPhone());
            st.setString(5, ui.isGender()+"");
            st.setDate(6, ui.getBirth());
            st.setInt(7, ui.getUser_id());
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    //change password
    public void changePw(String newPw, int user_id){
        String sql = "update user_acc set password=? where id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, newPw);
            st.setInt(2, user_id);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    //get User_info by input search and select bl/unbl
    public List<User_Info> getSearchedUserInfo(String type, String input) {
        MovieHandle mhd = new MovieHandle();
        int money=-1;
        try {
            money = Integer.parseInt(input);
        } catch (Exception e) {
        }
        List<User_Info> list = new ArrayList<>();
        String sql = "with r as(select user_info.*, state from user_info join user_acc on "
                + "user_info._user_id = user_acc.id where fullname like ? or email "
                + "like ? or phone like ? or birth like ? or acc_money = ?";
        
        if("Male".startsWith(input) || "male".startsWith(input)){
            sql+= " or gender=1 ";
        }
        else if("Female".startsWith(input) || "female".startsWith(input))
            sql+= " or gender=0 ";
        
        sql += ")select * from r";
        
        if(type.equals("Block"))
            sql += " where state = 1";
        else if(type.equals("Unblock"))
            sql += " where state = 0";
        
        try {
                PreparedStatement st = connection.prepareStatement(sql);
                st.setString(1, ("%" + input + "%"));
                st.setString(2, ("%" + input + "%"));
                st.setString(3, ("%" + input + "%"));
                st.setString(4, ("%" + input + "%"));
                st.setInt(5, money);
                ResultSet rs = st.executeQuery();
                while (rs.next()) {
                    User_Info ui = new User_Info(rs.getInt(1), rs.getInt(2), rs.getString(3),
                            rs.getString(4), rs.getString(5), rs.getString(6), rs.getBoolean(7), 
                            rs.getDate(8), rs.getDouble(9), mhd.getMovieIdByUserInfoId(rs.getInt(1)));
                    list.add(ui);
                }
            } catch (SQLException e) {
                System.out.println(e);
            }
        return list;
    }
    
    //get user_info follow by num of page
    public List<User_Info> getUserInfoByPage(List<User_Info> allUiList, int start, int end){
        List<User_Info> list = new ArrayList<>();
        for(int i = start; i<end; i++){
            list.add(allUiList.get(i));
        }
        return list;
    }
    
    //Block and unblock user_acc
    public void BlockAUnBlock(String type, int id){
        String sql = "update user_acc set state=? where id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            if(type.equals("Block"))
                st.setInt(1, 0);
            else if(type.equals("Unblock"))
                st.setInt(1, 1);
            st.setInt(2, id);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    // update userinfo money
    public void updateUserInfoMoney(User_Info ui, double mn){
        String sql = "update user_info set acc_money=? where id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setDouble(1, mn);
            st.setInt(2, ui.getId());
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    // add OwnFim===============================================
    public void addMovieUserInfo(User_Info ui, String[] idList){
        java.sql.Date date = new java.sql.Date(Calendar.getInstance().getTime().getTime());
        for(String id: idList){
            String sql = "insert into movie_userInfo values(?, ?, ?)";
            try {
                PreparedStatement st = connection.prepareStatement(sql);
                st.setInt(1, ui.getId());
                st.setInt(2, Integer.parseInt(id));
                st.setDate(3, date);
                st.executeUpdate();
            } catch (Exception e) {
                System.out.println(e);
            }
        }
    }
    
    //update receiptCode with username
    public void updateReceiptCode(String username, String code){
        String sql = "update user_acc set receiptCode=? where username=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, code);
            st.setString(2, username);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    //get receiptCode with username
    public String getReceptCode(String username){
        String sql = "Select * from user_acc where username = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                return rs.getString(7);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
}
