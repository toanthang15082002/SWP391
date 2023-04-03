/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import com.mysql.cj.xdevapi.Result;
import common.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.Question;
import model.Role;
import model.Syllabus;

/**
 *
 * @author ADMIN
 */
public class QuestionDAO extends DBContext {

    public List<Question> getQuestionOfSyllabus(int syllabusID) {
        List<Question> list = new ArrayList<>();
        try {
            String sql = "SELECT s.sNo ,q.qid, q.nameQuestion, q.detail\n"
                    + "FROM syllabus sy inner join session s on sy.syllabusID = s.syllabusID \n"
                    + "	inner join question q on s.sid = q.sid\n"
                    + "    where sy.syllabusID = ?\n"
                    + "    order by s.sNo asc;";

            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, syllabusID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Question q = new Question();
                q.setQid(rs.getInt(2));
                q.setSid(rs.getInt(1));
                q.setNameQuestion(rs.getString(3));
                q.setDetail(rs.getString(4));
                list.add(q);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Question> getAllQuestion() {
        List<Question> list = new ArrayList<>();
        try {
            String sql = "SELECT `question`.`qid`,\n"
                    + "    `question`.`sid`,\n"
                    + "    `question`.`nameQuestion`,\n"
                    + "    `question`.`detail`\n"
                    + "FROM `flm_web`.`question`;";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Question q = new Question();
                q.setQid(rs.getInt(1));
                q.setSid(rs.getInt(2));
                q.setNameQuestion(rs.getString(3));
                q.setDetail(rs.getString(4));
                list.add(q);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Question> getQuestionbySessionID(int sessionID) {
        List<Question> list = new ArrayList<>();
        try {
            String sql = "SELECT `question`.`qid`,\n"
                    + "    `question`.`sid`,\n"
                    + "    `question`.`nameQuestion`,\n"
                    + "    `question`.`detail`\n"
                    + "FROM `flm_web`.`question`\n"
                    + "where sid = ?;";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, sessionID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Question q = new Question();
                q.setQid(rs.getInt(1));
                q.setSid(rs.getInt(2));
                q.setNameQuestion(rs.getString(3));
                q.setDetail(rs.getString(4));
                list.add(q);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Question> getAllQuestionBySessionIDPaging(int sessionID, int index) {
        List<Question> list = new ArrayList<>();
        try {
            String sql = "SELECT `question`.`qid`,\n"
                    + "    `question`.`sid`,\n"
                    + "    `question`.`nameQuestion`,\n"
                    + "    `question`.`detail`\n"
                    + "FROM `flm_web`.`question`\n"
                    + "where sid = ?"
                    + "order by qid \n"
                    + "limit 1 offset ?;";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, sessionID);
            st.setInt(2, (index - 1) * 2);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Question q = new Question();
                q.setQid(rs.getInt(1));
                q.setSid(rs.getInt(2));
                q.setNameQuestion(rs.getString(3));
                q.setDetail(rs.getString(4));
                list.add(q);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public int getTotalQuestion() {
        try {
            String sql = "select Count(*) from question;";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public Question getOneQuestionbySessionID(int qid) {
        try {
            String sql = "SELECT `question`.`qid`,\n"
                    + "    `question`.`sid`,\n"
                    + "    `question`.`nameQuestion`,\n"
                    + "    `question`.`detail`\n"
                    + "FROM `flm_web`.`question`\n"
                    + "where qid = ?;";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, qid);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Question q = new Question();
                q.setQid(rs.getInt(1));
                q.setSid(rs.getInt(2));
                q.setNameQuestion(rs.getString(3));
                q.setDetail(rs.getString(4));
                return q;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void insertQuestion(int sid, String nameQuestion, String detail) {
        String sql = "INSERT INTO `flm_web`.`question`\n"
                + "(\n"
                + "`sid`,\n"
                + "`nameQuestion`,\n"
                + "`detail`)\n"
                + "VALUES\n"
                + "(?,?,?);";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, sid);
            st.setString(2, nameQuestion);
            st.setString(3, detail);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public List<Question> searchQuestion(String txt, int sid) {
        List<Question> list = new ArrayList<>();
        String sql = "select * from  question q inner join session s on q.sid = s.sid\n"
                + "where q.sid = " + sid + " and q.nameQuestion like '%" + txt + "%'";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Question q = new Question();
                q.setQid(rs.getInt(1));
                q.setSid(rs.getInt(2));
                q.setNameQuestion(rs.getString(3));
                q.setDetail(rs.getString(4));
                list.add(q);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void editQuestion(Question q) {
        String sql = "UPDATE `flm_web`.`question`\n"
                + "SET\n"
                + "`nameQuestion` = ?,\n"
                + "`detail` =? \n"
                + "WHERE `qid` = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, q.getNameQuestion());
            st.setString(2, q.getDetail());
            st.setInt(3, q.getQid());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void deleteQuestion(int qid) {
        String sql = "DELETE FROM `flm_web`.`question`\n"
                + "WHERE `qid` = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, qid);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public static void main(String[] args) {
        QuestionDAO dao = new QuestionDAO();
        System.out.println(dao.searchQuestion("1", 1));
    }
}
