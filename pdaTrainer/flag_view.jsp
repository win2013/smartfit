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
<%
    String flagID = request.getParameter("flagID");
    ExerciseFlag exerciseFlag = client.getExerciseFlag(Integer.parseInt(flagID));
    String back = (String)session.getAttribute("lastPage");

    String action = request.getParameter("action");
    if (action == null)
        action = "";
    if (action.equals("inactivate")) {
        exerciseFlag.setActive(false);
        exerciseFlag.setEndDate(System.currentTimeMillis());
        response.sendRedirect(back);
        return;
    }
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
    <td rowspan="2" bgcolor="#CCCCFF"><strong><font size="1" face="Arial, Helvetica, sans-serif">Flags</font></strong></td>
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
            <td width="66" height="16" colspan="2" class="sectionText"><strong><font color="#000000" size="2" face="Arial, Helvetica, sans-serif">View 
              Flag </font></strong></td>
          </tr>
          <tr> 
            <td colspan="2" bgcolor="#3366CC"> <div align="center"><font size="1" face="Arial, Helvetica, sans-serif"><%=exerciseFlag.getSubject()%></font></div></td>
          </tr>
          <tr> 
            <td colspan="2"><font size="1" face="Arial, Helvetica, sans-serif"><strong>Created 
              On:</strong> <%=SMUtils.parseDateAndTime(exerciseFlag.getDate())%> </font></td>
          </tr>
          <tr> 
            <td colspan="2"><font size="1" face="Arial, Helvetica, sans-serif"><strong>Created 
              By:</strong> <%=exerciseFlag.getCreator().getFirstName() + " " + exerciseFlag.getCreator().getLastName()%></font></td>
          </tr>
          <tr> 
            <td colspan="2"><font size="1" face="Arial, Helvetica, sans-serif"><strong>Exercise:</strong> 
              <%=exerciseFlag.getExerciseName()%></font></td>
          </tr>
          <tr> 
            <td colspan="2"><font size="1" face="Arial, Helvetica, sans-serif"><%=exerciseFlag.getContent()%></font></td>
          </tr>
          <tr> 
<%
    if (exerciseFlag.getCreator().getID() == trainer.getID()) {%>
            <td><div align="right"><a href="flag_view.jsp?action=inactivate&flagID=<%=exerciseFlag.getID()%>"><img border="0" src="buttons/makeInactive.gif" width="83" height="19"></a></div></td>
<%}%>
            <td><div align="right"><a href="<%=back%>"><img src="buttons/back.gif" border="0" width="35" height="19"></a></div></td>
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