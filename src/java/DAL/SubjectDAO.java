/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import com.oracle.wls.shaded.org.apache.bcel.generic.AALOAD;
import common.DBContext;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Subject;

/**
 *
 * @author admin
 */
public class SubjectDAO extends DBContext {

    public List<Subject> getAllSubject() {
        List<Subject> list = new ArrayList<>();
        String sql = "SELECT * FROM flm_web.subject ;";
        try {
            PreparedStatement st = connection.prepareCall(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Subject s = new Subject();
                s.setSubjectCode(rs.getString(1));
                s.setSubjectName(rs.getString(2));
                s.setSemester(rs.getInt(3));
                s.setNoCredit(rs.getInt(4));
                s.setPreRequisite(rs.getString(5));
                list.add(s);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List searchSubject(String txt) {
        List<Subject> list = new ArrayList<>();
        try {
            String sql = "SELECT * \n"
                    + "FROM flm_web.subject\n"
                    + "where subjectCode like ? "
                    + "or subjectCode like ?;";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, txt);
            st.setString(2, txt);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Subject s = new Subject();
                s.setSubjectCode(rs.getString(1));
                s.setSubjectName(rs.getString(2));
                s.setSemester(rs.getInt(3));
                s.setNoCredit(rs.getInt(4));
                s.setPreRequisite(rs.getString(5));
                list.add(s);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;

    }

}
