<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <!-- Basic Page Info -->
    <meta charset="utf-8" />
    <title>Find Job App-Admin</title>

    <!-- Mobile Specific Metas -->
    <meta
            name="viewport"
            content="width=device-width, initial-scale=1, maximum-scale=1"
    />

    <!-- Google Font -->
    <link
            href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap"
            rel="stylesheet"
    />
    <!-- CSS -->
    <link rel="stylesheet" type="text/css" href="vendors/styles/core.css" />
    <link rel="stylesheet" type="text/css" href="vendors/styles/card-3.css" />
    <link rel="stylesheet" type="text/css" href="vendors/styles/style.css"/>
    <link rel="stylesheet" href="./vendors/styles/seekerApplyStyle.css">




    <link
            rel="stylesheet"
            type="text/css"
            href="vendors/styles/icon-font.min.css"
    />
    <link
            rel="stylesheet"
            type="text/css"
            href="src/plugins/datatables/css/dataTables.bootstrap4.min.css"
    />
    <link
            rel="stylesheet"
            type="text/css"
            href="src/plugins/datatables/css/responsive.bootstrap4.min.css"
    />
    <link rel="stylesheet" type="text/css" href="vendors/styles/style.css" />
    <style>
        .sorting:before,.tbl-srt:before{
            content: "\2191" !important;
            display: none;
        }
        .sorting:after,.tbl-srt:after{
            content: "\2193" !important;
            display: none;

        }

        .imgBox img{
            object-fit: cover !important;
            object-position: top !important;
        }

    </style>

    <!-- Global site tag (gtag.js) - Google Analytics -->
    <script
            async
            src="https://www.googletagmanager.com/gtag/js?id=G-GBZ3SGGX85"
    ></script>
    <script
            async
            src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js?client=ca-pub-2973766580778258"
            crossorigin="anonymous"
    ></script>
    <script>
        window.dataLayer = window.dataLayer || [];
        function gtag() {
            dataLayer.push(arguments);
        }
        gtag("js", new Date());

        gtag("config", "G-GBZ3SGGX85");
    </script>
    <!-- Google Tag Manager -->
    <script>
        (function (w, d, s, l, i) {
            w[l] = w[l] || [];
            w[l].push({ "gtm.start": new Date().getTime(), event: "gtm.js" });
            var f = d.getElementsByTagName(s)[0],
                j = d.createElement(s),
                dl = l != "dataLayer" ? "&l=" + l : "";
            j.async = true;
            j.src = "https://www.googletagmanager.com/gtm.js?id=" + i + dl;
            f.parentNode.insertBefore(j, f);
        })(window, document, "script", "dataLayer", "GTM-NXZMQSS");
    </script>
    <!-- End Google Tag Manager -->
</head>
<body>
<%--<div class="pre-loader">--%>
<%--    <div class="pre-loader-box">--%>
<%--        <div class="loader-logo">--%>
<%--            <div class="loading">--%>
<%--                <svg viewBox="0 0 187.3 93.7" height="200px" width="300px" class="svgbox">--%>
<%--                    <defs>--%>
<%--                        <linearGradient y2="0%" x2="100%" y1="0%" x1="0%" id="gradient">--%>
<%--                            <stop stop-color="pink" offset="0%"></stop>--%>

<%--                            <stop stop-color="blue" offset="100%"></stop>--%>
<%--                        </linearGradient>--%>
<%--                    </defs>--%>

<%--                    <path stroke="url(#gradient)" d="M93.9,46.4c9.3,9.5,13.8,17.9,23.5,17.9s17.5-7.8,17.5-17.5s-7.8-17.6-17.5-17.5c-9.7,0.1-13.3,7.2-22.1,17.1c-8.9,8.8-15.7,17.9-25.4,17.9s-17.5-7.8-17.5-17.5s7.8-17.5,17.5-17.5S86.2,38.6,93.9,46.4z"></path>--%>
<%--                </svg>--%>

<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="loader-progress" id="progress_div">--%>
<%--            <div class="bar" id="bar1"></div>--%>
<%--        </div>--%>
<%--        <div class="percent" id="percent1">0%</div>--%>
<%--        <div class="loading-text">Loading...</div>--%>
<%--    </div>--%>
<%--</div>--%>

<div class="header">
<jsp:include page="Component/Header.jsp"/>
</div>

<div class="right-sidebar">
<jsp:include page="Component/RightSidebar.jsp"/>
</div>

<div class="left-side-bar">
<jsp:include page="Component/LeftSidebar.jsp"/>
</div>
<div class="mobile-menu-overlay"></div>

<div class="main-container">
    <%
        String pageName = request.getParameter("pn");

        if (pageName != null) {
            switch (pageName) {
                case "Dashboard":
    %>
    <jsp:include page="/Pages/Dashboard.jsp"/>
    <%
            break;
        case "SeekerApply":
//        case "true": // Include AddFaculty.jsp for both "AddFaculty" and "true"
    %>
    <jsp:include page="/Pages/SeekerApply.jsp"/>
    <%
            break;
        case "userinfo":
    %>
    <jsp:include page="/Pages/Userinfo.jsp"/>
    <%
            break;
        case "jobDetails":
    %>
    <jsp:include page="/Pages/JobDetails.jsp"/>
    <%
            break;
        case "vendorinfo":
    %>
    <jsp:include page="/Pages/RecruiterSignUpData.jsp"/>
    <%
            break;
        case "jobinfo":
    %>
    <jsp:include page="/Pages/JobInfo.jsp"/>
    <%
            break;
        case "profile":
    %>
    <jsp:include page="/Pages/profile.jsp"/>
    <%
            break;
        case "SeekerSignUp":
    %>
    <jsp:include page="/Pages/SeekerSignUpData.jsp"/>
    <%
            break;
        case "RecruiterSignUp":
    %>
    <jsp:include page="/Pages/RecruiterSignUpData.jsp"/>
    <%
            break;
        case "SeekerInfo":
    %>
    <jsp:include page="Pages/SeekerInfo.jsp"/>
    <%
        break;
        case "Jobinfo":
    %>
    <jsp:include page="Pages/JobInfo.jsp"/>
    <%

            break;

        default:
            // Page not found, show 404 error
            response.setStatus(404); // Set HTTP 404 status
    %>
    <jsp:forward page="/Pages/NotFound.jsp"/>
    <%
                break;
        }
    } else {
        // Default to Dashboard if no pageName parameter provided
    %>
    <%--    <jsp:include page="/Pages/Dashboard.jsp"/>--%>
    <jsp:include page="/Pages/Dashboard.jsp"/>
    <%
        }
    %>
</div>
<!-- welcome modal start -->


<!-- welcome modal end -->
<!-- js -->
<script src="vendors/scripts/core.js"></script>
<script src="vendors/scripts/script.min.js"></script>
<script src="vendors/scripts/process.js"></script>
<script src="vendors/scripts/layout-settings.js"></script>
<script src="src/plugins/apexcharts/apexcharts.min.js"></script>
<script src="src/plugins/datatables/js/jquery.dataTables.min.js"></script>
<script src="src/plugins/datatables/js/dataTables.bootstrap4.min.js"></script>
<script src="src/plugins/datatables/js/dataTables.responsive.min.js"></script>
<script src="src/plugins/datatables/js/responsive.bootstrap4.min.js"></script>
<script src="vendors/scripts/dashboard.js"></script>
<!-- Google Tag Manager (noscript) -->
<noscript
><iframe
        src="https://www.googletagmanager.com/ns.html?id=GTM-NXZMQSS"
        height="0"
        width="0"
        style="display: none; visibility: hidden"
></iframe
></noscript>
<!-- End Google Tag Manager (noscript) -->
</body>
</html>
