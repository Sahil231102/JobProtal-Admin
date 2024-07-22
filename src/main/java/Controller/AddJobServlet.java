package Controller;

import DAO.JobAddDB;
import model.AddJobData;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Paths;

@WebServlet(name = "AddJobServlet", value = "/AddJobServlet")
@MultipartConfig
public class AddJobServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String jobname = req.getParameter("jobname");
        String companyname = req.getParameter("companyname");
        String city = req.getParameter("city");
        String state = req.getParameter("state");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String salary = req.getParameter("salary");
        String jobtype = req.getParameter("jobtype");
        String startdate = req.getParameter("startdate");
        String enddate = req.getParameter("enddate");
        String jobdesc = req.getParameter("jobdesc");
        String jobAdder = req.getParameter("JobAdder");
        Part cimg = req.getPart("cimg");
        InputStream inputStream = cimg.getInputStream();
        byte[] addjobimg = readFile(inputStream);



//        String imgname = extractFileName(cimg);
//        String imguploadpath = getServletContext().getRealPath("/") + "upload/" + imgname;
//        cimg.write(imguploadpath);

        AddJobData jobdata = new AddJobData(jobname, companyname, city, state, email, phone, salary, jobtype, startdate, enddate, jobdesc, jobAdder, addjobimg);
        JobAddDB jDB = new JobAddDB();
        boolean insert = jDB.insertJob(jobdata);

        if (insert) {
            resp.sendRedirect("./?pn=AJ");
        }
        else
        {
            resp.sendRedirect("./?pn=AJ");

        }

    }

    private byte[] readFile(InputStream inputStream) throws IOException {
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        int nRead;
        byte[] data = new byte[1024];
        while ((nRead = inputStream.read(data, 0, data.length)) != -1) {
            byteArrayOutputStream.write(data, 0, nRead);

        }
        return byteArrayOutputStream.toByteArray();
    }
//    private String extractFileName(Part part)
//    {
//        String contentDisp = part.getHeader("content-disposition");
//        String[] items = contentDisp.split(";");
//        for (String s : items)
//        {
//            if(s.trim().startsWith("filename"))
//            {
//                return s.substring(s.indexOf("=") + 2, s.length() - 1);
//            }
//        }
//        return "";
//    }
}
