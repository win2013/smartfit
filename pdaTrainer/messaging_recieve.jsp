<%@page contentType="text/html"%>
<%@include file="imports.jsp"%>
<%@include file="init.jsp"%>
<%
	Iterator i = null;
	String title = "";
	String link = "";
	String routineType = "";
	if (client == null)
	{
		i = trainer.getRoutines().iterator();
		title = "Generic Routines";
		link = "createRoutine01.jsp";
		routineType = "Generic";
	}
	else
	{
		i = client.getRoutines().iterator();
		title = "Routines:  " + client.getFirstName() + " " + client.getLastName();
		link = "createRoutine01.jsp?id=" + client.getID();
		routineType = "Member";
	}
%>
<%
	String backButtonImage = "";
	String backButtonLink = "";
	if (client == null)
	{
		backButtonImage = "buttons/mainMenu.gif";
		backButtonLink = "main.jsp";
	}
	else
	{
		backButtonImage = "buttons/mainMembers.gif";
		backButtonLink = "memberSelect.jsp";
	}
%>
<%
    Message message = message = (Message)trainer.getNewMessages().elementAt(0);
    String action = request.getParameter("action");
    String todo = request.getParameter("todo");
    if (action == null)
        action = "";   
    if (action.equals("reply")) {
        if (todo.equals("save")) {
            trainer.removeNewMessage(message);
            trainer.addMessage(message);
        }
        if (todo.equals("delete")) {
            trainer.removeNewMessage(message);
        }
        String aa = "messaging_send.jsp?userID=" + message.getSender().getID() + "&subject=(reply)" + message.getSubject();
        System.out.println(aa);
        response.sendRedirect(aa);
        return;
    }
    if (action.equals("continue")) {
        if (todo.equals("save")) {
            trainer.removeNewMessage(message);
            trainer.addMessage(message);
        }
        if (todo.equals("delete")) {
            trainer.removeNewMessage(message);
        }
        String messageReturn = (String)session.getAttribute("messageReturn");
        session.removeAttribute("messageReturn");
        response.sendRedirect(messageReturn);
        return;
    }
    System.out.println(action + ", " + todo);
%>
<html>
<head>
<title>Routines</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<body bgcolor="#ffffff" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" >
<table border="0" cellpadding="0" cellspacing="0" width="226">
  <tr>
   <td><img src="images/spacer.gif" width="8" height="1" border="0" alt=""></td>
   <td><img src="images/spacer.gif" width="4" height="1" border="0" alt=""></td>
   <td><img src="images/spacer.gif" width="132" height="1" border="0" alt=""></td>
   <td><img src="images/spacer.gif" width="12" height="1" border="0" alt=""></td>
   <td><img src="images/spacer.gif" width="55" height="1" border="0" alt=""></td>
   <td><img src="images/spacer.gif" width="4" height="1" border="0" alt=""></td>
   <td><img src="images/spacer.gif" width="11" height="1" border="0" alt=""></td>
   <td><img src="images/spacer.gif" width="1" height="1" border="0" alt=""></td>
  </tr>

  <tr>
   <td colspan="7"><img name="pda2_r1_c1" src="images/pda2_r1_c1.gif" width="226" height="7" border="0" alt=""></td>
   <td><img src="images/spacer.gif" width="1" height="7" border="0" alt=""></td>
  </tr>
  <tr>
   <td colspan="4"><img name="pda2_r2_c1" src="images/pda2_r2_c1.gif" width="156" height="11" border="0" alt=""></td>
    <td rowspan="2" colspan="2"><a href="<%=backButtonLink%>" ><img src="<%=backButtonImage%>" alt="Main Menu" name="Image27" width="59" height="14" border="0"></a></td>
   <td rowspan="6"><img name="pda2_r2_c7" src="images/pda2_r2_c7.gif" width="11" height="255" border="0" alt=""></td>
   <td><img src="images/spacer.gif" width="1" height="11" border="0" alt=""></td>
  </tr>
  <tr>
   <td rowspan="3" colspan="2"><img name="pda2_r3_c1" src="images/pda2_r3_c1.gif" width="12" height="18" border="0" alt=""></td>
    <td rowspan="2" bgcolor="#CCCCFF"><strong><font size="1" face="Arial, Helvetica, sans-serif">Messaging</font></strong></td>
   <td rowspan="3"><img name="pda2_r3_c4" src="images/pda2_r3_c4.gif" width="12" height="18" border="0" alt=""></td>
   <td><img src="images/spacer.gif" width="1" height="3" border="0" alt=""></td>
  </tr>
  <tr>
   <td rowspan="2" colspan="2"><img name="pda2_r4_c5" src="images/pda2_r4_c5.gif" width="59" height="15" border="0" alt=""></td>
   <td><img src="images/spacer.gif" width="1" height="11" border="0" alt=""></td>
  </tr>
  <tr>
   <td><img name="pda2_r5_c3" src="images/pda2_r5_c3.gif" width="132" height="4" border="0" alt=""></td>
   <td><img src="images/spacer.gif" width="1" height="4" border="0" alt=""></td>
  </tr>
  <tr>
    <td rowspan="2"><img name="pda2_r6_c1" src="images/pda2_r6_c1.gif" width="8" height="226" border="0" alt=""></td>
    <td colspan="4" valign="top">
<form name="mainForm" method="post" action="messaging_recieve.jsp">
        <table width="90%" border="0" align="center" cellpadding="1" cellspacing="0" height="118">
          <tr> 
            <td width="66%" height="16" colspan="2" class="sectionText"><strong><font color="#000000" size="2" face="Arial, Helvetica, sans-serif">Message 
              Recieved </font></strong></td>
          </tr>
          <tr> 
            <td colspan="2" bgcolor="#3366CC"> <div align="left"><strong><font color="#FFFFFF" size="1" face="Arial, Helvetica, sans-serif">Sender: 
                </font></strong><font color="#FFFFFF" size="1" face="Arial, Helvetica, sans-serif"><%=message.getSender().getFirstName() + " " + message.getSender().getLastName()%></font></div></td>
          </tr>
          <tr> 
            <td colspan="2"><font size="1" face="Arial, Helvetica, sans-serif"><strong>Subject:</strong> 
              <%=message.getSubject()%> </font></td>
          </tr>
          <tr> 
            <td colspan="2"><font size="1" face="Arial, Helvetica, sans-serif"><strong>Time 
              Sent:</strong> <%=SMUtils.parseDateAndTime(message.getSendTime())%></font></td>
          </tr>
          <tr> 
            <td colspan="2"><font size="1" face="Arial, Helvetica, sans-serif"><%=message.getContent()%></font></td>
          </tr>
          <tr> 
            <td><div align="center"><font size="1" face="Arial, Helvetica, sans-serif">
              <div align="left"><a href="messaging_recieve.jsp?action=reply&todo=save"><img src="buttons/replySave.gif" width="77" height="19" border="0"></a></div></td>
            <td><div align="left"><a href="messaging_recieve.jsp?action=continue&todo=save"><img src="buttons/contSave.gif" width="93" height="19" border="0"></a></div></td>
          </tr>
          <tr> 
            <td><div align="left"><a href="messaging_recieve.jsp?action=reply&todo=delete"><img src="buttons/replyDelete.gif" width="89" height="19" border="0"></a></div></td>
            <td><div align="right"><a href="messaging_recieve.jsp?action=continue&todo=delete"><img src="buttons/contDelete.gif" width="105" height="19" border="0"></a></div></td>
          </tr>
        </table>
            </form></td>
   <td rowspan="2"><img name="pda2_r6_c6" src="images/pda2_r6_c6.gif" width="4" height="226" border="0" alt=""></td>
   <td><img src="images/spacer.gif" width="1" height="214" border="0" alt=""></td>
  </tr>
  <tr>
   <td colspan="4"><img name="pda2_r7_c2" src="images/pda2_r7_c2.gif" width="203" height="12" border="0" alt=""></td>
   <td><img src="images/spacer.gif" width="1" height="12" border="0" alt=""></td>
  </tr>
</table>
</body>
</html>