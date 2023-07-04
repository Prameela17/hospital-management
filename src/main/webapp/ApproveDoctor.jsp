<%@page import="dto.Doctor"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Approve Doctor</title>
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
	<h1><u>Doctor Details</u></h1>
	<%
		List<Doctor> list = (List<Doctor>) request.getAttribute("list");
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
			for (Doctor doctor : list) {
		%>
		<tr>
			<th><%=doctor.getId()%></th>
			<th><%=doctor.getName()%></th>
			<th><%=doctor.getMobile()%></th>
			<th><%=doctor.getAge()%></th>
			<th><%=doctor.isStatus()%></th>

			<th><a href="admindoctorstatus?id=<%=doctor.getId()%>"><button>Change Status</button></a></th>

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