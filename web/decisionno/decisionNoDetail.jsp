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
        <style>
/*            * {
                font-size: 16px;
                font-family: 'Roboto';
            }*/

            table {
                border-collapse: collapse;
                margin-top: 20px;
            }

            table,
            th,
            td {
                border: 1px solid #dee2e6;
                vertical-align: top;
                text-align: left;
                padding: 8px;
            }

            table th {
                background-color: #F2994A;
                color: white;
            }

            h2 {
                font-size: 30px;
                font-weight: normal;
            }

            .error-alert {
                color: red;
                margin-left: 160px;
                margin-top: 10px;
            }
        </style>
    </head>

    <body>
        <!--HEADER-->
        <header>
            <jsp:include page="../common/heading.jsp"></jsp:include>

            </header>
            <!--END HEADER-->
            <div class="content container-fluid ">
                <div class="row">
                    <div>
                        <h2>View Decision Detail</h2>

                    <c:set value="${sy.decisionNo}" var="de"/>
                    <table class="table" style="width:100%">


                        <tbody>
                            <tr>
                                <td style="width:12%;text-align:right;"> DecisionNo</td>
                                <td>${de.decisionNo}</td>
                            </tr>
                            <tr>
                                <td style="width:12%;text-align:right;">DecisionName</td>
                                <td>${de.decisionName}</td>
                            </tr>
                            <tr>
                                <td style="width:12%;text-align:right;"> ApprovedDate (MM/dd/yyyy)</td>
                                <td class="text-black-50">${de.approveDate}</td>
                            </tr>
                            <tr>
                                <td style="width:12%;text-align:right;">Note</td>
                                <td>${de.note}</td>
                            </tr>
                            <tr>
                                <td style="width:12%;text-align:right;">CreateDate (MM/dd/yyyy)</td>
                                <td>${de.createDate}</td>
                            </tr>
                            <tr>
                                <td style="width:12%;text-align:right;"> FileName</td>
                                <td>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>


            </div>
        </div>
        <!--FOOTER-->
        <jsp:include page="../common/footer.jsp"></jsp:include>
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

</html>
