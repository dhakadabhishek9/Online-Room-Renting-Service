/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package newpackage;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author hp
 */
public class adminlogservlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    Connection conn=ConnDao.getConnection();
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            response.setContentType("text/html;charset=UTF-8");
            String logemail = request.getParameter("email");
            String logpass = request.getParameter("password");
            PrintWriter out = response.getWriter();
            
            try {
            String query="SELECT * FROM `admin` WHERE email=? and Password=?";
            PreparedStatement pst1 =conn.prepareStatement(query);
            pst1.setString(1, logemail);
            pst1.setString(2, logpass);
            String quer="SELECT * FROM `admin` WHERE email=?";
            PreparedStatement pst2 =conn.prepareStatement(quer);
            pst2.setString(1, logemail);
            ResultSet rs1 = pst1.executeQuery();
            ResultSet rs2=pst2.executeQuery();
            if(!rs2.next())
            {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Admin Not registered.');");
                out.println("location='Admin.jsp';");
                out.println("</script>");
            }
            else if(rs1.next())
            {
                response.sendRedirect("AdminBlock.jsp");
                HttpSession session=request.getSession(true);
                request.getSession().setAttribute("email", rs1.getString("email"));
            }
            else
            {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('User or password incorrect.');");
                out.println("location='Admin.jsp';");
                out.println("</script>");
            }
            }catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
