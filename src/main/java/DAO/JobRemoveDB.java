package DAO;

import model.JobRemoveModel;
import model.RecruiterRemoveModel;
import model.SeekerRemoveModel;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class JobRemoveDB {
    public boolean JobRemoveDB(JobRemoveModel jobRemoveModel) {
        String sql = "DELETE FROM job_add WHERE j_id=?";

        try
        {
            Connection con = MyDatabase.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, jobRemoveModel.getJobId());

            int removeJob = ps.executeUpdate();
            con.close();
            return removeJob>0;
        }
        catch (Exception e)
        {
            System.out.println(e);
            return false;
        }


    }
}
