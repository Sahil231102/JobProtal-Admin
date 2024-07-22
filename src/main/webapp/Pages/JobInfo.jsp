<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.Base64" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <style>

body
{

}
        table {
            font-family:'Josefin Sans',sans-serif;
            border-collapse: collapse;
            width: 100%;
        }

        td, th {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }

        tr:nth-child(even) {
            background-color: #dddddd;
        }
        .container {
            width: 80%;
            margin: 0 auto;
            padding: 20px;
        }

        header {
            text-align: center;
            margin-bottom: 30px;
        }

        header h1 {
            font-size: 2.5em;
            color: #343a40;
        }

        .job-details {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }

        .job-card {
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            flex: 1;
            min-width: 250px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .company-logo {
            width: 80px;
            height: auto;
            margin-bottom: 10px;
        }

        .job-card h2 {
            color: #007bff;
            font-size: 1.5em;
            margin-bottom: 10px;
            text-align: center;
        }

        .job-card p {
            color: #6c757d;
            margin: 5px 0;
            text-align: center;
        }

        .job-card p strong {
            color: #343a40;
        }

    </style>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Job Information</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>



        <%

    String id = request.getParameter("job_id");

    if(id== null || id.isEmpty())
    {
        id="1";
    }
%>
    <%
        try
        {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/job-junction","root","");

            PreparedStatement psmt = con.prepareStatement("select * from add_job where job_id=?");

            psmt.setString(1, id);
            ResultSet rs = psmt.executeQuery();
            if (rs.next())
            {

                int job_id = rs.getInt("job_id");
                String job_Name = rs.getString("job_Name");
                String company_Name = rs.getString("company_Name");
                String phone = rs.getString("Phone_Number");
                String email= rs.getString("Email");
                String city = rs.getString("city");
                String state = rs.getString("state");
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
//                String cimg = rs.getString("companyImg");
//                String cimagepath = "upload/" + cimg;
    %>
    <div class="container">

        <section class="job-details">

            <div class="job-card">


                <table >
                    <tr>
                        <th colspan="2" style="text-align: center;font-weight: bold;font-size: 25px;color: #0c5460">Job Information</th>
                    </tr>

                    <tr>
                        <td colspan="2"  style="text-align: center">  <img src="<%=cimgs%>" alt="Avatar"  style="width:200px;  border-radius:50%;" ></td>

                    </tr>
                    <tr>
                        <td>Company Name</td>
                        <td><%=company_Name%></td>

                    </tr>
                    <tr>
                        <td>Job name: </td>
                        <td><%=job_Name%></td>

                    </tr>


                    <tr>
                        <td>Email: </td>
                        <td><%=email%></td>

                    </tr>

                    <tr>
                        <td>Phone Number</td>
                        <td><%=phone%></td>

                    </tr>
                    <tr>
                        <td>City</td>
                        <td><%=city%></td>

                    </tr>

                    <tr>
                        <td>State</td>
                        <td><%=state%></td>

                    </tr>



                    <tr>
                        <td>Salary</td>
                        <td> <%=salary%></td>

                    </tr>
                    <tr>
                        <td>StartDate:</td>
                        <td style="color:red"> <%=startDate%></td>

                    </tr>
                    <tr>
                        <td>EndDate:</td>
                        <td style="color:red"><%=endDate%></td>

                    </tr>

                    <tr>
                        <td>JobType:</td>
                        <td> <%=jobType%></td>

                    </tr>
                    <tr>
                        <td>Description:</td>
                        <td><%=jobdes%></td>

                    </tr>
                    <tr>
                        <td>Job Add Date:</td>
                        <td><%=jobAdd%></td>

                    </tr><tr>
                    <td>Job Adder:</td>
                    <td><%=jobadder%></td>

                </tr>

                </table>



            </div>


            <!-- Add more job cards as needed -->
        </section>
        <div class="row" style="display: flex;justify-content: space-around;padding: 30px" >
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
                Update
            </button>

            <!-- The Modal -->
            <form action="/JobUpdateServlet" method="POST" id="updateform" enctype="multipart/form-data">
                <div class="modal" id="myModal">
                    <div class="modal-dialog">
                        <div class="modal-content">

                            <!-- Modal Header -->
                            <div class="modal-header">
                                <h4 class="modal-title">Update Job</h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>

                            <!-- Modal body -->
                            <div class="modal-body">
                                <div class="form-group">
                                    <input type="text" name="id" class="form-control" placeholder="ID" value="<%=job_id%>" readonly>
                                </div>
                                <div class="form-group">
                                    <input type="text" name="job_Name" class="form-control" placeholder="job_Name"/>
                                </div>
                                <div class="form-group">
                                    <input type="text" name="company_Name" class="form-control" placeholder="company_Name"/>
                                </div>
                                <div class="form-group">
                                    <input type="text" name="email" class="form-control" placeholder="Email"/>
                                </div>
                                <div class="form-group">
                                    <input type="tel" name="phone" class="form-control" maxlength="10" placeholder="Phone Number"/>
                                </div>
                                <div class="form-group">
                                    <input type="text" name="city" class="form-control" placeholder="city"/>
                                </div>
                                <div class="form-group">
                                    <input type="text" name="state" class="form-control" placeholder="State"/>
                                </div>
                                <div class="form-group">
                                    <input type="text" name="salary" class="form-control" placeholder="salary"/>
                                </div>
                                <div class="form-group">
                                    <input type="date" name="startDate" class="form-control" placeholder="startDate"/>
                                </div>
                                <div class="form-group">
                                    <input type="date" name="endDate" class="form-control" placeholder="endDate"/>
                                </div>
                                <div class="form-group">
                                    <div class="select">

                                            <select name="jobType" class="form-control-range">
                                                <option value="">Select Job Type</option>
                                                <option value="Full Time">Full Time</option>
                                                <option value="Part Time">Part Time</option>
                                            </select>

                                    </div>
                                </div>
                                <div class="form-group">
                                    <input type="text" name="JobAdder" class="form-control" value="<%=jobadder%>" readonly/>
                                </div>
                                <div class="form-group">
                                    <textarea name="JobDescription" class="form-control" placeholder="JobDescription"></textarea>
                                </div>
                                <div class="form-group">
                                    <input type="file" name="cimg"  accept="image/*" class="form-control"/>
                                </div>

                            </div>

                            <!-- Modal footer -->
                            <div class="modal-footer">
                                <button type="submit" class="btn btn-primary" formaction="JobUpdateServlet">Update</button>
                                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                            </div>

                        </div>
                    </div>
                </div>
            </form>

            <form action="./JobDeleteServlet" method="POST" id="deleteForm">
            <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal1">
                Delete
            </button>
            <div class="modal" id="myModal1">
                <div class="modal-dialog">

                    <div class="modal-content">

                        <!-- Modal Header -->
                        <div class="modal-header">
                            <h4 class="modal-title">Delete Job</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>

                        <!-- Modal body -->
                        <div class="modal-body">
                         <h6 style="color: #cb4b16">Are You Sure Delete Job?</h6>

                        </div>


                        <!-- Modal footer -->
                        <div class="modal-footer">

                                <input type="hidden" name="id" value="<%= job_id %>">
                                <button type="submit" class="btn btn-primary" class="btn btn-danger">Yes</button>


                            <button type="button" class="btn btn-danger" data-dismiss="modal" href="./JobInfo.jsp">No</button>
                        </div>



                    </div>
                </div>
            </div>
            <button class="btn btn-outline-dark" type="submit" id="buttonback" name="back" ><a href="./?pn=jobDetails">Back</a></button>


</form>
    <%
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    %>

</body>
</html>
