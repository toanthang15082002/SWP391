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
        <title>List Assessment</title>
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
        <link href="fonts/fontawesome-free-6.2.1-web/css/all.min.css" rel="stylesheet">
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
                                <h1>List Decision</h1>
                            </div>
                            <div class="row">

                                <div class="col-lg-10">
                                    <form action="searchsession" method="get">
                                        <div class="d-flex justify-content-center" >

                                            <div class="form-outline col-lg-8">
                                                <input value="${requestScope.syllabusID}" name="syllabusID" hidden/>
                                            <input oninput="search(this)" type="search" class="form-control" name="txtsearch" 
                                                   value="${txtsearch}" placeholder="Enter Topic, Material or Task to search" style="height: 100%"/>
                                        </div>
                                        <button type="submit" class="btn btn-primary col-lg-2" >
                                            <i class="fas fa-search"></i>
                                        </button>
                                    </div>

                                </form>
                            </div>
                            <div class="col-lg">
                                <!--<a href="addassessment?syllabusID=${requestScope.syllabusID}" class="btn btn-primary m-auto d-block" >New Assessment</a>-->
                            </div>
                        </div>


                        <c:if test="${requestScope.listde.size() == 0}">
                            <h6 style="font-size: 2em;color: red">No Decision Here</h6>
                        </c:if>
                        <br>
                        <c:if test="${requestScope.listde.size() > 0}">
                            <table class="table table-striped" style="font-size: 1.2em">
                                <thead>
                                    <tr>
                                        <th class="col-1">ID
                                            <c:if  test="${empty(requestScope.sort) || requestScope.sort == 'categoti' 
                                                           || requestScope.sort == 'type'|| requestScope.sort == 'weight'}">
                                                   <small>
                                                       <a href="sortdecision?sort=decisionID desc"><i class="fa-solid fa-chevron-down"></i></a>
                                                   </small> 
                                            </c:if>
                                            <c:if test="${requestScope.sort == 'decisionID desc'}">
                                                <small>
                                                    <a href="sortdecision?sort=decisionID"><i class="fa-solid fa-chevron-up"></i></a>
                                                </small> 
                                            </c:if>
                                            <c:if  test="${requestScope.sort == 'decisionID'}">
                                                <small>
                                                    <a href="sortdecision?sort=decisionID desc"><i class="fa-solid fa-chevron-down"></i></a>
                                                </small> 
                                            </c:if>
                                        </th>
                                        <th class="col-2">decisionNo</th>
                                        <th class="col">decisionName</th>
                                        <th class="col">Approve Date</th>
                                        <th class="col">Create Date</th>
                                        <!--<th class="col">Note</th>-->
                                        <th class="col-1">Action</th>
                                    </tr>
                                </thead>
                                <tbody id="content">
                                    <c:forEach items="${requestScope.listde}" var="de">
                                        <tr>
                                            <td>${de.decisionID}</td>
                                            <td>${de.decisionNo}</td>
                                            <td>${de.decisionName}</td>
                                            <td>${de.approveDate}</td>
                                            <td>${de.createDate}</td>
                                            <!--<td>${de.note}</td>-->
                                            <td></td>
                                        </tr>

                                    </c:forEach>    
                                </tbody>
                            </table>


                            <!--Paging Start-->
                            <nav aria-label="Page navigation example">
                                <ul class="pagination">
                                    <li class="page-item">
                                        <a class="page-link" href="listdecision?indexPage=${tag-1}" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                            <span class="sr-only">Previous</span>
                                        </a>
                                    </li>

                                    <c:forEach begin="1" end="${numpage}" var="i">
                                        <li class="page-item ${page == i ? "active" : ""}"><a class="page-link" href="listdecision?indexPage=${i}">${i}</a></li>
                                        </c:forEach>
                                        <c:if test="${page != numpage}"> 
                                        <li class="page-item">
                                            <a class="page-link" href="listdecision?indexPage=${page+1}" aria-label="Next">
                                                <span aria-hidden="true">&raquo;</span>
                                                <span class="sr-only">Next</span>
                                            </a>
                                        </li>
                                    </c:if>
                                </ul>
                            </nav>
                            <!--Paging End-->
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


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <script src="js/main.js"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
            integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
    crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
    crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous">
    </script>
    <script type="text/javascript">
        function doDelete(sid) {
            if (confirm("Are you sure delete session with id =" + sid)) {
                window.location = "deletesession?sid = " + sid;
            }
        }
        function search(param) {
            var txtSearch = param.value;
            console.log(txtSearch);
            $.ajax({
                url: "/SWP391_T6/searchajax",
                type: "get",
                data: {
                    txtsearch: txtSearch
                },
                success: function (data) {
                    var row = document.getElementById("content");
                    row.innerHTML = data;
                }
            });
        }
    </script>

</html>
