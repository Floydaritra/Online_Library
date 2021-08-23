<%@ include file="search.html"%>
<%@include file="connect.jsp"%>
<title>Status of the requested books</title>
<body background="back.jpg">
<font face="Calibri">
<table  border=3 >
	<br><h2>STATUS OF THE BOOKS REQUESTED</h2><br>
<tr>
	<td><h1>NAME OF THE BOOK</h1></td>
	<td><h1>AUTHOR</h1></td>
	<td><h1>PUBLISHER</h1></td>
	<td><h1>STATUS</h1></td>
	</tr>
<%try{

 Statement stmt=con.createStatement();
 String userid=(String)session.getAttribute("userid");
 String q="select  * from bookread,book where bookread.bid=book.bid and req=1 and userid='"+userid+"'";
 ResultSet rs=stmt.executeQuery(q);
 while(rs.next())
 {

 %>
 <tr>
	<td><%=rs.getString(6)%></td>
	<td><%=rs.getString(7)%></td>
	<td><%=rs.getString(8)%></td>
	<td>DONE</td>
	</tr>

<%	
 }
 con.close();
}
 catch(Exception e){}
%></table>