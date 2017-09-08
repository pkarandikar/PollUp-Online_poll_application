<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%
	/*if(session.getAttribute("user")==null)
	{
		response.sendRedirect("index.jsp");
	}*/
	Cookie ck = null;
   	Cookie[] cs = null; 
	boolean log = false;
	cs = request.getCookies();
	if(cs!=null)
	{
		for (int i = 0; i < cs.length; i++){
         ck = cs[i];
         if(ck.getName().equals("user"))
		 {
			 log= true;
		 }
      }
	}
	if(!log)
	{
		response.sendRedirect("index.jsp");
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link href="css/main.css" rel="stylesheet" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<%
	String src = request.getParameter("src");
	
	
	String qid = request.getParameter("qid");
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pollup","root","");
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("SELECT * FROM question where qid="+qid);
	rs.next();
	String quest = rs.getString(2);
	int id = rs.getInt(1);
	int total = rs.getInt(7);
	ResultSet rs2 = st.executeQuery("select * from answer where qid="+id);
	rs2.last();
	int no=rs2.getRow();
	int i=0;
	
	if(total==0)
	{
		total=1;
	}
	String aid[]=new String[no];
	String ans[]=new String[no];
	int acnt[]= new int[no];
	int per[]= new int[no];
	int fill[]= new int[no];
	rs2.beforeFirst();
	while(rs2.next())
	{
		aid[i]=rs2.getString(1);
		ans[i]= rs2.getString(2);
		acnt[i]=rs2.getInt(4);
		per[i]=(acnt[i]*100)/total;
		fill[i]=(acnt[i]*750)/total;
		i++;
	}
	
%>
</head>
<body>

<%@include file="top.jsp"%>
<div id="Quest" style="padding-bottom:0px;height:450px;">
	<form action="<%=src%>" id="ansub" method="get">
    <%
	if(request.getParameter("sbox")!=null)
	{
		out.print("<input type='hidden' name='sbox' value='"+request.getParameter("sbox")+"' >");
	}%>
	<div style="width:700px;height:75px">
    	<h1><%=quest%></h1>
    </div>
    <% for(int c=0;c<i;c++){ %>
    <div id="a<%=c%>" class="ansr" >
    	<h3><%=ans[c]%></h3>
    </div>
    <% }%>
    
    <button id="submitans">
    Next
    </button>
    </form>
    
</div>

<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/jquery-ui.js"></script>
<script src="js/script.js"></script>
<script src="js/jquery.js"></script>

<script>
	<% for(int c=0;c<i;c++){ %>
	 	$("#a<%=c%>").hover(function(){
			$("#a<%=c%>").html("<h3><%=per[c]%>%(<%=acnt[c]%> Votes)</h3>");
			},function(){
			$("#a<%=c%>").html("<h3><%=ans[c]%></h3>");
			});
	 <%}%>
	$(document).ready(function(e) {
        <% for(int c=0;c<i;c++){ %>
			$("#a<%=c%>").css("box-shadow","<%=fill[c]%>px 0px 0px #09c inset");
		<%}%>
    });
	 
</script>
<% st.close();con.close();%>

</body>
</html>