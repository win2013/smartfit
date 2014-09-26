<%@page contentType="text/html"%>
<%@include file="imports.jsp"%>
<%@include file="init.jsp"%>
<%
	WorkoutSession workoutSession = (WorkoutSession)session.getAttribute("workoutSession");
	
	String routineID = request.getParameter("id");		
	Routine wsRoutine = null;
        Routine clientRoutine = null;
	//See if routine is already in WorkoutSession
	if (routineID != null) {
                System.out.println("Searching  WorkoutSession");
                System.out.println(workoutSession.getRoutines().size());
                clientRoutine = client.getRoutine(Integer.parseInt(routineID));
		Enumeration wsRoutines = workoutSession.getRoutines().elements();
		while (wsRoutines.hasMoreElements())
		{
			Routine tempRoutine = (Routine)wsRoutines.nextElement();
			if (clientRoutine.getName().equals(tempRoutine.getName()))
			{
                                System.out.println("Found it");
				wsRoutine = tempRoutine;
                                session.setAttribute("routine", wsRoutine);
				break;
			}	
		}		
	}
	else
	{
                System.out.println("Getting session routine");
		wsRoutine = (Routine)session.getAttribute("routine");
		if (wsRoutine == null) {
			out.println("ERROR");
			return;
		}
	}
	
	//Copy Routine if new
        System.out.println(wsRoutine);
	if (wsRoutine == null)
	{
		Routine newRoutine = db.createRoutine();
		newRoutine.setCreator(clientRoutine.getCreator());
		newRoutine.setName(clientRoutine.getName());
		newRoutine.setDescription(clientRoutine.getDescription());
		Enumeration clientExercises = clientRoutine.getExercises().elements();
		while (clientExercises.hasMoreElements())
		{
			Exercise exercise = (Exercise)clientExercises.nextElement();
			if (exercise instanceof AnaerobicExercise)
			{
				AnaerobicExercise ae = (AnaerobicExercise)exercise;
				AnaerobicExercise nae = db.createAnaerobicExercise();
				nae.setName(ae.getName());
				nae.setBodyPart(ae.getBodyPart());
                                newRoutine.addExercise(nae);
			} 
			else if (exercise instanceof AerobicExercise)
			{
				AerobicExercise ae = (AerobicExercise)exercise;
				AerobicExercise nae = db.createAerobicExercise();
				nae.setName(ae.getName());
                                newRoutine.addExercise(nae);
			}
		}
                wsRoutine = newRoutine;
		workoutSession.addRoutine(wsRoutine);
		session.setAttribute("routine", wsRoutine);
                System.out.println("Added New Routine");
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
<title>pda2.gif</title>
<script>
function forward()
{
	window.location = document.excercises.excercise.value;
}
</script>
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
      <table width="90%" border="0" align="center" cellpadding="1" cellspacing="0">
        <tr> 
          <td class="sectionText">
<div align="left"><strong><font color="#000000" size="2" face="Arial, Helvetica, sans-serif">Routine: 
              <%=wsRoutine.getName()%> </font></strong></div></td>
        </tr>
        <tr> 
          <td><strong><font face="Arial, Helvetica, sans-serif"> 
            <form name="excercises" action="">
              <select name="excercise" size="8">
                <%
               			Enumeration exercises = wsRoutine.getExercises().elements();
                  		while (exercises.hasMoreElements())
                  		{
                  			String link = "";
                  			Exercise exercise = (Exercise)exercises.nextElement();
                  			String display = exercise.getName();
                  			
                  			if (exercise.getDone())
                  				display += " - done";
                  			if (exercise instanceof AerobicExercise) {
                  				link = "trackPerformAerobic.jsp?id=" + exercise.getID();
                                        }
                  			else if (exercise instanceof AnaerobicExercise) {
                  				link = "trackPerformAnaerob.jsp?id=" + exercise.getID();
                                        }
                  				
                  			out.println("<option value=\"" + link + "\">" + display + "</option>");
                  		}
                  %>
              </select>
              <table width="90%" border="0" cellspacing="1" cellpadding="1">
                <tr> 
                  <td><a href="javascript:forward()"><img src="buttons/startModify.gif" width="81" height="19" border="0"></a></td>
                  <td><div align="right"><a href="trackPerform01.jsp"><img src="buttons/finish.gif" width="43" height="19" border="0"></a></div></td>
                </tr>
                <tr> 
                  <td><img src="buttons/addExercise.gif" width="80" height="19"></td>
                  <td>&nbsp;</td>
                </tr>
              </table>
            </form>
            </font></strong></td>
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