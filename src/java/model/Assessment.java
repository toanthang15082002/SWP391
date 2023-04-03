/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author admin
 */
public class Assessment {

    private int aid;
    private int syllabusID;
    private String category;
    private int type;
    private int part;
    private int weight;
    private String completionCriteria;
    private String duration;
    private String clo;
    private String questionType;
    private String noQuestion;
    private String knowAndSkill;
    private String gradingGuide;
    private String note;

    public Assessment() {
    }

    public Assessment(int aid, int syllabusID, String category, int type, int part, int weight, String completionCriteria, String duration, String clo, String questionType, String noQuestion, String knowAndSkill, String gradingGuide, String note) {
        this.aid = aid;
        this.syllabusID = syllabusID;
        this.category = category;
        this.type = type;
        this.part = part;
        this.weight = weight;
        this.completionCriteria = completionCriteria;
        this.duration = duration;
        this.clo = clo;
        this.questionType = questionType;
        this.noQuestion = noQuestion;
        this.knowAndSkill = knowAndSkill;
        this.gradingGuide = gradingGuide;
        this.note = note;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getCategory() {
        return category;
    }

    public int getAid() {
        return aid;
    }

    public void setAid(int aid) {
        this.aid = aid;
    }

    public int getSyllabusID() {
        return syllabusID;
    }

    public void setSyllabusID(int syllabusID) {
        this.syllabusID = syllabusID;
    }

    public void setType(int type) {
        this.type = type;
    }

    public int getType() {
        return type;
    }

    public String getNoQuestion() {
        return noQuestion;
    }

    public void setNoQuestion(String noQuestion) {
        this.noQuestion = noQuestion;
    }

    public int getPart() {
        return part;
    }

    public void setPart(int part) {
        this.part = part;
    }

    public int getWeight() {
        return weight;
    }

    public void setWeight(int weight) {
        this.weight = weight;
    }

    public String getCompletionCriteria() {
        return completionCriteria;
    }

    public void setCompletionCriteria(String completionCriteria) {
        this.completionCriteria = completionCriteria;
    }

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    public String getClo() {
        return clo;
    }

    public void setClo(String clo) {
        this.clo = clo;
    }

    public String getQuestionType() {
        return questionType;
    }

    public void setQuestionType(String questionType) {
        this.questionType = questionType;
    }

    public String getKnowAndSkill() {
        return knowAndSkill;
    }

    public void setKnowAndSkill(String knowAndSkill) {
        this.knowAndSkill = knowAndSkill;
    }

    public String getGradingGuide() {
        return gradingGuide;
    }

    public void setGradingGuide(String gradingGuide) {
        this.gradingGuide = gradingGuide;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    @Override
    public String toString() {
        return "Assessment{" + "aid=" + aid + ", syllabusID=" + syllabusID + ", category=" + category + ", type=" + type + ", part=" + part + ", weight=" + weight + ", completionCriteria=" + completionCriteria + ", duration=" + duration + ", clo=" + clo + ", questionType=" + questionType + ", noQuestion=" + noQuestion + ", knowAndSkill=" + knowAndSkill + ", gradingGuide=" + gradingGuide + ", note=" + note + '}';
    }

}
