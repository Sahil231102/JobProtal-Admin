package Controller;

import DAO.JobDeleteDB;
import model.JobDeleteModel;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "JobDeleteServlet", value = "/JobDeleteServlet")
@MultipartConfig
public class JobDeleteServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String id = req.getParameter("id");

            JobDeleteModel jobDeleteModel = new JobDeleteModel(id);
            JobDeleteDB jobDeleteDB = new JobDeleteDB();
            boolean deleteJob = jobDeleteDB.deleteJob(jobDeleteModel.getJobId());

            if (deleteJob) {
                System.out.println("Successfully deleted job");
                resp.sendRedirect("./?pn=jobDetails");
            } else {
                System.out.println("Failed to delete job");
               resp.sendRedirect("./?pn=jobinfo");
            }
        } catch (Exception e) {
            e.printStackTrace();
            // You can forward to an error page or set an error attribute
            req.setAttribute("errorMessage", "An error occurred while deleting the job.");
            RequestDispatcher dispatcher = req.getRequestDispatcher("error.jsp");
            dispatcher.forward(req, resp);
        }
    }

}
