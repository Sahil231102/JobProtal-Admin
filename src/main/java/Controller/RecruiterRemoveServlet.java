package Controller;

import DAO.RecruiterRemoveDB;
import DAO.SeekerRemoveDB;
import model.RecruiterRemoveModel;
import model.SeekerRemoveModel;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "RecruiterRemoveServlet" ,value = "/RecruiterRemoveServlet")
public class RecruiterRemoveServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String R_id = req.getParameter("r_id");
        System.out.println(R_id);

        RecruiterRemoveModel recruiterRemoveModel = new RecruiterRemoveModel(R_id);
        RecruiterRemoveDB rDB = new RecruiterRemoveDB();
        boolean Remove = rDB.RecruiterRemoveDB(recruiterRemoveModel);

        if(Remove)
        {
            resp.sendRedirect("./?pn=RecruiterSignUp&s=recruiter");
        }
        else
        {
            resp.sendRedirect("./?pn=RecruiterSignUp?s=recruiterNot");

        }


    }

}
