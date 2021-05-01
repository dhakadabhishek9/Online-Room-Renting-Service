<%@page import="newpackage.ConnDao"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Login</title>
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
        height:400px;
        width: 500px; margin: 0 auto;
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
    </style>
</head>
<body>
    <script type="text/javascript">
    function show() {
  var p = document.getElementById('pwd');
  p.setAttribute('type', 'text');
}

function hide() {
  var p = document.getElementById('pwd');
  p.setAttribute('type', 'password');
}

</script>
    <div class="wrap">
        <form class="login-form" action="adminlogservlet" method="post" align="center">
            <div class="form-header">
                <button class="form-button" style="width:21%"><a href="index.jsp">Home</a></button>
                <h3>Admin Login Form</h3>
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
        </form>
        
    </div><!--/.wrap-->
</div>
</body>
</html>