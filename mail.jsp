<%@ page import="java.io.*,java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*,javax.activation.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%
   String result;
   // Recipient's email ID needs to be mentioned.
   String to = "vigneetsompura@gmail.com";

   // Sender's email ID needs to be mentioned
   String from = "POLLup";

   // Assuming you are sending email from localhost
   String host = "localhost";

   // Get system properties object
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
      message.setFrom(new InternetAddress(from));
      // Set To: header field of the header.
      message.addRecipient(Message.RecipientType.TO,
                               new InternetAddress(to));
      // Set Subject: header field
      message.setSubject("Mail test 1");
      // Now set the actual message
      message.setText("<a href=\"test.jsp\"><button>Yes</button></a>");
      // Send message
      Transport.send(message);
      result = "Sent message successfully....";
   
%>
<html>
<head>
<title>Send Email using JSP</title>
</head>
<body>
<center>
<h1>Send Email using JSP</h1>
</center>
<p align="center">
<% 
   out.println("Result: " + result + "\n");
%>
</p>
</body>
</html>