<%@ page import ="javax.servlet.*" %>
<%@ page import ="javax.servlet.http.*" %>
<%@ page import ="java.io.*" %>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.servlet.ServletException" %>
<%@ page import ="javax.servlet.annotation.WebServlet" %>
<%@ page import ="javax.servlet.http.HttpServlet" %>
<%@ page import ="javax.servlet.http.HttpServletRequest" %>
<%@ page import ="javax.servlet.http.HttpServletResponse" %>
<%@ page import ="javax.servlet.http.HttpSession" %>

<html>
	<head><title>FP Systems And Services</title><meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
		<link rel="stylesheet" href="projectstyle.css">

		<script type="text/JavaScript">
		<!--
		var picCount=0;
		var picArray= ["2.jpg","3.jpg","4.jpg","5.jpg","6.jpg","1.jpg"];

			function nextPic()
			{
				picCount=(picCount+1<picArray.length)? picCount+1 : 0;
				var build='<img border="0" src="'+picArray[picCount]+'" width="1200" height="400">\
';
				document.getElementById("nav").innerHTML=build;
				setTimeout('nextPic()',2000);
			}
			//-->
		</script>

		<script type="text/javascript">
			function disableBackButton()

			{

			window.history.forward();

			}

				setTimeout("disableBackButton()", 0);

		</script>

		<style>
			#username input[type=submit]{
						float:right;
						margin-right:70px;
						font-size:30px;
    						background-color:#008b8b;
    						color:white;
						}
			#username input[type=submit]:hover{Background-color:orange;}
			#header p{
				font-size:25px;
				color:#008b8b;}
		</style>
	</head>
	<body  onunload="disableBackButton()" onload="setTimeout('nextPic()',2000)" >
<%
	String DB_URL = "jdbc:mysql://localhost/db127";
	String USER = "root";
	String PASS = "hasinI@24";
	int flag = 0;
	HttpSession s = request.getSession(true);
	String title = "Welcome Back to my website";
	Integer visitCount = new Integer(0);
	String visitCountKey = new String("visitCount");
	String userIDKey = new String("emailid");
	String emailid=request.getParameter("email");
	String pass=request.getParameter("pass");
	session.putValue("emailid",emailid);
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn= DriverManager.getConnection(DB_URL,USER,PASS);
	Statement statement=conn.createStatement();
	ResultSet columns=statement.executeQuery("select email,pass,uname from signup2 where email='"+emailid+"'");
	if(columns.next())
	{
		String mail=columns.getString("email");
		String pwd=columns.getString("pass");
		String name=columns.getString("uname");
		ServletContext sc=request.getServletContext();
		sc.setAttribute("name",name);
		if(pwd.equals(pass))
		{
			if (s.isNew())
			{
	    		s.setAttribute(userIDKey, emailid);
	    }
		 	else
		 	{
	        visitCount = (Integer)s.getAttribute(visitCountKey);
	        emailid = (String)s.getAttribute(userIDKey);
	    }
	    s.setAttribute(visitCountKey,  visitCount); %>


			<div id="header">
			<p>Welcome <%= name %></p>
			<img src="logo.png"/>
			</div>
			<div id="username">
				<form action="Logoutser" method="post">
				<input type="submit" value="Logout">
				</form>
			</div>

			<ul id="wrapper">
				<li><a href="aboutl.html">About</a></li>
				<li><a href="productsl.html">Products</a></li>
				<li><a href="servicesl.html">Services</a></li>
				<li><a href="contactl.html">Contact Us</a></li>
			</ul>
		<div id="nav">
			<img border="0" src="1.jpg" width="1200px" height="400px">
		</div>

		<div id="content">
			<h2>FutureTech Automation Services</h2>
			<p>FutureTech Automation Services got established in the Year 1999 with an aim to shoulder the responsibility of taking Security to everyone within the sphere of action, today FutureTech Automation Services has registered its powerful presence in almost all the sectors by providing security solution at a reasonable cost with best unmatched services.</p><br>
			<p>FutureTech Automation Services is one of the leading security solution provider companies endowed with an extrasensory perception, acumen and foresight to understand and fulfill the ever changing demands of security industry anywhere in INDIA Incessantly reinforcing its status as the most reliable security solution provider company armed with the latest and best security solution and most innovative style of working, FutureTech Automation Services is an outfit of totally dedicated professionals supported by sound infrastructure, adequate supply of equipment, immaculate policies and a spark in the eyes to reach the pinnacles of excellence in the field.</p><br>
			<p>The most renowned importers of security equipments Vast range of products Huge quantity of equipments readily available at short notice Service back up beyond comparison Support available across all major cities in India Highly motivated and performance driven organization.</p>

		</div>
		<div id="footer">&copy; FutureTechAutomation.All rights reserved.
		</div>

			<% }




		else
		{
				 RequestDispatcher rd=request.getRequestDispatcher("loginerror.html");
				rd.forward(request,response);

		 }
		}

		statement.close();

		conn.close();

		columns.close(); %>
	</body>
</html>
