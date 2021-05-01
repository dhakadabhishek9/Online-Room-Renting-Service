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
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
@MultipartConfig(maxFileSize = 16177216)
public class UpdateOServlet extends HttpServlet {

    Connection coo=ConnDao.getConnection();
    public UpdateOServlet()
    {
        
    }
 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
            try {
            int row=0;
            InputStream is=null;
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String city = request.getParameter("city");
            String address = request.getParameter("address");
            String gender = request.getParameter("gender");
            String lat = request.getParameter("lat");
            String lon = request.getParameter("lon");
            String rent = request.getParameter("rent");
            Part part=request.getPart("imag");
            is=part.getInputStream();
            if(part.getSize()==0)
            {
            String quer = "Update owners set name=?, password=?, city=? ,"
                    + " address=?, gender=?, latitude=?, longitude=?, rent=? where email=?";
          PreparedStatement pt =coo.prepareStatement(quer);

           pt.setString(1, name);
           pt.setString(2, password);
           pt.setString(3, city);
           pt.setString(4, address);
           pt.setString(5, gender);
           pt.setString(6, lat);
           pt.setString(7, lon);
           pt.setString(8, rent);
           pt.setString(9, email);
           row=pt.executeUpdate();
            }
            else
            {
                String query = "Update owners set name=?, password=?, city=?, address=?, gender=?,"
                    +"  latitude=?, longitude=?, rent=?, image=? where email='"+email+"'";
               PreparedStatement pt =coo.prepareStatement(query);

           pt.setString(1, name);
           pt.setString(2, password);
           pt.setString(3, city);
           pt.setString(4, address);
           pt.setString(5, gender);
           pt.setString(6, lat);
           pt.setString(7, lon);
           pt.setString(8, rent);
           pt.setBlob(9, is);
           row=pt.executeUpdate();
            }
            PrintWriter out = response.getWriter();
//            
//                out.println("<script type=\"text/javascript\">");
//                out.println("alert('row');");
//                out.println("</script>");
            if (row>0) {
                request.getSession().setAttribute("email", email);
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Record Updated');");
                out.println("location='OwnerDetails.jsp';");
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
