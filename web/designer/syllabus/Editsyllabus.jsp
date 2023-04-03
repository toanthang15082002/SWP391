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
        <title>Edit Syllabus</title>
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
                <div class="content__menu col-lg-2">
                <jsp:include page="../../designer/menudesigner.jsp"></jsp:include>

                </div>
                <!-- SYLLABUS ADD NEW-->
                 <div class="content__detail col-lg-10" id="syllabusAddNew">
                        <div class="content__detail-addSyllabus">
                            <div class="title text-center">
                                <h1>Syllabus Designer</h1>
                            </div>
                            
                            <div class="menu-syllabus mb-4">
                                <div style="display: flex ; gap:25px">
                                    <button class="btn btn-primary col-lg-2" style=" border-radius: 2px">
                                        <a href="listsession?syllabusID=${sy.syllabusID}" >
                                             <span>Session</span>
                                        </a>
                                    </button>
                                    <button class="btn btn-primary col-lg-2" >
                                        <a href="listassessment?syllabusID=${sy.syllabusID}">
                                            <span>Assessment</span>
                                        </a>
                                    </button>
                                    <button class="btn btn-primary col-lg-2" >
                                        <a href="">
                                            <span>Question</span>
                                        </a>
                                    </button>
                                </div>
                            </div>
                            <h2>Edit Syllabus</h2>
                            <br>
                        <c:set value="${requestScope.sy}" var="sy"/>
                            <form name="addSyllabus" action="editsyllabus" method="post" >
                                <div class="syllabus__content">
                                    <input type="number" hidden value="${sy.syllabusID}" name="syllabusID">
                                    <h3>Subject code <small class="d-inline text-danger">*</small></h3>
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <label class="input-group-text" for="inputGroupSelect01">Subject</label>
                                        </div>
                                        <select class="custom-select" id="inputGroupSelect01" name="subjectCode">
                                            <option value="${sy.subjectCode}">${sy.subjectCode}</option>
                                    </select>
                                </div>
                            </div>
                            <br>
                            <div class="syllabus__content form-group">
                                <h3>Syllabus Name <small class="d-inline text-danger">*</small></h3>
                                <input class="form-control" type="text" required value="${sy.syllabusName}" name="syllabusName">
                            </div>
                            <br>
                            <div class="syllabus__content form-group">
                                <h3>NoCredit</h3>
                                <input class="form-control" type="number" value="${sy.noCredit}" name="noCredit" id="">
                            </div>
                            <br>
                            <div class="syllabus__content form-group">
                                <h3>Degree Level</h3>
                                <input type="text" class="form-control" value="${sy.degreeLevel}" name="degreeLevel">
                            </div>
                            <br>
                            <div class="syllabus__content form-group">
                                <h3>Time Allocation</h3>
                                <textarea rows="5" class="form-control"  name="timeAllocation" rows="2">${sy.timeAllocation}</textarea>
                            </div>
                            <br>
                            <div class="syllabus__content form-group">
                                <h3>Pre-Requisite</h3>
                                <input type="text" class="form-control" value="${sy.preRequisite}" name="preRequisite">
                            </div>
                            <br>
                            <div class="syllabus__content form-group">
                                <h3>Description</h3>
                                <textarea rows="5" class="form-control" value="" name="description" rows="2">${sy.description}</textarea>
                            </div>
                            <br>
                            <div class="syllabus__content form-group" >
                                <h3>Student Tasks</h3>
                                <textarea rows="5" class="form-control" value="" name="studentTasks" rows="2">${sy.studentTasks}</textarea>
                            </div>
                            <br>
                            <div class="syllabus__content form-group" >
                                <h3>Tools</h3>
                                <textarea rows="5" type="text" class="form-control" value=""  name="tool" rows="2">${sy.tool}</textarea>
                            </div>
                            <br>
                            <div class="syllabus__content form-group">
                                <h3>Scoring Scale</h3>
                                <input type="number" class="form-control"  value="${sy.scoringScale}" name="scoringScale">
                            </div>
                            <br>
                            <div class="syllabus__content form-group">
                                 <h3>Decision No</h3>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <label class="input-group-text" for="inputGroupSelect01">DecisionNo</label>
                                    </div>
                                    <select class="custom-select" id="inputGroupSelect01" name="decisionNo">
                                        <option  value="">Choose...</option>
                                        <c:forEach items="${requestScope.listDeci}" var="dec">
                                            <option ${dec.decisionNo == sy.decisionNo.decisionNo ? "selected" :""} value="${dec.decisionID}">${dec.decisionNo}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <br>
                            <div class="syllabus__content form-group">
                                <h3>Is Approved</h3>
                                    <input type="radio" name="isApproved" ${sy.isApproved == "true"?"checked":""} value="1"/><h5 class="d-inline">True</h5>&nbsp&nbsp&nbsp&nbsp
                                    <input type="radio"name="isApproved"${sy.isApproved == "false"?"checked":""} value="0"/><h5 class="d-inline">False</h5>
                            </div>
                            <br>
                            <div class="syllabus__content form-group">
                                <h3>Note</h3>
                                <textarea rows="5" class="form-control" value="" name="note" rows="2">${sy.note}</textarea>
                            </div>
                            <br>
                            <div class="syllabus__content form-group">
                                <h3>Min Avg Mark To Pass</h3>
                                <input type="number" class="form-control" value="${sy.minAvgMarkToPass}" name="minAMToPass">
                            </div>
                            <br>
                            <div class="syllabus__content form-group">
                                <h3>Approved Date</h3>
                                <input type="date" class="form-control" value="${sy.approvedDate}" name="approvedDate">
                            </div>
                            <br>
                            <div class="syllabus__content form-group">
                                <h3>Is Active</h3>
                                    <input type="radio" name="isActive" ${sy.isActive == "true"?"checked":""} value="1"/><h5 class="d-inline">Yes</h5>&nbsp&nbsp&nbsp&nbsp
                                    <input type="radio"name="isActive" ${sy.isActive == "false"?"checked":""} value="0" /><h5 class="d-inline">No</h5>
                            </div>
                            <br>
                            <input class="btn btn-success text-center" style="height: 4rem; width:8rem; font-size:1.6em"
                                   type="submit" value="Save">
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
