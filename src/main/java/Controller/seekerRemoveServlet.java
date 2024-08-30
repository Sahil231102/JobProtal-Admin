package Controller;

import DAO.SeekerRemoveDB;
import model.SeekerRemoveModel;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "seekerRemoveServlet",value = "/seekerRemoveServlet")
public class seekerRemoveServlet extends HttpServlet {

    @Override

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String s_id = req.getParameter("s_id");
        System.out.println(s_id);

        SeekerRemoveModel seekerRemoveModel = new SeekerRemoveModel(s_id);
        SeekerRemoveDB sDB = new SeekerRemoveDB();
        boolean Remove = sDB.SeekerRemoveDB(seekerRemoveModel);

        if(Remove)
        {
            resp.sendRedirect("./?pn=SeekerSignUp");
        }
        else
        {
            RequestDispatcher rd = req.getRequestDispatcher("./?pn=SeekerSignUp");
            rd.include(req,resp);
        }


    }
}

