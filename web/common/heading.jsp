

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Navbar Start -->
<nav class="navbar navbar-expand-lg bg-white navbar-light shadow sticky-top p-0">
    <a href="home" class="navbar-brand d-flex align-items-center px-4 px-lg-5">
        <img src="img/logo-fpt.png" alt="" style="width: 100%; height:100%">
        <!-- <h2 class="m-0 text-primary"><i class="fa fa-book me-3"></i>eLEARNING</h2> -->
    </a>
    <button type="button" class="navbar-toggler me-4" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarCollapse">
        <div class="navbar-nav ms-auto p-4 p-lg-0 ">
            <a href="home" class="nav-item nav-link active">Home</a>
            <a href="viewcurriculum" class="nav-item nav-link">Curriculum</a>
            
            <c:if test="${sessionScope.account  != null}">
                <a href="syllabusmanagement" class="nav-item nav-link">Syllabus</a>
            </c:if>

            <a href="#" class="nav-item nav-link ">Part of a subject</a>
            <a href="contact.jsp" class="nav-item nav-link">Pre-Requisite</a>
            
        </div>
        <c:if test="${sessionScope.account == null}">
            <a href="login" class="btn btn-primary py-4 px-lg-5 d-none d-lg-block">Login<i class="fa fa-arrow-right ms-3"></i></a>
        </c:if>
        <c:if test="${sessionScope.account != null}">
            <input type="text" hidden="" name="accountID" value="${sessionScope.account.accountID}">
            <div class="nav-item dropdown">
                <img src="${sessionScope.account.avatar}" alt="Avatar" class="avatar" d
                     ata-bs-toggle="dropdown"  class="nav-item dropdown-toggle"
                     style="vertical-align: middle; width: 50px; height: 50px; border-radius: 50%;">  

                <div class="dropdown-menu fade-down m-0" style="right: 0;">
                    <a href="user" class="dropdown-item">Profile</a>
                    <c:if test="${sessionScope.account.roleID == 2 || sessionScope.account.roleID == 7}">
                          <a href="designer" class="dropdown-item">Designer</a>
                     </c:if>
                    <a href="changepassword" class="dropdown-item">Change Password</a>
                    <a href="logout" class="dropdown-item">Log Out</a>
                </div>
            </div>
        </c:if>
    </div>
</nav>

<!-- Navbar End -->



