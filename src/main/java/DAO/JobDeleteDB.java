package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class JobDeleteDB {

    public boolean deleteJob(String id) {
        String sql = "DELETE FROM `add_job` WHERE Job_id=?";
        try (Connection con = MyDatabase.getConnection();
             PreparedStatement psmt = con.prepareStatement(sql)) {

            psmt.setString(1, id);

            int rowsAffected = psmt.executeUpdate();
            return rowsAffected > 0; // Return true if at least one row was affected (deleted)
        } catch (SQLException | ClassNotFoundException e) {
            // Log the exception (you can use a logging framework like SLF4J or just print the stack trace)
            e.printStackTrace();
            return false; // Return false if there was an error
        }
    }
}