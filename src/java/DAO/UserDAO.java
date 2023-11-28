package DAO;

import Model.User_Acc;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.sql.PreparedStatement;

/**
 *
 * @author baqua
 */
public class UserDAO {

    private final DBContext dbContext;
    Connection cnn;

    public UserDAO() {
        this.dbContext = new DBContext();
    }

    public boolean checkLogin(String username, String password) {
        try {
            String query = "SELECT * FROM users WHERE Account = ? AND Password = ? ";
            try (PreparedStatement preparedStatement = dbContext.createStatement(query, username, password); ResultSet resultSet = preparedStatement.executeQuery()) {
                return resultSet.next();
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean checkUser(String account, String password) {
        try {
            String strSQL = "SELECT * FROM Users WHERE account=? AND password=?";
            try (PreparedStatement stm = cnn.prepareStatement(strSQL)) {
                stm.setString(1, account);
                stm.setString(2, password);

                try (ResultSet rs = stm.executeQuery()) {
                    return rs.next(); // Trả về true nếu có bản ghi khớp
                }
            }
        } catch (Exception e) {
            System.out.println("checkUser: " + e.getMessage());
        }
        return false;
    }
    
    public int getCategoryId(int ProuctId) {

        String sqlQuery = " select Products.CategoryID from Products where ProductID = ?";

        try {
            Connection connection = new DBContext().getConnection();
            PreparedStatement statement = connection.prepareStatement(sqlQuery);

            statement.setInt(1, ProuctId);
            ResultSet result = statement.executeQuery();
            while (result.next()) {
                return result.getInt(1);
            }
        } catch (Exception sqlError) {
        }
        return -1;
    }
}
