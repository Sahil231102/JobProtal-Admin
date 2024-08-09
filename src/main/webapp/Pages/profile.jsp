<%@ page import="DAO.MyDatabase" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.swing.plaf.nimbus.State" %><%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 11-07-2024
  Time: 02:15 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>CSS User Profile Card</title>
    <style>
        @import url('https://fonts.googleapis.com/css?family=Josefin+Sans&display=swap');

        *{
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            list-style: none;
            font-family: 'Josefin Sans', sans-serif;
        }

        body{
            background-color: #f0f0f0;


        }

        .wrapper{
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%,-50%);
            width: 850px;
            height: 400px;
            display: flex;
            box-shadow: 0 1px 20px 0 rgba(69,90,100,.08);
        }

        .wrapper .left{
            width: 45%;
            background: linear-gradient(to right,#0b132b,#353c4e);
            padding: 30px 25px;
            border-top-left-radius: 5px;
            border-bottom-left-radius: 5px;
            text-align: center;
            color: #fff;
        }

        .wrapper .left img{
            border-radius: 5px;
            margin-bottom: 10px;
        }

        .wrapper .left h4{
            margin-bottom: 10px;
        }

        .wrapper .left p{
            font-size: 12px;
        }

        .wrapper .right{
            width: 65%;
            background: #fff;
            padding: 30px 25px;
            border-top-right-radius: 5px;
            border-bottom-right-radius: 5px;
        }

        .wrapper .right .info,
        .wrapper .right .projects{
            margin-bottom: 25px;
        }

        .wrapper .right .info h3,
        .wrapper .right .projects h3{
            margin-bottom: 15px;
            padding-bottom: 5px;
            border-bottom: 1px solid #e0e0e0;
            color: #353c4e;
            text-transform: uppercase;
            letter-spacing: 5px;
        }

        .wrapper .right .info_data,
        .wrapper .right .projects_data{
            display: flex;
            justify-content: space-between;
        }

        .wrapper .right .info_data .data,
        .wrapper .right .projects_data .data{
            width: 45%;
        }

        .wrapper .right .info_data .data h4,
        .wrapper .right .projects_data .data h4{
            color: #353c4e;
            margin-bottom: 5px;
        }

        .wrapper .right .info_data .data p,
        .wrapper .right .projects_data .data p{
            font-size: 13px;
            margin-bottom: 10px;
            color: #919aa3;
        }

        .wrapper .social_media ul{
            display: flex;
        }

        .wrapper .social_media ul li{
            width: 45px;
            height: 45px;
            background: linear-gradient(to right,#0b132b,#353c4e);
            margin-right: 10px;
            border-radius: 5px;
            text-align: center;
            line-height: 45px;
        }

        .wrapper .social_media ul li a{
            color :#fff;
            display: block;
            font-size: 18px;
        }
    </style>



<link rel="stylesheet" href="/vendors/styles/adminprofile.css" type="text/css">
    <script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
</head>
<body>



<div class="wrapper">
    <%
        try
        {
            Connection con = MyDatabase.getConnection();

            Statement st = con.createStatement();

            ResultSet rs = st.executeQuery("select * from admin");

            if(rs.next())
            {
                String fname = rs.getString("Fname");
                String lname = rs.getString("Lname");
                String email = rs.getString("Email");
                String Gender = rs.getString("Gender");
                String password = rs.getString("Password");
                String phone = rs.getString("PhoneNumber");
//                String cimg = rs.getString("Aimg");




    %>
    <div class="left">
        <img src="${pageContext.request.contextPath}/vendors/images/JobDetails.jpg"
             alt="user" width="200">
        <h5 style="color: #f0f0f0"><%=fname%><%=lname%> </h5>
        <p>Admin</p>
    </div>
    <div class="right">
        <div class="info">
            <h4>Information</h4>
            <hr>
            <div class="info_data">
                <div class="data">
                    <h5>Email</h5>
                    <p><%=email%></p>
                </div>
                <div class="data">
                    <h5>Phone</h5>
                    <p><%=phone%></p>
                </div>
            </div>
        </div>

        <div class="projects">
            <h4>Personal Info</h4>
            <hr>
            <div class="projects_data">
                <div class="data">
                    <h5>Gender</h5>
                    <p><%=Gender%></p>
                </div>
                <div class="data">
                    <h5>Password</h5>
                    <p><%=password%></p>
                </div>
            </div>
        </div>

        <%
                }
            }
            catch (Exception exception)
            {
                exception.printStackTrace();
            }
        %>

        <div class="social_media">
            <ul>
                <li><a href="#"><i class="fab fa-facebook-f"></i></a></li>
                <li><a href="#"><i class="fab fa-twitter"></i></a></li>
                <li><a href="#"><i class="fab fa-instagram"></i></a></li>
            </ul>
        </div>
    </div>
</div>

</body>
</html>
