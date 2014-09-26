<%@page contentType="text/html"%>
<%@include file="../common/imports.jsp"%>
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
	String workoutSessionID = request.getParameter("workoutSession");
	String excerciseID = request.getParameter("excercise");
	String routineID = request.getParameter("routine");
	
	WorkoutSession workoutSession = client.getWorkoutSession(Long.parseLong(workoutSessionID));
	Routine routine = workoutSession.getRoutine(Long.parseLong(routineID));
    AnaerobicExcercise excercise = (AnaerobicExcercise)routine.getExcercise(Long.parseLong(excerciseID));
    
    Trainer t = workoutSession.getTrainer();
    
    GregorianCalendar gc = new GregorianCalendar();
    gc.setTimeInMillis(workoutSession.getStartTime());
    String date = SMUtils.getMonth(gc.get(Calendar.MONTH)) + " " + gc.get(Calendar.DAY_OF_MONTH) + "," + gc.get(Calendar.YEAR); 
    
    
	
%>
<html>
<head>
<title>pda2.gif</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<!-- Fireworks MX Dreamweaver MX target.  Created Wed May 14 12:19:09 GMT-0400 (Eastern Daylight Time) 2003-->

</head>
<body bgcolor="#ffffff" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
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
    <td rowspan="2" bgcolor="#CCCCFF"><strong><font color="#000000" size="1" face="Arial, Helvetica, sans-serif">Track 
      Performance</font></strong></td>
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
      <table width="95%" border="0" align="center" cellpadding="1" cellspacing="0">
        <tr>
          <td colspan="4" class="sectionText"><font size="2" face="Arial, Helvetica, sans-serif"><strong>Last 
            Session</strong></font></td>
        </tr>
        <tr> 
          <td colspan="4" class="sectionText"><strong><font color="#000000" size="1" face="Arial, Helvetica, sans-serif">Routine: 
            <%=routine.getName()%> </font></strong></td>
        </tr>
        <tr> 
          <td colspan="4"><strong><font size="1" face="Arial, Helvetica, sans-serif">Exercise: 
            <%=excercise.getName()%> </font></strong></td>
        </tr>
        <tr> 
          <td colspan="4"><strong><font size="1" face="Arial, Helvetica, sans-serif">Date:  <%=date%></font></strong></td>
        </tr>
        <tr> 
          <td colspan="4"><strong><font size="1" face="Arial, Helvetica, sans-serif">Trainer:  <%=t.getFirstName()%> <%=t.getLastName()%></font></strong></td>
        </tr>
        <tr> 
          <td><div align="center"><strong><font size="1" face="Arial, Helvetica, sans-serif">Set 
              #</font></strong></div></td>
          <td width="20%"><div align="center"><font size="1" face="Arial, Helvetica, sans-serif">Reps</font></div></td>
          <td width="21%"><div align="center"><font size="1" face="Arial, Helvetica, sans-serif">Weight</font></div></td>
          <td width="37%"><div align="center"><font size="1" face="Arial, Helvetica, sans-serif">Rest 
              Time</font></div></td>
        </tr>
        <%
        	int count = 1;
        	Iterator i = excercise.getSets().iterator();
        	while (i.hasNext())
        	{
        		int set[] = (int[])i.next();
        		%>
        <tr> 
          <td width="22%"><div align="center"><%=count++%></div></td>
          <td><div align="center"><%=set[0]%></div></td>
          <td><div align="center"><%=set[1]%></div></td>
          <td><div align="center"><%=set[2]%></div></td>
        </tr>
        <%	
        	}        	
        %>
      </table>
	  <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td><div align="right"><a href="trackPerformAnaerob.jsp">
            <img src="buttons/back.gif" width="35" height="19" border="0"></a></div></td>
        </tr>
      </table></td>
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