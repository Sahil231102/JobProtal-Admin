package Controller;

import DAO.LoginDB;
import model.LoginModel;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "LoginServlet", value="/LoginServlet")
@MultipartConfig
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        // Remove the call to super.doPost(req, resp);
        try {
            String email = req.getParameter("email");
            String password = req.getParameter("password");

            LoginModel loginModel = new LoginModel(email, password);
            LoginDB Ldb = new LoginDB();
            boolean AdminLogin = Ldb.LoginAdmin(loginModel);

            if (AdminLogin) {
                out.println("<script>alert('Login Successfully')</script>");
                RequestDispatcher rd = req.getRequestDispatcher("/index.jsp");
                rd.forward(req, resp);
            } else {
                out.println("<script>alert('incorrect phone number and password Please Enter Valid')</script>");
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/AdminLogin.jsp");
                rd.include(req, resp);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}