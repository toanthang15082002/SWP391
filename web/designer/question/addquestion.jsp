<%-- 
    Document   : addquestion
    Created on : Feb 15, 2023, 11:18:17 AM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>List Syllabus</title>
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
        <header>
            <jsp:include page="../../common/heading.jsp"></jsp:include>
            </header>
            <!--END HEADER-->
            <div class="content container-fluid ">
                <div class="row">
                    <div class="content__menu col-lg-2">
                    <jsp:include page="../../designer/menudesigner.jsp"></jsp:include>

                    </div>
                    <!-- SYLLABUS ADD NEW-->
                    <div class="content__detail col-lg-10" id="syllabusAddNew">
                        <div class="content__detail-addSyllabus">
                            <div class="title text-center">
                                <h1>Syllabus Designer</h1>
                            </div>
                            <h2>Add Question</h2>
                            <br>
                            <div class="modal-body">
                                <form action="addquestion" method="post">
                                    <div class="form-group">
                                        <input type="text" class="form-control" readonly name="qid" hidden id="recipient-name">
                                    </div>
                                    <div class="form-group">
                                        <label for="recipient-name" class="col-form-label" >SessionID</label>
                                        <input type="text" class="form-control" name="sid" value="${requestScope.sid}" required readonly id="recipient-name">
                                </div>
                                <div class="form-group">
                                    <label for="message-text" class="col-form-label"  >Question Name <span class="text-danger"> *</span></label>
                                    <input class="form-control" id="message-text" required name="questionname" >
                                </div>
                                <div class="form-group">
                                    <label for="message-text" class="col-form-label" >Detail</label>
                                    <textarea class="form-control" id="message-text" name="detail"></textarea>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <button type="submit" class="btn btn-primary">Add New</button>
                                </div>
                            </form>
                        </div>
                    </div>
                    <!-- END SYLLABUS ADD NEW-->

                </div>


            </div>
            <!--FOOTER-->
            <jsp:include page="../../common/footer.jsp"></jsp:include>
            <!--END FOOTER-->

    </body>
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
