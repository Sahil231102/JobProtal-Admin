package DAO;

import model.RecruiterRemoveModel;
import model.SeekerRemoveModel;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class RecruiterRemoveDB {
    public boolean RecruiterRemoveDB(RecruiterRemoveModel recruiterRemoveModel) {
        String sql = "DELETE FROM recuruiter WHERE r_id=?";

        try
        {
            Connection con = MyDatabase.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, recruiterRemoveModel.getId());

            int removedata = ps.executeUpdate();
            con.close();
            return removedata>0;
        }
        catch (Exception e)
        {
            System.out.println(e);
            return false;
        }


    }
}
