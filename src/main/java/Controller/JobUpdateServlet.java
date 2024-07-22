package Controller;

import DAO.JobUpadateDB;
import model.JobUpdateModel;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;


@WebServlet(name = "JobUpdateServlet", value = "/JobUpdateServlet")
@MultipartConfig
public class JobUpdateServlet extends HttpServlet {



    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String job_id = req.getParameter("id");
        String job_Name = req.getParameter("job_Name");
        String company_Name = req.getParameter("company_Name");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String city = req.getParameter("city");
        String state = req.getParameter("state");
        String salary = req.getParameter("salary");
        String startDate = req.getParameter("startDate");
        String endDate = req.getParameter("endDate");
        String jobType = req.getParameter("jobType");
        String jobdes = req.getParameter("JobDescription");
        String jobadder = req.getParameter("JobAdder");
        Part cimg = req.getPart("cimg");

        String imgname = extractFileName(cimg);
        String imguploadpath = "D:/AdminSide/src/main/webapp/upload/" + imgname;  // Construct the complete upload path
        cimg.write(imguploadpath);

        // Create JobUpdateModel object
        JobUpdateModel jobUpdateModel = new JobUpdateModel(job_id, job_Name, company_Name, city, state, salary, jobType, jobadder, jobdes, startDate, endDate, email, phone, imgname);

        // Update job in the database
        JobUpadateDB jDB = new JobUpadateDB();
        boolean updateJob = jDB.updatejob(jobUpdateModel);

        // Redirect based on update result
        if (updateJob) {
            System.out.println("Successfully updated job");
            resp.sendRedirect("./?pn=jobDetails");
        } else {
            System.out.println("Failed to update job");
            resp.sendRedirect("./?pn=jobinfo");
        }
    }

    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }
}
