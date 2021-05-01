package newpackage;


import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

//For image
@MultipartConfig(maxFileSize = 16177216)
public class RegisterServlet extends HttpServlet {

    public RegisterServlet() {
    }
    
    
                Connection conn=ConnDao.getConnection();
    
                //For owner Register
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
            Part part=request.getPart("image");
            PrintWriter out = response.getWriter();
            is=part.getInputStream();
            if(email.length()!=10)
            {
             out.println("<script type=\"text/javascript\">");
                out.println("alert(' Please Enter 10 digit Number.');");
                out.println("location='RegisterOwner.jsp';");
                out.println("</script>");   
            }else{
            String que="select * from owners where email="+email;
            PreparedStatement p=conn.prepareStatement(que);
            ResultSet rs=p.executeQuery();
            if(rs.next())
            {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Email or Phone no exists.Please choose another.');");
                out.println("location='RegisterOwner.jsp';");
                out.println("</script>");
            }
            else{
            String query = "insert into owners(name,email,password,image,city,address,gender,latitude,longitude,rent)"
                   + " values(?,?,?,?,?,?,?,?,?,?)";
           PreparedStatement pt =conn.prepareStatement(query);

           pt.setString(1, name);
           pt.setString(2, email);
           pt.setString(3, password);
           pt.setBlob(4,is);
           pt.setString(5, city);
           pt.setString(6, address);
           pt.setString(7, gender);
           pt.setString(8, lat);
           pt.setString(9, lon);
           pt.setString(10, rent);
           row=pt.executeUpdate();
            if (row>0) {
               response.sendRedirect("index.jsp");
                       }
            else {
                response.sendRedirect("welcome.jsp");
                 }
            }
            }
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }
        }

}
