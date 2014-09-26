<%@include file="imports.jsp"%>
<%
    Vector selected = (Vector)session.getAttribute("selected");
    StringBuffer userList = new StringBuffer();
    Enumeration enum = selected.elements();
    while (enum.hasMoreElements()) {
        User user = (User)enum.nextElement();
        userList.append(user.getFirstName() + " " + user.getLastName());
        if (enum.hasMoreElements())
            userList.append(", ");
    }

    String action = request.getParameter("action");
    if (action == null) 
        action = "";
    
    if (action.equals("Send")) {
        String subject = request.getParameter("subject");
        String messageContent = request.getParameter("messageContent");
        enum = selected.elements();
        while (enum.hasMoreElements()) {
            User user = (User)enum.nextElement();
            Message message = db.createMessage();
            message.setSendTime(System.currentTimeMillis());
            message.setSender(admin);
            message.setSubject(subject);
            message.setContent(messageContent);
            message.setActive(true);
            user.addNewMessage(message);
        }
        session.removeAttribute("selected");
        String link = (String)session.getAttribute("messageReturn");
        if (link == null)
            link = "messaging_main.jsp";
        session.removeAttribute("messageReturn");
        response.sendRedirect(link);
        return;
    }
   
    String subject = request.getParameter("subject");
    if (subject == null)
        subject = "";
%>
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
            <td bgcolor="#99CCFF" class="largeHeading"><div align="center">Compose 
                Message </div></td>
          </tr>
        </table>
        <table width="100%" border="0" align="center" cellpadding="3" cellspacing="0">
          <tr bgcolor="#FFFFFF"> 
            <td class="largeHeading">Message Recipient(s): <span class="normalText"><%=userList.toString()%></span></td>
          </tr>
        </table>
        <table width="100%" border="0" cellpadding="2" cellspacing="0" class="tableTop">
          <tr> 
            <td class="largeHeading">Message Subject: </td>
            <td class="largeHeading"><input type="text" name="subject" value="<%=subject%>"></td>
          </tr>
          <tr> 
            <td width="25%" class="largeHeading">Message Content:</td>
            <td width="83%" class="largeHeading"><textarea name="messageContent" cols="40" rows="3"></textarea></td>
          </tr>
        </table>
        <table width="100%" border="0" cellpadding="2" cellspacing="0">
          <tr>
            <td><div align="right" class="largeHeading">
                <input type="submit" name="action" value="Send">
              </div></td>
          </tr>
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
