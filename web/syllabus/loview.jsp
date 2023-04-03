<%-- 
    Document   : material
    Created on : Mar 19, 2023, 7:11:16 PM
    Author     : admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            .table-title th{
                background-color: #f1994a;
                color:#ffffff;
            }


        </style>
    </head>
    <body>
        <div class="container">
            <h1 class="mb-4 mt-4 ">Syllabus Details</h1>

            <jsp:include page="./menudetail.jsp"></jsp:include>

                <h3 class="mt-3 mb-3">${requestScope.lolist.size()} LO(s)</h3>
            <div>
                <table class="table table-striped table-bordered table-title" cellspacing="0" rules="all" border="1" id="gvLO"
                       style="border-collapse:collapse;">
                    <tbody>
                        <tr>
                            <th scope="col">CLO Name</th>
                            <th scope="col">CLO Details</th>
                            <th scope="col">LO Details</th>
                        </tr>
                        <c:forEach items="${requestScope.lolist}" var="lo">
                            <tr>
                                <td align="center" style="width:5%;">${lo.cloName}</td>
                                <td style="width:20%;">${lo.cloDetail}</td>
                                <td style="width:80%;">${lo.loDetail}</td>
                            </tr>
                        </c:forEach>

                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
