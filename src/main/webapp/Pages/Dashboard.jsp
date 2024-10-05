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
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

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
                    <img src="./vendors/images/icons/job.png" height="20%" width="20%">
                    <div class="widget-data" style="place-items: center">
                        <%
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/job-portal","root","");
                            Statement st1 = con1.createStatement();
                            ResultSet rs1 = st1.executeQuery("select count(j_id) from job_add ");

                            while (rs1.next())
                            {
                                String number = rs1.getString(1);


%>

                        <div class="h4 mb-0"><%=number%></div>
                        <div class="weight-600 font-14">Number Of Jobs</div> <%
                            }  %>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-3 mb-30">
            <div class="card-box height-100-p widget-style1">
                <div class="d-flex flex-wrap align-items-center">
                    <img src="./vendors/images/icons/job-offer.png" height="20%" width="20%">
                    <div class="widget-data" style="place-items: center">
                        <%
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            Connection con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/job-portal","root","");
                            Statement st2 = con2.createStatement();
                            ResultSet rs2 = st2.executeQuery("select count(a_id) from job_apply");

                            while (rs2.next())
                            {
                                String ApplyNo = rs2.getString(1);


                        %>

                        <div class="h4 mb-0"><%=ApplyNo%></div>
                        <div class="weight-600 font-14">Number Of Apply</div> <%
                        }  %>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-3 mb-30">
            <div class="card-box height-100-p widget-style1">
                <div class="d-flex flex-wrap align-items-center">
                    <img src="./vendors/images/icons/job-seeker.png" height="20%" width="20%">
                    <div class="widget-data" style="place-items: center">
                        <%
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            Connection con3 = DriverManager.getConnection("jdbc:mysql://localhost:3306/job-portal","root","");
                            Statement st3 = con3.createStatement();
                            ResultSet rs3 = st3.executeQuery("select count(s_id) from seeker");

                            while (rs3.next())
                            {
                                String SeekerNo = rs3.getString(1);


                        %>

                        <div class="h4 mb-0"><%=SeekerNo%></div>
                        <div class="weight-600 font-14">Number Of Seeker</div> <%
                        }  %>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-3 mb-30">
            <div class="card-box height-100-p widget-style1">
                <div class="d-flex flex-wrap align-items-center">
                    <img src="./vendors/images/icons/recruitment.png" height="20%" width="20%">
                    <div class="widget-data" style="place-items: center">
                        <%
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            Connection con4 = DriverManager.getConnection("jdbc:mysql://localhost:3306/job-portal","root","");
                            Statement st4 = con4.createStatement();
                            ResultSet rs4 = st4.executeQuery("select count(r_id) from recuruiter");

                            while (rs4.next())
                            {
                                String RecruiterNo = rs4.getString(1);


                        %>

                        <div class="h4 mb-0"><%=RecruiterNo%></div>
                        <div class="weight-600 font-14">Number Of Recruiter</div> <%
                        }  %>
                    </div>
                </div>
            </div>
        </div>


    </div>

    <div class="card-box d-lg-table-cell">
        <h2 class="h4 pd-20">Best Job</h2>
        <table class="data-table table nowrap" >
            <thead>
            <tr>
                <th class="tbl-srt">Job_id</th>
                <th class="tbl-srt">Company Img</th>
                <th class="tbl-srt">Poster Img</th>
                <th class="tbl-srt"> Company Name </th>
                <th class="tbl-srt">Job Title</th>
                <th class="tbl-srt">Employment Type</th>
                <th class="datatable-nosort">Job Add Date</th>
                <th class="tbl-srt">Employment Type</th>


            </tr>
            </thead>
            <tbody>
            <%
                int number =0;
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/job-portal","root","");
                    Statement st = con.createStatement();
                    ResultSet rs = st.executeQuery("select * from job_add inner join  recuruiter on job_add.r_id = recuruiter.r_id");
                    while (rs.next()) {

                        int job_id = rs.getInt("j_id");
                        String companyName = rs.getString("Company_name");
                        String job_Title = rs.getString("Job_Title");
                        String EmploymentType = rs.getString("EmploymentType");
                        String jobAddDate = rs.getString("JobAddDate");
                        String jobdes = rs.getString("JobDescripton");
                        String QualificationAndSkill = rs.getString("Qualification_and_skill");
                        String Benefits = rs.getString("Benefits");
                        byte[] cimg = rs.getBytes("Cimg");
                        String imgByte1 = Base64.getEncoder().encodeToString(cimg);
                        String cimgs = "data:image/png;base64," + imgByte1;
                        byte[] Pimg = rs.getBytes("PosterImg");
                        String imgByte = Base64.getEncoder().encodeToString(Pimg);
                        String pimgs = "data:image/png;base64," + imgByte;
                        number++;
            %>
            <tr>
                <td><%=number%></td>
                <td class="table-plus">
                    <div class="wrapper">
                        <div class="box box1 imgBox"><img class="imgBox" src="<%= cimgs %>" alt="Company Image"></div>
                    </div>
                </td>
                <td class="table-plus">
                    <div class="wrapper">
                        <div class="box box1 imgBox"><img class="imgBox" src="<%= pimgs %>" alt="Company Image"></div>
                    </div>
                </td>
                <td><%=companyName%></td>
                <td style="text-wrap:wrap;"><%=job_Title%></td>

                <td><%=EmploymentType %></td>
              <td><%=jobAddDate%></td>


                <td >
                    <div class="d-flex">
                        <input type="button" class="btn btn-primary" value="View" onclick="window.location.href='.?pn=jobinfo&j_id=<%=job_id%>';">
                        <form action="JobRemoveServlet" method="post">
                            <input type="hidden" value="<%=job_id%>" name="job_id">
                            <input type="submit" class="btn btn-danger" value="Remove">
                        </form>
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
