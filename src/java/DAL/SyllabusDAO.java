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
import model.DecisionNo;
import model.Syllabus;

/**
 *
 * @author admin
 */
public class SyllabusDAO extends DBContext {

    public List<Syllabus> getAllSyllabus(int index, int num) {
        List<Syllabus> list = new ArrayList<>();
        try {
            String sql = "SELECT sy.syllabusID, sy.subjectCode, sy.syllabusName,sy.noCredit, sy.degreeLevel,sy.timeAllocation, sy.prerequisite,sy.`description`,\n"
                    + "                     sy.studentTask, sy.tool, sy.scoringScale,sy.isApproved,sy.isActive, sy.note, sy.minAcgMarkToPass,\n"
                    + "                     sy.accountID ,acc.firstname, DATE_FORMAT(sy.approvedDate,\"%d-%m-%Y\") as 'syApprovedDate',\n"
                    + "                     d.decisionID,d.decisionNo, d.decisionName,DATE_FORMAT( d.approveDate,\"%d-%m-%Y\") as 'deApprovedDate'\n"
                    + "                   ,d.note, DATE_FORMAT(d.createDate,\"%d-%m-%Y\") as 'deCeateDate' ,\n"
                    + "                    	 d.fileName \n"
                    + "                        FROM syllabus sy left join decision d on sy.decisionNo = d.decisionID\n"
                    + "                    inner join `account` acc on acc.accountID =sy.accountID\n"
                    + "                    Order by sy.syllabusID\n"
                    + "                    LiMIT 6 offset ?";
            PreparedStatement st = connection.prepareCall(sql);
            st.setInt(1, (index - 1) * num);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                DecisionNo decisionNo = new DecisionNo(rs.getInt(19), rs.getString(20), rs.getString(21), rs.getString(22), rs.getString(23), rs.getString(24), rs.getString(25));
                Syllabus sy = new Syllabus();
                sy.setSyllabusID(rs.getInt(1));
                sy.setSubjectCode(rs.getString(2));
                sy.setSyllabusName(rs.getString(3));
                sy.setNoCredit(rs.getInt(4));
                sy.setDegreeLevel(rs.getString(5));
                sy.setTimeAllocation(rs.getString(6));
                sy.setPreRequisite(rs.getString(7));
                sy.setDescription(rs.getString(8));
                sy.setStudentTasks(rs.getString(9));
                sy.setTool(rs.getString(10));
                sy.setScoringScale(rs.getInt(11));
                sy.setIsApproved(rs.getBoolean(12));
                sy.setIsActive(rs.getBoolean(13));
                sy.setNote(rs.getString(14));
                sy.setMinAvgMarkToPass(rs.getInt(15));
                sy.setAccountID(rs.getInt(16));
                sy.setAccountName(rs.getString(17));
                sy.setApprovedDate(rs.getString(18));
                sy.setDecisionNo(decisionNo);
                list.add(sy);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Syllabus> getAllSyllabusListing(int index, int num) {
        List<Syllabus> list = new ArrayList<>();
        try {
            String sql = "SELECT sy.syllabusID, sy.subjectCode, sy.syllabusName,sy.noCredit, sy.degreeLevel,sy.timeAllocation, sy.prerequisite,sy.`description`,\n"
                    + "                     sy.studentTask, sy.tool, sy.scoringScale,sy.isApproved,sy.isActive, sy.note, sy.minAcgMarkToPass,\n"
                    + "                     sy.accountID , DATE_FORMAT(sy.approvedDate,\"%d-%m-%Y\") as 'syApprovedDate',\n"
                    + "                     d.decisionID,d.decisionNo, d.decisionName,DATE_FORMAT( d.approveDate,\"%d-%m-%Y\") as 'deApprovedDate'\n"
                    + "                   ,d.note, DATE_FORMAT(d.createDate,\"%d-%m-%Y\") as 'deCeateDate' ,\n"
                    + "                    	 d.fileName \n"
                    + "                        FROM syllabus sy left join decision d on sy.decisionNo = d.decisionID\n"
                    + "                    Order by sy.syllabusID\n"
                    + "                    LiMIT 6 offset ?";
            PreparedStatement st = connection.prepareCall(sql);
            st.setInt(1, (index - 1) * num);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                DecisionNo decisionNo = new DecisionNo(rs.getInt(18), rs.getString(19), rs.getString(20),
                        rs.getString(21), rs.getString(22), rs.getString(23), rs.getString(24));
                Syllabus sy = new Syllabus();
                sy.setSyllabusID(rs.getInt(1));
                sy.setSubjectCode(rs.getString(2));
                sy.setSyllabusName(rs.getString(3));
                sy.setNoCredit(rs.getInt(4));
                sy.setDegreeLevel(rs.getString(5));
                sy.setTimeAllocation(rs.getString(6));
                sy.setPreRequisite(rs.getString(7));
                sy.setDescription(rs.getString(8));
                sy.setStudentTasks(rs.getString(9));
                sy.setTool(rs.getString(10));
                sy.setScoringScale(rs.getInt(11));
                sy.setIsApproved(rs.getBoolean(12));
                sy.setIsActive(rs.getBoolean(13));
                sy.setNote(rs.getString(14));
                sy.setMinAvgMarkToPass(rs.getInt(15));
                sy.setAccountID(rs.getInt(16));
                sy.setApprovedDate(rs.getString(17));
                sy.setDecisionNo(decisionNo);
                list.add(sy);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public int getTotalSyllabus() {
        String sql = "SELECT Count(*) FROM flm_web.syllabus";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public int getTotalSyllabusByAcountID(int accountID) {
        String sql = "SELECT Count(*)\n"
                + "FROM syllabus sy left join decision d on sy.decisionNo = d.decisionID\n"
                + " inner join `account` acc on acc.accountID =sy.accountID\n"
                + "where sy.accountID = " + accountID;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public List<Syllabus> pagingSyllabus(int index, int num) {
        List<Syllabus> list = new ArrayList<>();
        try {
            String sql = "SELECT sy.syllabusID, sy.subjectCode, sy.syllabusName,sy.noCredit, sy.degreeLevel,sy.timeAllocation, sy.prerequisite,sy.`description`,\n"
                    + " sy.studentTask, sy.tool, sy.scoringScale,sy.isApproved,sy.isActive, sy.note, sy.minAcgMarkToPass, sy.accountID, DATE_FORMAT(sy.approvedDate,\"%d-%m-%Y\") as 'syApprovedDate',\n"
                    + " d.decisionID,d.decisionNo, d.decisionName,DATE_FORMAT( d.approveDate,\"%d-%m-%Y\") as 'deApprovedDate',d.note, DATE_FORMAT(d.createDate,\"%d-%m-%Y\") as 'deCeateDate' ,\n"
                    + " d.fileName  FROM syllabus sy left join decision d on sy.decisionNo = d.decisionID"
                    + "order by sy.syllabusID\n"
                    + "LiMIT 6 offset ?";
            PreparedStatement st = connection.prepareCall(sql);
            st.setInt(1, (index - 1) * num);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                DecisionNo decisionNo = new DecisionNo(rs.getInt(18), rs.getString(19), rs.getString(20), rs.getString(21), rs.getString(22), rs.getString(23), rs.getString(24));
                Syllabus sy = new Syllabus();
                sy.setSyllabusID(rs.getInt(1));
                sy.setSubjectCode(rs.getString(2));
                sy.setSyllabusName(rs.getString(3));
                sy.setNoCredit(rs.getInt(4));
                sy.setDegreeLevel(rs.getString(5));
                sy.setTimeAllocation(rs.getString(6));
                sy.setPreRequisite(rs.getString(7));
                sy.setDescription(rs.getString(8));
                sy.setStudentTasks(rs.getString(9));
                sy.setTool(rs.getString(10));
                sy.setScoringScale(rs.getInt(11));
                sy.setIsApproved(rs.getBoolean(12));
                sy.setIsActive(rs.getBoolean(13));
                sy.setNote(rs.getString(14));
                sy.setMinAvgMarkToPass(rs.getInt(15));
                sy.setAccountID(rs.getInt(16));
                sy.setApprovedDate(rs.getString(17));
                sy.setDecisionNo(decisionNo);
                list.add(sy);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Syllabus getASyllabus(int syllabusID) {
        try {
            String sql = "SELECT sy.syllabusID, sy.subjectCode, sy.syllabusName,sy.noCredit, sy.degreeLevel,sy.timeAllocation, sy.prerequisite,sy.`description`,\n"
                    + "                     sy.studentTask, sy.tool, sy.scoringScale,sy.isApproved,sy.isActive, sy.note, sy.minAcgMarkToPass,\n"
                    + "                    sy.accountID , DATE_FORMAT(sy.approvedDate,\"%d-%m-%Y\") as 'syApprovedDate',\n"
                    + "                     d.decisionID,d.decisionNo, d.decisionName,DATE_FORMAT( d.approveDate,\"%d-%m-%Y\") as 'deApprovedDate'\n"
                    + "                    ,d.note, DATE_FORMAT(d.createDate,\"%d-%m-%Y\") as 'deCeateDate' ,\n"
                    + "                    d.fileName \n"
                    + "                     FROM syllabus sy left join decision d on sy.decisionNo = d.decisionID\n"
                    + "                     Where sy.syllabusID = ?";
            PreparedStatement st = connection.prepareCall(sql);
            st.setInt(1, syllabusID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                DecisionNo decisionNo = new DecisionNo(rs.getInt(18), rs.getString(19), rs.getString(20),
                        rs.getString(21), rs.getString(22), rs.getString(23), rs.getString(24));
                Syllabus sy = new Syllabus();
                sy.setSyllabusID(rs.getInt(1));
                sy.setSubjectCode(rs.getString(2));
                sy.setSyllabusName(rs.getString(3));
                sy.setNoCredit(rs.getInt(4));
                sy.setDegreeLevel(rs.getString(5));
                sy.setTimeAllocation(rs.getString(6));
                sy.setPreRequisite(rs.getString(7));
                sy.setDescription(rs.getString(8));
                sy.setStudentTasks(rs.getString(9));
                sy.setTool(rs.getString(10));
                sy.setScoringScale(rs.getInt(11));
                sy.setIsApproved(rs.getBoolean(12));
                sy.setIsActive(rs.getBoolean(13));
                sy.setNote(rs.getString(14));
                sy.setMinAvgMarkToPass(rs.getInt(15));
                sy.setAccountID(rs.getInt(16));
                sy.setApprovedDate(rs.getString(17));
                sy.setDecisionNo(decisionNo);
                return sy;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Syllabus> searchPagingSyllabus(String text, int index, int num, int accountID) {
        List<Syllabus> list = new ArrayList<>();

        try {
            String sql = "SELECT sy.syllabusID, sy.subjectCode, sy.syllabusName,sy.noCredit, sy.degreeLevel,sy.timeAllocation, sy.prerequisite,sy.`description`,\n"
                    + "                                sy.studentTask, sy.tool, sy.scoringScale,sy.isApproved,sy.isActive, sy.note, sy.minAcgMarkToPass,\n"
                    + "                 sy.accountID ,acc.firstname, DATE_FORMAT(sy.approvedDate,\"%d-%m-%Y\") as 'syApprovedDate',\n"
                    + "                d.decisionID,d.decisionNo, d.decisionName,DATE_FORMAT( d.approveDate,\"%d-%m-%Y\") as 'deApprovedDate'\n"
                    + "                        ,d.note, DATE_FORMAT(d.createDate,\"%d-%m-%Y\") as 'deCeateDate' ,\n"
                    + "                    	 d.fileName \n"
                    + "                FROM syllabus sy left join decision d on sy.decisionNo = d.decisionID\n"
                    + "                   inner join `account` acc on acc.accountID =sy.accountID\n"
                    + "                    where  sy.accountID = ? and sy.subjectCode like	'%" + text + "%'  or sy.syllabusName like'%" + text + "%'\n"
                    + "                   Order by sy.syllabusID\n"
                    + "                     LiMIT 6 offset ?";
            PreparedStatement st = connection.prepareCall(sql);
            st.setInt(1, accountID);
            st.setInt(2, (index - 1) * num);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                DecisionNo decisionNo = new DecisionNo(rs.getInt(19), rs.getString(20), rs.getString(21), rs.getString(22), rs.getString(23), rs.getString(24), rs.getString(25));
                Syllabus sy = new Syllabus();
                sy.setSyllabusID(rs.getInt(1));
                sy.setSubjectCode(rs.getString(2));
                sy.setSyllabusName(rs.getString(3));
                sy.setNoCredit(rs.getInt(4));
                sy.setDegreeLevel(rs.getString(5));
                sy.setTimeAllocation(rs.getString(6));
                sy.setPreRequisite(rs.getString(7));
                sy.setDescription(rs.getString(8));
                sy.setStudentTasks(rs.getString(9));
                sy.setTool(rs.getString(10));
                sy.setScoringScale(rs.getInt(11));
                sy.setIsApproved(rs.getBoolean(12));
                sy.setIsActive(rs.getBoolean(13));
                sy.setNote(rs.getString(14));
                sy.setMinAvgMarkToPass(rs.getInt(15));
                sy.setAccountID(rs.getInt(16));
                sy.setAccountName(rs.getString(17));
                sy.setApprovedDate(rs.getString(18));
                sy.setDecisionNo(decisionNo);
                list.add(sy);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Syllabus> searchPagingSyllabusListing(String text, int index, int num) {
        List<Syllabus> list = new ArrayList<>();

        try {
            String sql = " SELECT sy.syllabusID, sy.subjectCode, sy.syllabusName,sy.noCredit, sy.degreeLevel,sy.timeAllocation, sy.prerequisite,sy.`description`,\n"
                    + "  sy.studentTask, sy.tool, sy.scoringScale,sy.isApproved,sy.isActive, sy.note, sy.minAcgMarkToPass,\n"
                    + "  sy.accountID , DATE_FORMAT(sy.approvedDate,\"%d-%m-%Y\") as 'syApprovedDate',\n"
                    + "  d.decisionID,d.decisionNo, d.decisionName,DATE_FORMAT( d.approveDate,\"%d-%m-%Y\") as 'deApprovedDate'\n"
                    + "  ,d.note, DATE_FORMAT(d.createDate,\"%d-%m-%Y\") as 'deCeateDate' ,\n"
                    + "  d.fileName \n"
                    + "  FROM syllabus sy left join decision d on sy.decisionNo = d.decisionID\n"
                    + "   where  sy.subjectCode like	'%" + text + "%'  or sy.syllabusName like '%" + text + "%' \n"
                    + "   Order by sy.syllabusID\n"
                    + "   LiMIT 6 offset ?";
            PreparedStatement st = connection.prepareCall(sql);
            st.setInt(1, (index - 1) * num);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                DecisionNo decisionNo = new DecisionNo(rs.getInt(18), rs.getString(19), rs.getString(20),
                        rs.getString(21), rs.getString(22), rs.getString(23), rs.getString(24));
                Syllabus sy = new Syllabus();
                sy.setSyllabusID(rs.getInt(1));
                sy.setSubjectCode(rs.getString(2));
                sy.setSyllabusName(rs.getString(3));
                sy.setNoCredit(rs.getInt(4));
                sy.setDegreeLevel(rs.getString(5));
                sy.setTimeAllocation(rs.getString(6));
                sy.setPreRequisite(rs.getString(7));
                sy.setDescription(rs.getString(8));
                sy.setStudentTasks(rs.getString(9));
                sy.setTool(rs.getString(10));
                sy.setScoringScale(rs.getInt(11));
                sy.setIsApproved(rs.getBoolean(12));
                sy.setIsActive(rs.getBoolean(13));
                sy.setNote(rs.getString(14));
                sy.setMinAvgMarkToPass(rs.getInt(15));
                sy.setAccountID(rs.getInt(16));
                sy.setApprovedDate(rs.getString(17));
                sy.setDecisionNo(decisionNo);
                list.add(sy);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Syllabus> getAllSyllabusByAccountID(int index, int num, int accountID) {
        List<Syllabus> list = new ArrayList<>();
        try {
            String sql = "SELECT sy.syllabusID, sy.subjectCode, sy.syllabusName,sy.noCredit, sy.degreeLevel,sy.timeAllocation, sy.prerequisite,sy.`description`,\n"
                    + "                     sy.studentTask, sy.tool, sy.scoringScale,sy.isApproved,sy.isActive, sy.note, sy.minAcgMarkToPass,\n"
                    + "                     sy.accountID ,acc.firstname, DATE_FORMAT(sy.approvedDate,\"%d-%m-%Y\") as 'syApprovedDate',\n"
                    + "                     d.decisionID,d.decisionNo, d.decisionName,DATE_FORMAT( d.approveDate,\"%d-%m-%Y\") as 'deApprovedDate'\n"
                    + "                   ,d.note, DATE_FORMAT(d.createDate,\"%d-%m-%Y\") as 'deCeateDate' ,\n"
                    + "                    	 d.fileName \n"
                    + "                        FROM syllabus sy left join decision d on sy.decisionNo = d.decisionID\n"
                    + "                    inner join `account` acc on acc.accountID =sy.accountID\n"
                    + " where sy.accountID = ?"
                    + "                    Order by sy.syllabusID\n"
                    + "                    LiMIT 6 offset ?";
            PreparedStatement st = connection.prepareCall(sql);
            st.setInt(2, (index - 1) * num);
            st.setInt(1, accountID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                DecisionNo decisionNo = new DecisionNo(rs.getInt(19), rs.getString(20), rs.getString(21), rs.getString(22), rs.getString(23), rs.getString(24), rs.getString(25));
                Syllabus sy = new Syllabus();
                sy.setSyllabusID(rs.getInt(1));
                sy.setSubjectCode(rs.getString(2));
                sy.setSyllabusName(rs.getString(3));
                sy.setNoCredit(rs.getInt(4));
                sy.setDegreeLevel(rs.getString(5));
                sy.setTimeAllocation(rs.getString(6));
                sy.setPreRequisite(rs.getString(7));
                sy.setDescription(rs.getString(8));
                sy.setStudentTasks(rs.getString(9));
                sy.setTool(rs.getString(10));
                sy.setScoringScale(rs.getInt(11));
                sy.setIsApproved(rs.getBoolean(12));
                sy.setIsActive(rs.getBoolean(13));
                sy.setNote(rs.getString(14));
                sy.setMinAvgMarkToPass(rs.getInt(15));
                sy.setAccountID(rs.getInt(16));
                sy.setAccountName(rs.getString(17));
                sy.setApprovedDate(rs.getString(18));
                sy.setDecisionNo(decisionNo);
                list.add(sy);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Syllabus> getAllSyllabusByAccID(int accountID) {
        List<Syllabus> list = new ArrayList<>();
        try {
            String sql = "SELECT sy.syllabusID, sy.subjectCode, sy.syllabusName,sy.noCredit, sy.degreeLevel,sy.timeAllocation, sy.prerequisite,sy.`description`,\n"
                    + "                     sy.studentTask, sy.tool, sy.scoringScale,sy.isApproved,sy.isActive, sy.note, sy.minAcgMarkToPass,\n"
                    + "                     sy.accountID ,acc.firstname, DATE_FORMAT(sy.approvedDate,\"%d-%m-%Y\") as 'syApprovedDate',\n"
                    + "                     d.decisionID,d.decisionNo, d.decisionName,DATE_FORMAT( d.approveDate,\"%d-%m-%Y\") as 'deApprovedDate'\n"
                    + "                   ,d.note, DATE_FORMAT(d.createDate,\"%d-%m-%Y\") as 'deCeateDate' ,\n"
                    + "                    	 d.fileName \n"
                    + "                        FROM syllabus sy left join decision d on sy.decisionNo = d.decisionID\n"
                    + "                    inner join `account` acc on acc.accountID =sy.accountID\n"
                    + " where sy.accountID = ?"
                    + "                    Order by sy.syllabusID\n";
            PreparedStatement st = connection.prepareCall(sql);
            st.setInt(1, accountID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                DecisionNo decisionNo = new DecisionNo(rs.getInt(19), rs.getString(20), rs.getString(21), rs.getString(22), rs.getString(23), rs.getString(24), rs.getString(25));
                Syllabus sy = new Syllabus();
                sy.setSyllabusID(rs.getInt(1));
                sy.setSubjectCode(rs.getString(2));
                sy.setSyllabusName(rs.getString(3));
                sy.setNoCredit(rs.getInt(4));
                sy.setDegreeLevel(rs.getString(5));
                sy.setTimeAllocation(rs.getString(6));
                sy.setPreRequisite(rs.getString(7));
                sy.setDescription(rs.getString(8));
                sy.setStudentTasks(rs.getString(9));
                sy.setTool(rs.getString(10));
                sy.setScoringScale(rs.getInt(11));
                sy.setIsApproved(rs.getBoolean(12));
                sy.setIsActive(rs.getBoolean(13));
                sy.setNote(rs.getString(14));
                sy.setMinAvgMarkToPass(rs.getInt(15));
                sy.setAccountID(rs.getInt(16));
                sy.setAccountName(rs.getString(17));
                sy.setApprovedDate(rs.getString(18));
                sy.setDecisionNo(decisionNo);
                list.add(sy);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Syllabus> searchSyllabus(String text) {
        List<Syllabus> list = new ArrayList<>();
        try {
            String sql = "SELECT sy.syllabusID, sy.subjectCode, sy.syllabusName,sy.noCredit, sy.degreeLevel,sy.timeAllocation, sy.prerequisite,sy.`description`,\n"
                    + "	 sy.studentTask, sy.tool, sy.scoringScale,sy.isApproved,sy.isActive, sy.note, sy.minAcgMarkToPass,"
                    + " sy.accountID , DATE_FORMAT(sy.approvedDate,\"%d-%m-%Y\") as 'syApprovedDate',\n"
                    + "	 d.decisionID,d.decisionNo, d.decisionName,DATE_FORMAT( d.approveDate,\"%d-%m-%Y\") as 'deApprovedDate'"
                    + ",d.note, DATE_FORMAT(d.createDate,\"%d-%m-%Y\") as 'deCeateDate' ,\n"
                    + "	 d.fileName \n"
                    + "     FROM syllabus sy left join decision d on sy.decisionNo = d.decisionID"
                    + " \n"
                    + "where subjectCode like '%" + text + "%'" + " or syllabusName like '%" + text + "%'\n"
                    + "Order by syllabusID desc;";
            PreparedStatement st = connection.prepareCall(sql);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                DecisionNo decisionNo = new DecisionNo(rs.getInt(19), rs.getString(20), rs.getString(21), rs.getString(22), rs.getString(23), rs.getString(24), rs.getString(25));

                Syllabus sy = new Syllabus();
                sy.setSyllabusID(rs.getInt(1));
                sy.setSubjectCode(rs.getString(2));
                sy.setSyllabusName(rs.getString(3));
                sy.setNoCredit(rs.getInt(4));
                sy.setDegreeLevel(rs.getString(5));
                sy.setTimeAllocation(rs.getString(6));
                sy.setPreRequisite(rs.getString(7));
                sy.setDescription(rs.getString(8));
                sy.setStudentTasks(rs.getString(9));
                sy.setTool(rs.getString(10));
                sy.setScoringScale(rs.getInt(11));
                sy.setIsApproved(rs.getBoolean(12));
                sy.setIsActive(rs.getBoolean(13));
                sy.setNote(rs.getString(14));
                sy.setMinAvgMarkToPass(rs.getInt(15));
                sy.setAccountID(rs.getInt(16));
                sy.setApprovedDate(rs.getString(18));
                sy.setDecisionNo(decisionNo);
                list.add(sy);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void addSyllabus(String subjectCode, String syllabusName, int noCredit, String degreeLevel, String timeAllocation, String description,
            String preRequisite, String studentTasks, String tool, int scoringScale, int decisionNo, boolean isApproved,
            String note, int minAvgMarkToPass, boolean isActive, String approvedDate, int accountID) {
        try {
            String sql = "INSERT INTO `flm_web`.`syllabus`(`subjectCode`, `syllabusName`,"
                    + " `noCredit`, `degreeLevel`, `timeAllocation`, `description`,"
                    + "`prerequisite` ,`studentTask`, `tool`, `scoringScale`, `decisionNo`,"
                    + " `isApproved`, `note`, `minAcgMarkToPass`, `isActive`, `approvedDate`,`accountID`)\n"
                    + " VALUES ( ?, ?,?,?,? ,?,?,?,?,?,?,?, ?,?, ?,?,?);";
            PreparedStatement st = connection.prepareCall(sql);
            st.setString(1, subjectCode);
            st.setString(2, syllabusName);
            st.setInt(3, noCredit);
            st.setString(4, degreeLevel);
            st.setString(5, timeAllocation);
            st.setString(6, description);
            st.setString(7, preRequisite);
            st.setString(8, studentTasks);
            st.setString(9, tool);
            st.setInt(10, scoringScale);
            st.setInt(11, decisionNo);
            st.setBoolean(12, isApproved);
            st.setString(13, note);
            st.setInt(14, minAvgMarkToPass);
            st.setBoolean(15, isActive);
            st.setString(16, approvedDate);
            st.setInt(17, accountID);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateSyllabus(String syllabusName, int noCredit, String deLevel, String timeLocation,
            String prequisite, String description, String studentTask, String tool,
            int scale, int decisionNo, int isApproved, String note, int minAVG, int isActive, String approvedDate, int syllabusID) {

        try {
            String sql = "UPDATE `flm_web`.`syllabus` SET "
                    + "`syllabusName` = '" + syllabusName + "', "
                    + "`noCredit` = " + noCredit + ", "
                    + "`degreeLevel` = '" + deLevel + "', "
                    + " `timeAllocation` = '" + timeLocation + "', "
                    + "`prerequisite` = '" + prequisite + "', "
                    + "`description` = '" + description + "', "
                    + "`studentTask` = '" + studentTask + "', "
                    + "`tool` = '" + tool + "', "
                    + "`scoringScale`= " + scale + ", "
                    + "`decisionNo` = " + decisionNo + ", "
                    + "`isApproved` = " + isApproved + ", "
                    + "`note` = '" + note + "', "
                    + " `minAcgMarkToPass` = " + minAVG + ","
                    + "`isActive` = " + isActive + ", "
                    + "`approvedDate` = '" + approvedDate + "'"
                    + " WHERE `syllabusID` =" + syllabusID;

            PreparedStatement st = connection.prepareStatement(sql);

            st.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public static void main(String[] args) {
        SyllabusDAO d = new SyllabusDAO();

        System.out.println(d.getASyllabus(16).getSyllabusName());
        d.updateSyllabus("syllabusName", 0, "deLevel", "timeLocation", "prequisite", "description",
                "studentTask", "tool", 0, 3, 0, "note", 0, 0, "2023-01-04", 17);
//        d.addSyllabus("MAD201", "123", 0, "asdad", "asdads", "description", "preRequisite", "studentTasks",
//                "tool", 10, 2, true, "note", 10, true, "2022-12-12", 4);
        List<Syllabus> l = d.searchPagingSyllabusListing("swp", 1, 6);
        for (Syllabus syllabus : l) {
            System.out.println(syllabus);
        }
    }

}
