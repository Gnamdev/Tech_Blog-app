package dao;

import Helper.ConnectionProvider;
import entities.Categories;
import entities.Post;
import entities.User;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale.Category;

public class PostDao {

    Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }

    public ArrayList<Categories> getAllCategory() {

        ArrayList<Categories> list = new ArrayList<>();

        try {

            String q = "select * from categories ";

            Statement st = con.createStatement();
            ResultSet rt = st.executeQuery(q);

            while (rt.next()) {

                int cid = rt.getInt("cid");
                String name = rt.getString("name");
                String description = rt.getString("description");

                Categories c = new Categories(cid, name, description);

                list.add(c);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public boolean savePost(Post p) {
        boolean f = false;

        try {

            String q = "insert into post(pTitle , pContent, pCode , pPic ,carId , userId) values (?,?,?,?,?,?)";

            PreparedStatement pt = con.prepareStatement(q);

            pt.setString(1, p.getpTitle());
            pt.setString(2, p.getpContent());
            pt.setString(3, p.getpCode());
            pt.setString(4, p.getpPic());
            pt.setInt(5, p.getCarId());
            pt.setInt(6, p.getClientId());

            pt.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;

    }

    public List<Post> getAllPost() {

        List<Post> list = new ArrayList<>();

        try {

            PreparedStatement pt = con.prepareStatement("select * from post order by pid desc");

            ResultSet set = pt.executeQuery();

            while (set.next()) {

                int pId = set.getInt("pid");
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pCode = set.getString("pCode");
                String pPic = set.getString("pPic");
                Timestamp d = set.getTimestamp("pDate");
                int catId = set.getInt("carId");
                int userId = set.getInt("userId");

                Post post = new Post(pId, pTitle, pContent, pCode, pPic, null, catId, userId);
                list.add(post);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public List<Post> getAllPost(int catid) {

        List<Post> list = new ArrayList<>();

        try {

            PreparedStatement pt = con.prepareStatement("select * from post where carId = ?");

            pt.setInt(1, catid);
            ResultSet set = pt.executeQuery();

            while (set.next()) {

                int pId = set.getInt("pid");
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pCode = set.getString("pCode");
                String pPic = set.getString("pPic");
                Timestamp d = set.getTimestamp("pDate");
                int catId = set.getInt("carId");
                int userId = set.getInt("userId");

                Post post = new Post(pId, pTitle, pContent, pCode, pPic, null, catId, userId);
                list.add(post);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public Post getPostByPostId(int postId) {
        Post p = null;
        try {

            String q = "select * from post where pid = ?";
            PreparedStatement pt = this.con.prepareStatement(q);
            pt.setInt(1, postId);

            ResultSet set = pt.executeQuery();

            if (set.next()) {
               
                int pId = set.getInt("pid");
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pCode = set.getString("pCode");
                String pPic = set.getString("pPic");
                Timestamp d = set.getTimestamp("pDate");
                int catId = set.getInt("carId");
                int userId = set.getInt("userId");

                 p = new Post(pId, pTitle, pContent, pCode, pPic, null, catId, userId);

            }

        } catch (Exception e) {
            e.addSuppressed(e);
        }

        return p;
    }
    

}
