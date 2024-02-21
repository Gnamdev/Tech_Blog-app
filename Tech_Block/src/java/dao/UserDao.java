//it is use for communicate with data base
package dao;

import entities.User;
import java.sql.*;

public class UserDao {

    private Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }

//   method to insert data in dataBase
    public boolean saveUser(User user) {

        boolean f = false;
        try {

            String query = "insert into Client(user_name, email, password, gender) values(?,?,?,?)";
            PreparedStatement pt = con.prepareStatement(query);
            pt.setString(1, user.getName());
            pt.setString(2, user.getEmail());
            pt.setString(3, user.getPassword());
            pt.setString(4, user.getGender());

            pt.executeUpdate();

            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;

    }

    //get user email and passwords
    public User getUserAndPassword(String email, String password) {
        User user = null;
        try {

            String query = "select * from Client where email = ? and password = ?";

            PreparedStatement pt = con.prepareStatement(query);
            pt.setString(1, email);
            pt.setString(2, password);

            ResultSet rt = pt.executeQuery();

            if (rt.next()) {

                user = new User();

                int id = rt.getInt("id");
                user.setId(id);
                String name = rt.getString("user_name");
                user.setName(name);

                user.setEmail(rt.getString("email"));

                user.setGender(rt.getString("gender"));
                user.setPassword(rt.getString("password"));
                user.setDateTime(rt.getTimestamp("registerDate"));
                user.setProfile(rt.getString("profile"));
            }

        } catch (Exception e) {
            e.printStackTrace();

        }

        return user;
    }

    // pending kam hai 
    public boolean UpdateUser(User user) {
        boolean f = false;
        try {

            String q = "UPDATE Client SET  user_name =?,email = ? , password = ? , gender = ? , profile =? where id = ?";

            PreparedStatement pt = con.prepareStatement(q);

            pt.setString(1, user.getName());
            pt.setString(2, user.getEmail());
            pt.setString(3, user.getPassword());
            pt.setString(4, user.getGender());
            pt.setString(5, user.getProfile());
            pt.setInt(6, user.getId());

//            debug the code
            System.out.println("user name : " + user.getName());
            System.out.println("user email : " + user.getEmail());
            System.out.println("user pass : " + user.getPassword());
            System.out.println("user gender : " + user.getGender());
            System.out.println("user prof : " + user.getProfile());

//            boolean i = pt.execute();
//
//            System.out.println("infected row : " + i);
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;

    }

    public User getUserDetailsByUserId(int userId) {

        User user = null;
        try {

            String q = "select * from client where id =?";
            PreparedStatement pt = this.con.prepareStatement(q);

            pt.setInt(1, userId);

            ResultSet rt = pt.executeQuery();

            if (rt.next()) {

                System.out.println("bruh ff");
                user = new User();

                int id = rt.getInt("id");
                user.setId(id);
                String name = rt.getString("user_name");
                user.setName(name);

                user.setEmail(rt.getString("email"));

                user.setGender(rt.getString("gender"));
                user.setPassword(rt.getString("password"));
                user.setDateTime(rt.getTimestamp("registerDate"));
                user.setProfile(rt.getString("profile"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

}
