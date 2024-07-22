package DAO;

import model.JobUpdateModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class JobUpadateDB {

    public boolean updatejob(JobUpdateModel jobUpdateModel) {
        String updatequery = "UPDATE add_job SET Job_Name=?, Company_Name=?, City=?, State=?, Email=?, Phone_Number=?, Salary=?, JobType=?, StartDate=?, EndDate=?, JobDescription=?, JobAdder=?, companyImg=? WHERE Job_id=?";

        try {
            Connection con = MyDatabase.getConnection();
            PreparedStatement ps = con.prepareStatement(updatequery);
            ps.setString(1, jobUpdateModel.getJobName());
            ps.setString(2, jobUpdateModel.getCompany_Name());
            ps.setString(3, jobUpdateModel.getCity());
            ps.setString(4, jobUpdateModel.getState());
            ps.setString(5, jobUpdateModel.getEmail());
            ps.setString(6, jobUpdateModel.getPhone());
            ps.setString(7, jobUpdateModel.getSalary());
            ps.setString(8, jobUpdateModel.getJobtype());
            ps.setString(9, jobUpdateModel.getStartDate());
            ps.setString(10, jobUpdateModel.getEndDate());
            ps.setString(11, jobUpdateModel.getJobDescription());
            ps.setString(12, jobUpdateModel.getJobAdder());
            ps.setString(13,jobUpdateModel.getCimg());
            ps.setString(14, jobUpdateModel.getJobId());

            int jobUpdate = ps.executeUpdate();
            return jobUpdate > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
}
