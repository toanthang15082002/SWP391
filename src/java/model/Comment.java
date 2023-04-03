/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;
import java.text.DateFormat;
import java.time.LocalDate;
import java.util.List;


/**
 *
 * @author admin
 */

public class Comment {
    private int commentID;
    private int syllabusID;
    private int curriculumID;
    private String comment;
    private int accountID;
    private String firstName;
    private String avatar;
    private String date;
    private List<ReComment> recomentlist;
    public Comment() {
    }

    public Comment(int commentID, int syllabusID, int curriculumID, String comment, int accountID, String firstName, String avatar, String date, List<ReComment> recomentlist) {
        this.commentID = commentID;
        this.syllabusID = syllabusID;
        this.curriculumID = curriculumID;
        this.comment = comment;
        this.accountID = accountID;
        this.firstName = firstName;
        this.avatar = avatar;
        this.date = date;
        this.recomentlist = recomentlist;
    }

  


    public void setAccountID(int accountID) {
        this.accountID = accountID;
    }

    public int getAccountID() {
        return accountID;
    }


    public int getCommentID() {
        return commentID;
    }

    public void setCommentID(int commentID) {
        this.commentID = commentID;
    }

    public int getSyllabusID() {
        return syllabusID;
    }

    public void setSyllabusID(int syllabusID) {
        this.syllabusID = syllabusID;
    }

    public int getCurriculumID() {
        return curriculumID;
    }

    public void setCurriculumID(int curriculumID) {
        this.curriculumID = curriculumID;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public List<ReComment> getRecomentlist() {
        return recomentlist;
    }

    public void setRecomentlist(List<ReComment> recomentlist) {
        this.recomentlist = recomentlist;
    }

    

    
    
    public String getDateNow(){
        LocalDate currentDate = LocalDate.now();
        return currentDate.toString();
    }
    
    public static void main(String[] args) {
      
    }
}
