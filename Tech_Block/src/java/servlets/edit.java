package servlets;

import Helper.ConnectionProvider;
import Helper.HP;

import dao.UserDao;
import entities.Message;
import entities.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.HttpSessionListener;
import jakarta.servlet.http.Part;
import java.io.File;

@MultipartConfig
public class edit extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet edit</title>");
            out.println("</head>");
            out.println("<body>");
            
            String email = request.getParameter("user_email");
            String password = request.getParameter("user_password");
            Part img = request.getPart("user_image");
            
            String imageName = img.getSubmittedFileName();
            
            HttpSession s = request.getSession();
            User user = (User) s.getAttribute("currentUser");
            
            user.setEmail(email);
            user.setPassword(password);
            String oldPic = user.getProfile();
            user.setProfile(imageName);
            
//            out.println(user.getEmail() + "<br>");
//            out.println(user.getPassword() + "<br>");
//            out.println(user.getGender() + "<br>");
//            out.println(user.getName() + "<br>");
//            out.println(user.getProfile() + "<br>");
            
            out.println("Updating user...");

            //update database
            UserDao dao = new UserDao(ConnectionProvider.getConnection());
            boolean ans = dao.UpdateUser(user);
            if (ans) {
                out.println("update to Db");

                //String path = request.getRealPath("/") + "pics" + File.separator + ;
                String path = request.getSession().getServletContext().getRealPath("/") + "pics" + File.separator + user.getProfile();
                
                 String oldPath = request.getSession().getServletContext().getRealPath("/") + "pics" + File.separator + oldPic;
                HP.deleteFile(oldPath);
               // out.print("<h1> path : </h1>" + path);
                
                if (HP.saveFile(img.getInputStream(), path)) {
                    // out.println("");

                    Message m = new Message("profile updeted..", "success", "alert-success");
                    
                    s.setAttribute("mgs", m);
                    
                } else {
                    //out.print("profile not updated");
                    Message m = new Message("Sorry ! something went wrong 😓 ", "error", "alert-danger");
                    
                    s.setAttribute("mgs", m);
                }
                
            } else {
//                out.print("Not update in DB");
                Message m = new Message("Sorry ! something went wrong 😓 ", "error", "alert-danger");
                
                s.setAttribute("mgs", m);
                
            }
            
     response.sendRedirect("profile.jsp");
            
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
