package dao;

import java.sql.*;

public class likeDao {

    Connection con;

    public likeDao(Connection con) {
        this.con = con;
    }

    public boolean insertLikeIntoDataBase(int pid, int uid) {

        boolean f = false;
        try {

            String q = "insert into liked(pid , uid)values(?,?)";

            PreparedStatement pt = this.con.prepareStatement(q);

            pt.setInt(1, pid);
            pt.setInt(2, uid);

            pt.executeUpdate();

            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    public int countLikePost(int pid) {

        int count = 0;

        try {
            String q = "select count(*) from liked where pid=?";

            PreparedStatement pt = con.prepareStatement(q);
            pt.setInt(1, pid);

            ResultSet set = pt.executeQuery();

            if (set.next()) {
                count = set.getInt("count(*)");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return count;
    }

    public boolean isLikedByUser(int pid, int uid) {

        boolean f = false;

        try {
            PreparedStatement pt = this.con.prepareStatement("select from liked  where pid = ? && uid = ?");

            pt.setInt(1, pid);
            pt.setInt(2, uid);

            ResultSet set = pt.executeQuery();

            if (set.next()) {
                f = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    public boolean deleteLike(int pid, int uid) {
        boolean f = false;

        try {

            PreparedStatement pt = this.con.prepareStatement("delete from liked where pid =? and uid = ?");

            pt.setInt(1, pid);
            pt.setInt(2, uid);

            pt.executeUpdate();
            f = true;

        } catch (Exception e) {
        }
        return f;
    }

}
