<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <link
            href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap"
            rel="stylesheet"
    />
    <title>Add Jobs</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

    <style>
        h4{
            font-family: 'Josefin Sans', sans-serif;
        }
    </style>
</head>
<body>
<div class="pd-ltr-20 xs-pd-20-10">
    <div class="min-height-200px">
        <div class="page-header">
            <div class="row">
                <div class="col-md-6 col-sm-12">
                    <div class="title">
                        <h4>Add Jobs</h4>
                    </div>
                </div>
                <div class="col-md-6 col-sm-12 text-right">
                    <div class="dropdown">
                        <a class="btn btn-primary dropdown-toggle" href="#" role="button" data-toggle="dropdown">January 2018</a>
                        <div class="dropdown-menu dropdown-menu-right">
                            <a class="dropdown-item" href="#">Export List</a>
                            <a class="dropdown-item" href="#">Policies</a>
                            <a class="dropdown-item" href="#">View Assets</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="pd-20 card-box mb-30">
            <div class="clearfix">
                <h4 class="text-blue h4">Add Jobs</h4>
            </div>
            <div class="wizard-content">
                <form id="jobForm" action="AddJobServlet" method="post" enctype="multipart/form-data">
                    <section>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Job Name :</label>
                                    <input type="text" name="jobname" class="form-control" required/>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Company Name :</label>
                                    <input type="text" name="companyname" class="form-control" required/>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Enter City :</label>
                                    <input type="text" name="city" class="form-control"/>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Enter state :</label>
                                    <input type="text" name="state" class="form-control"/>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Email Address :</label>
                                    <input type="email" name="email" class="form-control"/>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Phone Number :</label>
                                    <input type="text" name="phone" class="form-control"/>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Enter Salary :</label>
                                    <input type="number" name="salary" class="form-control"/>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <div style="padding: 0px" class="container">
                                        <label>Job Type:</label>
                                        <div class="select">
                                            <select name="jobtype" class="form-control">
                                                <option value="">Select Type</option>
                                                <option value="Full Time">Full Time</option>
                                                <option value="Part Time">Part Time</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Start Date :</label>
                                    <input type="text" name="startdate" class="form-control date-picker" placeholder="Select Date"/>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>End Date :</label>
                                    <input type="text" name="enddate" class="form-control date-picker" placeholder="Select Date"/>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <div style="padding: 0" class="container">
                                        <label>JobAdder:</label>
                                        <div class="select">
                                            <select name="JobAdder" class="form-control">
                                                <option value="null">Select Type</option>
                                                <option value="Admin">Admin</option>

                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <div style="padding: 0" class="container">

                                        <div class="form-group">
                                            <label>Vacancy :</label>
                                            <input type="text" name="vacancy" class="form-control" placeholder="Select Vacancy"/>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <div style="padding: 0" class="container">
                                        <label>Company Image :</label>
                                        <input type="file"  name="cimg" class="form-control"/>

                                    </div>


                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <div style="padding: 0" class="container">

                                        <div class="form-group">
                                            <div style="padding: 0" class="container">
                                                <label>Hiring Poster :</label>
                                                <input type="file" name="Hpimg" class="form-control"/>

                                            </div>

                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">

                            </div>

                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>Job Description :</label>
                                    <textarea name="jobdesc" class="form-control"></textarea>
                                </div>
                            </div>
                        </div>

                    </section>
                    <button class="btn btn-primary" type="submit" id="buttonsubmit" name="submit">Submit</button>
                </form>
            </div>
        </div>
    </div>
</div>
<%--<script>--%>
<%--    $(document).ready(function() {--%>
<%--        $("#buttonsubmit").click(function(event) {--%>
<%--            event.preventDefault(); // Prevent the default form submission--%>
<%--            var form = $("#jobForm")[0];--%>
<%--            var formData = new FormData(form);--%>

<%--            $.ajax({--%>
<%--                type: "POST",--%>
<%--                url: "AddJobServlet",--%>
<%--                data: formData,--%>
<%--                processData: false,--%>
<%--                contentType: false,--%>
<%--                success: function(response) {--%>
<%--                    swal("Success", "Form submitted successfully!", "success");--%>
<%--                },--%>
<%--                error: function(xhr, status, error) {--%>
<%--                    swal("Error", "There was an error submitting the form: " + xhr.responseText, "error");--%>
<%--                }--%>
<%--            });--%>
<%--        });--%>
<%--    });--%>
<%--</script>--%>
</body>
</html>
