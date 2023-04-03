<%-- 
    Document   : register
    Created on : Feb 5, 2023, 4:07:18 PM
    Author     : tient
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>eLEARNING - eLearning HTML Template</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link
            href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Nunito:wght@600;700;800&display=swap"
            rel="stylesheet">

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
        <style>
            .profile-ava{
                position: relative;

            }
            #file{
                display: none;
            }
            .photo{

            }
            #uploadBtn{
                height: 40px;
                width: 100%;
                position: absolute;
                bottom: 0;

                left: 0;
                text-align: center;
                /*background: rgba(0, 0, 0, 0.7);*/
                color: wheat;
                line-height: 30px;
                font-family: sans-serif;
                font-size: 18px;
                cursor: pointer;
                /*display: none;*/
            }
        </style>
    </head>

    <body>
        <!-- Spinner Start -->
        <div id="spinner"
             class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div>
        <!-- Spinner End -->


        <!-- Navbar Start -->
        <jsp:include page="../common/heading.jsp"/>
        <!-- Navbar End -->


        <!-- Header Start -->
        <div class="container-fluid bg-primary py-5 mb-5 page-header ">
            <div class="container py-5">
                <div class="row justify-content-center">
                    <div class="col-lg-10 text-center">
                        <h1 class="display-3 text-white animated slideInLeft">Profile</h1>
                    </div>
                </div>
            </div>
        </div>
        <!-- Header End -->


        <!-- Contact Start -->
        <section>
            <div class="container-fluid h-custom">
                <c:set value="${sessionScope.account}" var="u"/>

                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-md-9 col-lg-6 col-xl-5 profile-ava">
                        <form action="changeavar" method="post">
                            <img src="${u.avatar}" id="photo"
                                 class="img-thumbnail rounded-circle" alt="${u.firstName}img" >
                            <input type="file" id="file">
                            <label for="file" id="uploadBtn">Change Avatar</label>
                            <!--<input type="submit" value="Add image" >-->
                        </form>

                    </div>
                    <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">

                        <div class="infoform">
                            <h4>Informations</h4>
                            <div class="my-4">
                                <p class="text-center fw-bold mx-3 mb-0"><hr></p>
                            </div>
                            <div class="row">
                                <div class="form-outline mb-4 col-12 col-md-6">
                                    <label class="form-label" >First Name</label>
                                    <h3>${u.firstName}</h3>
                                </div>
                                <div class="form-outline mb-3 col-12 col-md-6">
                                    <label class="form-label" >Last Name</label>
                                    <h3>${u.lastName}</h3>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-outline mb-4 col-12 col-md-6">
                                    <label class="form-label" >Username</label>
                                    <%--<fmt:formatDate pattern="--%>
                                    <h3>${u.userName}</h3>
                                </div>
                                <div class="form-outline mb-4 col-12 col-md-6">
                                    <label class="form-label" >Gender</label>
                                    <h3>${u.gender==1?"Male":"Female"}</h3>
                                </div>
                            </div>

                            <div class="row">
                                <div class="form-outline mb-4 col-12 col-md-6">
                                    <label class="form-label">Email</label>
                                    <h5>${u.email}</h5>
                                </div>
                                <div class="form-outline mb-4 col-12 col-md-6">
                                    <label class="form-label" >Phone Number</label>
                                    <h5>${u.phone}</h5>
                                </div>
                            </div>
                            <div class="form-outline mb-4">
                                <label class="form-label" >Address</label>
                                <h5>${u.address}</h5>
                            </div>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="text-center text-lg-start pt-2">
                                    <a href="changeinfo?accountID=${u.accountID}" class="btn btn-primary btn-lg"
                                       style="padding-left: 2.5rem; padding-right: 2.5rem;">Change information</a>

                                </div>
                            </div>


                            <script>
                                function checkPassword(pw) {
                                    if (pw.length < 8 || pw.length > 15) {
                                        document.getElementById("message").innerHTML = "";
                                        document.getElementById("message").innerHTML = "Mat khau tu 8 - 15 ky tu";
                                        document.getElementById("register").disabled = true;
                                    } else {
                                        document.getElementById("message").innerHTML = "";
                                        document.getElementById("register").disabled = false;
                                    }
                                }
                            </script>

                        </div>
                    </div>
                </div>
        </section>
        <!-- Contact End -->

        <!--modal change information-->


        <!-- Modal -->

        <!-- Footer Start -->
        <jsp:include page="../common/footer.jsp"></jsp:include>
        <!-- Footer End -->



        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="lib/wow/wow.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/waypoints/waypoints.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>

        <!-- Template Javascript -->
        <script src="js/main.js"></script>
    </body>

</html>
