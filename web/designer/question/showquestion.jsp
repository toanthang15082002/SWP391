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
        <title>List Question</title>
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
            <jsp:include page="../../common/heading.jsp"/>
        </header>
        <!--END HEADER-->

        <div class="content container-fluid ">
            <div class="row">
                <!-- Menu DESIGNER -->
                <div class="content__menu col-lg-2">
                    <jsp:include page="../../designer/menudesigner.jsp"/>
                </div>
                <!-- END Menu DESIGNER -->

                <!--Question Show Start-->
                <div class="content__detail col-lg-10" >
                    <div class="content__detail-addSyllabus">
                        <div class="title text-center">
                            <h1>Question...</h1>
                        </div>
                        <div class="row">
                            <div  class="col-sm-2">
                                <form action="questionbysid" method="get">
                                    <div class="d-flex justify-content-center" >
                                        <div class="mt-3">
                                            <select name="qbysid"onchange="this.form.submit()">
                                                <c:forEach items="${requestScope.slist}" var="sl">
                                                    <option ${sid == sl.sid ?'selected':''} value="${sl.sid}">Session ${sl.no}&nbsp;&nbsp;&nbsp;  </option>
                                                </c:forEach>

                                            </select>
                                        </div>

                                    </div>
                                </form>
                            </div>
                            <div class="col-sm-9">

                                <form action="searchquestion" method="get">
                                    <div class="d-flex justify-content-center" >
                                        <input class="form-control" name="sid" value="${sid}" hidden/>

                                        <div class="form-outline col-lg">
                                            <input type="search" class="form-control" name="searchtxt" value="${searchtxt}" placeholder="Enter Question name" style="height: 100%"/>
                                        </div>
                                        <button type="submit" class="btn btn-primary col-lg-2" >
                                            <i class="fas fa-search"></i>
                                        </button>
                                    </div>
                                </form>

                            </div>

                        </div>

                        <c:if test="${requestScope.qlist.size() == 0}">
                            <h6 style="font-size: 2em;color: red">No Question Here</h6>
                        </c:if>
                        <br>
                        <c:if test="${requestScope.qlist.size() != 0}">
                            <table class="table table-striped" style="font-size: 1.2em">
                                <thead>
                                    <tr>
                                        <th scope="col">Q_Code</th>
                                        <th scope="col">Q_Name</th>
                                        <th scope="col">Detail</th>
                                        <th scope="col">Action</th>

                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${requestScope.qlist}" var="ql">
                                        <tr>
                                            <td class="col-md-1">${ql.qid}</td>
                                            <td class="col-md-1">${ql.nameQuestion}</td>
                                            <td class="col-md-7">${ql.detail}</td>
                                            <td class="col-md-3">   
                                                <a href="editquestion?qid=${ql.qid}" class="btn btn-primary "  style="font-size: 0.6em; width: 9em; ">Edit</a>
                                                <button type="button" class="btn btn-primary " data-toggle="modal" style="font-size: 0.6em; width: 9em"  data-target="#DeleteModal" data-whatever="@fat">Delete</button>
                                            </td>
                                        </tr>
                                        <!--ModalDelete Start-->
                                    <div class="modal fade" id="DeleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLabel">Delete Question</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    <form action="deletequestion" method="get">
                                                        <div class="form-group">
                                                            <input type="text" class="form-control" readonly name="qid" value="${ql.qid}" hidden id="recipient-name">
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="recipient-name" class="col-form-label" >SessionID</label>
                                                            <input type="text" class="form-control" name="sid" value="${ql.sid}" readonly id="recipient-name">
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="message-text" class="col-form-label">Question Name</label>
                                                            <input class="form-control" id="message-text" value="${ql.nameQuestion}" readonly name="questionname" >
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="message-text" class="col-form-label">Detail</label>
                                                            <textarea class="form-control" id="message-text" readonly name="detail">${ql.detail}</textarea>
                                                        </div>
                                                        <div class="form-group">
                                                            <br>
                                                            <h4>Do you want to <span style="color: red">DELETE</span> this information</h4>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Not</button>
                                                            <button type="submit" class="btn btn-primary">Accept</button>
                                                        </div>
                                                    </form>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <!--ModalDelete end-->

                                </c:forEach>

                                </tbody>
                            </table>

                        </c:if>
                        <a href="addquestion?sid=${requestScope.sid}" class="btn btn-primary m-auto d-block" >Add New Question</a>

                        <!--Paging Start-->
                        <nav aria-label="Page navigation example">
                            <ul class="pagination">
                                <c:if test="${tag > 1}">
                                    <li class="page-item">
                                        <a class="page-link" href="showquestion?sid=${sid}&?indexPage=${tag-1}" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                            <span class="sr-only">Previous</span>
                                        </a>
                                    </li>
                                </c:if>

                                <c:forEach begin="1" end="${endPage}" var="i">
                                    <li class="page-item ${tag == i ? "active" : ""}"><a class="page-link" href="showquestion?sid=${sid}&?indexPage=${i}">${i}</a></li>
                                    </c:forEach>
                                    <c:if test="${tag != endPage}"> 
                                    <li class="page-item">
                                        <a class="page-link" href="showquestion?sid=${sid}&?indexPage=${tag+1}" aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                            <span class="sr-only">Next</span>
                                        </a>
                                    </li>
                                </c:if>
                            </ul>
                        </nav>
                        <!--Paging End-->

                    </div>
                </div>


                <!--ModalAdd Start-->
                <div class="modal fade" id="AddModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Add New Question</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <form action="addquestion" method="get">
                                    <div class="form-group">
                                        <input type="text" class="form-control" readonly name="qid" value+hidden id="recipient-name">
                                    </div>
                                    <div class="form-group">
                                        <label for="recipient-name" class="col-form-label" >SessionID</label>
                                        <input type="text" class="form-control" name="sid" value="${ql.sid}" readonly="" id="recipient-name">
                                    </div>
                                    <div class="form-group">
                                        <label for="message-text" class="col-form-label"  >Question Name</label>
                                        <input class="form-control" id="message-text" name="questionname" >
                                    </div>
                                    <div class="form-group">
                                        <label for="message-text" class="col-form-label" >Detail</label>
                                        <textarea class="form-control" id="message-text" name="detail"></textarea>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                        <button type="submit" class="btn btn-primary">Add New</button>
                                    </div>
                                </form>
                            </div>

                        </div>
                    </div>
                </div>
                <!--ModalAdd end-->

                <!--                Modal Edit
                                <div class="modal fade" id="EditModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">Edit Question</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <form action="editquestion" method="get">
                                                    <div class="form-group">
                                                        <input type="text" class="form-control" readonly name="qid" value="${ql.sid}" hidden id="recipient-name">
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="recipient-name" class="col-form-label" >SessionID</label>
                                                        <input type="text" class="form-control" readonly name="sid" value="${ql.sid}" id="recipient-name">
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="message-text" class="col-form-label"  >Question Name</label>
                                                        <input class="form-control" id="message-text" name="questionname" value="${ql.nameQuestion}">
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="message-text" class="col-form-label" >Detail</label>
                                                        <textarea class="form-control" id="message-text" name="detail">${ql.detail}</textarea>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                        <button type="submit" class="btn btn-primary">Change</button>
                                                    </div>
                                                </form>
                                            </div>
                
                                        </div>
                                    </div>
                                </div>
                                ModalEdit end-->


                <!-- END Question-->

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
