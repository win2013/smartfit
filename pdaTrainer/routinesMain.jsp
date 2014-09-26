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
    <td rowspan="2" bgcolor="#CCCCFF"><strong><font size="1" face="Arial, Helvetica, sans-serif"><%=routineType%> Routines</font></strong></td>
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
<form name="routinesForm" method="post" action="">
        <table width="90%" border="0" align="center" cellpadding="1" cellspacing="0" height="182">
          <tr> 
            <td width="66%" height="16" class="sectionText"><strong><font color="#000000" size="2" face="Arial, Helvetica, sans-serif">Select 
              A Routine</font></strong></td>
          </tr>
          <tr valign="top"> 
            <td height="166"> <div align="center"><strong><font color="#999999" size="2"> 
                <select name="routines" size="9">
                  <%
                  		while (i.hasNext())
                  		{
                  			Routine routine = (Routine)i.next();
                  			out.println("<option value=\"" + routine.getID() + "\">" + routine.getName() + "</option>");
                  		}
                  %>
                </select>
                </font></strong> 
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td><strong><a href="createRoutine01.jsp"><img src="buttons/createNew.gif" width="70" height="19" border="0"></a><font color="#999999" size="2"></font></strong></td>
                    <td><strong><font color="#999999" size="2"><a href="javascript:forward('removeRoutine.jsp')"><img src="buttons/remove.gif" width="47" height="19" border="0"></a></font></strong></td>
                    <td><div align="right"><strong><a href="javascript:forward('createRoutineAgain.jsp')"><img src="buttons/modify.gif" width="45" height="19" border="0"></a></strong></div></td>
                  </tr>
                </table>
                <strong><font color="#999999" size="2"> </font></strong></div></td>
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