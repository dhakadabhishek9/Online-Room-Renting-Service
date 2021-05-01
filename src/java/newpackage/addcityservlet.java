package newpackage;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

public class addcityservlet extends HttpServlet {

    Connection coo=ConnDao.getConnection();
 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
            try {
            int row=0;
            String city = request.getParameter("cit");
            String query = "insert into city values(?)";
            PreparedStatement pt =coo.prepareStatement(query);
           pt.setString(1,city);
           row=pt.executeUpdate();
            PrintWriter out = response.getWriter();
//            
//                out.println("<script type=\"text/javascript\">");
//                out.println("alert('row');");
//                out.println("</script>");
            if (row>0) {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('City Added.');");
                out.println("location='AdminBlock.jsp';");
                out.println("</script>");
                       }
            else {
                response.sendRedirect("welcome.jsp");
                 }
        } catch (SQLException e) {
                System.out.println(e.getMessage());
        }
            }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
