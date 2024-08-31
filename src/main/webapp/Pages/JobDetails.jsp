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

        .table-header1 {
            display: flex;
            justify-content: space-between;
            background-color: #0b132b;
            color: white;
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


        .btn:hover {
            background-color: black;
            color: whitesmoke;
        }
    </style>
    <title>Job Data</title>
</head>
<body>
<div class="container">
    <h2>Job Data</h2>
    <ul class="responsive-table" >
        <li class="table-header1">
            <div class="col col-1">No</div>
            <div class="col col-2">Company Img</div>
            <div class="col col-2">Company Name</div>
            <div class="col col-2">Job Title</div>
            <div class="col col-2">Employment Type</div>
            <div class="col col-2">Job Add Date</div>

            <div class="col col-2">Actions</div>
        </li>
        <%

            try
            {
                Connection con = MyDatabase.getConnection();
                Statement st = con.createStatement();

                // Note: Use formatted_date in the SELECT statement
                ResultSet rs = st.executeQuery("SELECT *, DATE_FORMAT(job_add.JobAddDate, '%M %e %Y') AS formatted_date FROM job_add INNER JOIN recuruiter ON job_add.r_id = recuruiter.r_id");
                int i = 1;
                while (rs.next())
                {
                    String job_id = rs.getString("j_id");
                    String Company_Name = rs.getString("Company_Name");
String Job_Title = rs.getString("job_add.Job_Title");
//                    String phoneNumber = rs.getString("Phone_Number");
                    String EmploymentType = rs.getString("EmploymentType");
                    String jobAddDate = rs.getString("formatted_date");
                                      byte[] cimg = rs.getBytes("recuruiter.Cimg");
                    String imgByte1 = Base64.getEncoder().encodeToString(cimg);
                    String cimgs = "data:image/png;base64," + imgByte1;
        %>
        <li class="table-row">
            <div class="col col-1" data-label="Id"><%= i++ %></div>
            <div class="col col-2" data-label="Company Img"><img src="<%= cimgs %>" alt="Company Image"></div>
            <div class="col col-2" data-label="Company Name"><%= Company_Name %></div>
            <div class="col col-2" data-label="Company Name"><%= Job_Title %></div>
            <div class="col col-2" data-label="Job Title"><%= EmploymentType %></div>
            <div class="col col-2" data-label="Job Add Date"><%= jobAddDate %></div> <!-- Display formatted date -->
            <div class="col col-2" data-label="Actions">
                <input type="button" class="btn" value="View" onclick="window.location.href='.?pn=Jobinfo&j_id=<%=job_id%>';">
            </div>

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
