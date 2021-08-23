<%@ include file="search.html"%>
<%@include file="connect.jsp"%>
<title>Downloadable books</title>
<body background="back.jpg">
<font face="Calibri">
<body ><h2>:::BOOK YOU CAN READ:::</h2><br><br><br>
<center>
<table border=3>
	<td><h1>NAME OF THE BOOK</h1></td>
	<td><h1>AUTHOR</h1></td>
	<td><h1>PUBLISHER</h1></td>
	<td><h1>DOWNLOAD LINK</h1></td>
<%
try{
	Statement stmt = con.createStatement();
	String userid=(String)session.getAttribute("userid");
	String q="select * from bookread,book where bookread.bid=book.bid and bookread.acc=1 and userid='"+userid+"'";
	ResultSet rs=stmt.executeQuery(q);
	while(rs.next()){
		String name=rs.getString(6);
		String loc=rs.getString(10);
	%>
	<tr>
		<td><%=name%></td>
		<td><%=rs.getString(7)%></td>
		<td><%=rs.getString(8)%></td>
		<td><a href="<%=loc%>" target="_blank"><% out.println(name); %>(PDF)</a></td>
		</tr>
	<%	
	}
	
	con.close();
	}
	catch(Exception e){}
	%></table></center></body>
	