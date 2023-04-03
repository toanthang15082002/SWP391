<%-- 
    Document   : Addsyllabus.jsp
    Created on : Feb 4, 2023, 10:11:54 PM
    Author     : admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>PO List</title>
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

                    <!--LIST CURRICULUM-->

                    <div class="content__detail col-lg-10" >
                        <div class="content__detail-addSyllabus">

                            <div class="title text-center">
                                <h1>List PO</h1>
                            </div>
                            <form action="searchpo" method="post">
                                <div class="d-flex justify-content-center" >
                                    <div class="form-outline col-lg-8">
                                        <input type="search" class="form-control" name="poText" placeholder="Enter PO name" style="height: 100%"/>
                                    </div>
                                    <button type="submit" class="btn btn-primary col-lg-2" >
                                        <i class="fa fa-search"></i>
                                    </button>
                                    <button style="margin-left: 5px" class="btn btn-primary" type="button">
                                        <a style="color: white" href="addpo">Add PO</a>
                                    </button>
                                </div>
                            </form><br>

                            <form action="managepo" method="post">
                                <div class="form-text">
                                    <h4 for="exampleFormControlSelect1">Search By Curriculum</h4>
                                    <select class="form-control" id="exampleFormControlSelect1" onchange="this.form.submit()" name="curid">
                                    <c:forEach items="${listCur}" var="o">
                                        <option ${curid == o.curid ? 'selected':''} value="${o.curid}">${o.curCode}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <c:if test="${requestScope.listPo.size() == 0}">
                                <h6 style="font-size: 2em;color: red">Not Found</h6>
                            </c:if>
                        </form><br>

                        <c:if test="${requestScope.listPo.size() > 0}">
                            <table class="table table-striped" style="font-size: 1.2em">
                                <thead>
                                    <tr>
                                        <th scope="col">PO ID</th>
                                        <th scope="col">PO Name</th>
                                        <th scope="col">PO Description</th>
                                        <th scope="col">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${listPo}" var="o">
                                        <tr>
                                            <td>${o.poid}</td>
                                            <td>${o.poName}</td>
                                            <td>${o.poDescription}</td>
                                            <td>
                                                <a style="font-size: 0.5em" href="./editpo?poid=${o.poid}&curid=${o.curid}"><i class="btn btn-square bi bi-pencil-square"></i></a>
                                                <a style="font-size: 0.5em" href="./deletepo?poid=${o.poid}" onclick="return confirm('Are you sure you want to DELETE?');"><i class="btn btn-square bi bi-trash"></i></a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </c:if>
                        <nav aria-label="Page navigation example">
                            <ul class="pagination">
                                <c:if test="${tag > 1}">
                                    <li class="page-item">
                                        <a class="page-link" href="managepo?page=${tag-1}" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                            <span class="sr-only">Previous</span>
                                        </a>
                                    </li>
                                </c:if>

                                <c:forEach begin="1" end="${endPage}" var="i">
                                    <li class="page-item ${tag == i ? "active" : ""}"><a class="page-link" href="managepo?page=${i}">${i}</a></li>
                                    </c:forEach>
                                    <c:if test="${tag != endPage}"> 
                                    <li class="page-item">
                                        <a class="page-link" href="managepo?page=${tag+1}" aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                            <span class="sr-only">Next</span>
                                        </a>
                                    </li>
                                </c:if>
                            </ul>
                        </nav>
                    </div>
                </div>


                <!-- END LIST CURRICULUM-->

            </div>

        </div>
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
