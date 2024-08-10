<%@ page import="java.sql.Connection" %>
<%@ page import="DAO.MyDatabase" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %><%--
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
<div class="header-left">
    <div class="menu-icon bi bi-list"></div>
    <div
            class="search-toggle-icon bi bi-search"
            data-toggle="header_search"
    ></div>
    <div class="header-search">
        <form>
            <div class="form-group mb-0">
                <i class="dw dw-search2 search-icon"></i>
                <input
                        type="text"
                        class="form-control search-input"
                        placeholder="Search Here"
                />
                <div class="dropdown">
                    <a
                            class="dropdown-toggle no-arrow"
                            href="#"
                            role="button"
                            data-toggle="dropdown"
                    >
                        <i class="ion-arrow-down-c"></i>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right">
                        <div class="form-group row">
                            <label class="col-sm-12 col-md-2 col-form-label"
                            >From</label
                            >
                            <div class="col-sm-12 col-md-10">
                                <input
                                        class="form-control form-control-sm form-control-line"
                                        type="text"
                                />
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-12 col-md-2 col-form-label">To</label>
                            <div class="col-sm-12 col-md-10">
                                <input
                                        class="form-control form-control-sm form-control-line"
                                        type="text"
                                />
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-12 col-md-2 col-form-label"
                            >Subject</label
                            >
                            <div class="col-sm-12 col-md-10">
                                <input
                                        class="form-control form-control-sm form-control-line"
                                        type="text"
                                />
                            </div>
                        </div>
                        <div class="text-right">
                            <button class="btn btn-primary">Search</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
<div class="header-right">
    <div class="dashboard-setting user-notification">
        <div class="dropdown">
            <a
                    class="dropdown-toggle no-arrow"
                    href="javascript:;"
                    data-toggle="right-sidebar"
            >
                <i class="dw dw-settings2"></i>
            </a>
        </div>
    </div>
    <div class="user-notification">
        <div class="dropdown">
            <a
                    class="dropdown-toggle no-arrow"
                    href="#"
                    role="button"
                    data-toggle="dropdown"
            >
                <i class="icon-copy dw dw-notification"></i>
                <span class="badge notification-active"></span>
            </a>

        </div>
    </div>
    <div class="user-info-dropdown">
        <div class="dropdown">
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
            %>
            <a
                    class="dropdown-toggle"
                    href="#"
                    role="button"
                    data-toggle="dropdown"
            >
							<span class="user-icon">
								<img src="./upload/IMG_0537.jpg" alt=""  height="80%"width="80%"/>
							</span>
                <span class="user-name" style="font-family: 'Josefin Sans'"><%=fname%><%=lname%></span>
            </a>
            <%
                    }
                }
                catch (Exception exception)
                {
                    exception.printStackTrace();
                }
            %>
            <div
                    class="dropdown-menu dropdown-menu-right dropdown-menu-icon-list"
            >

                <a class="dropdown-item" href="AdminLogin.jsp"
                ><i class="dw dw-logout"></i> Log Out</a
                >
            </div>
        </div>
    </div>
</div>
</body>
</html>
