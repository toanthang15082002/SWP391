<%-- 
    Document   : syllabusmanegment
    Created on : Feb 17, 2023, 2:06:10 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Syllabus Management</title>
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
        <link rel="stylesheet" href="css/styleSyllabus.css"/>
        <style>
            .syllabus-meta .syllabus-isActive.cat-1{
                background-color: #4BB92F;
            }
            .syllabus-meta .syllabus-isActive.cat-2{
                background-color: #ff8700;
            }
            .syllabus-meta .syllabus-isActive.cat-3{
                background-color: #dddddd;
            }



            tr, td, th{
                border:1px solid rgba(0, 0, 0,0.1);
                color: #000000;

            }

        </style>
    </head>
    <body>
        <!--HEADER-->
        <header>
            <jsp:include page="../common/heading.jsp"></jsp:include>  
            </header>
            <!--END HEADER-->
            <div class=" search-syllabus mt-5">
                <nav class="navbar navbar-light">
                    <form class="form-inline d-xl-flex m-auto" action="syllabusmanagement" method="post">
                        <input class="form-control mr-sm-2" type="search" placeholder="Enter subject code or syllabus name"
                               aria-label="Search" style="width: 30em;height: 3em" name="txtSearch" value="${txtSearch}">
                    <button class="btn btn-primary my-2 my-sm-0" type="submit"
                            style="height: 3em">Search</button>
                </form>
            </nav>
        </div>

        <!--Search Syllabus End-->
        <!--Syllabus List-->

        <c:if test="${requestScope.sylist.size() == 0}">
            <h6 style="font-size: 2em;color: red">Not Found</h6>
        </c:if>
        <c:if test="${requestScope.sylist.size() > 0}">

            <div class="container mt-5 mb-5">
                <table class="table "  cellspacing="0" rules="all" style="border:1px solid #000000;"  id="gvSyllabus"
                       style="border-collapse:collapse;">
                    <tbody>
                        <tr style="background-color: #f1994a;">
                            <th scope="col">Subject Code</th>
                            <th scope="col">Syllabus Name</th>
                            <th scope="col">IsActive</th>
                            <th scope="col">IsApproved</th>
                            <th scope="col">DecisionNo</th>
                        </tr>

                        <c:forEach items="${requestScope.sylist}" var="sy">
                            
                            <tr>
                                <td>${sy.subjectCode}</td>
                                <td><a href="syllabusdetails?syllabusID=${sy.syllabusID}">${sy.syllabusName}</a></td>
                                <td><span class="aspNetDisabled"><input id="" type="checkbox"
                                                                        ${sy.isActive == true ? "checked":""}
                                                                        disabled="disabled"></span></td>
                                <td><span class="aspNetDisabled"><input id="" type="checkbox"
                                                                        ${sy.isApproved == true ? "checked":""}
                                                                        disabled="disabled"></span></td>
                                <td><a href="decisiondetail?syllabusID=${sy.syllabusID}">${sy.decisionNo.decisionNo}</a></td>
                            </tr>
                        </c:forEach>

                    </tbody>
                </table>
            </c:if>


            <!--PAGING-->

            <c:if test="${requestScope.sylist.size() >= num || tag == endPage}">
                <nav aria-label="Page navigation example">
                    <ul class="pagination">
                        <c:if test="${tag > 1}">
                            <li class="page-item">
                                <a class="page-link" href="syllabusmanagement?indexPage=${tag-1}" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                    <span class="sr-only">Previous</span>
                                </a>
                            </li>
                        </c:if>
                        <c:forEach begin="1" end="${endPage}" var="i">
                            <li class="page-item ${tag == i?"active":""}"><a class="page-link" href="syllabusmanagement?indexPage=${i}">${i}</a></li>
                            </c:forEach>
                            <c:if test="${tag != endPage}"> 
                            <li class="page-item">
                                <a class="page-link" href="syllabusmanagement?indexPage=${tag+1}" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                    <span class="sr-only">Next</span>
                                </a>
                            </li>
                        </c:if>

                    </ul>
                </nav>
            </c:if>
            <!--END PAGING-->
        </div>
        <!--Syllabus List-->



        <!--FOOTER-->
        <jsp:include page="../common/footer.jsp"></jsp:include>
        <!--END FOOTER-->
        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>


    </body> 


    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
            integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
    crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
    crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
    crossorigin="anonymous"></script>
    <script src="lib/wow/wow.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>

</html>
