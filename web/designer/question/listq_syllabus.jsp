<%-- 
    Document   : Addsyllabus.jsp
    Created on : Feb 4, 2023, 10:11:54 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

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
        <!--HEADER-->
        <header>
            <jsp:include page="../../common/heading.jsp"></jsp:include>

            </header>
            <!--END HEADER-->
            <div class="content container-fluid ">
                <div class="row">
                    <!-- Menu DESIGNER -->

                    <div class="content__menu col-lg-2">

                    <jsp:include page="../../designer/menudesigner.jsp"></jsp:include>
                    </div>
                    <!-- END Menu DESIGNER -->

                    <!--LIST SYLLABUS-->

                    <div class="content__detail col-lg-10" >
                        <div class="content__detail-addSyllabus">
                            <div class="title text-center">
                                <h1>List Syllabus</h1>
                            </div>
                            <form action="searchsyllabus" method="post">
                                <div class="d-flex justify-content-center" >
                                    <div class="form-outline col-lg-8">
                                        <input type="search" class="form-control" name="syllabusTxt" value="${txtSearch}" placeholder="Enter subject code or syllabus name" style="height: 100%"/>
                                </div>
                                <button type="submit" class="btn btn-primary col-lg-2" >
                                    <i class="fas fa-search"></i>
                                </button>
                            </div>
                            <c:if test="${requestScope.listsy.size() == 0}">
                                <h6 style="font-size: 2em;color: red">Not Found</h6>
                            </c:if>
                        </form>
                        <br>
                        <c:if test="${requestScope.listsy.size() > 0}">
                            <table class="table table-striped" style="font-size: 1.2em">
                                <thead>
                                    <tr>
                                        <th scope="col">Subject Code</th>
                                        <th scope="col">Syllabus Name</th>
                                        <th scope="col">Date Approved</th>
                                        <th scope="col">Designer</th>

                                    </tr>
                                </thead>
                                <tbody>
                                    <c:set  value="${sessionScope.account}" var="a"/>
                                    <c:forEach items="${requestScope.listsy}" var="sy">        
                                        <tr>
                                            <td><a href="listq_session?syllabusID=${sy.syllabusID}">${sy.subjectCode}</a></td>
                                            <td><a href="listq_session?syllabusID=${sy.syllabusID}">${sy.syllabusName}</a></td>
                                            <td>${sy.approvedDate}</td>
                                            <td>${a.userName}</td>
                                        </tr>
                                    </c:forEach>

                                </tbody>
                            </table>
                        </c:if>
                    </div>
                </div>


                <!-- END LIST SYLLABUS-->

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
