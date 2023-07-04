<%@page import="org.apache.commons.codec.binary.Base64"%>
<%@page import="dto.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="dto.Doctor"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>UpcomingAppointment</title>
<style>
	*{
        margin: 0;
        padding: 0;
    }
    body{
        width: 100%;
        height: 100vh;
        background-image: url(images/R\ \(1\).jpg);
        background-size: cover;
        background-repeat: no-repeat;
        background-position: center;
    }
    h1{
        padding: 20px 0;
        color: green;
        display: flex;
        align-items: center;
        justify-content: center;
    }
    .container{
        width: 90%;
        height: 28px;
        color: white;
        margin: 80px 0 0 70px;
        font-size: large;
        font-weight: bolde;
        background: transparent;
        display: flex;
        align-items: center;
        justify-content: center;
    }
    .container1 button{
        height: 30px;
        width: 90px;
        position: relative;
        top: 200px;
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
	<h1><u>Upcoming Appointments</u></h1>
	<%
		Doctor doctor = (Doctor) session.getAttribute("doctor");
		if (doctor == null) {
			response.getWriter().print("<h1>Invalid Session </h1>");
			request.getRequestDispatcher("Login.html").include(request, response);
		} else {
			List<Appointment> list = doctor.getAppointments();
			if (list.isEmpty()) {
				response.getWriter().print("<h1>No Appointments Yet</h1>");
				request.getRequestDispatcher("DoctorHome.html").include(request, response);
			} else {
	%>
	<div class="container">
	<table border="2">
		<tr>
			<th>Appointment Id</th>
			<th>Patient Id</th>
			<th>Patient Name</th>
			<th>Patient Picture</th>
			<th>Patient Problem</th>
			<th>Check</th>
		</tr>
		<%
			for (Appointment appointment : list) {
		%>
		<%
			if (appointment.getDatetime() == null) {
		%>
		<tr>
			<th><%=appointment.getId()%></th>
			<th><%=appointment.getPatient().getId()%></th>
			<th><%=appointment.getPatient().getName()%></th>
			<th>
				<%
					String base64 = Base64.encodeBase64String(appointment.getPatient().getPicture());
				%> <img height="50px" width="50px" alt="unknown" src="data:image/jpeg;base64,<%=base64%>">
			</th>
			<th><%=appointment.getProblem()%></th>
			<th><a href="checkappointment?id=<%=appointment.getId()%>"><button>Check</button></a></th>
		</tr>
		<%
			}
		%>
		<%
			}
		%>
	</table>
	</div>
	<div class="container1">
		<a href="DoctorHome.html"><button>Back</button></a>
	<%
		}
	%>
	<%
		}
	%>
	</div>
</body>
</html>