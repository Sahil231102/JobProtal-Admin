package Controller;

import DAO.SignUpDB;
import model.SignUpModel;

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
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "SignUpServlet", value = "/SignUpServlet")
@MultipartConfig(maxFileSize = 1024*1024*10)
public class SignUpServlet extends HttpServlet {

    private final static Logger LOGGER = Logger.getLogger(SignUpServlet.class.getCanonicalName());

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String fname = req.getParameter("fname");
            String lname = req.getParameter("lname");
            String email = req.getParameter("email");
            String mobile = req.getParameter("phone");
            String password = req.getParameter("password");
            String gender = req.getParameter("gender");


            Part Aimg = req.getPart("Adminimage");
            InputStream inputStream = Aimg.getInputStream();
            byte[] dp = readByteFromInputStram(inputStream);



//            String imgname = AdminextractFileName(Aimg);
//            String AdminImgPath = "D:/AdminSide/src/main/webapp/adminimg/" + imgname;
//            Aimg.write(AdminImgPath);

            SignUpModel signupdata = new SignUpModel(fname, lname, mobile, email, dp, gender,password);
            SignUpDB sDB = new SignUpDB();
            boolean AdminSignUp = sDB.signUpInsertData(signupdata);

            if (AdminSignUp) {
//                System.out.println(fname);
//                System.out.println(lname);
//                System.out.println(email);
//                System.out.println(mobile);
//                System.out.println(password);
//                System.out.println(AdminImgPath.toString());
//                System.out.println(gender);
                req.setAttribute("message", "Admin SignUp successful.");
                resp.sendRedirect("AdminLogin.jsp");
            } else {
                req.setAttribute("message", "Data insertion failed.");
                req.getRequestDispatcher("/AdminLogin.jsp").forward(req, resp);
            }
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error during signup process", e);
            req.setAttribute("message", "An error occurred: " + e.getMessage());
            req.getRequestDispatcher("/AdminLogin.jsp").forward(req, resp);
        }
    }

    private byte[] readByteFromInputStram(InputStream inputStream) throws IOException {
        ByteArrayOutputStream buffer  = new ByteArrayOutputStream();
        int byteRead;
        byte[] data = new byte[1024];
        while((byteRead = inputStream.read(data,0,data.length))!=-1)
        {
            buffer.write(data,0,byteRead);

        }
        return buffer.toByteArray();
    }
//    private String AdminextractFileName(Part part) {
//        String contentDisp = part.getHeader("content-disposition");
//        String[] items = contentDisp.split(";");
//        for (String s : items) {
//            if (s.trim().startsWith("filename")) {
//                return s.substring(s.indexOf("=") + 2, s.length() - 1);
//            }
//        }
//        return "";
//    }
}
