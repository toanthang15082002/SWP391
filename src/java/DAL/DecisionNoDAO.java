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

/**
 *
 * @author ADMIN
 */
public class DecisionNoDAO extends DBContext {

    public List<DecisionNo> getAllDecesionNo() {
        List<DecisionNo> list = new ArrayList<>();
        try {
            String sql = "SELECT *,DATE_FORMAT( approveDate,\"%d-%m-%Y\") ,"
                    + "DATE_FORMAT( createDate,\"%d-%m-%Y\") FROM flm_web.decision";
            PreparedStatement st = connection.prepareCall(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                DecisionNo d = new DecisionNo();
                d.setDecisionID(rs.getInt(1));
                d.setDecisionNo(rs.getString(2));
                d.setDecisionName(rs.getString(3));
                d.setNote(rs.getString(5));
                d.setFileName(rs.getString(7));
                d.setApproveDate(rs.getString(8));
                d.setCreateDate(rs.getString(9));
                list.add(d);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<DecisionNo> getAllDecisionNoPaging(int index) {
        List<DecisionNo> list = new ArrayList<>();
        try {
            String sql = "SELECT *,DATE_FORMAT( approveDate,\"%d-%m-%Y\") ,"
                    + "DATE_FORMAT( createDate,\"%d-%m-%Y\") FROM flm_web.decision\n"
                    + "order by decisionID\n"
                    + "limit 2 offset ?;";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, (index - 1) * 2);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                DecisionNo d = new DecisionNo();
                d.setDecisionID(rs.getInt(1));
                d.setDecisionNo(rs.getString(2));
                d.setDecisionName(rs.getString(3));
                d.setNote(rs.getString(5));
                d.setFileName(rs.getString(7));
                d.setApproveDate(rs.getString(8));
                d.setCreateDate(rs.getString(9));
                list.add(d);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<DecisionNo> listByPage(List<DecisionNo> delist, int start, int end) {
        List<DecisionNo> list = new ArrayList<>();
        for (int i = start; i < end; i++) {
            list.add(delist.get(i));
        }
        return list;
    }

    public DecisionNo getDecisionByDecisionID(int decisionID) {
        try {
            String sql = "SELECT *,DATE_FORMAT( approveDate,\"%d-%m-%Y\") ,"
                    + "DATE_FORMAT( createDate,\"%d-%m-%Y\") FROM flm_web.decision\n"
                    + "where decisionID =?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, decisionID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                DecisionNo d = new DecisionNo();
                d.setDecisionID(rs.getInt(1));
                d.setDecisionNo(rs.getString(2));
                d.setDecisionName(rs.getString(3));
                d.setNote(rs.getString(5));
                d.setFileName(rs.getString(7));
                d.setApproveDate(rs.getString(8));
                d.setCreateDate(rs.getString(9));
                return d;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return null;
    }

    //Filter
    public List<DecisionNo> searchDecision(String txt) {
        List<DecisionNo> list = new ArrayList<>();
        String sql = "SELECT *,DATE_FORMAT( approveDate,\"%d-%m-%Y\") ,"
                + "DATE_FORMAT( createDate,\"%d-%m-%Y\") FROM flm_web.decision\n"
                + "where decisionName like '%" + txt + "%'";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                DecisionNo d = new DecisionNo();
                d.setDecisionID(rs.getInt(1));
                d.setDecisionNo(rs.getString(2));
                d.setDecisionName(rs.getString(3));
                d.setNote(rs.getString(5));
                d.setFileName(rs.getString(7));
                d.setApproveDate(rs.getString(8));
                d.setCreateDate(rs.getString(9));
                list.add(d);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<DecisionNo> sort(String txtSort) {
        List<DecisionNo> list = new ArrayList<>();
        String sql = "SELECT *,DATE_FORMAT( approveDate, \"%d-%m-%Y\") ,DATE_FORMAT( createDate, \"%d-%m-%Y\") \n"
                + "FROM flm_web.decision\n"
                + "order by "+ txtSort;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                DecisionNo d = new DecisionNo();
                d.setDecisionID(rs.getInt(1));
                d.setDecisionNo(rs.getString(2));
                d.setDecisionName(rs.getString(3));
                d.setNote(rs.getString(5));
                d.setFileName(rs.getString(7));
                d.setApproveDate(rs.getString(8));
                d.setCreateDate(rs.getString(9));
                list.add(d);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public static void main(String[] args) {
        DecisionNoDAO d = new DecisionNoDAO();
        List<DecisionNo> l = d.sort("decisionID desc");
        List<DecisionNo> list = d.getAllDecesionNo();

        for (DecisionNo decisionNo : l) {
            System.out.println(decisionNo);
        }
    }
}
