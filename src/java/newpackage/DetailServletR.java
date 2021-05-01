
package newpackage;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 *
 * @author hp
 */
public class DetailServletR extends HttpServlet {
 
    Connection c=ConnDao.getConnection();
    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email=request.getParameter("eml");
        try {
            String q="Select * from roomie where email='"+email+"'";
            PreparedStatement ps=c.prepareStatement(q);
            ResultSet rs=ps.executeQuery();
            if(rs.next())
            {
            response.sendRedirect("CompleteDetailR.jsp");
            request.getSession().setAttribute("m", rs.getString("email"));
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
