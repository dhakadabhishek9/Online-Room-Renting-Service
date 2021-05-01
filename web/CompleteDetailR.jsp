<%-- 
    Document   : CompleteDetail
    Created on : Nov 5, 2020, 3:13:25 PM
    Author     : hp
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="newpackage.ConnDao"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <title>Complete Description</title>
	<style>
            .form-button{
        background: #27afdc;
        border: 1px solid #ddd;
        color: #ffffff;
        padding: 10px;
        width: 100%;
        text-transform: uppercase;
    }
		p {
			display: inline;
		}
                .form-input{
        background: #d3d3d3;
        border: 1px solid #eeeeee;
        padding: 12px;
        width: 75%;
    }
    table{
 font-family: verdana; 
 color:black; 
 font-size: 16px; 
 font-style: normal;
 font-weight: bold;
 background: white
 border-collapse collapse; 
  
}
table.inner{
 border: 10px
}
	</style>
        <%
    try {
          String emai=request.getSession().getAttribute("m").toString();
            Connection co=ConnDao.getConnection();
            String query="Select * from roomie where email='"+emai+"'";
            PreparedStatement pt=co.prepareStatement(query);
            ResultSet rs=pt.executeQuery();
            if(rs.next())
            {
        
    %>
<body>
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
    <script type="text/javascript">
        window.onload = function () {
            var mapOptions = {
                center: new google.maps.LatLng(<%=rs.getString("latitude") %>, <%=rs.getString("longitude") %>),
                zoom: 14,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            };
            var map = new google.maps.Map(document.getElementById("dvMap"), mapOptions);
            var marker = new google.maps.Marker({
    position: new google.maps.LatLng(<%=rs.getString("latitude") %>, <%=rs.getString("longitude") %>),
    title:"House of : <%=rs.getString("name") %>"
});

// To add the marker to the map, call setMap();
marker.setMap(map);
        }
</script>
<div>
<form  method="post" h:form enctype="multipart/form-data">
    <button class="form-button" style="width:21%"><a href="index.jsp">Home</a></button>
    <table align ="center" cellpadding ="10">
        <tr>
            <td>Name: </td>
            <td><input class="form-input" type="text" id="Name" name="Name" value="<%=rs.getString("name")%>" disabled="disabled"></td>
            <td>Phone No: </td>
            <td><input class="form-input" type="text" id="Email" name="Email" value="<%=rs.getString("email")%>" disabled="disabled"></td>
             <td>Rent: </td>
            <td><input class="form-input" type="text" id="Rent" name="Rent" value="<%=rs.getString("rent")%>" disabled="disabled"></td>
            <td>Address: </td>
            <td><input class="form-input" type="text" id="Address" name="Address" value="<%=rs.getString("address")%>" disabled="disabled"></td>
            <td>Person Living : </td>
            <td><input class="form-input" type="text" id="living" name="Living" value="<%=rs.getString("living")%>" disabled="disabled"></td>
    </table>
</form>
<div id="dvMap" style="width: 600px; float:left; height:500px;border: 1px solid black;background: white; margin:30px">
    
	
</div>
     <img src="showimager.jsp" style="width: 600px; float:left; height:500px;border: 1px solid black;background:white; margin:30px;">
</div>
<%
    }
}
catch(SQLException e)
{
System.out.println(e.getMessage());
}%>
</html>