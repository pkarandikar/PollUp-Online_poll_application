<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*,java.util.*,javax.mail.*,javax.mail.internet.*,javax.activation.*,javax.servlet.http.*,javax.servlet.*" %>

<%
	String user = request.getParameter("username");
	String email = request.getParameter("email");
	String url ="http://localhost:4444/pollup/rpass.jsp?user="+user+"&token=";
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pollup","root","");
	Statement st = con.createStatement();
	
	ResultSet rs = st.executeQuery("Select * from user where uname='"+user+"' and email='"+email+"'");
	if(rs.next())
	{
		String letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
      	String token = "";
	 	 final java.util.Random r = new java.security.SecureRandom();
     	 for (int i=0; i<32; i++)
      	 {
          int index = (int)(r.nextDouble()*letters.length());
          token += letters.substring(index, index+1);
     	 }
		 url+=token;
		 st.executeUpdate("UPDATE `user` SET `token`='"+token+"' WHERE uname='"+user+"'");
		 
		 
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
      message.setSubject("PollUP: Reset Password");
      // Now set the actual message
      message.setText(url);
      // Send message
      Transport.send(message);
			 
		response.sendRedirect("fpass1.jsp");	 
	}
	else
	{
		response.sendRedirect("fpass.jsp?iu=invalid username or email");
	}

%>
<% st.close();con.close();%>
