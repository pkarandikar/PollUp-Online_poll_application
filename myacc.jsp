<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="myacc.jsp?pg=1" %>
<%
	String usr="";
	Cookie ck = null;
   	Cookie[] cs = null; 
	boolean log = false;
	cs = request.getCookies();
	if(cs!=null)
	{
		for (int i = 0; i < cs.length; i++)
		{
			ck = cs[i];
			if(ck.getName().equals("user"))
			{
				usr = ck.getValue();
				log= true;
			}
		}
	}
	if(!log)
	{
		response.sendRedirect("index.jsp");
	}
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pollup","root","");
	Statement st = con.createStatement();
	
	ResultSet rs = st.executeQuery("select * from question where asker='"+usr+"' order by askedon desc");
	rs.last();
	int qno=rs.getRow();
	String qid[]=new String[qno];
	String quest[]=new String[qno];
	String type[]=new String[qno];
	String exp[]=new String[qno];
	String addedon[]=new String[qno];
	String answered[]=new String[qno];
    String up[]=new String[qno];
	String down[]=new String[qno];
	String status[]=new String[qno];

	rs.beforeFirst();
	int i=0;
	while(rs.next())
	{
		qid[i]=rs.getString(1);
		quest[i]=rs.getString(2);
		type[i]=rs.getString(4);
		exp[i]=rs.getString(5);
		addedon[i]=rs.getString(6);
		answered[i]=rs.getString(7);
		up[i]=rs.getString(8);
		down[i]=rs.getString(9);
		status[i]=rs.getString(11);
		i++;
	}
	
	ResultSet rs2 = st.executeQuery("select * from `user` where uname='"+usr+"'");
	rs2.next();
	int qans = rs2.getInt(7);
	int qm = rs2.getInt(8);
	int qmaj;
	if(qans!=0)
	qmaj = (qm*100)/qans;
	else
	qmaj = 0;
	int maxpg = (qno/4)+1;
	if((qno%4)==0)
		maxpg--;
	int curr=0;
	if(request.getParameter("pg")!=null)
	{
		curr=Integer.parseInt( request.getParameter("pg"))-1;
	}
	int start = curr*4;
	int end = start+4;
	if(end>qno)
	end=qno;
	int ano[] = new int[end-start];
	String ans[][] = new String[end-start][5];
	int anscnt[][] = new int[end-start][5];
	int per[][] = new int[end-start][5];
	
	for(int a=start;a<end;a++)
	{
		ResultSet ra2 = st.executeQuery("select * from answer where qid="+qid[a]);
		ra2.last();
		ano[a-start]=ra2.getRow();
		ra2.beforeFirst();
		int cc=0;
		while(ra2.next())
		{
			ans[a-start][cc]=ra2.getString(2);
			anscnt[a-start][cc]=ra2.getInt(4);
			if(java.lang.Integer.parseInt(answered[a])!=0)
			{
			per[a-start][cc]=(anscnt[a-start][cc]*100)/java.lang.Integer.parseInt(answered[a]);
			}
			else
			{
				per[a-start][cc]=0;
			}
			cc++;
		}
	}
	
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link href="css/main.css" rel="stylesheet" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
</head>


<body>
	<%@include file="top.jsp"%>
    <div id="Quest" style="padding-top:30px; height:440px; padding-bottom:30px;">
    	<h1 style="color:#09c; font-size:25px;">Hello,<%=usr%>..!!</h1>
        <table width="750px" >
        <tr style="color:#09c;font-size:20px; text-align:center">
        	<td>Answered</td>
            <td>Answered as majority</td>
            <td>Questions asked</td>
        </tr>
        <tr style="color:#f79120;font-size:20px; text-align:center">
        	<td><%=qans%></td>
            <td><%=qmaj%>%</td>
            <td><%=qno%></td>
        </tr>
        </table>
        <div id="lquest">
      	<div id="myquest" style="text-align:center;color:#09c;">
        <h1>Your Questions</h1>
        
        <% for(int c=start;c<end;c++){ %>
        	<div id="q<%=c%>" class="lq">
            	<%=quest[c]%>
            </div>
        <%}%>
        </div>
    	<a href="<%
			if(curr==0)
				out.print("#");
				else
				out.print("myacc.jsp?pg="+(Integer.parseInt(request.getParameter("pg"))-1));
		%>"><div class="page">Previous</div></a>
        <div id="pg">
        <form action="myacc.jsp" method="get">
        <select name="pg" id="pgno">
        	<%for(int c=0;c<maxpg;c++){%>
            	<option value="<%=c+1%>"><%=c+1%></option>
            <%}%>
        </select>
        </div>
        <button class="page">Go</button>
        </form>       <a href="<%
			if(curr==maxpg-1)
				out.print("#");
				else
				out.print("myacc.jsp?pg="+(curr+2));
		%>"> <div class="page">Next</div></a>
        </div>
	</div>
    <%for(int c=start;c<end;c++){%>
    	<div id="que<%=c%>" class="qdiv">
        	<div class="quediv"><%=quest[c]%></div>
            <div class="close">X</div>
            <table width="700px" align="center" height="200px" class="antab">
            <tr style="color:#f79120;">
            	<td width="400px">Answers</td>
                <td width="150px">Votes</td>
                <td width="150px">Percentagde</td>
            </tr>
            	<%for(int a=0;a<ano[c-start];a++){%>
                	<tr height="30px">
                    <td><%=ans[c-start][a]%></td>
                    <td><%=anscnt[c-start][a]%></td>
                    <td><%=per[c-start][a]%>%</td>
                    </tr>
                <%}%>
                <tr style="color:#f79120">
                <td>Total</td>
                <td><%=answered[c]%></td>
                </tr>
            </table>
           <div style="position:absolute;bottom:10px;width:100%">
           			<table width="600px" style="float:left;color:#09c;text-align:center;">
                    <tr>
                    	<td>Thumbs UP/DN</td>
                        <td>Expire on</td>
                        <td>Status</td>
                    </tr>
                    <tr style="color:#f79120">
                    	<td><%=up[c]%>/<%=down[c]%></td>
                        <td><%=exp[c]%></td>
                        <td><%=status[c]%></td>
                        </tr>
                    </table>
                    <a style="text-decoration:none;" href="<%
                    if(status[c].equals("active"))
						out.print("stop.jsp?qid="+qid[c]);
						else
						out.print("start.jsp?qid="+qid[c]);
                    %>"><div class="page"><%
					if(status[c].equals("active"))
						out.print("Stop");
						else
						out.print("Start");
					%></div></a>
           </div>
            
        </div>
	<%}%>
<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/jquery-ui.js"></script>
<script src="js/script.js"></script>
<script src="js/jquery.js"></script> 

<script>
	<%for(int c=start;c<end;c++){%>
		$("#q<%=c%>").click(function(e) {
            $("#Quest").css("display","none");
			$("#que<%=c%>").css("display","block");
        });
	<%}%>
	$(".close").click(function(e) {
        $(".qdiv").css("display","none");
		$("#Quest").css("display","block");
    });
</script>
</body>
<% st.close();con.close();%>
</html>