<%@page import="dto.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="dto.Patient"%>
<%@page import="dao.MyDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>PatientAppointment1</title>
<style>
	*{
        margin: 0;
        padding: 0;
     }
     body{
        width: 100%;
        height: 100vh;
        background-image: url(images/R.jpg);
        background-size: cover;
		background-repeat: no-repeat;
        background-position: center;
     }
     h1{
        padding: 20px 0;
        color: lime;
        margin: 0 0 0 210px;
    }
    .container{
        width: 90%;
        height: 28px;
        color: white;
        margin: 130px 0 0 -280px;
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
        left: 280px;
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
	
	<%
		int pid = Integer.parseInt(request.getParameter("id"));
		MyDao dao = new MyDao();
		Patient patient = dao.fetchPatient(pid);
		List<Appointment> list = patient.getAppointments();
		if (list.isEmpty()) {
			response.getWriter().print("<h1 style='color:red'>No Apppoinments Yet</h1>");
			request.setAttribute("list", dao.fetchAllPatient());
			if(session.getAttribute("admin")!=null  && session.getAttribute("staff")==null)
			request.getRequestDispatcher("ViewPatientHistory.jsp").include(request, response);
			else
			request.getRequestDispatcher("ViewPatientHistory1.jsp").include(request, response);
		} else {
	%>
	<h1><u>Appointment Details1</u></h1>
	<div class="container">
	<table border="2">
		<tr>
			<th>Appointment Id</th>
			<th>Patient</th>
			<th>Problem</th>
			<th>Doctor</th>
			<th>Appointment Date</th>
		</tr>
		<%
			for (Appointment appointment : list) {
		%>
		<tr>
			<th><%=appointment.getId()%></th>
			<th><%=appointment.getPatient().getName()%></th>
			<th><%=appointment.getProblem()%></th>
			<th><%=appointment.getDoctor().getName()%></th>
			<th>
			<%if(appointment.getDatetime()==null) {%>
			Not Yet Visited Doctor
			<%}else{ %>
			<%=appointment.getDatetime()%>
			<%} %>
			</th>
		</tr>
		<%}%>
	</table>
	</div>
	<div class="container1">
	<a href="stafffetchpatienthistory"><button>Back</button></a>
	</div>
	<%} %>
</body>
</html>