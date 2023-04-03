/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;
import java.time.LocalDate;

/**
 *
 * @author admin
 */
// c.commentID ,rec.recommentID,rec.recomment,a.accountID, a.firstname, a.avatar, 
public class ReComment {
    private int commentID;
    private int recommentID;
    private int accountID;
    private String recomment;
    private String firstname;
    private String avatar;
    private String date;
    
    
    public ReComment() {
    }

    public ReComment(int commentID, int recommentID, int accountID, String recomment, String firstname, String avatar, String date) {
        this.commentID = commentID;
        this.recommentID = recommentID;
        this.accountID = accountID;
        this.recomment = recomment;
        this.firstname = firstname;
        this.avatar = avatar;
        this.date = date;
    }




    public int getCommentID() {
        return commentID;
    }

    public void setCommentID(int commentID) {
        this.commentID = commentID;
    }

    public int getRecommentID() {
        return recommentID;
    }

    public void setRecommentID(int recommentID) {
        this.recommentID = recommentID;
    }

    public int getAccountID() {
        return accountID;
    }

    public void setAccountID(int accountID) {
        this.accountID = accountID;
    }

    public String getRecomment() {
        return recomment;
    }

    public void setRecomment(String recomment) {
        this.recomment = recomment;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
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

     public LocalDate getDateNow(){
        return java.time.LocalDate.now();
    }
}
