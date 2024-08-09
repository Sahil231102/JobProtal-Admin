package DAO;

import model.AddJobData;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class JobAddDB {

    public boolean insertJob(AddJobData addJobData) {
        String sql = "INSERT INTO job_add (r_id, Job_Title, EmploymentType, Minsalary, Maxsalary, JobDescripton, QualifiBenefitscation_and_Skill,Benefits, PosterImg, JobAdder) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            Connection con = MyDatabase.getConnection();
            PreparedStatement psmt = con.prepareStatement(sql);


            psmt.setString(1, addJobData.getR_id());
            psmt.setString(2, addJobData.getJobTitle());
            psmt.setString(3, addJobData.getEmploymentType());
            psmt.setString(4, addJobData.getMinsalary());
            psmt.setString(5, addJobData.getMaxsalary());
            psmt.setString(6, addJobData.getJobdesc());
            psmt.setString(7, addJobData.getQualificaton_skill());
            psmt.setString(8, addJobData.getBenefites());
            psmt.setBytes(9, addJobData.getHpimg());
            psmt.setString(10, addJobData.getJobAdder());


            int jobInsert = psmt.executeUpdate();
            return jobInsert > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}