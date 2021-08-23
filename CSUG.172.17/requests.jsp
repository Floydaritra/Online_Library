<%@include file="connect.jsp"%>
<center>
<title>Request status</title>
<form action="search.jsp" method=post>
	<select name=type>
	<option>search by...</option>
	<option value=name>Search by name</option>
	<option value=aut>Search by Author</option>
	<option value=pub>Search by publisher</option>
	</select>
	<input type=text value="Search here..." name=key style="width: 300px">
	<input type=submit name=search>
		&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp 
	<a href="admin.html"><img src="book.png" style="width:100px;height:100px;"></img></a>
	&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp <a href="logout.jsp">log out</a>
</form>
<hr>
	
	
<body background="back.jpg">
<font face="Calibri">
<table  border=3 >
	STATUS OF THE BOOKS REQUESTED
<tr>
	<td><h1>USER NAME</h1></td>
	<td><h1>NAME OF THE BOOK</h1></td>
	<td><h1>AUTHOR</h1></td>
	<td><h1>PUBLISHER</h1></td>
	<td><h1>ACCEPT</h1></td>
	<td><h1>REFUSE</h1></td>
	</tr>

<% try{
	 Statement stmt=con.createStatement();
	 String q="select * from lib.bookread,lib.book where bookread.bid=book.bid and req='1' ";
	 ResultSet rs=stmt.executeQuery(q);
	 while(rs.next()){
		
	 String user=rs.getString(2);
	 int  bid=rs.getInt(1);
	 String book=rs.getString(6);
	 
	 %>
	 <form action="updateadmin.jsp" method=post>

	 
	 <center>
	
	 <tr>
		<input type=hidden name=bid value=<%=bid%>><input type=hidden name=uid value=<%=user%>>
		<td><%=user%></td>
		<td><%=book%></td>
		<td><%out.println(rs.getString(7));%></td>
		<td><%out.println(rs.getString(8));%></td>
		<td><input type=submit name=n value=ACCEPT></td>
		<td><input type=submit name=n value=REFUSE></td>
	 </tr>
	 </center>
	 </form>
<%}

	con.close();
}
	 catch(Exception e){}
%></table>