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

                <h4 class="mt-3 mb-3">${requestScope.selist.size()} sessions (45'/session)</h4>
            <div>
                <table class="auto-style2 table table-striped table-bordered table-title tbl-data thead-light  " cellspacing="0"
                       rules="all" border="1" id="gvSchedule" style="width:100%;border-collapse:collapse;">
                    <tbody>
                        <tr >
                            <th scope="col">Session</th>
                            <th scope="col">Topic</th>
                            <th scope="col">Learning-Teaching Type</th>
                            <th scope="col">LO</th>
                            <th scope="col">ITU</th>
                            <th scope="col">Student Materials</th>
                            <th scope="col">S-Download</th>
                            <th scope="col">Student's Tasks</th>
                            <th scope="col">URLs</th>
                        </tr>
                        <c:forEach items="${requestScope.selist}" var="se">
                            <tr>
                                <td>${se.sid}</td>
                                <td>${se.topic}</td>
                                <td>${se.learningTeachingType?'Online':'Offline'}</td>
                                <td>${se.lo}</td>
                                <td>${se.itu}</td>
                                <td class="product">${se.studentMaterial}</td>
                                <td><a href="#">${se.download}</a></td>
                                <td>${se.studentTask}</td>
                                <td>${se.urls}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
