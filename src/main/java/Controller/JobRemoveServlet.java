package Controller;

import DAO.JobRemoveDB;
import DAO.RecruiterRemoveDB;
import DAO.SeekerRemoveDB;
import model.JobRemoveModel;
import model.RecruiterRemoveModel;
import model.SeekerRemoveModel;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "JobRemoveServlet" ,value = "/JobRemoveServlet")
public class JobRemoveServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String j_id = req.getParameter("job_id");
        System.out.println(j_id);

        JobRemoveModel jobRemoveModel = new JobRemoveModel(j_id);
        JobRemoveDB rDB = new JobRemoveDB();
        boolean Remove = rDB.JobRemoveDB(jobRemoveModel);

        if(Remove)
        {
            resp.sendRedirect("./?pn=Dashboard");
        }
        else
        {
            RequestDispatcher rd = req.getRequestDispatcher("./?pn=Dashboard");
            rd.include(req,resp);
        }


    }

}
