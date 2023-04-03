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
import model.Session;

/**
 *
 * @author admin
 */
public class SessionDAO extends DBContext {

    public List<Session> getSessionBySyllabusID(int syllabusID) {
        List<Session> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM flm_web.session\n"
                    + "where syllabusID = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, syllabusID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Session s = new Session();
                s.setSid(rs.getInt(1));
                s.setSyllabusID(rs.getInt(2));
                s.setTopic(rs.getString(3));
                s.setLearningTeachingType(rs.getBoolean(4));
                s.setLo(rs.getString(5));
                s.setItu(rs.getString(6));
                s.setStudentMaterial(rs.getString(7));
                s.setDownload(rs.getString(8));
                s.setStudentTask(rs.getString(9));
                s.setUrls(rs.getString(10));
                s.setNo(rs.getInt(11));
                list.add(s);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public List<Session> getAllSession() {
        List<Session> list = new ArrayList<>();
        try {
            String sql = "SELECT `session`.`sid`,\n"
                    + "    `session`.`syllabusID`,\n"
                    + "    `session`.`topic`,\n"
                    + "    `session`.`learningTeachingType`,\n"
                    + "    `session`.`lo`,\n"
                    + "    `session`.`itu`,\n"
                    + "    `session`.`studentmaterial`,\n"
                    + "    `session`.`sDownload`,\n"
                    + "    `session`.`studentTask`,\n"
                    + "    `session`.`urls`,\n"
                    + "    `session`.`sNo`\n"
                    + "FROM `flm_web`.`session`;";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Session s = new Session();
                s.setSid(rs.getInt(1));
                s.setSyllabusID(rs.getInt(2));
                s.setTopic(rs.getString(3));
                s.setLearningTeachingType(rs.getBoolean(4));
                s.setLo(rs.getString(5));
                s.setItu(rs.getString(6));
                s.setStudentMaterial(rs.getString(7));
                s.setDownload(rs.getString(8));
                s.setStudentTask(rs.getString(9));
                s.setUrls(rs.getString(10));
                s.setNo(rs.getInt(11));
                list.add(s);

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Session> getAllSessionBySyllabusIDPaging(int syllabusID, int index) {
        List<Session> list = new ArrayList<>();
        try {
            String sql = "SELECT `session`.`sid`,\n"
                    + "    `session`.`syllabusID`,\n"
                    + "    `session`.`topic`,\n"
                    + "    `session`.`learningTeachingType`,\n"
                    + "    `session`.`lo`,\n"
                    + "    `session`.`itu`,\n"
                    + "    `session`.`studentmaterial`,\n"
                    + "    `session`.`sDownload`,\n"
                    + "    `session`.`studentTask`,\n"
                    + "    `session`.`urls`,\n"
                    + "    `session`.`sNo`\n"
                    + "FROM `flm_web`.`session`"
                    + "Where syllabusID = ? "
                    + "order by sid \n"
                    + "limit 10 offset ?;";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, syllabusID);
            st.setInt(2, (index - 1) * 10);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Session s = new Session();
                s.setSid(rs.getInt(1));
                s.setSyllabusID(rs.getInt(2));
                s.setTopic(rs.getString(3));
                s.setLearningTeachingType(rs.getBoolean(4));
                s.setLo(rs.getString(5));
                s.setItu(rs.getString(6));
                s.setStudentMaterial(rs.getString(7));
                s.setDownload(rs.getString(8));
                s.setStudentTask(rs.getString(9));
                s.setUrls(rs.getString(10));
                s.setNo(rs.getInt(11));
                list.add(s);

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public int getTotalSession() {
        try {
            String query = "select Count(*) from session;";
            PreparedStatement st = connection.prepareStatement(query);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public List<Session> getAllSessionPaging(int index) {
        List<Session> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM flm_web.session\n"
                    + "order by sid \n"
                    + "limit 10 offset ?;";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, (index - 1) * 10);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Session s = new Session();
                s.setSid(rs.getInt(1));
                s.setSyllabusID(rs.getInt(2));
                s.setTopic(rs.getString(3));
                s.setLearningTeachingType(rs.getBoolean(4));
                s.setLo(rs.getString(5));
                s.setItu(rs.getString(6));
                s.setStudentMaterial(rs.getString(7));
                s.setDownload(rs.getString(8));
                s.setStudentTask(rs.getString(9));
                s.setUrls(rs.getString(10));
                s.setNo(rs.getInt(11));
                list.add(s);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Session getSessionBySessionID(int sid) {
        try {
            String sql = "SELECT * FROM flm_web.session\n"
                    + "where sid = ?\n"
                    + "order by sNo asc;";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, sid);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Session s = new Session();
                s.setSid(rs.getInt(1));
                s.setSyllabusID(rs.getInt(2));
                s.setTopic(rs.getString(3));
                s.setLearningTeachingType(rs.getBoolean(4));
                s.setLo(rs.getString(5));
                s.setItu(rs.getString(6));
                s.setStudentMaterial(rs.getString(7));
                s.setDownload(rs.getString(8));
                s.setStudentTask(rs.getString(9));
                s.setUrls(rs.getString(10));
                s.setNo(rs.getInt(11));
                return s;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return null;
    }

    public void editSession(Session q) {
        String sql = " UPDATE `flm_web`.`session`\n"
                + "SET\n"
                + "`topic` =?,\n"
                + "`learningTeachingType` = ?,\n"
                + "`lo` = ?,\n"
                + "`itu` = ?,\n"
                + "`studentmaterial` = ?,\n"
                + "`sDownload` = ?,\n"
                + "`studentTask` = ?,\n"
                + "`urls` = ?,\n"
                + "`sNo` = ?\n"
                + "WHERE `sid` = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
//            st.setInt(1, q.getSyllabusID());
            st.setString(1, q.getTopic());
            st.setBoolean(2, q.isLearningTeachingType());
            st.setString(3, q.getLo());
            st.setString(4, q.getItu());
            st.setString(5, q.getStudentMaterial());
            st.setString(6, q.getDownload());
            st.setString(7, q.getStudentTask());
            st.setString(8, q.getUrls());
            st.setInt(9, q.getNo());
            st.setInt(10, q.getSid());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void deleteSession(int sid) {
        String sql = "DELETE FROM `flm_web`.`session`\n"
                + "WHERE `sid` = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, sid);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void insertSession(String topic, boolean learningTeachingType, String lo,
            String itu, String studentmaterial, String studentTask, int syllabusID, int sNo, String sDownload, String url) {
        String sql = "INSERT INTO `flm_web`.`session`\n"
                + "("
                + "`topic`,\n"
                + "`learningTeachingType`,\n"
                + "`lo`,\n"
                + "`itu`,\n"
                + "`studentmaterial`,\n"
                + "`sDownload`,\n"
                + "`studentTask`,\n"
                + "`urls`,\n"
                + "`syllabusID`,\n"
                + "`sNo`)\n "
                + "VALUES\n"
                + "(?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, topic);
            st.setBoolean(2, learningTeachingType);
            st.setString(3, lo);
            st.setString(4, itu);
            st.setString(5, studentmaterial);
            st.setString(6, sDownload);
            st.setString(7, studentTask);
            st.setString(8, url);
            st.setInt(9, syllabusID);
            st.setInt(10, sNo);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public List<Session> listByPage(List<Session> selist, int start, int end) {
        List<Session> list = new ArrayList<>();
        for (int i = start; i < end; i++) {
            list.add(selist.get(i));
        }
        return list;
    }

    public List<Session> sortAscBySid(int syllabusID) {
        List<Session> list = new ArrayList<>();
        String sql = "Select * from session\n"
                + "where syllabusID = ?\n"
                + "order by sid asc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, syllabusID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Session s = new Session();
                s.setSid(rs.getInt(1));
                s.setSyllabusID(rs.getInt(2));
                s.setTopic(rs.getString(3));
                s.setLearningTeachingType(rs.getBoolean(4));
                s.setLo(rs.getString(5));
                s.setItu(rs.getString(6));
                s.setStudentMaterial(rs.getString(7));
                s.setDownload(rs.getString(8));
                s.setStudentTask(rs.getString(9));
                s.setUrls(rs.getString(10));
                s.setNo(rs.getInt(11));
                list.add(s);
            }
        } catch (Exception e) {
        }

        return list;
    }

    public List<Session> sortAscByTopic(int syllabusID) {
        List<Session> list = new ArrayList<>();
        String sql = "Select * from session\n"
                + "where syllabusID = ?\n"
                + "order by topic asc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, syllabusID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Session s = new Session();
                s.setSid(rs.getInt(1));
                s.setSyllabusID(rs.getInt(2));
                s.setTopic(rs.getString(3));
                s.setLearningTeachingType(rs.getBoolean(4));
                s.setLo(rs.getString(5));
                s.setItu(rs.getString(6));
                s.setStudentMaterial(rs.getString(7));
                s.setDownload(rs.getString(8));
                s.setStudentTask(rs.getString(9));
                s.setUrls(rs.getString(10));
                s.setNo(rs.getInt(11));
                list.add(s);
            }
        } catch (Exception e) {
        }

        return list;
    }

    public List<Session> sortAscByType(int syllabusID) {
        List<Session> list = new ArrayList<>();
        String sql = "Select * from session\n"
                + "where syllabusID = ?\n"
                + "order by learningTeachingType asc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, syllabusID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Session s = new Session();
                s.setSid(rs.getInt(1));
                s.setSyllabusID(rs.getInt(2));
                s.setTopic(rs.getString(3));
                s.setLearningTeachingType(rs.getBoolean(4));
                s.setLo(rs.getString(5));
                s.setItu(rs.getString(6));
                s.setStudentMaterial(rs.getString(7));
                s.setDownload(rs.getString(8));
                s.setStudentTask(rs.getString(9));
                s.setUrls(rs.getString(10));
                s.setNo(rs.getInt(11));
                list.add(s);
            }
        } catch (Exception e) {
        }

        return list;
    }

    public List<Session> sortDescBySid(int syllabusID) {
        List<Session> list = new ArrayList<>();
        String sql = "Select * from session\n"
                + "where syllabusID = ?\n"
                + "order by sid desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, syllabusID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Session s = new Session();
                s.setSid(rs.getInt(1));
                s.setSyllabusID(rs.getInt(2));
                s.setTopic(rs.getString(3));
                s.setLearningTeachingType(rs.getBoolean(4));
                s.setLo(rs.getString(5));
                s.setItu(rs.getString(6));
                s.setStudentMaterial(rs.getString(7));
                s.setDownload(rs.getString(8));
                s.setStudentTask(rs.getString(9));
                s.setUrls(rs.getString(10));
                s.setNo(rs.getInt(11));
                list.add(s);
            }
        } catch (Exception e) {
        }

        return list;
    }

    public List<Session> sortDescByTopic(int syllabusID) {
        List<Session> list = new ArrayList<>();
        String sql = "Select * from session\n"
                + "where syllabusID = ?\n"
                + "order by topic desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, syllabusID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Session s = new Session();
                s.setSid(rs.getInt(1));
                s.setSyllabusID(rs.getInt(2));
                s.setTopic(rs.getString(3));
                s.setLearningTeachingType(rs.getBoolean(4));
                s.setLo(rs.getString(5));
                s.setItu(rs.getString(6));
                s.setStudentMaterial(rs.getString(7));
                s.setDownload(rs.getString(8));
                s.setStudentTask(rs.getString(9));
                s.setUrls(rs.getString(10));
                s.setNo(rs.getInt(11));
                list.add(s);
            }
        } catch (Exception e) {
        }

        return list;
    }

    public List<Session> sortDescByType(int syllabusID) {
        List<Session> list = new ArrayList<>();
        String sql = "Select * from session\n"
                + "where syllabusID = ?\n"
                + "order by learningTeachingType desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, syllabusID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Session s = new Session();
                s.setSid(rs.getInt(1));
                s.setSyllabusID(rs.getInt(2));
                s.setTopic(rs.getString(3));
                s.setLearningTeachingType(rs.getBoolean(4));
                s.setLo(rs.getString(5));
                s.setItu(rs.getString(6));
                s.setStudentMaterial(rs.getString(7));
                s.setDownload(rs.getString(8));
                s.setStudentTask(rs.getString(9));
                s.setUrls(rs.getString(10));
                s.setNo(rs.getInt(11));
                list.add(s);
            }
        } catch (Exception e) {
        }

        return list;
    }

    public boolean checkExistSNo(int syllabusID, int sNo) {
        String sql = "select *from session\n"
                + "                where syllabusId=? and sNo=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, syllabusID);
            st.setInt(2, sNo);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (Exception e) {
        }
        return false;
    }
//check User
//    public boolean existedUser(String username) {
//        String sql = "select * from Admin where Username=? ";
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//            st.setString(1, username);
//            ResultSet rs = st.executeQuery();
//            if (rs.next()) {
//                return true;
//            }
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//        return false;
//    }

    public List<Session> searchSession(String txt, int syllabusID) {
        List<Session> list = new ArrayList<>();
        String sql = "SELECT * FROM flm_web.session\n"
                + "where syllabusID =" + syllabusID + " and\n"
                + "topic like  '%" + txt + "%'or \n"
                + "studentmaterial like '%" + txt + "%' or\n"
                + "studentTask like '%" + txt + "%'";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Session s = new Session();
                s.setSid(rs.getInt(1));
                s.setSyllabusID(rs.getInt(2));
                s.setTopic(rs.getString(3));
                s.setLearningTeachingType(rs.getBoolean(4));
                s.setLo(rs.getString(5));
                s.setItu(rs.getString(6));
                s.setStudentMaterial(rs.getString(7));
                s.setDownload(rs.getString(8));
                s.setStudentTask(rs.getString(9));
                s.setUrls(rs.getString(10));
                s.setNo(rs.getInt(11));
                list.add(s);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public static void main(String[] args) {
        List<Session> l = new SessionDAO().getAllSessionBySyllabusIDPaging(1, 1);
        for (Session s : l) {
            System.out.println(s.getNo());
        }
// boolean check = new SessionDAO().checkExistSNo(1, 70);
//        System.out.println(check);
    }
}
