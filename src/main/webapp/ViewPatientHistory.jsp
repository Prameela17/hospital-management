<%@page import="dto.Patient"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.codec.binary.Base64"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>PatientHistory</title>
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
        padding: 10px 0;
        color: lime;
        display: flex;
        align-items: center;
        justify-content: center;
    }
    .container{
        width: 90%;
        height: 28px;
        color: white;
        margin: 140px 0 0 50px;
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
        top: 180px;
        left: 620px;
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
	<h1><u>Patients History</u></h1>
	<%
		List<Patient> list = (List<Patient>) request.getAttribute("list");
	%> 
	<div class="container">
	<table border="2">
		<tr>
			<th>ID</th>
			<th>Name</th>
			<th>Mobile</th>
			<th>Age</th>
			<th>Picture</th>
			<th>View Previous Appointments</th>
		</tr>
		<%
			for (Patient patient : list) {
		%>
		<tr>
			<th><%=patient.getId()%></th>
			<th><%=patient.getName()%></th>
			<th><%=patient.getMobile()%></th>
			<th><%=patient.getAge()%></th>
			<th>
			<%
			String base64=Base64.encodeBase64String(patient.getPicture());
			%>
			<img height="50px" width="50px" alt="unknown" src="data:image/jpeg;base64,<%=base64%>">
			</th>
			<th><a href="ViewPatientAppointment.jsp?id=<%=patient.getId()%>"><button>Click</button></a></th>
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