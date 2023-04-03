/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author admin
 */
//INSERT INTO `flm_web`.`decision`
//(`decisionID`,
//`decisionNo`,
//`decisionName`,
//`approveDate`,
//`note`,
//`createDate`,
//`fileName`)
public class DecisionNo {

    private int decisionID;
    private String decisionNo;
    private String decisionName;
    private String approveDate;
    private String note;
    private String createDate;
    private String fileName;

    public DecisionNo() {
    }

    public DecisionNo(int decisionID, String decisionNo, String decisionName, String approveDate, String note, String createDate, String fileName) {
        this.decisionID = decisionID;
        this.decisionNo = decisionNo;
        this.decisionName = decisionName;
        this.approveDate = approveDate;
        this.note = note;
        this.createDate = createDate;
        this.fileName = fileName;
    }

    public int getDecisionID() {
        return decisionID;
    }

    public void setDecisionID(int decisionID) {
        this.decisionID = decisionID;
    }

    public String getDecisionNo() {
        return decisionNo;
    }

    public void setDecisionNo(String decisionNo) {
        this.decisionNo = decisionNo;
    }

    public String getDecisionName() {
        return decisionName;
    }

    public void setDecisionName(String decisionName) {
        this.decisionName = decisionName;
    }

    public String getApproveDate() {
        return approveDate;
    }

    public void setApproveDate(String approveDate) {
        this.approveDate = approveDate;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getCreateDate() {
        return createDate;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    @Override
    public String toString() {
        return "DecisionNo{" + "decisionID=" + decisionID + ", decisionNo=" + decisionNo + ", decisionName=" + decisionName + ", approveDate=" + approveDate + ", note=" + note + ", createDate=" + createDate + ", fileName=" + fileName + '}';
    }

}
