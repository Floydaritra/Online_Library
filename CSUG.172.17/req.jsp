<%@ include file="connect.jsp"%>

<%
	int bid=Integer.parseInt(request.getParameter("bid"));
	String uid=request.getParameter("userid");
	String type=request.getParameter("type");
	String key=request.getParameter("key");
	out.println(type+key);
	try{
	PreparedStatement pst1=con.prepareStatement("Insert into lib.bookread values (?,?,?,?)");
	
	pst1.setInt(1,bid);
	pst1.setString(2,uid);
	pst1.setInt(3,1);
	pst1.setInt(4,0);
	int t=pst1.executeUpdate();
	if(t>0)
	{%>
	
		<%response.sendRedirect("search.jsp");
	}
	con.close();
}
	catch(Exception e){}
	%>
	