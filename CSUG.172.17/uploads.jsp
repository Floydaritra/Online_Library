<%@ include file="connect.jsp"%>

<%try{
	String nm=request.getParameter("nm");
	String aut=request.getParameter("aut");
	String pub=request.getParameter("pub");
	String gen=request.getParameter("gen");
	String fl=request.getParameter("fl");
	PreparedStatement pst=con.prepareStatement("Select max(bid) from lib.book");
		int bid=0;
		ResultSet rs=pst.executeQuery();
		if(rs.next())
			{bid=rs.getInt(1);
			 bid=bid+1;
			}
	PreparedStatement pst1=con.prepareStatement("Insert into lib.book values (?,?,?,?,?,?)");
	
	pst1.setInt(1,bid);
	pst1.setString(2,nm);
	pst1.setString(3,aut);
	pst1.setString(4,pub);
	pst1.setString(5,gen);
	pst1.setString(6,fl);
	int t=pst1.executeUpdate();
	
		if(t>0)
		{
			%>
			<body background="pic.png" >
			<center>
			<font color=blue size="10" face="Calibri">
			<br><br>:::BOOK UPLOADED SUCCESSFULLY:::<br><br>
			<a href="index.html"><img src="home.png" style="width:100px;height:100px;"></img></a>
			<%
			con.close();
		}
		else{
			out.println("upload unsucessful");
		response.sendRedirect("index.html");}
		con.close();
		}
		
		catch(Exception e){
			%>
			<body background="pic.png" >
			<center>
			<font color=red size="15" face="Calibri">
			<br><br>:::BOOK ALREADY EXISTS:::<br><br>
			<a href="index.html"><img src="home.png" style="width:100px;height:100px;"></img></a>
			<%
		}
%>		