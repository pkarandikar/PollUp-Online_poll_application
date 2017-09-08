<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%

	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pollup","root","");
	
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String date = request.getParameter("date");
	String uname = request.getParameter("username");
	String pass = request.getParameter("password");
	String rpass = request.getParameter("rpassword");
	String iu=null;
	String pdm=null;
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("SELECT * FROM `user` where uname='"+uname+"';");
	if(!pass.equals(rpass))
	{
		pdm="1";
	}
	if(rs.next())
	{
		iu="1";
	}
	if(iu==null && pdm==null)
		{
		st.executeUpdate("INSERT INTO `user`(`uname`, `password`, `name`, `email`, `birthdate`) VALUES ('"+uname+"','"+pass+"','"+name+"','"+email+"','"+date+"')");
		response.sendRedirect("login.jsp?username="+uname+"&password="+pass);
		}
	
	String arg = "";
	if(iu!=null && pdm==null)
	{
		arg="iu=1";	
	}
	else if(iu==null && pdm!=null)
	{
		arg="pdm=1";	
	}
	else if(iu!=null && pdm!=null)
	{
		arg="pdm=1&iu=1";	
	}
	if(iu!=null || pdm!=null)
	{
		request.getRequestDispatcher("index.jsp?"+arg).forward(request, response);
	}
	
	


%>
<% st.close();con.close();%>