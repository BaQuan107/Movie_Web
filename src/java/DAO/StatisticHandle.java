/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author win
 */
public class StatisticHandle extends DBContext {

    public int getResultInt(String sql) {
        int t = 0;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                t = rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return t;
    }

    public int countUserAcc() {
        String sql = "select count(*) from user_acc";
        return getResultInt(sql);
    }

    public int countMovie() {
        String sql = "select count(*) from movie";
        return getResultInt(sql);
    }

    public int sumAllMoneyMovie() {
        String sql = "select sum(price) from movie";
        return getResultInt(sql);
    }

    public int countDirectorAndActor() {
        String sql1 = "select count(*) from director";
        String sql2 = "select count(*) from actor";
        return getResultInt(sql1) + getResultInt(sql2);
    }

    public String getArrayStringCreateAcc() {
        String result = "";
        String sql = "select count(*) from user_acc where MONTH(createdAt)=1 and YEAR(createdAt) = 2022 union all\n"
                + "select count(*) from user_acc where MONTH(createdAt)=2 and YEAR(createdAt) = 2022 union all\n"
                + "select count(*) from user_acc where MONTH(createdAt)=3 and YEAR(createdAt) = 2022 union all\n"
                + "select count(*) from user_acc where MONTH(createdAt)=4 and YEAR(createdAt) = 2022 union all\n"
                + "select count(*) from user_acc where MONTH(createdAt)=5 and YEAR(createdAt) = 2022 union all\n"
                + "select count(*) from user_acc where MONTH(createdAt)=6 and YEAR(createdAt) = 2022 union all\n"
                + "select count(*) from user_acc where MONTH(createdAt)=7 and YEAR(createdAt) = 2022 union all\n"
                + "select count(*) from user_acc where MONTH(createdAt)=8 and YEAR(createdAt) = 2022 union all\n"
                + "select count(*) from user_acc where MONTH(createdAt)=9 and YEAR(createdAt) = 2022 union all\n"
                + "select count(*) from user_acc where MONTH(createdAt)=10 and YEAR(createdAt) = 2022 union all\n"
                + "select count(*) from user_acc where MONTH(createdAt)=11 and YEAR(createdAt) = 2022 union all\n"
                + "select count(*) from user_acc where MONTH(createdAt)=12 and YEAR(createdAt) = 2022";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                result += rs.getInt(1) + ",";
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return result.substring(0, result.length() - 1);
    }

    public String getArrayStringMFAcc() {
        String result = "";
        String sql = "select COUNT(*) from user_acc join user_info on user_acc.id = user_info._user_id where user_info.gender = 1 union all\n"
                + "select COUNT(*) from user_acc join user_info on user_acc.id = user_info._user_id where user_info.gender = 0";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                result += rs.getInt(1) + ",";
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return result.substring(0, result.length() - 1);
    }

    public String getArrayStringGenM() {
        String result = "";
        String sql = "select genre_name, COUNT(*) as num from genre join movie_genre on genre.id = movie_genre._genre_id group by genre.id, genre_name";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                result += rs.getString(1) + "-" + rs.getInt(2) + ",";
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return result.substring(0, result.length() - 1);
    }

    public String getArrayStringMoiveViewer() {
        String result = "";
        String sql = "select top 7 name, number_view from movie order by number_view desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                result += rs.getString(1) + "_" + rs.getInt(2) + ",";
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return result.substring(0, result.length() - 1);
    }

    public String getArrayStringStatisticMoney() {
        String result = "";
        String sql = "select sum(price) from movie_userInfo join movie on movie_userInfo._movie_id = movie.id where MONTH(boughtAt)=1 and YEAR(boughtAt) = 2022 union all\n"
                + "select sum(price) from movie_userInfo join movie on movie_userInfo._movie_id = movie.id where MONTH(boughtAt)=2 and YEAR(boughtAt) = 2022 union all\n"
                + "select sum(price) from movie_userInfo join movie on movie_userInfo._movie_id = movie.id where MONTH(boughtAt)=3 and YEAR(boughtAt) = 2022 union all\n"
                + "select sum(price) from movie_userInfo join movie on movie_userInfo._movie_id = movie.id where MONTH(boughtAt)=4 and YEAR(boughtAt) = 2022 union all\n"
                + "select sum(price) from movie_userInfo join movie on movie_userInfo._movie_id = movie.id where MONTH(boughtAt)=5 and YEAR(boughtAt) = 2022 union all\n"
                + "select sum(price) from movie_userInfo join movie on movie_userInfo._movie_id = movie.id where MONTH(boughtAt)=6 and YEAR(boughtAt) = 2022 union all\n"
                + "select sum(price) from movie_userInfo join movie on movie_userInfo._movie_id = movie.id where MONTH(boughtAt)=7 and YEAR(boughtAt) = 2022 union all\n"
                + "select sum(price) from movie_userInfo join movie on movie_userInfo._movie_id = movie.id where MONTH(boughtAt)=8 and YEAR(boughtAt) = 2022 union all\n"
                + "select sum(price) from movie_userInfo join movie on movie_userInfo._movie_id = movie.id where MONTH(boughtAt)=9 and YEAR(boughtAt) = 2022 union all\n"
                + "select sum(price) from movie_userInfo join movie on movie_userInfo._movie_id = movie.id where MONTH(boughtAt)=10 and YEAR(boughtAt) = 2022 union all\n"
                + "select sum(price) from movie_userInfo join movie on movie_userInfo._movie_id = movie.id where MONTH(boughtAt)=11 and YEAR(boughtAt) = 2022 union all\n"
                + "select sum(price) from movie_userInfo join movie on movie_userInfo._movie_id = movie.id where MONTH(boughtAt)=12 and YEAR(boughtAt) = 2022";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                result += rs.getInt(1) + ",";
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return result.substring(0, result.length() - 1);
    }

}
