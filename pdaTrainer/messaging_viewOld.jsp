<%@page contentType="text/html"%>
<%@include file="imports.jsp"%>
<%@include file="init.jsp"%>
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
<html>
<head>
<title>Routines</title>
<script>
function forward(httpLink)
{
	clientID = document.routinesForm.routines.value;
	httpLink = httpLink + '?routineID=' + clientID;
	window.location = httpLink;	
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<body bgcolor="#ffffff" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" >
<table border="0" cellpadding="0" cellspacing="0" width="226">
<!-- fwtable fwsrc="newPDADesign.png" fwbase="pda2.gif" fwstyle="Dreamweaver" fwdocid = "742308039" fwnested="0" -->
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
    <table width="100%" border="0" align="left" cellpadding="1" cellspacing="0" height="63">
        <tr> 
          <td width="53" height="12"> <div align="left"><strong><font size="1" face="Arial, Helvetica, sans-serif">Subject</font></strong></div></td>
          <td width="75"><div align="center"><font size="1" face="Arial, Helvetica, sans-serif"><strong>Sender</strong></font></div></td>
          <td width="69" height="12"> <div align="center"><strong><font size="1" face="Arial, Helvetica, sans-serif">Date</font></strong></div></td>
        </tr>
        <%
        	Enumeration enum = trainer.getMessages().elements();
                int count = 0;
                while (enum.hasMoreElements()) {
                    Message message = (Message)enum.nextElement();%>
        <tr bgcolor="<%=((count++%2==0) ?"#FFCC33" :"#FFFFFF")%>"> 
          <td height="11"><font size="1" face="Arial, Helvetica, sans-serif"><a href="messaging_view.jsp?messageID=<%=message.getID()%>"><%=message.getSubject()%></a></font></td>
          <td height="11"><div align="center"><font size="1" face="Arial, Helvetica, sans-serif"><a href="messaging_view.jsp?messageID=<%=message.getID()%>"><%=message.getSender().getFirstName() + " " + message.getSender().getLastName()%></a></font></div></td>
          <td height="11"><div align="center"><font size="1" face="Arial, Helvetica, sans-serif"><a href="messaging_view.jsp?messageID=<%=message.getID()%>"><%=SMUtils.parseDateShort(message.getSendTime())%></a></font></div></td>
        </tr>
        <%
        	}
        %>
        <tr> 
          <td height="19" colspan="2" bgcolor="#FFFFFF">&nbsp;</td>
          <td width="69" height="19"><div align="center"><a href="messaging_choose.jsp"><img src="buttons/back.gif" width="35" height="19" border="0"></a></div></td>
        </tr>
      </table> </td>
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