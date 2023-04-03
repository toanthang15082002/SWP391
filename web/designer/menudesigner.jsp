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
        <title>List Session</title>
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
        <c:set value="${sessionScope.account}" var="a"/>
        <div class="menu__detail">
            <div class="menu-title">Menu Designer</div>
            <div class="dropdown menu-item">
                <a href="listsyllabus" class="menu-item-btn btn btn-primary animated slideInLeft" style="font-size: 1em; font-weight:300 " type="button" >
                    <span>Syllabus</span>
                </a>
            </div>
            <div class="dropdown menu-item">
                <a href="managecurriculum" class="menu-item-btn btn btn-primary animated slideInLeft" style="font-size: 1em; font-weight:300 "  >
                    <span>Curriculum</span>
                </a>
            </div>
            <div class="dropdown menu-item">
                <a href="manageplo" class="menu-item-btn btn btn-primary animated slideInLeft" style="font-size: 1em; font-weight:300 " type="button">
                    <span>PLO</span>
                </a>
            </div>
            <div class="dropdown menu-item">
                <a href="managepo" class="menu-item-btn btn btn-primary animated slideInLeft" style="font-size: 1em; font-weight:300 " type="button">
                    <span>PO</span>
                </a>
            </div>
            <div class="dropdown menu-item">
                <a href="listsubject" class="menu-item-btn btn btn-primary animated slideInLeft" style="font-size: 1em; font-weight:300 " type="button" >
                    <span>Subject</span>
                </a>
            </div>
            <div class="dropdown menu-item">
                <a href="listq_syllabus" class="menu-item-btn btn btn-primary animated slideInLeft" style="font-size: 1em; font-weight:300 "  >
                    <span>Question</span>
                </a>
            </div>
            
            
            <div class="dropdown menu-item">
                <a href="listdecision" class="menu-item-btn btn btn-primary animated slideInLeft" style="font-size: 1em; font-weight:300 "  >
                    <span>Decision</span>
                </a>
            </div>
            <div class="dropdown menu-item">
                <button class="menu-item-btn btn btn-primary animated slideInLeft">
                    <span>Combo</span>
                </button>
                <div class="dropdown-menu menu-item-dropdown" aria-labelledby="dropdownMenuSyllabus">
                    <a class="dropdown-item" href="addcombosubject">Add Combo</a>
                    <a class="dropdown-item" href="#">Edit Combo</a>
                    <a class="dropdown-item" href="#">Find combo</a>
                    <a class="dropdown-item" href="listallcombo">View all Combo</a>
                </div>
            </div>
        </div>

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
