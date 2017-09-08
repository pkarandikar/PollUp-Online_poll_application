<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>

<%@ page import="java.io.*,java.util.*,javax.mail.*,javax.mail.internet.*,javax.activation.*,javax.servlet.http.*,javax.servlet.*" %>
<%
String qid = request.getParameter("qid");
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pollup","root","");
	Statement st = con.createStatement();

	st.executeUpdate("UPDATE `question` SET `status`='inactive' WHERE qid="+qid);
	
	ResultSet rs= st.executeQuery("select * from question where qid="+qid);
	rs.next();
	String usr= rs.getString(3);
	String quest = rs.getString(2);
	int total = rs.getInt(7);
	int up = rs.getInt(8);
	int down = rs.getInt(9);
	
	ResultSet ra =st.executeQuery("select * from answer where qid="+qid);
	ra.last();
	int no = ra.getRow();
	String ans[] = new String[no];
	int vote[] = new int[no];
	int per[] = new int[no];
	String answers = "";
	ra.beforeFirst();
	int cnt=0;
	while(ra.next())
	{
		answers+=ra.getString(2)+"\t\t"+ra.getString(4)+"votes("+(ra.getInt(4)*100)/total+"%)\n";
	}
	ResultSet rs2 = st.executeQuery("select * from `user` where uname='"+usr+"'");
	rs2.next();
	String email = rs2.getString(4);
	  Properties properties = new Properties();

   // Setup mail server
   properties.put("mail.smtp.host", "smtp.gmail.com");
   properties.put("mail.smtp.socketFactory.port", "465");
   properties.put("mail.smtp.socketFactory.class",  
            "javax.net.ssl.SSLSocketFactory");  
  properties.put("mail.smtp.auth", "true");  
  properties.put("mail.smtp.port", "465");  
   

   // Get the default Session object.
   Session mailSession = Session.getInstance(properties,new javax.mail.Authenticator() {  
   protected PasswordAuthentication getPasswordAuthentication() {  
   return new PasswordAuthentication("pollupmail@gmail.com","itisnottemplate");//change accordingly  
   }  
  });

      // Create a default MimeMessage object.
      MimeMessage message = new MimeMessage(mailSession);
      // Set From: header field of the header.
      message.setFrom(new InternetAddress("pollupmail@gmail.com"));
      // Set To: header field of the header.
      message.addRecipient(Message.RecipientType.TO,
                               new InternetAddress(email));
      // Set Subject: header field
      message.setSubject("Poll Stopped");
      // Now set the actual message
      message.setText("Hello "+usr+"\nYou have Stopped Poll here are results \nQuestion: \n"+quest+"\nAnswers:  \n"+answers+"\nThumbs up"+up+"\nThumbs down"+down);
      // Send message
      Transport.send(message);
	
	
	
	
	
	response.sendRedirect("myacc.jsp");




%>
<% st.close();con.close();%>