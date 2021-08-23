<%@ include file="search.html"%>
<%@ include file="connect.jsp"%>
<title>Welcome to the library</title>
<body  background="back.jpg" >
<%

String a=(String) session.getAttribute("userid");
if(a==null)
{	
	//response.setIntHeader("refresh",1);
	response.sendRedirect("login.html");
	
	
}

out.println("<center><hl><font size=15 face='calibri'>WELCOME"+"   "+(String) session.getAttribute("userid"));
		
		%>
		</font>
		<form action="requested.jsp" method=post><br><br><br><br>
		<a href="requested.jsp">SEE THE REQUESTED FILES</a><br><br>
		</form>
		<form action="accepted.jsp" method=post><br>
		<a href="accepted.jsp">SEE THE ACCEPTED FILES</a><br><br>
		::BOOKS YOU HAVE READ::
		
	<%
		String userid=(String) session.getAttribute("userid");
		try{
			Statement stmt=con.createStatement();
			String q="select * from lib.bookread where userid='"+userid+"'";
			ResultSet rs=stmt.executeQuery(q);
			while(rs.next())
			{ 
				if(rs.getInt(4)==1)
				{
			
					
				}
				
				
				
			}
			con.close();
		}
			catch(Exception e){}
			con.close();
			
			%>