<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="DAO.MyDatabase" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.Base64" %><%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 05-06-2024
  Time: 05:22 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link
            href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&family=Josefin+Sans:wght@300;400;600;700&display=swap"
            rel="stylesheet"
    />
    <style>
        .wrapper {
            height: 100px;
            display: flex;
            gap: 20px;
        }

        .box {
            border: 1px solid #000;
            width: 100px; /* Set a fixed width */
            height: 100px; /* Set a fixed height */
        }

        .box img {
            width: 100%;
            height: 100%;
            object-fit: cover; /* Ensure the image covers the box */
        }

        .box1 img {
            object-fit: cover;
        }

        .widget-data,
        .card-box h2,
        table th,
        table td {
            font-family: 'Josefin Sans', sans-serif;
        }
    </style>
    <title>Title</title>
</head>
<body>
<div class="pd-ltr-20">
    <div class="row">
        <div class="col-xl-3 mb-30">
            <div class="card-box height-100-p widget-style1">
                <div class="d-flex flex-wrap align-items-center">
                    <div class="progress-data">
                        <div id="chart"></div>
                    </div>
                    <div class="widget-data">
                        <div class="h4 mb-0">2020</div>
                        <div class="weight-600 font-14">Contact</div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-3 mb-30">
            <div class="card-box height-100-p widget-style1">
                <div class="d-flex flex-wrap align-items-center">
                    <div class="progress-data">
                        <div id="chart2"></div>
                    </div>
                    <div class="widget-data">
                        <div class="h4 mb-0">400</div>
                        <div class="weight-600 font-14">Deals</div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-3 mb-30">
            <div class="card-box height-100-p widget-style1">
                <div class="d-flex flex-wrap align-items-center">
                    <div class="progress-data">
                        <div id="chart3"></div>
                    </div>
                    <div class="widget-data">
                        <div class="h4 mb-0">350</div>
                        <div class="weight-600 font-14">Campaign</div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-3 mb-30">
            <div class="card-box height-100-p widget-style1">
                <div class="d-flex flex-wrap align-items-center">
                    <div class="progress-data">
                        <div id="chart4"></div>
                    </div>
                    <div class="widget-data">
                        <div class="h4 mb-0">$6060</div>
                        <div class="weight-600 font-14">Worth</div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="card-box d-lg-table-cell">
        <h2 class="h4 pd-20">Best Job</h2>
        <table class="data-table table nowrap">
            <thead>
            <tr>
                <th class="tbl-srt">Job_id</th>
                <th class="tbl-srt">Company_Images</th>
                <th class="tbl-srt">Job_Name</th>
                <th class="tbl-srt">Company_Name</th>
                <th class="tbl-srt">City</th>
                <th class="tbl-srt">StartDate</th>
                <th class="tbl-srt">JobType</th>
                <th class="tbl-srt">jobAdder</th>
                <th class="datatable-nosort">Action</th>
            </tr>
            </thead>
            <tbody>
            <%
                int number =0;
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/job-junction","root","");
                    Statement st = con.createStatement();
                    ResultSet rs = st.executeQuery("select * from add_job order by job_id ASC ");
                    while (rs.next()) {
                        int job_id = rs.getInt("job_id");
                        String job_Name = rs.getString("job_Name");
                        String company_Name = rs.getString("company_Name");
                        String city = rs.getString("city");
                        String salary = rs.getString("salary");
                        String startDate = rs.getString("startDate");
                        String endDate = rs.getString("endDate");
                        String jobType = rs.getString("jobType");
                        String jobAdd = rs.getString("Job_Add_Date");
                        String jobdes = rs.getString("JobDescription");
                        String jobadder = rs.getString("JobAdder");
                        byte[] cimg = rs.getBytes("companyImg");
                        String imgByte = Base64.getEncoder().encodeToString(cimg);
                        String cimgs = "data:image/png;base64," + imgByte;
                        number++;
            %>
            <tr>
                <td><%=number%></td>
                <td class="table-plus">
                    <div class="wrapper">
                        <div class="box box1 imgBox"><img class="imgBox" src="<%= cimgs %>" alt="Company Image"></div>
                    </div>
                </td>
                <td><%= job_Name %></td>
                <td><%= company_Name %></td>
                <td><%= city %></td>
                <td><%= startDate %></td>
                <td><%= jobType %></td>
                <td><%= jobadder %></td>
                <td>
                    <div class="dropdown-menu-icon-list">
                        <a class="btn btn-link font-24 p-0 line-height-1 no-arrow dropdown-toggle" href="#" role="button" data-toggle="dropdown">
                            <i class="fa-solid fa-ellipsis-vertical"></i>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right dropdown-menu-icon-list">
                            <a class="dropdown-item" href="#"><i class="dw dw-eye"></i> View</a>
                            <a class="dropdown-item" href="#"><i class="dw dw-edit2"></i> Edit</a>
                            <a class="dropdown-item" href="#"><i class="dw dw-delete-3"></i> Delete</a>
                        </div>
                    </div>
                </td>
            </tr>
            <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
