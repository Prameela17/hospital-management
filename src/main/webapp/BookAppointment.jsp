<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Select One</title>
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
        padding: 120px 0;
        color: lime;
        margin: 0 0 0 200px;
    }
    .canva a{
            width: 85%;
            margin: auto;
            color:rgb(243, 189, 54);
            font-size: larger;
            font-weight: bolder;
            display: flex;
            align-items: center;
            justify-content: center;
        }
       .canva button{
            height: 35px;
            width: 20%;
            position: relative;
            top: -100px;
            left: -350px;
            margin: 10px;
            background-color:rgb(243, 189, 54);
            border-color: rgb(243, 189, 54);
            border-radius: 50px;
            font-weight: bold;
            box-shadow: 10px 10px 5px;
        }
        .canva1 button{
           	height: 30px;
            width: 90px;
            position: relative;
            top: -70px;
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
	<h1><u>Book Appointments</u></h1>
	<div class="canva">
		<%
			if (session.getAttribute("staff") == null) {
				response.getWriter().print("<h1 style='color:red'>Session Expired Login Again</h1>");
				request.getRequestDispatcher("Login.html").include(request, response);
			} else {
		%>
		<a href="fetchallpatient"><button>View All Patient</button></a><br>
		<a href="FetchById.html"><button>Fetch Patient By Id</button></a>
		<%
			}
		%>
	</div>
	<div class="canva1">
		<a href="StaffHome.html"><button>Back</button></a>
	</div>
</body>
</html>