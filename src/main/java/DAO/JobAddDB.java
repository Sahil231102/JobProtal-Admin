package DAO;

import model.AddJobData;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class JobAddDB {

    public boolean insertJob(AddJobData addJobData) {
        String sql = "INSERT INTO add_job (Job_Name, Company_Name, City, State, Email, Phone_Number, Salary, JobType, StartDate, EndDate, JobDescription, JobAdder, companyImg) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            Connection con = MyDatabase.getConnection();
            PreparedStatement psmt = con.prepareStatement(sql);


            psmt.setString(1, addJobData.getJobname());
            psmt.setString(2, addJobData.getCompanyname());
            psmt.setString(3, addJobData.getCity());
            psmt.setString(4, addJobData.getState());
            psmt.setString(5, addJobData.getEmail());
            psmt.setString(6, addJobData.getPhone());
            psmt.setString(7, addJobData.getSalary());
            psmt.setString(8, addJobData.getJobtype());
            psmt.setString(9, addJobData.getStartdate());
            psmt.setString(10, addJobData.getEnddate());
            psmt.setString(11, addJobData.getJobdesc());
            psmt.setString(12, addJobData.getJobAdder());
            psmt.setBytes(13, addJobData.getCimg());

            int jobInsert = psmt.executeUpdate();
            return jobInsert > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}