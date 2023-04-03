/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Curriculum;
import common.DBContext;
import model.Plo;
import model.Po;

/**
 *
 * @author Thang
 */
public class CurriculumDAO extends DBContext {

    //Curriculum
    public void insertCurriculum(String code, String name, String description, String decisionNo, boolean isapprove, boolean isactive, String incharge) {
        String query = "insert into curriculum(curCode, curName, description, decisionNo, isapprove, isactive, incharge) values (?,?,?,?,?,?,?);";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setString(1, code);
            st.setString(2, name);
            st.setString(3, description);
            st.setString(4, decisionNo);
            st.setBoolean(5, isapprove);
            st.setBoolean(6, isactive);
            st.setString(7, incharge);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void editCurriculum(Curriculum c) {
        String query = "UPDATE curriculum SET curCode = ?, curName = ?, description = ?, decisionNo = ?, isapprove = ?, isactive = ?, incharge = ?\n"
                + "WHERE curid = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setString(1, c.getCurCode());
            st.setString(2, c.getCurName());
            st.setString(3, c.getDescription());
            st.setString(4, c.getDecisionNo());
            st.setBoolean(5, c.isIsapprove());
            st.setBoolean(6, c.isIsactive());
            st.setString(7, c.getIncharge());
            st.setInt(8, c.getCurid());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<Curriculum> getAllCurriculum() {
        List<Curriculum> list = new ArrayList<>();
        String query = "select * from curriculum";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Curriculum(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getBoolean(6),
                        rs.getBoolean(7),
                        rs.getString(8)
                ));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Curriculum getCurriculumByID(int id) {

        String query = "SELECT `curriculum`.`curid`,\n"
                + "    `curriculum`.`curCode`,\n"
                + "    `curriculum`.`curName`,\n"
                + "    `curriculum`.`description`,\n"
                + "    `curriculum`.`decisionNo`,\n"
                + "    `curriculum`.`isapprove`,\n"
                + "    `curriculum`.`isactive`,\n"
                + "    `curriculum`.`incharge`\n"
                + "FROM `flm_web`.`curriculum`"
                + "WHERE `curriculum`.`curid` = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Curriculum c = new Curriculum();
                c.setCurid(rs.getInt(1));
                c.setCurCode(rs.getString(2));
                c.setCurName(rs.getString(3));
                c.setDescription(rs.getString(4));
                c.setDecisionNo(rs.getString(5));
                c.setIsapprove((rs.getBoolean(6)));
                c.setIsactive(rs.getBoolean(7));
                c.setIncharge(rs.getString(8));
                return c;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List searchCurriculum(String text) {
        List<Curriculum> list = new ArrayList<>();
        try {
            String query = "SELECT * FROM curriculum\n"
                    + "where curCode like ? or curName like ?\n"
                    + "Order by curid desc;";
            PreparedStatement st = connection.prepareStatement(query);
            st.setString(1, "%" + text + "%");
            st.setString(2, "%" + text + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Curriculum c = new Curriculum();
                c.setCurid(rs.getInt(1));
                c.setCurCode(rs.getString(2));
                c.setCurName(rs.getString(3));
                c.setDescription(rs.getString(4));
                c.setDecisionNo(rs.getString(5));
                c.setIsapprove((rs.getBoolean(6)));
                c.setIsactive(rs.getBoolean(7));
                c.setIncharge(rs.getString(8));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Curriculum checkCurCode(String curCode) {
        String query = "SELECT `curriculum`.`curid`,\n"
                + "    `curriculum`.`curCode`,\n"
                + "    `curriculum`.`curName`,\n"
                + "    `curriculum`.`description`,\n"
                + "    `curriculum`.`decisionNo`,\n"
                + "    `curriculum`.`isapprove`,\n"
                + "    `curriculum`.`isactive`,\n"
                + "    `curriculum`.`incharge`\n"
                + "FROM `flm_web`.`curriculum`"
                + "WHERE `curriculum`.`curCode` = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setString(1, curCode);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Curriculum c = new Curriculum();
                c.setCurid(rs.getInt(1));
                c.setCurCode(rs.getString(2));
                c.setCurName(rs.getString(3));
                c.setDescription(rs.getString(4));
                c.setDecisionNo(rs.getString(5));
                c.setIsapprove((rs.getBoolean(6)));
                c.setIsactive(rs.getBoolean(7));
                c.setIncharge(rs.getString(8));
                return c;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public int getTotalCurriculum() {
        try {
            String query = "select count(*) from flm_web.curriculum";
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

    public int getTotalCurriculumActive() {
        try {
            String query = "select count(*) from flm_web.curriculum where isactive = true";
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

    public List<Curriculum> pagingCurriculum(int index) {
        List<Curriculum> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM flm_web.curriculum\n"
                    + "order by curID desc\n"
                    + "limit 6 offset ?;";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, (index - 1) * 6);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Curriculum c = new Curriculum();
                c.setCurid(rs.getInt(1));
                c.setCurCode(rs.getString(2));
                c.setCurName(rs.getString(3));
                c.setDescription(rs.getString(4));
                c.setDecisionNo(rs.getString(5));
                c.setIsapprove((rs.getBoolean(6)));
                c.setIsactive(rs.getBoolean(7));
                c.setIncharge(rs.getString(8));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Curriculum> pagingCurriculumActive(int index) {
        List<Curriculum> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM flm_web.curriculum\n"
                    + "where isactive = true\n"
                    + "order by curID\n"
                    + "limit 6 offset ?;";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, (index - 1) * 6);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Curriculum c = new Curriculum();
                c.setCurid(rs.getInt(1));
                c.setCurCode(rs.getString(2));
                c.setCurName(rs.getString(3));
                c.setDescription(rs.getString(4));
                c.setDecisionNo(rs.getString(5));
                c.setIsapprove((rs.getBoolean(6)));
                c.setIsactive(rs.getBoolean(7));
                c.setIncharge(rs.getString(8));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    //PLO
    public List<Plo> getPLOByCurriculumID(int id) {
        List<Plo> list = new ArrayList<>();
        String query = "SELECT `plo`.`ploid`,\n"
                + "    `plo`.`ploName`,\n"
                + "    `plo`.`ploDescription`,\n"
                + "    `plo`.`curid`\n"
                + "FROM `flm_web`.`plo`\n"
                + "WHERE `curid` = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Plo p = new Plo();
                p.setPloid(rs.getInt(1));
                p.setPloName(rs.getString(2));
                p.setPloDescription(rs.getString(3));
                p.setCurid(rs.getInt(4));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Plo> getAllPLOPaging(int index) {
        List<Plo> list = new ArrayList<>();
        String query = "SELECT `plo`.`ploid`,\n"
                + "    `plo`.`ploName`,\n"
                + "    `plo`.`ploDescription`,\n"
                + "    `plo`.`curid`\n"
                + "FROM `flm_web`.`plo`\n"
                + "Order by ploid desc\n"
                + "limit 10 offset ?";

        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setInt(1, (index - 1) * 10);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Plo p = new Plo();
                p.setPloid(rs.getInt(1));
                p.setPloName(rs.getString(2));
                p.setPloDescription(rs.getString(3));
                p.setCurid(rs.getInt(4));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void insertPlo(String ploName, String ploDescription, String curid) {
        String query = "insert into plo(ploName, ploDescription, curid) values (?,?,?);";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setString(1, ploName);
            st.setString(2, ploDescription);
            st.setString(3, curid);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void editPlo(Plo p) {
        String query = "UPDATE plo SET ploName = ?, ploDescription = ?, curid = ?\n"
                + "WHERE ploid = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setString(1, p.getPloName());
            st.setString(2, p.getPloDescription());
            st.setInt(3, p.getCurid());
            st.setInt(4, p.getPloid());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public Plo getPLOByID(String ploid) {
        String query = "SELECT `plo`.`ploid`,\n"
                + "    `plo`.`ploName`,\n"
                + "    `plo`.`ploDescription`,\n"
                + "    `plo`.`curid`\n"
                + "FROM `flm_web`.`plo`\n"
                + "WHERE `ploid` = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setString(1, ploid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Plo p = new Plo();
                p.setPloid(rs.getInt(1));
                p.setPloName(rs.getString(2));
                p.setPloDescription(rs.getString(3));
                p.setCurid(rs.getInt(4));
                return p;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

//    public Plo checkPloID(String ploid) {
//        String query = "SELECT `plo`.`ploid`,\n"
//                + "    `plo`.`ploName`,\n"
//                + "    `plo`.`ploDescription`,\n"
//                + "    `plo`.`curid`\n"
//                + "FROM `flm_web`.`plo`\n"
//                + "WHERE `ploid` = ?;";
//        try {
//            PreparedStatement st = connection.prepareStatement(query);
//            st.setString(1, ploid);
//            ResultSet rs = st.executeQuery();
//            while (rs.next()) {
//                Plo p = new Plo();
//                p.setPloid(rs.getInt(1));
//                p.setPloName(rs.getString(2));
//                p.setPloDescription(rs.getString(3));
//                p.setCurid(rs.getInt(4));
//                return p;
//            }
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//        return null;
//    }
    public int getTotalPlo() {
        try {
            String query = "select count(*) from flm_web.plo";
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

    public List searchPlo(String text) {
        List<Plo> list = new ArrayList<>();
        try {
            String query = "SELECT * FROM flm_web.plo\n"
                    + "WHERE ploName like ?\n"
                    + "Order by ploid desc;";
            PreparedStatement st = connection.prepareStatement(query);
            st.setString(1, "%" + text + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Plo p = new Plo();
                p.setPloid(rs.getInt(1));
                p.setPloName(rs.getString(2));
                p.setPloDescription(rs.getString(3));
                p.setCurid(rs.getInt(4));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void deletePlo(String ploid) {
        String query = "DELETE FROM flm_web.plo \n"
                + "WHERE ploid = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setString(1, ploid);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    //PO
    public List<Po> getPOByCurriculumID(int id) {
        List<Po> list = new ArrayList<>();
        String query = "SELECT `po`.`poid`,\n"
                + "    `po`.`poName`,\n"
                + "    `po`.`poDescription`,\n"
                + "    `po`.`curid`\n"
                + "FROM `flm_web`.`po`\n"
                + "WHERE `curid` = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Po p = new Po();
                p.setPoid(rs.getInt(1));
                p.setPoName(rs.getString(2));
                p.setPoDescription(rs.getString(3));
                p.setCurid(rs.getInt(4));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Po> getAllPOPaging(int index) {
        List<Po> list = new ArrayList<>();
        String query = "SELECT `po`.`poid`,\n"
                + "    `po`.`poName`,\n"
                + "    `po`.`poDescription`,\n"
                + "    `po`.`curid`\n"
                + "FROM `flm_web`.`po`\n"
                + "Order by poid desc\n"
                + "limit 10 offset ?";

        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setInt(1, (index - 1) * 10);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Po p = new Po();
                p.setPoid(rs.getInt(1));
                p.setPoName(rs.getString(2));
                p.setPoDescription(rs.getString(3));
                p.setCurid(rs.getInt(4));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void insertPo(String poName, String poDescription, String curid) {
        String query = "insert into po(poName, poDescription, curid) values (?,?,?);";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setString(1, poName);
            st.setString(2, poDescription);
            st.setString(3, curid);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void editPo(Po p) {
        String query = "UPDATE po SET poName = ?, poDescription = ?, curid = ?\n"
                + "WHERE `poid` = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setString(1, p.getPoName());
            st.setString(2, p.getPoDescription());
            st.setInt(3, p.getCurid());
            st.setInt(4, p.getPoid());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public Po getPOByID(String poid) {
        String query = "SELECT `po`.`poid`,\n"
                + "    `po`.`poName`,\n"
                + "    `po`.`poDescription`,\n"
                + "    `po`.`curid`\n"
                + "FROM `flm_web`.`po`\n"
                + "WHERE `poid` = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setString(1, poid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Po p = new Po();
                p.setPoid(rs.getInt(1));
                p.setPoName(rs.getString(2));
                p.setPoDescription(rs.getString(3));
                p.setCurid(rs.getInt(4));
                return p;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public int getTotalPo() {
        try {
            String query = "select count(*) from flm_web.po";
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

    public List searchPo(String text) {
        List<Po> list = new ArrayList<>();
        try {
            String query = "SELECT * FROM flm_web.po\n"
                    + "WHERE poName like ?\n"
                    + "Order by poid desc;";
            PreparedStatement st = connection.prepareStatement(query);
            st.setString(1, "%" + text + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Po p = new Po();
                p.setPoid(rs.getInt(1));
                p.setPoName(rs.getString(2));
                p.setPoDescription(rs.getString(3));
                p.setCurid(rs.getInt(4));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public boolean checkIsActiveCurriculum(String id) {
        try {
            String query = "select isactive from curriculum\n"
                    + "where curid = ?;";
            PreparedStatement st = connection.prepareStatement(query);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                if (rs.getInt(1) == 1) {
                    return true;
                }
                if (rs.getInt(1) == 0) {
                    return false;
                }
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return true;

    }

    public void deletePo(String poid) {
        String query = "DELETE FROM flm_web.po \n"
                + "WHERE poid = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setString(1, poid);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public static void main(String[] args) {
        CurriculumDAO dao = new CurriculumDAO();
        Po p = new Po(8, "test2", "test2", 2);
        dao.editPo(p);

    }
}
