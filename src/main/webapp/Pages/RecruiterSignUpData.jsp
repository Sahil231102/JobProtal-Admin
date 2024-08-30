<%@ page import="java.sql.Connection" %>
<%@ page import="DAO.MyDatabase" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.Base64" %><%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 10-08-2024
  Time: 10:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <style>

        .container {
            width: 100%;
            max-width: 1200px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            font-size: 24px;
            color: #333;
        }

        .responsive-table {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .table-header {
            display: flex;
            justify-content: space-between;
            background-color: #f1f1f1;
            padding: 15px;
            border-bottom: 2px solid #e1e1e1;
        }

        .table-row {
            display: flex;
            justify-content: space-between;
            padding: 15px;
            border-bottom: 1px solid #e1e1e1;
        }

        .table-row:nth-of-type(odd) {
            background-color: #f9f9f9;
        }

        .col {
            flex: 1;
            text-align: center;
            padding: 0 10px;
            word-wrap: break-word; /* Handle long text */
        }

        .col-2 {
            flex: 2;
        }

        .col img {
            max-width: 100px;
            height: 70px;
            border-radius: 4px;
        }


        .btn-remove {
            padding: 8px 12px;
            background-color: red;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .btn:hover {
            background-color: black;
            color: whitesmoke;
        }
    </style>
    <title>Recruiter SignUp Data</title>
</head>
<body>
<div class="container">
    <h2>Recruiter SignUp Data</h2>
    <ul class="responsive-table">
        <li class="table-header">
            <div class="col col-1">Id</div>
            <div class="col col-2">Company Img</div>
            <div class="col col-2">Company Name</div>
            <div class="col col-2">Email</div>
            <div class="col col-2">Phone Number</div>
            <div class="col col-2">Register Date</div>
            <div class="col col-2">Actions</div>
            <div class="col col-2">Actions</div>
        </li>
        <%

            try
            {
                Connection con = MyDatabase.getConnection();
                Statement st = con.createStatement();

                ResultSet rs = st.executeQuery("select * from recuruiter");
                int i = 1;
                while (rs.next())
                {
                    String r_id = rs.getString("r_id");
                    String CompanyName = rs.getString("Company_Name");
                    String Email = rs.getString("Email");
                    String PhoneNumber = rs.getString("Phone_Number");
                    byte[] cimg = rs.getBytes("Cimg");
                    String imgByte1 = Base64.getEncoder().encodeToString(cimg);
                    String cimgs = "data:image/png;base64," + imgByte1;
        %>
        <li class="table-row">
            <div class="col col-1" data-label="Id"><%= i++ %></div>
            <div class="col col-2" data-label="Company Img"><img src="<%= cimgs %>" alt="Company Image"></div>
            <div class="col col-2" data-label="Company Name"><%= CompanyName %></div>
            <div class="col col-2" data-label="Email"><%= Email %></div>
            <div class="col col-2" data-label="Phone Number"><%= PhoneNumber %></div>
            <div class="col col-2" data-label="Job Apply Date">21-08-2024</div>
            <div class="col col-2" data-label="Actions"><input type="button" class="btn btn-dark" value="View"></div>
            <form action="RecruiterRemoveServlet" method="post">
                <input type="hidden" name="r_id" value="<%= r_id %>">
                <button type="submit" class="btn btn-danger">Remove</button>
            </form>
        </li>
        <%
                }
            }
            catch (Exception e)
            {
                e.printStackTrace();
            }
        %>
    </ul>
</div>
</body>
</html>
