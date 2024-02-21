package servlets;

import Helper.ConnectionProvider;
import Helper.HP;
import dao.PostDao;
import entities.Post;
import entities.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;

@MultipartConfig
public class postServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

            String title = request.getParameter("title");
            String content = request.getParameter("content");
            int cId = Integer.parseInt(request.getParameter("cid"));

            String code = request.getParameter("code");
            Part part = request.getPart("pics");

//            getting current user id
            HttpSession s = request.getSession();
            User user = (User) s.getAttribute("currentUser");

            Post post = new Post(title, content, code, part.getSubmittedFileName(), null, cId, user.getId());

            PostDao dao = new PostDao(ConnectionProvider.getConnection());
            if (dao.savePost(post)) {
               out.print("done");
                String path = request.getSession().getServletContext().getRealPath("/") + "Blog_pics" + File.separator + part.getSubmittedFileName();

                HP.saveFile(part.getInputStream(), path);
                
                

            } else {

                out.println("fail post");
                System.out.println("fail p");
            }
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
