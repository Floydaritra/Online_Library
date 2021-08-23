
<%@ page import="java.sql.*"%>
<center>
<a href="index.html"><img src="home.png" style="width:100px;height:100px;"></img></a>
<body background="back.jpg" >
<hr>
<font  face="calibri">
<table border=3>
	<tr>
					<td><h1>NAME OF BOOK</h1></td>
					<td><h1>AUTHOR</h1></td>
					<td><h1>PUBLISHER</h1></td>
					<td><h1>GENRE</h1></td>
					

<% 
		String type=request.getParameter("type");
		String key=request.getParameter("key");
	
		try{
			String k1="";
			Class.forName("oracle.jdbc.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","lib","lib");
			
			Statement stmt=con.createStatement();
			
			out.println("<br><br><center>SEARCH RESULTS FOR: <mark>");
			if(type.equals("name"))
			{k1="name"; out.println("BOOK NAME: "+key+"</mark>");}
			else if(type.equals("aut"))	
			{k1="author"; out.println("AUTHOR: "+key+"</mark>");}
			else if(type.equals("pub"))
			{k1="pub"; out.println("PUBLISHER: "+key+"</mark>");}
			
			String q="select * from lib.book where "+k1+" like '%"+key+"%'"	;

			int f=0;
			ResultSet rs=stmt.executeQuery(q);
			while(rs.next())
			{
				%>
				<tr>
					<td><%out.println(rs.getString(2));%></td>
					<td><%out.println(rs.getString(3));%></td>
					<td><%out.println(rs.getString(4));%></td>
					<td><%out.println(rs.getString(5));%></td>
				</tr>
				<%
				f=1;
			}
			if(f==0)
			out.println("<mark>:::0 MATCHES:::</mark>");
			con.close();
			}
			catch(Exception e){}
			
			%>
			</table>