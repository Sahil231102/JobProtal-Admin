<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 05-06-2024
  Time: 05:13 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link
            href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap"
            rel="stylesheet"
    />
    <title>Title</title>
</head>
<body>
<div class="left-side-bar">
    <div class="brand-logo">
        <a href="./?pn=Dashboard">
            <img src="./src/images/layout/logo.png" alt="" class="dark-logo" />
            <img
                    src="./src/images/layout/dark_logo.png"
                    alt=""
                    class="light-logo"
            />
        </a>
        <div class="close-sidebar" data-toggle="left-sidebar-close">
            <i class="ion-close-round"></i>
        </div>
    </div>
    <div class="menu-block customscroll">
        <div class="sidebar-menu">
            <ul id="accordion-menu">
                <li class="dropdown">
                    <a href="javascript:;" class="dropdown-toggle">
								<span class="micon bi bi-house"></span
                                ><span class="mtext">Home</span>
                    </a>



                </li>
                <li class="dropdown">
                    <a href="javascript:;" class="dropdown-toggle">
								<span class="micon bi bi-textarea-resize"></span
                                ><span class="mtext">Forms</span>
                    </a>
                    <ul class="submenu">

                        <li><a href="./?pn=AJ">Add Job</a></li>

                    </ul>
                </li>
                <li class="dropdown">
                    <a href="javascript:;" class="dropdown-toggle">
								<span class="micon bi bi-table"></span
                                ><span class="mtext">Tables</span>
                    </a>
                    <ul class="submenu">

                        <li><a href="./?pn=userinfo">User</a></li>
                        <li><a href="./?pn=vendorinfo">Vendor</a></li>
                    </ul>
                </li>




                <li class="dropdown">
                    <a href="javascript:;" class="dropdown-toggle">
								<span class="micon bi bi-back"></span
                                ><span class="mtext">Job Details</span>
                    </a>
                    <ul class="submenu">
                        <li><a href="./?pn=jobDetails">Job Details</a></li>
                    </ul>
                </li>

                <li class="dropdown">
                    <a href="javascript:;" class="dropdown-toggle">
								<span class="micon ion-man"></span
                                ><span class="mtext">Profile</span>
                    </a>
                    <ul class="submenu">
                        <li><a href="./?pn=profile">Profile</a></li>
                    </ul>
                </li>



                <li>
                    <div class="dropdown-divider"></div>
                </li>

            </ul>
        </div>
    </div>
</div>
</body>
</html>
