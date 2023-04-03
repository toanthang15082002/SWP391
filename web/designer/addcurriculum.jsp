<%-- 
    Document   : Addsyllabus.jsp
    Created on : Feb 4, 2023, 10:11:54 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Add Syllabus</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Nunito:wght@600;700;800&display=swap" rel="stylesheet">

        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/animate/animate.min.css" rel="stylesheet">
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">    
        <link rel="stylesheet" href="css/styleDesigner.css"/>

    </head>

    <body>  
        <!--HEADER-->
        <header>
            <jsp:include page="../common/heading.jsp"></jsp:include>
            </header>
            <!--END HEADER-->
            <div class="content container-fluid ">
                <div class="row">
                    <!-- Menu DESIGNER -->

                    <div class="content__menu col-lg-2">

                    <jsp:include page="../designer/menudesigner.jsp"></jsp:include>
                    </div>
                    <!-- END Menu DESIGNER -->

                    <!-- SYLLABUS ADD NEW-->
                    <div class="content__detail col-lg-10" id="syllabusAddNew">
                        <div class="content__detail-addSyllabus">
                            <div class="title text-center">
                                <h1>Curriculum Designer</h1>
                            </div>
                            <h2>Add Curriculum</h2>
                            <br>
                            <form action="addcurriculum" method="post">
                                <div class="syllabus__content form-group">
                                    <h3>Curriculum Code<small style="color: red"> *</small></h3><p style="color: red">${alert}</p>
                                    <input class="form-control" type="text" name="codeCurriculum" required>
                                </div>
                                <br>
                                <div class="syllabus__content form-group">
                                    <h3>Curriculum Name<small style="color: red"> *</small></h3>
                                    <input class="form-control" type="text" name="nameCurriculum" required="">
                                </div>
                                <br>
                                <div class="syllabus__content form-group">
                                    <h3>Description</h3>
                                    <textarea rows="10" class="form-control" rows="2" name="description"></textarea>
                                </div>
                                <br>
                                <div class="syllabus__content form-group">
                                    <h3>DecisionNo</h3>
                                    <input type="text" class="form-control" name="decision">
                                </div>
                                <div class="syllabus__content form-group">
                                    <h3>Curriculum Approve</h3>
                                    <select class="form-control" name="approve" >
                                    <option value="true">True</option>
                                    <option value="false">False</option>
                                </select>
                                </div>
                                <div class="syllabus__content form-group">
                                    <h3>Curriculum Active</h3>
                                    <select class="form-control" name="active" >
                                    <option value="true">True</option>
                                    <option value="false">False</option>
                                </select>
                                </div>
                                <div class="syllabus__content form-group">
                                    <h3>Curriculum InCharge</h3>
                                    <input type="text" class="form-control" name="inCharge">
                                </div>
                                <br>
                                <input class="btn btn-success text-center" style="height: 4rem; width:8rem; font-size:1.6em"
                                       type="submit" value="Add">
                            </form>
                        </div>
                </div>
                <!-- END SYLLABUS ADD NEW-->
            </div>

        </div>
        <!--FOOTER-->
        <jsp:include page="../common/footer.jsp"></jsp:include>
        <!--END FOOTER-->


    </body>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/wow/wow.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script> 
    <!-- Template Javascript -->
    <script src="js/main.js"></script>
    <script src="js/main.js"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
            integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
    crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
    crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
    crossorigin="anonymous"></script>

</html>
