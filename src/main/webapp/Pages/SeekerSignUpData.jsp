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

        .btn {
            padding: 8px 12px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
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
    <title>Seeker Register Data</title>
</head>
<body>
<div class="container">
    <h2>Seeker Register Data</h2>
    <ul class="responsive-table">
        <li class="table-header">
            <div class="col col-1">Id</div>
            <div class="col col-2">Seeker Img</div>
            <div class="col col-2">Full Name</div>
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

                ResultSet rs = st.executeQuery("select * from Seeker");
                int i = 1;
                while (rs.next())
                {
                    String Fname = rs.getString("fname");
                    String lname = rs.getString("lname");
                    String Email = rs.getString("email");
                    String phoneNumber = rs.getString("phoneNumber");
                    byte[] simg = rs.getBytes("simg");
                    String imgByte1 = Base64.getEncoder().encodeToString(simg);
                    String simgs = "data:image/png;base64," + imgByte1;
        %>
        <li class="table-row">
            <div class="col col-1" data-label="Id"><%= i++ %></div>
            <div class="col col-2" data-label="Company Img"><img src="<%= simgs %>" alt="Company Image"></div>
            <div class="col col-2" data-label="Company Name"><%= Fname %> <%=lname%></div>
            <div class="col col-2" data-label="Email"><%= Email %></div>
            <div class="col col-2" data-label="Phone Number"><%= phoneNumber %></div>
            <div class="col col-2" data-label="Job Apply Date">21-08-2024</div>
            <div class="col col-2" data-label="Actions"><input type="button" class="btn" value="View"></div>
            <div class="col col-2" data-label="Actions"><input type="button" class="btn-remove" value="Remove"></div>
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
