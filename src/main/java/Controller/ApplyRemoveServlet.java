package Controller;

import DAO.ApplyRemoveDB;
import DAO.JobRemoveDB;
import DAO.RecruiterRemoveDB;
import DAO.SeekerRemoveDB;
import model.ApplyRemoveModel;
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

@WebServlet(name = "ApplyRemoveServlet" ,value = "/ApplyRemoveServlet")
public class ApplyRemoveServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String a_id = req.getParameter("apply_id");
        System.out.println(a_id);

        ApplyRemoveModel applyRemoveModel = new ApplyRemoveModel(a_id);
        ApplyRemoveDB aDB = new ApplyRemoveDB();
        boolean Remove = aDB.ApplyRemoveDB(applyRemoveModel);

        if(Remove)
        {
            resp.sendRedirect("./?pn=SeekerApply&s=applyRemove");
        }
        else
        {
            RequestDispatcher rd = req.getRequestDispatcher("./?pn=SeekerApply");
            rd.include(req,resp);
        }


    }

}
