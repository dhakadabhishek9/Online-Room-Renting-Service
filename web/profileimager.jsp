<%@ page trimDirectiveWhitespaces="true" %><%@page import="newpackage.ConnDao"%><%@ page import="java.sql.*"%><%@ page import="java.io.*"%><%
    try {
        byte[] imgData = null;
          String mail=request.getSession().getAttribute("email").toString();
          
    Connection con=ConnDao.getConnection();
    Statement st=con.createStatement();
    String q="select * from roomie where email='"+mail+"'";
ResultSet rs=st.executeQuery(q);
if(rs.next()){
        
          java.sql.Blob imga = rs.getBlob("image");
          imgData = imga.getBytes(1,(int)imga.length());   
          response.setContentType("image/jpg");
          OutputStream o = response.getOutputStream();
          o.write(imgData);
          o.flush();
          o.close();
}
rs.close();
st.close();
con.close();
}catch (Exception e) {
e.printStackTrace();
        }
%>

