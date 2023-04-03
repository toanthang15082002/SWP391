<%-- 
    Document   : Addsyllabus.jsp
    Created on : Feb 4, 2023, 10:11:54 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Add Syllabus</title>
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
            <jsp:include page="../../common/heading.jsp"></jsp:include>
            </header>
            <!--END HEADER-->
            <div class="content container-fluid ">
                <div class="row">
                    <!-- Menu DESIGNER -->

                    <div class="content__menu col-lg-2">

                    <jsp:include page="../menudesigner.jsp"></jsp:include>
                    </div>
                    <!-- END Menu DESIGNER -->

                    <!-- SYLLABUS ADD NEW-->
                    <div class="content__detail col-lg-10" id="syllabusAddNew">
                        <div class="content__detail-addSyllabus">
                            <div class="title text-center">
                                <h1>Syllabus Designer</h1>
                            </div>
                            <h2>Add Syllabus</h2>
                            <br>
                            <form name="addSyllabus"  action="addsyllabus" method="post" onsubmit="return valuesNotNull()" required>
                                <div class="syllabus__content">
                                    <h3>Subject code <small class="d-inline text-danger">*</small></h3>

                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <label class="input-group-text" for="inputGroupSelect01">Subject</label>
                                        </div>
                                        <select required class="custom-select" id="inputGroupSelect01" name="subjectCode">
                                            <option selected value="">Choose...</option>
                                        <c:forEach items="${requestScope.listSubject}" var="s">
                                            <option value="${s.subjectCode}">${s.subjectCode}</option>
                                        </c:forEach>
                                         </select>
                                        </div>
                                        <small>${mes1}</small>
                                </div>
                            <br>
                            <div class="syllabus__content form-group">
                                <h3>Syllabus Name  <small class="d-inline text-danger">*</small></h3>
                                <input class="form-control" type="text" value="" name="syllabusName" required>
                                 <small>${mes2}</small>
                            </div>
                            <br>
                            <div class="syllabus__content form-group">
                                <h3>NoCredit  <small class="d-inline text-danger">*</small></h3>
                                <input class="form-control" type="number" value="0" name="noCredit" id="" required>
                                <small>${mes3}</small>
                            </div>
                            <br>
                            <div class="syllabus__content form-group">
                                <h3>Degree Level</h3>
                                <input type="text" class="form-control" name="degreeLevel">
                            </div>
                            <br>
                            <div class="syllabus__content form-group">
                                <h3>Time Allocation</h3>
                                <textarea rows="5" class="form-control" name="timeAllocation" rows="2"></textarea>
                            </div>
                            <br>
                            <div class="syllabus__content form-group">
                                <h3>Pre-Requisite</h3>
                                <input type="text" class="form-control" name="preRequisite">
                            </div>
                            <br>
                            <div class="syllabus__content form-group">
                                <h3>Description</h3>
                                <textarea rows="5" class="form-control" name="description" rows="2"></textarea>
                            </div>
                            <br>
                            <div class="syllabus__content form-group" >
                                <h3>Student Tasks</h3>
                                <textarea rows="5" class="form-control" name="studentTasks" rows="2"></textarea>
                            </div>
                            <br>
                            <div class="syllabus__content form-group" >
                                <h3>Tools</h3>
                                <textarea rows="5" type="text" class="form-control" name="tool" rows="2"></textarea>
                            </div>
                            <br>
                            <div class="syllabus__content form-group">
                                <h3>Scoring Scale</h3>
                                <input type="number" class="form-control" value="0" name="scoringScale">
                            </div>
                            <br>
                            <div class="syllabus__content form-group">
                                <h3>Decision No</h3>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <label class="input-group-text" for="inputGroupSelect01">DecisionNo</label>
                                    </div>
                                    <select class="custom-select" id="inputGroupSelect01" name="decisionNo">
                                        <option selected value="">Choose...</option>
                                        <c:forEach items="${requestScope.listDeci}" var="dec">
                                            <option value="${dec.decisionID}">${dec.decisionNo}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <br>
                                <div class="syllabus__content form-group">
                                    <h3>Is Approved</h3>
                                    <input type="radio" name="isApproved" value="true"/><h5 class="d-inline">True</h5>&nbsp&nbsp&nbsp&nbsp
                                    <input type="radio"name="isApproved" value="False"/><h5 class="d-inline">False</h5>
                                </div>
                                <br>
                                <div class="syllabus__content form-group">
                                    <h3>Note</h3>
                                    <textarea rows="5" class="form-control" name="note" rows="2"></textarea>
                                </div>
                                <br>
                                <div class="syllabus__content form-group">
                                    <h3>Min Avg Mark To Pass</h3>
                                    <input type="number" class="form-control" value="0" name="minAMToPass">
                                </div>
                                <br>
                                <div class="syllabus__content form-group">
                                    <h3>Approved Date</h3>
                                    <input type="date" class="form-control" name="approvedDate">
                                </div>
                                <br>
                                <div class="syllabus__content form-group">
                                    <h3>Is Active</h3>
                                    <input type="radio" name="isActive" value="true"/><h5 class="d-inline">Yes</h5>&nbsp&nbsp&nbsp&nbsp
                                    <input type="radio"name="isActive" value="False" /><h5 class="d-inline">No</h5>
                                </div>
                                <br>
                                <input class="btn btn-success text-center mb-2" style="padding: 0 20px;width: content-box;font-size:1.6em"
                                       type="submit" value="Add">
                                <br>
                                </form>
                            </div>
                    </div>
                    <!-- END SYLLABUS ADD NEW-->
                </div>

            </div>
            <!--FOOTER-->
            <jsp:include page="../../common/footer.jsp"></jsp:include>
            <!--END FOOTER-->


    </body>
    <script>
        function valuesNotNull() {


        }
    </script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/wow/wow.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script> 
    <!-- Template Javascript -->
    <script src="js/main.js"></script>
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
