	
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="noresult.jsp" %>
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
<link href="../css/main.css" rel="stylesheet" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<%
	String search=request.getParameter("sbox");
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pollup","root","");
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("SELECT * FROM question where type='tvshows' ORDER BY RAND()  LIMIT 1");
	rs.next();
	String quest = rs.getString(2);
	int id = rs.getInt(1);
	ResultSet rs2 = st.executeQuery("select * from answer where qid="+id);
	rs2.last();
	int no=rs2.getRow();
	int i=0;
	int total=0;
	String aid[]=new String[no];
	String ans[]=new String[no];
	int acnt[]= new int[no];
	rs2.beforeFirst();
	while(rs2.next())
	{
		aid[i]=rs2.getString(1);
		ans[i]= rs2.getString(2);
		acnt[i]=rs2.getInt(4);
		total+=rs2.getInt(4);
		i++;
	}
	if(total==0)
	{
		total=1;
	}
%>
</head>
<body>

<%@include file="top.jsp"%>
<div id="Quest" style="padding-bottom:0px;height:450px;">
	<form action="../insans.jsp" id="ansub" method="post">
    <input id="th" type="hidden" name="th" value="0" />
    <input id="sa" type="hidden" name="ans"  />
    <input type="hidden" name="que" value="<%=id%>"  />
    <input type="hidden" name="src" value="categories/tvshow.jsp"  />
	<div style="width:700px;height:75px">
    	<h1><%=quest%></h1>
    </div>
    <% for(int c=0;c<i;c++){ %>
    <div id="a<%=c%>" class="answer" >
    	<h3><%=ans[c]%></h3>
    </div>
    <% }%>
    
    <button id="submitans">
    Skip
    </button>
    <div id="tup" class="thumbs">
    </div>
    <div id="tdown" class="thumbs">
    </div> 
    </form>
    
</div>

<script src="../js/jquery-1.11.1.min.js"></script>
<script src="../js/jquery-ui.js"></script>
<script src="../js/script.js"></script>
<script src="../js/jquery.js"></script>

<script>
	$("#tup").click(function(e) {
        $("#th").val("1");
		$("#tdown").css("background-image","url(../images/thumbsdown.png)");
		$("#tup").css("background-image","url(../images/thumbsups.png)");
		$("#submitans").html("Submit");
    });
	$("#tdown").click(function(e) {
        $("#th").val("-1");
		$("#tdown").css("background-image","url(../images/thumbsdowns.png)");
		$("#tup").css("background-image","url(../images/thumbsup.png)");
		$("#submitans").html("Submit");
    });
	<%for(int c=0;c<i;c++){%>
		$("#a<%=c%>").click(function(e){
			$("#sa").val("<%=aid[c]%>");
			$(".answer").css("background-color","#fff");
			$("#a<%=c%>").css("background-color","#f79120");
			$(".answer").css("color","#000");
			$("#a<%=c%>").css("color","#fff");
			$("#submitans").html("Submit");
			});
	
	<%}%>
</script>
<% st.close();con.close();%>
</body>
</html>