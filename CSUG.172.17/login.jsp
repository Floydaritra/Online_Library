<%@ include file="connect.jsp"%>

<%try{
	String uid=request.getParameter("uid");
	String pass=request.getParameter("pass");
	String ad=request.getParameter("ad");
	
	Statement stmt=con.createStatement();
	
	String q1="select * from lib.book_user where userid='"+uid+"' and pass='"+pass+"'";

	ResultSet rs=stmt.executeQuery(q1);
	
	if(rs.next()){
		session.setAttribute("userid",uid);
		if(ad==null){
			
			response.sendRedirect("home.jsp");
		}
		
		else if(ad.equals("admin")){
			
				if(uid.equals("ADMIN"))
					response.sendRedirect("admin.html");
				else if(!uid.equals("ADMIN")){
					out.println("TRY LOGIN FROM USER LOGIN AREA");
		response.sendRedirect("login.html");}}
		
		
	}
	else{
%>
<center>
<font color=red>:::Invalid Userid or Password:::</font>
<a href="index.html"><imgsrc="home.png"></img></a>
<%
	}
	con.close();
}
catch(Exception e){}

%>
