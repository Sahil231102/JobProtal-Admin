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
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;


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

        InputStream inputStream = cimg.getInputStream();
        byte[] newcimgs = readByteFromInputstream(inputStream);

        // Create JobUpdateModel object
        JobUpdateModel jobUpdateModel = new JobUpdateModel(job_id, job_Name, company_Name, city, state, salary, jobType, jobadder, jobdes, startDate, endDate, email, phone, newcimgs);

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
    private byte[] readByteFromInputstream(InputStream inputStream) throws IOException {
        ByteArrayOutputStream buffer = new ByteArrayOutputStream();
        int  ByteRead;
        byte[] data = new byte[1024];
        while((ByteRead=inputStream.read(data,0, data.length))!=-1)
        {
            buffer.write(data,0,ByteRead);
        }
        return buffer.toByteArray();
    }

}
