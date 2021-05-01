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
public class DeleteRServlet extends HttpServlet {
    Connection ccc=ConnDao.getConnection();
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        try {
            
             
            String em=request.getSession().getAttribute("va").toString();
            String email=request.getSession().getAttribute("email").toString();
        String query="Delete from roomie where email="+email;
        PreparedStatement pt=ccc.prepareStatement(query);
        int row=pt.executeUpdate();
        PrintWriter out=response.getWriter();
        if(row>0)
        {
            if(em.equals("1"))
            {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('User Record Deleted Successfully');");
                out.println("location='AdminBlock.jsp';");
                out.println("</script>");
                request.getSession().setAttribute("va", "0");
            }
            else{
                out.println("<script type=\"text/javascript\">");
                out.println("alert('User Record Deleted Successfully');");
                out.println("location='index.jsp';");
                out.println("</script>");
            }
        }
        else
        {
            response.sendRedirect("welcome.jsp");
        }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
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
    

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    

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
