
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

public class logservlet extends HttpServlet {

    Connection conn=ConnDao.getConnection();
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            response.setContentType("text/html;charset=UTF-8");
            String logemail = request.getParameter("email");
            String logpass = request.getParameter("password");
            PrintWriter out = response.getWriter();
            
            try {
            String query="SELECT * FROM `owners` WHERE email=? and Password=?" +
                " UNION " +
                    "SELECT * FROM `roomie` WHERE email=? and Password=?";
            PreparedStatement pst1 =conn.prepareStatement(query);
            pst1.setString(1, logemail);
            pst1.setString(2, logpass);
            pst1.setString(3, logemail);
            pst1.setString(4, logpass);
            String quer="SELECT * FROM `owners` WHERE email=?" +
                " UNION " +
                    "SELECT * FROM `roomie` WHERE email=?";
            PreparedStatement pst2 =conn.prepareStatement(quer);
            pst2.setString(1, logemail);
            pst2.setString(2, logemail);
            ResultSet rs1 = pst1.executeQuery();
            ResultSet rs2=pst2.executeQuery();
            if(!rs2.next())
            {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Phone No. Not registered.');");
                out.println("location='index.jsp';");
                out.println("</script>");
            }
            else if(rs1.next())
            {
                if(rs1.getString("living")!=null)
                {
                response.sendRedirect("RoomieDetails.jsp");
                HttpSession session=request.getSession(true);
                request.getSession().setAttribute("email", rs1.getString("email"));
                }else
            {
                response.sendRedirect("OwnerDetails.jsp");
                HttpSession session=request.getSession(true);
                request.getSession().setAttribute("email", rs1.getString("email"));
            }
            }
            else
            {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('User or password incorrect.');");
                out.println("location='index.jsp';");
                out.println("</script>");
            }
            }catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        }

}
