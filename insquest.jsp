<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%

	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pollup","root","");
	Statement st = con.createStatement();
	
	Cookie ck = null;
	Cookie[] cs = null; 
	String uname="";
	cs = request.getCookies();
	if(cs!=null)
	{
		for (int i = 0; i < cs.length; i++)
		{
			ck = cs[i];
			if(ck.getName().equals("user"))
			{
				uname=(String) ck.getValue();		 
			}
		}
	}
	
	String quest = (String) request.getParameter("aquest");
	int no = Integer.parseInt((String)request.getParameter("no"));
	java.util.Date date= new java.util.Date();
	Timestamp t= new Timestamp(date.getTime());
	String ans[] = new String[no];
	
	for(int i=0;i<no;i++)
	{
		ans[i]= (String)request.getParameter("aans"+(i+1));
		out.println(ans[i]);
	}
	String skey=(String) request.getParameter("skey");
	String type=(String) request.getParameter("type");
	String edate=(String) request.getParameter("edate");
	String time=(String) request.getParameter("etime");
	Timestamp et= Timestamp.valueOf(edate+" "+time+":00.000");
	String Query ="INSERT INTO `question`(`question`, `asker`, `type`, `expire`, `askedon`,`keyword`) VALUES ('"+quest+"','"+uname+"','"+type+"','"+et+"','"+t+"','"+skey+"')";
	PreparedStatement pstmt = con.prepareStatement(Query, Statement.RETURN_GENERATED_KEYS);  
	pstmt.executeUpdate();  
	ResultSet keys = pstmt.getGeneratedKeys();    
	keys.next();  
	int id = keys.getInt(1);
	
	String sql = "INSERT INTO `answer`(`answer`, `qid`) VALUES (?,"+id+")";
	PreparedStatement ps = con.prepareStatement(sql);
	for(int i=0;i<no;i++)
	{
		ps.setString(1,ans[i]);
		ps.execute();
	}
	
	response.sendRedirect("addq.jsp?add=yes");
	
%>
<% st.close();con.close();%>
