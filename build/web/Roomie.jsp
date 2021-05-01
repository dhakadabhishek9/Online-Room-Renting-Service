<%@page import="newpackage.ConnDao"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html> 
    <head>
        <title>Description</title>
        <style>
            .form-button{
        background: #27afdc;
        border: 1px solid #ddd;
        color: #ffffff;
        padding: 10px;
        width: 100%;
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
    try {String city=request.getParameter("cityr");
            Connection connn=ConnDao.getConnection();
        Statement stmt = connn.createStatement(); 
        ResultSet rst = stmt.executeQuery("SELECT * FROM roomie where city='"+city+"'"); 
        %>
        <form action="DetailServletR" method="post" h:form enctype="multipart/form-data">
            <button class="form-button" style="width:21%"><a href="index.jsp">Home</a></button>
            <h2 align="center">Information Table</h2>
        <table align="center">
            <thead>
            <tr><th>Name</th>
                <th>Contact</th>
                <th>Address</th>
                <th>City</th>
                <th>Price</th>
                <th>More</th>
            </tr>
            </thead>
            <%
            while (rst.next())  
        {  
            %>
            <tr>
                <td data-column="Name"><%=rst.getString("Name")%></td>
                <td data-column="Email"><%=rst.getString("Email")%></td>
                <td data-column="Address"><%=rst.getString("Address")%></td>
                <td data-column="City"><%=rst.getString("City")%></td>
                <td data-column="Rent"><%=rst.getString("Rent")%></td>
                <td data-column="More"><button type="submit" name="emai" value="<%=rst.getString("Email")%>" onclick="valu(this.value)">View More Detail</button></td>
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