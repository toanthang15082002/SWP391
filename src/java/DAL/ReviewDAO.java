/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import common.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import model.Comment;
import model.ReComment;

/**
 *
 * @author admin
 */
public class ReviewDAO extends DBContext {

    public List<Comment> getComment(String syllabusID, String curriculumID) {
        List<Comment> list = new ArrayList<>();

        String sql = "SELECT c.commentID , c.syllabusID, c.curriculumID,  c.comment,a.accountID,a.firstname, a.avatar,  DATE_FORMAT(c.date,\"%d/%m/%Y\")\n"
                + " FROM comment c inner join account a on c.accountID = a.accountID\n"
                + " where c.syllabusID = ? or c.curriculumID= ?\n"
                + " order by c.commentID desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, syllabusID);
            st.setString(2, curriculumID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Comment c = new Comment();
                c.setCommentID(rs.getInt(1));
                c.setSyllabusID(rs.getInt(2));
                c.setCurriculumID(rs.getInt(3));
                c.setComment(rs.getString(4));
                c.setAccountID(rs.getInt(5));
                c.setFirstName(rs.getString(6));
                c.setAvatar(rs.getString(7));
                c.setDate(rs.getString(8));

                // get recommnent by commentID
                List<ReComment> recomlist = new ArrayList<>();
                String recomsql = "SELECT c.commentID ,rec.recommentID,rec.recomment,a.accountID, a.firstname, a.avatar, DATE_FORMAT(rec.date,\"%d/%m/%Y\")\n"
                        + "FROM comment c  inner join  recomment rec on rec.commentID = c.commentID"
                        + " inner join account a on rec.accountID = a.accountID\n"
                        + "where c.commentID = ?";
                PreparedStatement recomst = connection.prepareStatement(recomsql);
                recomst.setInt(1, rs.getInt(1));
                ResultSet recomrs = recomst.executeQuery();
                while (recomrs.next()) {
                    ReComment rec = new ReComment();
                    rec.setCommentID(recomrs.getInt(1));
                    rec.setRecommentID(recomrs.getInt(2));
                    rec.setRecomment(recomrs.getString(3));
                    rec.setAccountID(recomrs.getInt(4));
                    rec.setFirstname(recomrs.getString(5));
                    rec.setAvatar(recomrs.getString(6));
                    rec.setDate(recomrs.getString(7));
                    recomlist.add(rec);
                }
                c.setRecomentlist(recomlist);
                list.add(c);
            }

        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public void insertComment(int accountID, String comment, String date, String syID, String CurID) {
        String sql = "INSERT INTO `flm_web`.`comment`\n"
                + "(`syllabusID`,\n"
                + "`curriculumID`,\n"
                + "`accountID`,\n"
                + "`comment`,\n"
                + "`date`)"
                + "VALUES\n"
                + "(?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, syID);
            st.setString(2, CurID);
            st.setInt(3, accountID);
            st.setString(4, comment);
            st.setString(5, date);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }

    }

    public void insertReComment(int accountID, int commentID, String recomment) {
        String sql = "INSERT INTO `flm_web`.`recomment`\n"
                + "(`commentID`,\n"
                + "`accountID`,\n"
                + "`recomment`,\n"
                + "`date`)\n"
                + "VALUES\n"
                + "(?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, commentID);
            st.setInt(2, accountID);
            st.setString(3, recomment);
            st.setString(4, getDateNow());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }

    }

    public void updateComment(String comment, String commentID) {
        String sql = ""
                +"UPDATE `flm_web`.`comment`\n"
                + "SET\n"
                + "`comment` = ?,\n"
                + "`date` = ?\n"
                + "WHERE `commentID` = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, comment);
            st.setString(2, getDateNow());
            st.setString(3, commentID);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
        
    }

    public String getDateNow() {
        LocalDate currentDate = LocalDate.now();
        return currentDate.toString();
    }

    public static void main(String[] args) {
        ReviewDAO d = new ReviewDAO();
       
        d.updateComment("ty sua", "12");

    }
}
