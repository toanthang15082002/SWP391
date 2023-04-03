<%-- 
    Document   : curriculum
    Created on : Feb 17, 2023, 2:03:05 PM
    Author     : Thang
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Edit Curriculum</title>
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
        <link rel="stylesheet" href="css/guest.css"/>
    </head>
    <body>
        <!--HEADER-->
        <header>
            <jsp:include page="../common/heading.jsp"></jsp:include>
            </header>
            <!--END HEADER-->
            <div class=" search-syllabus mt-5">
                <nav class="navbar navbar-light">
                    <form class="form-inline d-xl-flex m-auto" action="searchviewcurriculum" method="post">
                        <input class="form-control mr-sm-2" name="curText" type="search" placeholder="Enter subject code or syllabus name"
                               aria-label="Search" style="width: 30em; height: 3em">
                        <button class="btn btn-primary my-2 my-sm-0" type="submit"
                                style="color: #FFFFF; height: 3em">Search</button>

                    </form>
                </nav>
            </div>

            <!--Search Syllabus End-->
            <!--Syllabus List-->
            <div class="container mt-5 mb-5">
                <div class="syllabus-list row">
                    <div class="col-md-12">
                        <div class="" style="margin-bottom: 40px;">
                            <h2>Curriculum</h2>
                        </div>
                    </div>
                    <table class="table table-bordered" cellspacing="0" rules="all" border="1"
                           style="border-collapse: collapse; width: 100%">
                        
                            <thead style="background-color: #f1994a; color: white">                                    
                                <tr>
                                    <th></th>
                                    <th scope="col">Curriculum Code</th>
                                    <th scope="col">Curriculum Name</th>
                                    <th scope="col">DecisionNo</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${listCurriculumPaging}" var="o" varStatus="count">
                                <tr>
                                    <td>${count.count}</td>
                                    <td>${o.curCode}</td>
                                    <td><a onmouseover="this.style.color = '#08c'" onmouseout="this.style.color = 'black'" href="./curriculumdetail?curid=${o.curid}">${o.curName}</a></td>
                                    <td>${o.decisionNo}</td>
                                </tr>
                            </c:forEach>
                        </tbody>

                    </table>






                    <nav aria-label="Page navigation example">
                        <ul class="pagination">
                            <c:if test="${tag > 1}">
                                <li class="page-item">
                                    <a class="page-link" href="viewcurriculum?page=${tag-1}" aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                        <span class="sr-only">Previous</span>
                                    </a>
                                </li>
                            </c:if>

                            <c:forEach begin="1" end="${endPage}" var="i">
                                <li class="page-item ${tag == i ? "active" : ""}"><a class="page-link" href="viewcurriculum?page=${i}">${i}</a></li>
                                </c:forEach>
                                <c:if test="${tag != endPage}"> 
                                <li class="page-item">
                                    <a class="page-link" href="viewcurriculum?page=${tag+1}" aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                        <span class="sr-only">Next</span>
                                    </a>
                                </li>
                            </c:if>
                        </ul>
                    </nav>
            </div>
        </div>
        <!--Syllabus List-->
        <!--FOOTER-->
        <jsp:include page="../common/footer.jsp"></jsp:include>
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
