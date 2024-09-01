package DAO;

import model.ApplyRemoveModel;
import model.JobRemoveModel;
import model.RecruiterRemoveModel;
import model.SeekerRemoveModel;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class ApplyRemoveDB {
    public boolean ApplyRemoveDB(ApplyRemoveModel applyRemoveModel) {
        String sql = "DELETE FROM job_apply WHERE a_id=?";

        try
        {
            Connection con = MyDatabase.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, applyRemoveModel.getA_id());

            int removeApply = ps.executeUpdate();
            con.close();
            return removeApply>0;
        }
        catch (Exception e)
        {
            System.out.println(e);
            return false;
        }


    }
}
