<%@page import="newpackage.ConnDao"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html> 
    <head>
        <title>Admin Block</title>
        <style>
            .form-input{
        background: #d3d3d3;
        border: 1px solid #eeeeee;
        padding: 12px;
        width: 20%;
    }
            .form-button{
        background: #27afdc;
        border: 1px solid #ddd;
        color: #ffffff;
        padding: 10px;
        width: 10%;
        text-transform: uppercase;
    }
            table { 
	width: 750px; 
	border-collapse: collapse; 
	margin:50px auto;
	}

/* Zebra striping */
tr:nth-of-type(odd) { 
	background: #eee; 
	}

th { 
	background: #3498db; 
	color: white; 
	font-weight: bold; 
	}

td, th { 
	padding: 10px; 
	border: 1px solid #ccc; 
	text-align: left; 
	font-size: 18px;
	}
@media 
only screen and (max-width: 760px),
(min-device-width: 768px) and (max-device-width: 1024px)  {

	table { 
	  	width: 100%; 
	}

	/* Force table to not be like tables anymore */
	table, thead, tbody, th, td, tr { 
		display: block; 
	}
	
	/* Hide table headers (but not display: none;, for accessibility) */
	thead tr { 
		position: absolute;
		top: -9999px;
		left: -9999px;
	}
	
	tr { border: 1px solid #ccc; }
	
	td { 
		/* Behave  like a "row" */
		border: none;
		border-bottom: 1px solid #eee; 
		position: relative;
		padding-left: 50%; 
	}

	td:before { 
		/* Now like a table header */
		position: absolute;
		/* Top/left values mimic padding */
		top: 6px;
		left: 6px;
		width: 45%; 
		padding-right: 10px; 
		white-space: nowrap;
		/* Label the data */
		content: attr(data-column);

		color: #000;
		font-weight: bold;
	}    
        </style>
    </head>
        <body>
            <script>
                function valu(mail)
                {
                    document.getElementById("eml").setAttribute("value",mail);
                }
            </script>
    <% 
    try {
            Connection connn=ConnDao.getConnection();
        Statement stmt = connn.createStatement(); 
        ResultSet rst = stmt.executeQuery("SELECT * FROM `owners`" +
                " UNION " +
                    "SELECT * FROM `roomie`"); 
                    request.getSession().setAttribute("va", "1");
        %>
        <form action="addcityservlet" method="post" >
            <button class="form-button" style="width:21%"><a href="index.jsp">Home</a></button>
            <h2 align="center">Admin Block</h2>
            <div align="center">
                <input class="form-input" type="text" name="cit" required>
            <button class="form-button" type="submit">Add City</button>
            </div>
        </form>
        <form action="lgoutservlet" align="center" >
    <button class="form-button" type="submit">Log Out</button>
</form>
        <form action="alogservlet" method="post" h:form enctype="multipart/form-data">
        <table align="center">
            <thead>
            <tr><th>Name</th>
                <th>Contact</th>
                <th>City</th>
                <th>Operation</th>
            </tr>
            </thead>
            <%
            while (rst.next())  
        {  
            %>
            <tr>
                <td data-column="Name"><%=rst.getString("Name")%></td>
                <td data-column="Email"><%=rst.getString("Email")%></td>
                <td data-column="City"><%=rst.getString("City")%></td>
                <td data-column="More"><button type="submit" name="emai" value="<%=rst.getString("Email")%>" onclick="valu(this.value)">View/Update/Delete</button></td>
            </tr>
            <%
        }
            %>
            
        </table>
            <input type="text" name="eml" id="eml" hidden="">
        </form>
           
        <%
        } catch (Exception e) {
        }
 
    %> 
        </body>
    </html> 