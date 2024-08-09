package DAO;

import model.LoginModel;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginDB {
    public boolean LoginAdmin(LoginModel loginModel) {
        String sql = "SELECT * FROM admin WHERE Email = ? AND Password = ?";

        try {
            Connection con = MyDatabase.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, loginModel.getEmail());
            ps.setString(2, loginModel.getPassword());

            System.out.println("Executing query: " + ps.toString());  // Log the query for debugging

            ResultSet rs = ps.executeQuery();
            return rs.next();  // If there's a result, return true

        } catch (SQLException e) {
            System.err.println("SQL error: " + e.getMessage());
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            System.err.println("Class not found: " + e.getMessage());
            throw new RuntimeException(e);
        }
    }
}
