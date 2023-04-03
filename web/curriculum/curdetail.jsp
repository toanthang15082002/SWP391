<%-- 
    Document   : curdetail
    Created on : Feb 18, 2023, 1:52:25 PM
    Author     : Thang
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Curriculum Management</title>
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
            .table-title th{
                background-color: #f1994a;
                color:#ffffff;
            }
        </style>
    </head>
    <body>
        <header>
            <jsp:include page="../common/heading.jsp"></jsp:include>  
            </header>

            <!-- Container -->
            <div class="container">
                <div class="row">
                    <h1 class="mb-4 mt-4 ">Curriculum Details</h1>

                    <!--Table Detail-->

                    <table class="table table-bordered" cellspacing="0" rules="all" border="1"
                           style="border-collapse: collapse; width: 100%">
                        <tbody>
                            <tr>
                                <td class="auto-style3" align="right" style="text-align: right; table-layout: auto">
                                    Curriculum Name:
                                </td>
                                <td class="auto-style4">
                                    <span id="lblSyllabusName" style="font-weight: bold">${cur.curName}</span>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2" align="right" style="text-align: right; table-layout: auto">
                                Curriculum Code:
                            </td>
                            <td class="auto-style6">
                                <span id="lblSubjectCode" style="font-weight: bold">${cur.curCode}</span>
                            </td>
                        </tr>

                        <tr>
                            <td class="auto-style2" align="right" style="text-align: right; table-layout: auto">
                                Description:
                            </td>
                            <td class="auto-style6">
                                <span id="lblDescription">${cur.description}</span>
                            </td>
                        </tr>


                        <tr>
                            <td class="auto-style2" align="right" style="text-align: right; table-layout: auto">
                                DecisionNo:
                            </td>
                            <td class="auto-style6">
                                <span id="lblDecisionNo">${cur.decisionNo}</span>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2" align="right" style="text-align: right; table-layout: auto"></td>
                            <td class="auto-style6">
                                <div>
                                    <button class="btn btn-primary" type="button"><a href="./plodetail?curid=${cur.curid}" type="button"><span style="color: white">PLO</span></a></button>
                                    <button class="btn btn-primary"><a href="./podetail?curid=${cur.curid}" type="button"><span style="color: white">PO</span></a></button>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <!--Table Detail-->


            </div>
        </div>


        <!--End Container -->
        <!--Review-->
        <c:set value="${sessionScope.account.roleID}" var="rid"></c:set>
        <c:if test="${rid == 6 || rid == 2 }">
            <jsp:include page="../reviewer/review.jsp" ></jsp:include> 
        </c:if>

        <!--End Review-->
        <!--FOOTER-->
        <jsp:include page="../common/footer.jsp"></jsp:include>
        <!--END FOOTER-->
        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>

    </body>
    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/wow/wow.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
            integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
    crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
    crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
    crossorigin="anonymous"></script>
    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</html>


