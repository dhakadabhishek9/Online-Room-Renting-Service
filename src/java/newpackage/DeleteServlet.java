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

/**
 *
 * @author hp
 */
public class DeleteServlet extends HttpServlet {
Connection cccc=ConnDao.getConnection();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        try {
            
        PrintWriter out=response.getWriter();
            String email=request.getSession().getAttribute("email").toString();
        out.println("<script type=\"text/javascript\">");
                out.println("alert('Hello'"+email+");");
                out.println("</script>");
            String em=request.getSession().getAttribute("va").toString();
            
        String query="Delete from owners where email="+email;
        PreparedStatement pt=cccc.prepareStatement(query);
        int row=pt.executeUpdate();
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

   
}
