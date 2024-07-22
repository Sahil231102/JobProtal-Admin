package DAO;

import model.LoginModel;
import model.SignUpModel;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class SignUpDB {

    public boolean signUpInsertData(SignUpModel signUpModel){
        String sql = "INSERT INTO  admin (First_name, Last_name, Contect_Number, Email, Image, Gender, Password) VALUES (?,?,?,?,?,?,?)";

        try {
            Connection con = MyDatabase.getConnection();
            PreparedStatement psmt = con.prepareStatement(sql);

            psmt.setString(1, signUpModel.getFname());
            psmt.setString(2, signUpModel.getLname());
            psmt.setString(3, signUpModel.getPhone());
            psmt.setString(4, signUpModel.getEmail());
            psmt.setBytes(5, signUpModel.getAdminimg());
            psmt.setString(6, signUpModel.getGender());
            psmt.setString(7, signUpModel.getPassword());

            int SignUpDataInsert = psmt.executeUpdate();
            return SignUpDataInsert > 1;



        }
        catch (Exception e)
        {
            e.printStackTrace();
            return false;
        }

    }
}
