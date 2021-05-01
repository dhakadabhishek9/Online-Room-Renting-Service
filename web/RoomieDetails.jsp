<%@ page trimDirectiveWhitespaces="true" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="newpackage.ConnDao"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>User Profile</title>
<style>
   
.form-header{
        text-align: center;
        margin-bottom : 2rem;
    }
    .login-form{
        width: 350px;
        margin: 0 auto;
        border: 1px solid #222;
        padding: 2rem;
        background: #ffffff;
    }
    .form-input{
        background: #d3d3d3;
        border: 1px solid #eeeeee;
        padding: 12px;
        width: 75%;
    }
    .form-button{
        background: #27afdc;
        border: 1px solid #ddd;
        color: #ffffff;
        padding: 10px;
        width: 30%;
        text-transform: uppercase;
    }
    .form-button:hover{
        background: #27a0dc;
    }
    .select-css {
	display: block;
	font-size: 15px;
	font-family: sans-serif;
	font-weight: 600;
	color: #444;
	line-height: 1.3;
	padding: .6em 1.4em .5em .8em;
	width: 50%;
	max-width: 100%;
	box-sizing: border-box;
	margin: 0;
	border: 1px solid #aaa;
	box-shadow: 0 1px 0 1px rgba(0,0,0,.04);
	border-radius: .5em;
	-moz-appearance: none;
	-webkit-appearance: none;
	appearance: none;
	background-color: #fff;
	background-image: url('data:image/svg+xml;charset=US-ASCII,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%22292.4%22%20height%3D%22292.4%22%3E%3Cpath%20fill%3D%22%23007CB2%22%20d%3D%22M287%2069.4a17.6%2017.6%200%200%200-13-5.4H18.4c-5%200-9.3%201.8-12.9%205.4A17.6%2017.6%200%200%200%200%2082.2c0%205%201.8%209.3%205.4%2012.9l128%20127.9c3.6%203.6%207.8%205.4%2012.8%205.4s9.2-1.8%2012.8-5.4L287%2095c3.5-3.5%205.4-7.8%205.4-12.8%200-5-1.9-9.2-5.5-12.8z%22%2F%3E%3C%2Fsvg%3E'),
	  linear-gradient(to bottom, #ffffff 0%,#e5e5e5 100%);
	background-repeat: no-repeat, repeat;
	background-position: right .7em top 50%, 0 0;
	background-size: .65em auto, 100%;
}
.select-css::-ms-expand {
	display: none;
}
.select-css:hover {
	border-color: #888;
}
.select-css:focus {
	border-color: #aaa;
	box-shadow: 0 0 1px 3px rgba(59, 153, 252, .7);
	box-shadow: 0 0 0 3px -moz-mac-focusring;
	color: #222;
	outline: none;
}
.select-css option {
	font-weight:normal;
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
.option-input {
  -webkit-appearance: none;
  -moz-appearance: none;
  -ms-appearance: none;
  -o-appearance: none;
  appearance: none;
  position: relative;
  top: 13.33333px;
  right: 0;
  bottom: 0;
  left: 0;
  height: 40px;
  width: 40px;
  transition: all 0.15s ease-out 0s;
  background: #cbd1d8;
  border: none;
  color: #fff;
  cursor: pointer;
  display: inline-block;
  margin-right: 0.5rem;
  outline: none;
  position: relative;
  z-index: 1000;
}
.option-input:hover {
  background: #9faab7;
}
.option-input:checked {
  background: #40e0d0;
}
.option-input:checked::before {
  height: 40px;
  width: 40px;
  position: absolute;
  content: '✔';
  display: inline-block;
  font-size: 26.66667px;
  text-align: center;
  line-height: 40px;
}
.option-input:checked::after {
  -webkit-animation: click-wave 0.65s;
  -moz-animation: click-wave 0.65s;
  animation: click-wave 0.65s;
  background: #40e0d0;
  content: '';
  display: block;
  position: relative;
  z-index: 100;
}
.option-input.radio {
  border-radius: 50%;
}
.option-input.radio::after {
  border-radius: 50%;
}

.button {
  display: inline-block;
  padding: 12px 19px;
  cursor: pointer;
  border-radius: 5px;
  background-color:#cbd1d8;
  font-size: 16px;
  font-weight: bold;
  color: #fff;
}
</style>
</head>
<body>
        <%
    try {
          String emai=request.getSession().getAttribute("email").toString();
            Connection co=ConnDao.getConnection();
            String query="Select * from roomie where email='"+emai+"'";
            PreparedStatement pt=co.prepareStatement(query);
            ResultSet rs=pt.executeQuery();
            if(rs.next())
            {
        
    %>
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
    <script type="text/javascript">
        window.onload = function () {
            var mapOptions = {
                center: new google.maps.LatLng(<%=rs.getString("latitude") %>, <%=rs.getString("longitude") %>),
                zoom: 14,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            };
            var map = new google.maps.Map(document.getElementById("dvMap"), mapOptions);
            google.maps.event.addListener(map, 'click', function (e) {
                var lat=e.latLng.lat();
                var lon=e.latLng.lng();
            document.getElementById("lat").setAttribute('value',lat);
            document.getElementById("lon").setAttribute('value',lon);
            });
            var marker = new google.maps.Marker({
    position: new google.maps.LatLng(<%=rs.getString("latitude") %>, <%=rs.getString("longitude") %>),
    title:"House of : <%=rs.getString("name") %>"
});

// To add the marker to the map, call setMap();
marker.setMap(map);
document.getElementById("<%=rs.getString("gender")%>").checked=true;
        }
</script>
    <form name="f1" action="UpdateRServlet" method="post" h:form enctype="multipart/form-data">
        <button class="form-button" style="width:21%"><a href="index.jsp">Home</a></button>
<h2 class="form-header">Roomie Profile</h2>
<table align="center" cellpadding = "10">
<tr>
<td>Name :</td>
<td><input class="form-input" type="text" name="name" value="<%=rs.getString("Name")%>" required></td>
</tr>
<tr>
<td>Phone no :</td>
<td><input class="form-input" type="text" name="email" value="<%=rs.getString("email")%>" readonly></td>
</tr>
<tr>
<td>Password :</td>
<td><input class="form-input" type="password" name="password" value="<%=rs.getString("password")%>" required></td>
</tr>
<tr>
<td>Gender :</td>
<td>
    <input class="option-input radio" type="radio" name="gender" value="Male" id="Male"/>
Male
<input class="option-input radio" type="radio" name="gender" value="Female" id="Female"/>
Female
</td>
</tr>
<tr>
<td>Address :</td>
<td><input class="form-input" type="text" name="address" value="<%=rs.getString("address")%>" required></td>
</tr>
<tr>
<td>City :</td>
<td>
<select class="select-css">
    <option value="<%=rs.getString("city")%>" ><%=rs.getString("city")%></option>
</select>
</td>
</tr>
<tr>
<td>Change City :</td>
<td>
<select name="city" class="select-css">
    <option value="<%=rs.getString("city")%>" selected="selected">Same as previous</option>
<%
            String quer="Select Distinct(city) from city";
            PreparedStatement pt1=co.prepareStatement(quer);
            ResultSet rs1=pt1.executeQuery();
            while(rs1.next())
            {
        
    %>
        <option value="<%=rs1.getString("city")%>"><%=rs1.getString("city")%></option>
        <%
    }
%>
</select>
</td>
</tr>
<tr>
<td>Price per Room :</td>
<td><input attribute type="number" onkeydown="return event.keyCode !== 69"  class="form-input" type="text" name="rent" value="<%=rs.getString("rent")%>" required></td>
</tr>
<tr>
<td>Person Living Currently :</td>
<td><input class="form-input" type="text" name="living" value="<%=rs.getString("living")%>" required></td>
</tr>
<tr>
<td colspan="2" align="center"><img src="profileimager.jsp" style="width: 600px; height: 500px"></div></td>
</tr>
<tr>
<td>Change image :</td>
<td><input class="button" type="file" name="imag"></td>
<tr>
    <td colspan="2" align="center"><div id="dvMap" style="width: 600px; height: 500px"></div></td>
</tr>
<tr>
    <td> <input type="text" name="lat" id="lat" hidden="" value="<%=rs.getString("latitude")%>"></td>
    <td>  <input type="text" name="lon" id="lon" hidden="" value="<%=rs.getString("longitude")%>"></td>
</tr>
<tr>
<td colspan="2" align="center">
    <button class="form-button" type="submit">Update</button>
</td>
</tr>
</table>
</form>
<form action="DeleteRServlet" method="post" align="center" >
    <button class="form-button" type="submit">Delete</button>
</form>
<form action="lgoutservlet" align="center" >
    <button class="form-button" type="submit">Log Out</button>
</form>
    <%
    }
}
catch(SQLException e)
{
System.out.println(e.getMessage());
}%>
</body>
</html>
