<%-- 
    Document   : review
    Created on : Feb 28, 2023, 2:47:21 PM
    Author     : admin
--%>



<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    .reply-link:hover{
        cursor: pointer;
        color: #e49145;
    }
    .edit-link:hover{
        cursor: pointer;
        color: #e49145;
    }
</style>
<link rel="stylesheet" href="fonts/fontawesome-free-6.2.1-web/css/all.min.css"/>
<section class="container">
    <div class="row my-5 py-5">
        <div class="col">
            <div class="col-sm-12 col-md-12">
                <div class="card">
                    <div class="card-body p-4">
                        <h2 class="text-center mb-4 pb-2">Reviewer</h2>

                        <c:set value="${sessionScope.account}" var="a"></c:set>
                            <div class="row">
                                <div class="col-12">
                                    <form method="post" action="comment">
                                        <input type="text" hidden  value="${syllabusID}" name="syllabusID">
                                    <input type="text" hidden value="${curid}" name="curID">

                                    <input type="text" hidden value="${a.accountID}" name="accountID">
                                    <div class="d-flex flex-start mt-4">
                                        <img class="rounded-circle shadow-1-strong me-3"
                                             src="${a.avatar}"
                                             alt="avatar" width="65" height="65" />
                                        <div class="flex-grow-1 flex-shrink-1">
                                            <div>

                                                <div class="d-flex align-items-center">
                                                    <p class="mb-1">
                                                        ${a.firstName} 
                                                    </p>
                                                </div> 

                                                <div class="comment-detail">
                                                    <textarea class="form-control textarea" cols="12" rows="4" name="txtComment" required>
                                                    </textarea>
                                                    <div class="float-end mt-2 pt-1 mb-2">
                                                        <button type="submit" class="btn btn-primary btn-sm">
                                                            Post comment
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                                <!-- comment List -->
                                <c:forEach items="${requestScope.comlist}" var="com">
                                    <div class="d-flex flex-start mt-4" >
                                        <img class="rounded-circle shadow-1-strong me-3"
                                             src="${com.avatar}"
                                             alt="avatar" width="55" height="55" />
                                        <div class="flex-grow-1 flex-shrink-1">   
                                            <div>

                                                <div class="d-flex justify-content-between align-items-center">

                                                    <p class="mb-1">
                                                        ${com.firstName} <span class="small">- ${com.date}</span>
                                                    </p>

                                                    <a  id="${com.commentID}reply" class="reply-link"><i class="fas fa-reply fa-xs"></i><span class="small">
                                                            reply</span></a>
                                                </div> 

                                                <!--edit-->
                                                <form method="post" action="editcomment"> 
                                                    <input type="text" hidden  value="${syllabusID}" name="syllabusID">
                                                    <input type="text" hidden value="${curid}" name="curID">
                                                    <input type="text" name="commentID" value="${com.commentID}" hidden/>
                                                    <div class="comment">
                                                        <p class="w-100 mb-0 comment-text" >
                                                            ${com.comment}
                                                        </p>
                                                        <textarea name="textedit" style="display: none" required=""></textarea>
                                                        <c:if test="${a.accountID == com.accountID}">
                                                            <a  id="${com.commentID}edit" class="edit-link"><i class="fa-thin fa-comment-pen"></i><span class="small">
                                                                    Edit.</span>
                                                            </a>
                                                        </c:if>
                                                        <button type="button" class="float-end mt-2 pt-1 save-button btn btn-primary btn-sm" style="display: none" >
                                                            Save
                                                        </button>
                                                    </div>

                                                </form>


                                            </div>

                                            <c:forEach items="${com.recomentlist}" var="recom">

                                                <!-- reply list -->
                                                <div  class="d-flex flex-start mt-5">

                                                    <a class="me-3" href="#">
                                                        <img class="rounded-circle shadow-1-strong"
                                                             src="${recom.avatar}"
                                                             alt="avatar" width="55" height="55" />
                                                    </a>
                                                    <div class="flex-grow-1 flex-shrink-1">
                                                        <div>
                                                            <div class="d-flex justify-content-between align-items-center">
                                                                <p class="mb-1">
                                                                    ${recom.firstname} <span class="small">- ${recom.date}</span>
                                                                </p>

                                                            </div>


                                                            <form method="get">
                                                                <div class="comment">
                                                                    <p class="w-100 mb-0 comment-text" >
                                                                        ${recom.recomment}
                                                                    </p>
                                                                    <c:if test="${a.accountID == recom.accountID}">
                                                                        <a  id="${recom.recommentID}edit" class="edit-link"><i class="fa-thin fa-comment-pen"></i><span class="small">
                                                                                Edit.</span>
                                                                        </a>
                                                                    </c:if>
                                                                    <button type="button" class="float-end mt-2 pt-1 save-button btn btn-primary btn-sm" style="display: none" >
                                                                        Save
                                                                    </button>


                                                                </div>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- end reply list -->

                                            </c:forEach>
                                            <!-- reply comment -->
                                            <form method="post" action="recomment">
                                                <input type="text" hidden  value="${syllabusID}" name="syllabusID">
                                                <input type="text" hidden value="${curid}" name="curID">
                                                <input type="text" name="commentID" value="${com.commentID}" hidden/>
                                                <input type="text" name="accountID" value="${a.accountID}" hidden/>
                                                <div class="reply-form d-none d-flex flex-start mt-5 " id="${com.commentID}reply-comment" >
                                                    <a class="me-3" href="#">
                                                        <img class="rounded-circle shadow-1-strong"
                                                             src="${a.avatar}"
                                                             alt="avatar" width="55" height="55" />
                                                    </a>
                                                    <div class="flex-grow-1 flex-shrink-1">
                                                        <div>
                                                            <div class="d-flex justify-content-between align-items-center">
                                                                <p class="mb-1">
                                                                    ${a.firstName}
                                                                </p>
                                                            </div>
                                                            <div class="comment">
                                                                <textarea class="w-100 mb-0 textarea" rows="4" name="txtReComment" required>
                                                                </textarea >
                                                                <div class="float-end mt-2 pt-1">
                                                                    <button type="submit" class="btn btn-primary btn-sm">
                                                                        Post comment
                                                                    </button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </form>
                                            <!--End reply comment -->
                                        </div>

                                    </div>
                                </c:forEach> 
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</section>

<script src="js/reviewer.js"></script>
<script>

    var editLinks = document.querySelectorAll('.edit-link');
      for (var i = 0; i < editLinks.length; i++) {
        editLinks[i].addEventListener('click', function(event) {
          event.preventDefault();
          var comment = this.parentNode.querySelector('.comment-text');
          var textarea = document.createElement('textarea');
          textarea.className = 'comment-textarea w-100 form-control';
          textarea.name = 'comment';
          textarea.value = comment.textContent;
          comment.parentNode.insertBefore(textarea, comment);
          comment.style.display = 'none';
          this.style.display = 'none';
          this.parentNode.querySelector('.save-button').style.display = 'block';
        });
      }

    var saveButtons = document.querySelectorAll('.save-button');
    for (var i = 0; i < saveButtons.length; i++) {
        saveButtons[i].addEventListener('click', function (event) {
            event.preventDefault();
            var form = this.parentNode.parentNode;
            var commentTextarea = this.parentNode.querySelector('.comment-textarea');
            var commentText = this.parentNode.querySelector('.comment-text');
            commentText.textContent = commentTextarea.value;
            commentTextarea.parentNode.removeChild(commentTextarea);
            commentText.style.display = 'block';
            this.parentNode.querySelector('.edit-link').style.display = 'inline';
            this.style.display = 'none';
            form.submit();
        });
    }


</script>

<script>
    const textareas = document.querySelectorAll('.textarea');
    textareas.forEach(function (textarea) {
        textarea.addEventListener('blur', function () {
            const content = this.value.trimLeft();
            this.value = content;
        });
    });



</script>





