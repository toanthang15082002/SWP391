<%-- 
    Document   : Editsyllabus
    Created on : Feb 4, 2023, 10:14:21 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Add Assessment</title>
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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"
              integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.2.1/dist/css/bootstrap.min.css"
              integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
                integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.6/dist/umd/popper.min.js"
                integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.2.1/dist/js/bootstrap.min.js"
                integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"
        crossorigin="anonymous"></script>

    </head>

    <body>
        <!--HEADER-->
        <header>
            <jsp:include page="../../common/heading.jsp"></jsp:include>
            </header>
            <!--END HEADER-->
            <div class="content container-fluid ">
                <div class="row">
                    <div class="content__menu col-lg-2">
                    <jsp:include page="../../designer/menudesigner.jsp"></jsp:include>

                    </div>
                    <!-- ADD -->
                    <div class="content__detail col-lg-10" id="syllabusAddNew">
                        <div class="content__detail-addSyllabus">
                            <div class="title text-center">
                                <h1>Syllabus Designer</h1>
                            </div>
                            <h2>Add Session</h2>
                            <div class="modal-body">

                                <form action="addsession" method="post">
                                    <div class="form-group">
                                        <label for="recipient-name" class="col-form-label" >SyllabusID <span class="text-danger"> *</span></label>
                                        <select class="custom-select" id="inputGroupSelect01" name="syllabusID">
                                            <!--<option selected value="">Choose...</option>-->
                                        <c:forEach items="${requestScope.listSyllabus}" var="s">
                                            <option value="${s.syllabusID}">${s.subjectCode}_${s.syllabusName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="recipient-name" class="col-form-label" >Category <span class="text-danger"> * ${requestScope.ms}</span></label>
                                    <input type="number" class="form-control" name="category" id="recipient-name">
                                </div>
                                <div class="form-group">
                                    <label for="message-text" class="col-form-label">Type <span class="text-danger"> *</span></label>
                                    <br>
                                    <input name="type" type="radio" checked value="1"> On-going
                                    <input name="type" type="radio" value="0">Final exam
                                </div>
                                <div class="form-group">
                                    <label for="message-text" class="col-form-label" >Part <span class="text-danger"> *</span></label>
                                    <input class="form-control" id="message-text" required name="part">
                                </div>
                                <div class="form-group">
                                    <label for="message-text" class="col-form-label" >Weight <span class="text-danger"> *</span></label>
                                    <select name="weight">
                                        <option>Choose...</option>
                                        <option value="10">10%</option>
                                        <option value="15">15%</option>
                                        <option value="20">20%</option>
                                        <option value="40">40%</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="message-text" class="col-form-label" >Completion Criteria<span class="text-danger"> *</span></label>
                                    <input class="form-control" id="message-text" required name="completioncriteria" >
                                </div>
                                <div class="form-group">
                                    <label for="message-text" class="col-form-label" >Duration<span class="text-danger"> *</span></label>
                                    <input class="form-control" id="message-text" required name="duration" >
                                </div>
                                <div class="form-group">
                                    <label for="message-text" class="col-form-label" >CLO <span class="text-danger"> *</span></label>
                                    <input class="form-control" id="message-text" required name="clo" >
                                </div>
                                <div class="form-group">
                                    <label for="message-text" class="col-form-label" >Question Type</label>
                                    <input class="form-control" id="message-text" name="questiontype" >
                                </div> <div class="form-group">
                                    <label for="message-text" class="col-form-label" >No Question</label>
                                    <input class="form-control" id="message-text" name="noquestion" >
                                </div>
                                <div class="form-group">
                                    <label for="message-text" class="col-form-label" >Knowledge and Skill</label>
                                    <textarea class="form-control" id="message-text" name="kas"></textarea>

                                </div>
                                <div class="form-group">
                                    <label for="message-text" class="col-form-label" >Grading Guide</label>
                                    <textarea class="form-control" id="message-text" name="grandingguide"></textarea>
                                </div>
                                <div class="form-group">
                                    <label for="message-text" class="col-form-label" >Note</label>
                                    <textarea class="form-control" id="message-text" name="note"></textarea>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <button type="submit" class="btn btn-primary">Add New</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <!--End Question Update-->



            </div>

            <!--Toast notification-->
            <div aria-live="polite" aria-atomic="true" style="position: relative; min-height: 200px;">
                <!-- Position it -->
                <div style="position: absolute; top: 20px; right: 10px;">

                    <!-- Then put toasts within -->
                    <div class="toast border-success" role="alert" aria-live="assertive" aria-atomic="true"
                         data-autohide="false">
                        <div class="toast-header ">
                            <!-- <img src="..." class="rounded mr-2" alt="..."> -->
                            <i class="fa-solid fa-circle-check text-success"></i>&nbsp;
                            <strong class="mr-auto text-success">Update Successful</strong>&nbsp;&nbsp;&nbsp;
                            <small class="text-muted">just now</small>
                            <button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <!-- <div class="toast-body">
                            See? Just like this.
                        </div> -->
                    </div>
                </div>
            </div>
            <!--End Toast notification--> 
        </div>
        <!--FOOTER-->
        <jsp:include page="../../common/footer.jsp"></jsp:include>
        <!--END FOOTER-->


    </body>
    <script>
        $(document).ready(function () {
            $('.toast').toast('show');
        });
    </script>
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
