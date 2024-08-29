package DAO;

import model.SeekerRemoveModel;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class SeekerRemoveDB {
    public boolean SeekerRemoveDB(SeekerRemoveModel seekerRemoveModel) {
            String sql = "DELETE FROM seeker WHERE s_id=?";

            try
            {
                Connection con = MyDatabase.getConnection();
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setString(1, seekerRemoveModel.getId());

                int deletedata = ps.executeUpdate();
                con.close();
                return deletedata>0;
            }
            catch (Exception e)
            {
                System.out.println(e);
                return false;
            }


    }
}
