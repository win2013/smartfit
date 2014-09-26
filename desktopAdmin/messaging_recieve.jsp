<%@include file="imports.jsp"%>
<%
    Message message = (Message)admin.getNewMessages().elementAt(0);
    String action = request.getParameter("action");
    if (action == null)
        action = "";
    
    if (action.equals("replyandsave")) {
        admin.addMessage(message);
        admin.removeNewMessage(message);
        Vector selected = new Vector();
        selected.add(message.getSender());
        session.setAttribute("selected", selected);
        response.sendRedirect("messaging_send.jsp?subject=(reply)" + message.getSubject());
        return;
    } else if (action.equals("replyanddelete")) {
        Vector selected = new Vector();
        selected.add(message.getSender());
        session.setAttribute("selected", selected);
        admin.removeNewMessage(message);
        response.sendRedirect("messaging_send.jsp?subject=(reply)" + message.getSubject());        
    } else if (action.equals("continueandsave")) {
        admin.removeNewMessage(message);
        admin.addMessage(message);
        String link = (String)session.getAttribute("messageReturn");
        session.removeAttribute("messageReturn");
        response.sendRedirect(link);
        return;
    } else if (action.equals("continueanddelete")) {
        admin.removeNewMessage(message);
        String link = (String)session.getAttribute("messageReturn");
        session.removeAttribute("messageReturn");
        response.sendRedirect(link);
        return;
    }
    System.out.println(action);
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
            <td bgcolor="#99CCFF" class="largeHeading"> <div align="center">Recieved 
                Message from <%=message.getSender().getFirstName() + " " + message.getSender().getLastName()%></div></td>
          </tr>
        </table>
        <table width="100%" border="0" align="center" cellpadding="3" cellspacing="0">
          <tr bgcolor="#FFFFFF"> 
            <td colspan="2" class="largeHeading"><%=message.getSubject()%></a></td>
            <td width="50%" class="largeHeading">Time Sent: <%=SMUtils.parseDateAndTime(message.getSendTime())%></td>
          </tr>
        </table>
        <table width="100%" border="0" cellpadding="2" cellspacing="0" class="tableTop">
          <tr>
            <td class="normalText"><%=message.getContent()%></td>
          </tr>
        </table>
        <table width="100%" border="0" cellpadding="2" cellspacing="0" class="tableTop">
          <tr class="largeHeading"> 
            <td width="25%"> 
              <div align="center" class="largeHeading"><a href="messaging_recieve.jsp?action=replyandsave">Reply and Save</a></div></td>
            <td width="25%"> 
              <div align="center"><a href="messaging_recieve.jsp?action=replyanddelete">Reply and Delete</a></div></td>
            <td width="25%"> 
              <div align="center"><a href="messaging_recieve.jsp?action=continueandsave">Continue and Save</a></div></td>
            <td width="25%"> 
              <div align="center"><a href="messaging_recieve.jsp?action=continueanddelete">Continue and Delete</a></div></td>
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
