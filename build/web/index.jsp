
<%@page import="newpackage.ConnDao"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Home</title>
    <style>
        
    *{
        margin:0;
        padding: 0;
        box-sizing: border-box;
    }
    html{
        height: 100%;
    }
    body{
        font-family: 'Segoe UI', sans-serif;;
        font-size: 1rem;
        line-height: 1.6;
        height: 100%;
    }
    .wrap {
        width: 350px;
        float:left; 
        height:400px;
        margin:20px;
    }
    .wrap1 {
        width: 350px;
        float:left; 
        height:350px;
        margin:20px;
    }
    .wrapall
    {
        width: 1300px; 
        height:580px;
        margin:20px;
        display: flex;
        justify-content: center;
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
        width: 100%;
    }
    .form-group{
        margin-bottom: 1rem;
    }
    .form-button{
        background: #27afdc;
        border: 1px solid #ddd;
        color: #ffffff;
        padding: 10px;
        width: 100%;
        text-transform: uppercase;
    }
    .form-button:hover{
        background: #27a0dc;
    }
    .form-header{
        text-align: center;
        margin-bottom : 2rem;
    }
    .form-footer{
        text-align: center;
    }
    .select-css {
	display: block;
	font-size: 15px;
	font-family: sans-serif;
	font-weight: 600;
	color: #444;
	line-height: 1.3;
	padding: .6em 1.4em .5em .8em;
	width: 100%;
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
    </style>
</head>
<script>
    function wrong()
    {
        var x=document.f1.cityo.value;
        if(x=="0")
        {
            alert("Please Select A City.");
            return false;
        }
    }
    function wrong1()
    {
        var x=document.f2.cityr.value;
        if(x=="0")
        {
            alert("Please Select A City.");
            return false;
        }
    }
        function show() {
  var p = document.getElementById('pwd');
  p.setAttribute('type', 'text');
}

function hide() {
  var p = document.getElementById('pwd');
  p.setAttribute('type', 'password');
}
</script>

<div class="wrapall">
    <div class="wrap1">
        <form class="login-form" name="f1" action="Owner.jsp" method="post" h:form enctype="multipart/form-data" onsubmit="return wrong()">
            <div class="form-header">
                <h3>Find Rooms Here : </h3>
            </div>
            <select name="cityo" class="select-css">
                            <option disabled="disables" selected="selected" value="0">Select City</option>
                            <%
                try { 
                Connection connection = null;
                Statement statement = null;
                ResultSet rs = null;
                connection = ConnDao.getConnection();
                statement=connection.createStatement();
                String sql ="SELECT distinct(city) FROM owners where city is not null";

                rs = statement.executeQuery(sql);
                while(rs.next()){
                %>
                <option value="<%=rs.getString("city")%>"><%=rs.getString("city")%></option>
                            <%
                                }
                            %>
       </select>
       <br><button class="form-button" type="submit" value="submit">Search</button><br>
        </form>
<%
} catch (Exception e) {
e.printStackTrace();
}
%>
<form class="login-form" name="f2" action="Roomie.jsp" method="post" h:form enctype="multipart/form-data" onsubmit="return wrong1()">
            <div class="form-header">
                <h3>Find Roommate Here : </h3>
            </div>
            <select name="cityr" class="select-css">
                            <option disabled="disabled" selected="selected" value="0">Select City</option>
                            <%
                try { 
                Connection connection = null;
                Statement statement = null;
                ResultSet rs = null;
                connection = ConnDao.getConnection();
                statement=connection.createStatement();
                String sql ="SELECT distinct(city) FROM roomie where city is not null";
                rs = statement.executeQuery(sql);
                while(rs.next()){
                %>
                <option value="<%=rs.getString("city")%>"><%=rs.getString("city")%></option>
                            <%
                                }
                            %>
       </select>
       <br> <button class="form-button" type="submit" value="submit">Search</button><br>
        </form>
<%
} catch (Exception e) {
e.printStackTrace();
}
%>
    </div>
    <div class="wrap">
        <form class="login-form" action="logservlet" method="post">
            <div class="form-header">
                <h3>Login Form</h3>
            </div>
            <!--Email Input-->
            <div class="form-group">
                <input type="text" name="email" class="form-input" placeholder="Phone No" required>
            </div><br>
            <!--Password Input-->
            <div class="form-group">
                <input type="password" name="password" class="form-input" placeholder="Password" id="pwd" required>
                <button class="form-button" type="button" onmouseover="show()" onmouseout="hide()" id="eye">Show Password</button>
            </div>
            <br>
            <!--Login Button-->
            <div class="form-group">
                <button class="form-button" type="submit">Login</button>
            </div><br>
            <a href="RegisterOwner.jsp" style="font-family: monospace">Want to rent rooms?Click Here</a><br><br>
        <a href="RegisterRoomie.jsp" style="font-family: monospace">Need a Roommate?Click Here</a><br><br>
        <a href="Admin.jsp" style="font-family: monospace">Admin Login.</a>
        </form>
        
    </div><!--/.wrap-->
</div>
</body>
</html>