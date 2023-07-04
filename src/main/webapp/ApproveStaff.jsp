<%@page import="dto.Staff"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Approve Staff</title>
<style>
	*{
        margin: 0;
        padding: 0;
     }
     body{
        width: 100%;
        height: 100vh;
        background-image: url(images/maxresdefault.jpg);
        background-size: cover;
		background-repeat: no-repeat;
        background-position: center;
      }
	h1{
        padding: 30px 0;
        color: lime;
        display: flex;
        align-items: center;
        justify-content: center;
    }
    .container{
        width: 90%;
        height: 30px;
        color: white;
        margin: 60px 0 0 70px;
        font-size: larger;
        font-weight: bolder;
        background: transparent;
        display: flex;
        align-items: center;
        justify-content: center;
    }
    .container1 button{
            height: 30px;
            width: 90px;
            position: relative;
            top: 120px;
            left: 630px;
            margin: 10px;
            background-color:palevioletred;
            border-color: palevioletred;
            border-radius: 50px;
            font-weight: bold;
            box-shadow: 10px 10px 5px;
     }
</style>
</head>
<body>
	<h1><u>Staff Details</u></h1>
	<%
		List<Staff> list = (List<Staff>) request.getAttribute("list");
	%>
	<div class="container">
	<table border="2">
		<tr>
			<th>ID</th>
			<th>Name</th>
			<th>Mobile</th>
			<th>Age</th>
			<th>Status</th>
			<th>ChangeStatus</th>
		</tr>
		<%
			for (Staff staff : list) {
		%>
		<tr>
			<th><%=staff.getId()%></th>
			<th><%=staff.getName()%></th>
			<th><%=staff.getMobile()%></th>
			<th><%=staff.getAge()%></th>
			<th><%=staff.isStatus()%></th>

			<th><a href="adminstaffstatus?id=<%=staff.getId()%>"><button>Change Status</button></a></th>
		</tr>
		<%
			}
		%>
	</table>
	</div>
	<div class="container1">
		<a href="AdminHome.html"><button>Back</button></a>
	</div>
</body>
</html>