<%
String letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";

      String pw = "";
	  final java.util.Random r = new java.security.SecureRandom();
      for (int i=0; i<8; i++)
      {
          int index = (int)(r.nextDouble()*letters.length());
          pw += letters.substring(index, index+1);
      }
	  out.print(pw);
%>