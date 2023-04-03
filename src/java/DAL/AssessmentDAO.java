/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import common.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Assessment;

/**
 *
 * @author admin
 */
public class AssessmentDAO extends DBContext {

    public List<Assessment> getAssessmentBySyllabusID(int syllabusID) {
        List<Assessment> list = new ArrayList<>();

        try {
            String sql = "SELECT * FROM flm_web.assessment\n"
                    + "where syllabusID = ?;";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, syllabusID);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Assessment a = new Assessment();

                a.setAid(rs.getInt(1));
                a.setSyllabusID(rs.getInt(2));
                a.setCategory(rs.getString(3));
                a.setType(rs.getInt(4));
                a.setPart(rs.getInt(5));
                a.setWeight(rs.getInt(6));
                a.setCompletionCriteria(rs.getString(7));
                a.setDuration(rs.getString(8));
                a.setClo(rs.getString(9));
                a.setQuestionType(rs.getString(10));
                a.setNoQuestion(rs.getString(11));
                a.setKnowAndSkill(rs.getString(12));
                a.setGradingGuide(rs.getString(13));
                a.setNote(rs.getString(14));
                list.add(a);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public List<Assessment> getAllAssessmentsBySyllabusIDPaging(int syllabusID, int index) {
        List<Assessment> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM flm_web.assessment\n"
                    + "where syllabusID =?\n"
                    + "order by aid\n"
                    + "limit 3 offset ?;";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, syllabusID);
            st.setInt(2, (index - 1) * 3);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Assessment a = new Assessment();
                a.setAid(rs.getInt(1));
                a.setSyllabusID(rs.getInt(2));
                a.setCategory(rs.getString(3));
                a.setType(rs.getInt(4));
                a.setPart(rs.getInt(5));
                a.setWeight(rs.getInt(6));
                a.setCompletionCriteria(rs.getString(7));
                a.setDuration(rs.getString(8));
                a.setClo(rs.getString(9));
                a.setQuestionType(rs.getString(10));
                a.setNoQuestion(rs.getString(11));
                a.setKnowAndSkill(rs.getString(12));
                a.setGradingGuide(rs.getString(13));
                a.setNote(rs.getString(14));
                list.add(a);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Assessment> listByPage(List<Assessment> selist, int start, int end) {
        List<Assessment> list = new ArrayList<>();
        for (int i = start; i < end; i++) {
            list.add(selist.get(i));
        }
        return list;
    }

    public Assessment getAssessmentByAID(int aID) {
        try {
            String sql = "SELECT * FROM flm_web.assessment\n"
                    + "where aid =?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, aID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Assessment a = new Assessment();
                a.setAid(rs.getInt(1));
                a.setSyllabusID(rs.getInt(2));
                a.setCategory(rs.getString(3));
                a.setType(rs.getInt(4));
                a.setPart(rs.getInt(5));
                a.setWeight(rs.getInt(6));
                a.setCompletionCriteria(rs.getString(7));
                a.setDuration(rs.getString(8));
                a.setClo(rs.getString(9));
                a.setQuestionType(rs.getString(10));
                a.setNoQuestion(rs.getString(11));
                a.setKnowAndSkill(rs.getString(12));
                a.setGradingGuide(rs.getString(13));
                a.setNote(rs.getString(14));
                return a;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return null;
    }

    //CRUD
    public void deleteAssessment(int aid) {
        String sql = "DELETE FROM `flm_web`.`assessment`\n"
                + "WHERE aid =? ;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, aid);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void insertAssessment(int syllabusID, String cate, int type, int part, int weight,
            String completionCriteria, String duration,
            String CLO, String questionType, String noQuestion,
            String knowAndSkill, String grandingGuide, String note) {
        String sql = "INSERT INTO `flm_web`.`assessment`\n"
                + "(\n"
                + "`syllabusID`,\n"
                + "`categoti`,\n"
                + "`type`,\n"
                + "`part`,\n"
                + "`weight`,\n"
                + "`completionCriteria`,\n"
                + "`duration`,\n"
                + "`clo`,\n"
                + "`questionType`,\n"
                + "`noQuestion`,\n"
                + "`knowAndskill`,\n"
                + "`gradingGuide`,\n"
                + "`note`)\n"
                + "VALUES\n"
                + "(?,?,?,?,?,?,?,?,?,?,?,?,?);";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, syllabusID);
            st.setString(2, cate);
            st.setInt(3, type);
            st.setInt(4, part);
            st.setInt(5, weight);
            st.setString(6, completionCriteria);
            st.setString(7, duration);
            st.setString(8, CLO);
            st.setString(9, questionType);
            st.setString(10, noQuestion);
            st.setString(11, knowAndSkill);
            st.setString(12, grandingGuide);
            st.setString(13, note);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void editSession(Assessment a) {
        String sql = " UPDATE `flm_web`.`assessment`\n"
                + "SET\n"
                + "`syllabusID` = ?,\n"
                + "`categoti` = ?,\n"
                + "`type` = ?,\n"
                + "`part` = ?,\n"
                + "`weight` = ?,\n"
                + "`completionCriteria` = ?,\n"
                + "`duration` = ?,\n"
                + "`clo` = ?,\n"
                + "`questionType` = ?,\n"
                + "`noQuestion` = ?,\n"
                + "`knowAndskill` =?,\n"
                + "`gradingGuide` = ?,\n"
                + "`note` = ?\n"
                + "WHERE `aid` = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
//            st.setInt(1, q.getSyllabusID());
            st.setInt(1, a.getSyllabusID());
            st.setString(2, a.getCategory());
            st.setInt(3, a.getType());
            st.setInt(4, a.getPart());
            st.setInt(5, a.getWeight());
            st.setString(6, a.getCompletionCriteria());
            st.setString(7, a.getDuration());
            st.setString(8, a.getClo());
            st.setString(9, a.getQuestionType());
            st.setString(10, a.getNoQuestion());
            st.setString(11, a.getKnowAndSkill());
            st.setString(12, a.getGradingGuide());
            st.setString(13, a.getNote());
            st.setInt(14, a.getAid());

            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    //Filter
    public List<Assessment> searchSession(String txt, int syllabusID) {
        List<Assessment> list = new ArrayList<>();
        String sql = "SELECT * FROM flm_web.assessment\n"
                + "where aid = " + syllabusID + "\n"
                + "or categoti like '%" + txt + "%'";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Assessment a = new Assessment();
                a.setAid(rs.getInt(1));
                a.setSyllabusID(rs.getInt(2));
                a.setCategory(rs.getString(3));
                a.setType(rs.getInt(4));
                a.setPart(rs.getInt(5));
                a.setWeight(rs.getInt(6));
                a.setCompletionCriteria(rs.getString(7));
                a.setDuration(rs.getString(8));
                a.setClo(rs.getString(9));
                a.setQuestionType(rs.getString(10));
                a.setNoQuestion(rs.getString(11));
                a.setKnowAndSkill(rs.getString(12));
                a.setGradingGuide(rs.getString(13));
                a.setNote(rs.getString(14));
                list.add(a);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Assessment> sort(int syllabusID, String txtSort) {
        List<Assessment> list = new ArrayList<>();
        String sql = "SELECT * FROM flm_web.assessment\n"
                + "where syllabusID = ?\n"
                + "order by " + txtSort;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, syllabusID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Assessment a = new Assessment();
                a.setAid(rs.getInt(1));
                a.setSyllabusID(rs.getInt(2));
                a.setCategory(rs.getString(3));
                a.setType(rs.getInt(4));
                a.setPart(rs.getInt(5));
                a.setWeight(rs.getInt(6));
                a.setCompletionCriteria(rs.getString(7));
                a.setDuration(rs.getString(8));
                a.setClo(rs.getString(9));
                a.setQuestionType(rs.getString(10));
                a.setNoQuestion(rs.getString(11));
                a.setKnowAndSkill(rs.getString(12));
                a.setGradingGuide(rs.getString(13));
                a.setNote(rs.getString(14));
                list.add(a);
            }
        } catch (Exception e) {
        }

        return list;
    }

    public static void main(String[] args) {
        List<Assessment> l = new AssessmentDAO().getAssessmentBySyllabusID(1);
//        for (Assessment s : l) {
//            System.out.println(s.getAid());
//        }
        
    }

}
