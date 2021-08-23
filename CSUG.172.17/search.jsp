<%@ page import="java.sql.*"%>
<%@ include file="search.html"%>
<title>Search results...</title>
<body background="back.jpg" >
<hr>
<center><font face="calibri">
<table border=3 >
	<tr>
					<td><h1>NAME OF BOOK</h1></td>
					<td><h1>AUTHOR</h1></td>
					<td><h1>PUBLISHER</h1></td>
					<td><h1>GENRE</h1></td>
					<td><h1>REQUEST</h1></td>
<% 
		String type=request.getParameter("type");
		String key=request.getParameter("key");
		if(key!=type){
		session.setAttribute("key",key);
		session.setAttribute("type",type);
		}
		else{
			type=(String) session.getAttribute("type");
			key=(String) session.getAttribute("key");
			
			
		}
		try{
			String k1="";
			
			Class.forName("oracle.jdbc.OracleDriver");
			
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","lib","lib");
			
			Statement stmt=con.createStatement();
			
			out.println("<br><br><center>SEARCH RESULTS FOR: ");
			if(type.equals("name"))
			{k1="name"; out.println("BOOK NAME: "+key);}
			else if(type.equals("aut"))	
			{k1="author"; out.println("AUTHOR: "+key);}
			else if(type.equals("pub"))
			{k1="pub"; out.println("PUBLISHER: "+key);}
			String userid=(String) session.getAttribute("userid");
			String q="select bid,name,author,pub,genre from lib.book,(select bid as r from book minus select bid as r from bookread where userid='"+userid+"') t where lib.book.bid=t.r and "+k1+" like '%"+key+"%'"	;
			
			int f=0;
			ResultSet rs=stmt.executeQuery(q);
			while(rs.next())
			{  	f=1;
				String bid=rs.getString(1);
				String name=rs.getString(2);%>
				
				<form action="req.jsp" method=post>
				
				<tr>
					<td><%out.println(name);%></td>
					<td><%out.println(rs.getString(3));%></td>
					<td><%out.println(rs.getString(4));%></td>
					<td><%out.println(rs.getString(5));%></td>
					<td><input type=submit value=Request></td>
				</tr>	
					<input type=hidden name=bid value=<%=bid%>>
					<input type=hidden name=userid value=<%=userid%>>
					
				</form>	
			
					
				
			<%}
			if(f==0)
			out.println("data not found");
			con.close();
			}
			catch(Exception e){}
			
			
			%>
			</table>