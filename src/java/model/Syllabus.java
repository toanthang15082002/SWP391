/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author admin
 */
public class Syllabus {
    private int syllabusID;
    private String subjectCode;
    private String syllabusName;
    private int noCredit;
    private String degreeLevel;
    private String timeAllocation;
    private String preRequisite;
    private String description;
    private String studentTasks;
    private String tool;
    private int scoringScale;
    private DecisionNo decisionNo;
    private boolean isApproved;
    private String note;
    private int minAvgMarkToPass;
    private boolean isActive;
    private String approvedDate;
    private int accountID;
    private String accountName;
    public Syllabus() {
    }

    public Syllabus(int syllabusID, String subjectCode, String syllabusName, int noCredit, String degreeLevel, String timeAllocation, String preRequisite, String description, String studentTasks, String tool, int scoringScale, DecisionNo decisionNo, boolean isApproved, String note, int minAvgMarkToPass, boolean isActive, String approvedDate, int accountID, String accountName) {
        this.syllabusID = syllabusID;
        this.subjectCode = subjectCode;
        this.syllabusName = syllabusName;
        this.noCredit = noCredit;
        this.degreeLevel = degreeLevel;
        this.timeAllocation = timeAllocation;
        this.preRequisite = preRequisite;
        this.description = description;
        this.studentTasks = studentTasks;
        this.tool = tool;
        this.scoringScale = scoringScale;
        this.decisionNo = decisionNo;
        this.isApproved = isApproved;
        this.note = note;
        this.minAvgMarkToPass = minAvgMarkToPass;
        this.isActive = isActive;
        this.approvedDate = approvedDate;
        this.accountID = accountID;
        this.accountName = accountName;
    }


    public int getSyllabusID() {
        return syllabusID;
    }

    public void setSyllabusID(int syllabusID) {
        this.syllabusID = syllabusID;
    }

    public String getSubjectCode() {
        return subjectCode;
    }

    public void setSubjectCode(String subjectCode) {
        this.subjectCode = subjectCode;
    }

    public String getSyllabusName() {
        return syllabusName;
    }

    public void setSyllabusName(String syllabusName) {
        this.syllabusName = syllabusName;
    }

    public int getNoCredit() {
        return noCredit;
    }

    public void setNoCredit(int noCredit) {
        this.noCredit = noCredit;
    }

    public String getDegreeLevel() {
        return degreeLevel;
    }

    public void setDegreeLevel(String degreeLevel) {
        this.degreeLevel = degreeLevel;
    }

    public String getTimeAllocation() {
        return timeAllocation;
    }

    public void setTimeAllocation(String timeAllocation) {
        this.timeAllocation = timeAllocation;
    }

    public String getPreRequisite() {
        return preRequisite;
    }

    public void setPreRequisite(String preRequisite) {
        this.preRequisite = preRequisite;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getStudentTasks() {
        return studentTasks;
    }

    public void setStudentTasks(String studentTasks) {
        this.studentTasks = studentTasks;
    }

    public String getTool() {
        return tool;
    }

    public void setTool(String tool) {
        this.tool = tool;
    }

    public int getScoringScale() {
        return scoringScale;
    }

    public void setScoringScale(int scoringScale) {
        this.scoringScale = scoringScale;
    }

    public DecisionNo getDecisionNo() {
        return decisionNo;
    }

    public void setDecisionNo(DecisionNo decisionNo) {
        this.decisionNo = decisionNo;
    }

   

    public boolean isIsApproved() {
        return isApproved;
    }

    public void setIsApproved(boolean isApproved) {
        this.isApproved = isApproved;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public int getMinAvgMarkToPass() {
        return minAvgMarkToPass;
    }

    public void setMinAvgMarkToPass(int minAvgMarkToPass) {
        this.minAvgMarkToPass = minAvgMarkToPass;
    }

    public boolean isIsActive() {
        return isActive;
    }

    public void setIsActive(boolean isActive) {
        this.isActive = isActive;
    }

    public String getApprovedDate() {
        return approvedDate;
    }

    public void setApprovedDate(String approvedDate) {
        this.approvedDate = approvedDate;
    }

    public void setAccountID(int accountID) {
        this.accountID = accountID;
    }

    public int getAccountID() {
        return accountID;
    }

    public String getAccountName() {
        return accountName;
    }

    public void setAccountName(String accountName) {
        this.accountName = accountName;
    }
    
    
    
}
