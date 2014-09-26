<%@include file="imports.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="admin.css" rel="stylesheet" type="text/css">
<style type="text/css">
A:link {text-decoration: none}
A:visited {text-decoration: none}
A:active {text-decoration: none}
A:hover {text-decoration: underline; color: #000099;}
</style>
</head>

<body bgcolor="#ffffff" link="#3333CC" vlink="#3333CC" alink="#0099FF" >
<form name="form1" method="post" action="">
  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="boxBorder">
    <tr> 
      <td><table width="100%" border="0" cellpadding="2" cellspacing="0" align="center" class="tableTop">
          <tr> 
            <td bgcolor="#99CCFF" class="largeHeading"> <div align="center">Archived 
                Messages for <%=trainer.getFirstName() + " " + trainer.getLastName()%></div></td>
          </tr>
        </table>
        <table width="100%" border="0" align="center" cellpadding="3" cellspacing="0">
          <tr bgcolor="#FFFFFF"> 
            <td width="40%" class="largeHeading">Message Subject</td>
            <td width="25%" class="largeHeading">Date and Time Recieved</td>
            <td width="35%" class="largeHeading">Sender</td>
          </tr>
          <%
    Enumeration enum = trainer.getMessages().elements();
    GregorianCalendar gc = new GregorianCalendar();
    int count = 0;
    while (enum.hasMoreElements()) {
        Message message = (Message)enum.nextElement();
        gc.setTimeInMillis(message.getSendTime());        
        int year = gc.get(Calendar.YEAR);
        int month = gc.get(Calendar.MONTH);
        int day = gc.get(Calendar.DAY_OF_MONTH);
        gc = new GregorianCalendar(year, month, day);
        String time = SMUtils.getTime(message.getSendTime() ,gc.getTimeInMillis() );
%>
          <tr class="normalText" <%= ( (count++%2==0) ?"#FFFFFF" :"#C7E1E9")%>> 
            <td width="51%"> <div align="left" class="normalText"><a href="messaging_view.jsp?messageID=<%=message.getID()%>"><%=message.getSubject()%></a></div></td>
            <td width="30%"><%=month + "/" + day + "/"  + year + "  " + time%></td>
            <td width="9%"><%=message.getSender().getFirstName() + " " + message.getSender().getLastName()%></td>
            <%
    }
%>
        </table></td>
    </tr>
  </table>
  <table width="100%" border="0" align="center" cellpadding="2" cellspacing="0">
    <tr> 
      <td><div align="right"><a href="javascript:history.back(1)" class="smallLinks">Back</a></div></td>
    </tr>
  </table>
  <div align="center"></div>
</form>
</body>
</html>
