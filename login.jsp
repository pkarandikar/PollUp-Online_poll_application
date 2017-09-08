<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%

	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pollup","root","");
	Statement st = con.createStatement();
	boolean flag =false;	
	String uname = request.getParameter("username");
	String pass=request.getParameter("password");
	
	ResultSet rs = st.executeQuery("select * from user where uname='"+uname+"'");
	if(rs.next())
	{
		if(pass.equals(rs.getString(2)))
		{
			flag=true;
		}
	}
	
	if(flag)
	{
		//session.setAttribute("user",uname);
		Cookie u = new Cookie("user",uname);
		u.setMaxAge(360000);
		response.addCookie(u);

		if(request.getParameter("stay")!=null)
		{
			//session.setAttribute("pass",pass);
			//String sesID = session.getId();
			Cookie p = new Cookie("pass",pass);
			p.setMaxAge(360000);
			response.addCookie(p);			
		}
		response.sendRedirect("home.jsp");
	}
	else
	{
		response.sendRedirect("index.jsp?err=f");
	}
%>
<% st.close();con.close();%>
