<%-- 
    Document   : menudetail
    Created on : Mar 19, 2023, 7:01:53 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style>
        .menu-detail{
           position: sticky;
           width: 100%;
           border: 0;
           margin-top: 50px;
           top: 0;
       }
       .menu{
           width: 100%;
           height: 100%;
           display: flex;
           align-items:center;
          
       }


       .menu-item{
           width: 100%;
           height: 100%;
           list-style-type: none;
           display:flex;
           gap: 20px; 
           background:#ffffff;
           padding: 10px;
       }


       .item{
           width: 200px;
           height:60px;
           background:#f1994a;
           border-radius: 4px;
       }
       .item:hover{
           background:#f3b074;
           cursor: pointer;
       }
       .itemlink{
           display:flex;
           width: 100%;
           height: 100%;
           color: #ffffff;
           text-align:center;
           justify-content:center;
           align-items: center;
       }
       .itemlink:hover{
          
           color: #ffffff;
       }






</style>
<div class="menu-detail ">
    <div class="menu">
        <ul class="menu-item">
            <li class="item"><a class="itemlink" href="syllabusdetails?syllabusID=${syllabusID}">Details</a></li>
            <li class="item"><a class="itemlink" href="materialdetailview?syllabusID=${syllabusID}">Material</a></li>
            <li class="item"><a class="itemlink" href="lodetailview?syllabusID=${syllabusID}">LO</a></li>
            <li class="item"><a class="itemlink" href="sessiondetailview?syllabusID=${syllabusID}">Sessions</a></li>
            <li class="item"><a class="itemlink" href="questiondetailview?syllabusID=${syllabusID}">Question</a></li>
            <li class="item"><a class="itemlink" href="assessmentdetailview?syllabusID=${syllabusID}">Assessment</a></li>
        </ul>
    </div>
</div>
