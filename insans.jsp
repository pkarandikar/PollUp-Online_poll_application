<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%
if(request.getMethod().equals("POST"))
{
 	String updown = request.getParameter("th");
	String aid = request.getParameter("ans"); 
	String qid = request.getParameter("que");
	String src = request.getParameter("src");

	String usr="";
	Cookie ck = null;
   	Cookie[] cs = null; 
	cs = request.getCookies();
	if(cs!=null)
	{
		for (int i = 0; i < cs.length; i++)
		{
			ck = cs[i];
			if(ck.getName().equals("user"))
			{
				usr = ck.getValue();
			}
		}
	}

	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pollup","root","");
	Statement st = con.createStatement();
	
	ResultSet rs=st.executeQuery("select * from question where qid="+qid);
	rs.next();
	Date exp = rs.getDate(5);
	java.util.Date now = new java.util.Date();
	if(now.compareTo(exp)<0)
	{
	int answered = rs.getInt(7);
	if(!aid.equals(""))
	answered++;
	int up = rs.getInt(8);
	int down = rs.getInt(9);
	if(updown.equals("1"))
		up++;
	else if(updown.equals("-1"))
		down++;
		st.executeUpdate("UPDATE `question` SET `answered`="+answered+",`up`="+up+",`down`="+down+" WHERE qid="+qid);
	}
	else
	{
		st.executeUpdate("UPDATE `question` SET `status`='expired' where qid="+qid);
	}
	if(!aid.equals(""))
	{
	ResultSet rs2=st.executeQuery("select * from answer where aid="+aid);
	rs2.next();
	int cnt = rs2.getInt(4);
	cnt++;
	ResultSet rm=st.executeQuery("select * from answer where qid="+qid+" order by `count` DESC");
	rm.next();
	String mid = rm.getString(1);
	ResultSet rs3=st.executeQuery("select * from `user` where uname='"+usr+"'");
	rs3.next();
	int uans = rs3.getInt(7)+1;
	int umaj = rs3.getInt(8);
	if(mid.equals(aid))
	{
		umaj++;
	}
	
	st.executeUpdate("UPDATE `answer` SET `count`="+cnt+" WHERE aid="+aid);
	st.executeUpdate("UPDATE `user` SET `ans`="+uans+",`maj`="+umaj+" WHERE uname='"+usr+"'");

	if(request.getParameter("sbox")==null)
	{
	response.sendRedirect("ans.jsp?src="+src+"&qid="+qid);
	}
	else
	{
		response.sendRedirect("ans.jsp?src="+src+"&qid="+qid+"&sbox="+request.getParameter("sbox"));
	}
	}
	else
	{
		if(request.getParameter("sbox")==null)
	{
			response.sendRedirect(src);	
	}
	else
	{
		response.sendRedirect(src+"?sbox="+request.getParameter("sbox"));
	}
		
	}
	st.close();
	con.close();
}

%>

