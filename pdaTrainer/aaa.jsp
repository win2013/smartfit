<%@page contentType="text/html"%>
<%@include file="../common/imports.jsp"%>
<%@include file="init.jsp"%>
<%
	//Iitialize and create Workout Session
	//session.removeAttribute("workoutSession");
	WorkoutSession workoutSession = (WorkoutSession)session.getAttribute("workoutSession");
	if (workoutSession == null) {
		System.out.println("creatuing");
		workoutSession = club.createWorkoutSession(trainer);
		client.addWorkoutSession(workoutSession);
		session.setAttribute("workoutSession", workoutSession);
	}
	//Get Routines info for client
	Iterator i = client.getRoutines().iterator();
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
<title>Track Performace</title>
<script>
function forward(httpLink)
{
	clientID = document.routines.routine.value;
	httpLink = httpLink + '?id=' + clientID;
	window.location = httpLink;	
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
          <td class="sectionText"><strong><font color="#000000" size="2" face="Arial, Helvetica, sans-serif">Select 
            Routine </font></strong></td>
        </tr>
        <tr> 
          <td><strong><font face="Arial, Helvetica, sans-serif"> 
            <form method="post" name="routines" action="">
              <select name="routine" size="9">
                <%
                  		while (i.hasNext())
                  		{
                  			//if (true) return;
                  			Routine routine = (Routine)i.next();
                  			long rid = routine.getID();
                  			
                  			System.out.println("WHAT THE FUCK");
                  			Routine temp = workoutSession.getRoutine(rid);//club.createWorkoutSession(trainer).getRoutine(rid);
							System.out.println("WHAT THE FUCK 2");

                  			String display = routine.getName();                  			
							
                  			if (temp != null) {
                  				int completeExcercises = 0;
                  				int totalExcercises = 0;
								Iterator j = temp.getExcercises().iterator();																
								while (j.hasNext())
								{
									totalExcercises++;
									if ( ((Excercise)j.next()).done() )
										completeExcercises++;
								}
                  				display += " " + completeExcercises + "/" + totalExcercises;
                  			}
                  			out.println("<option value=\"" + routine.getID() + "\">" + display + "</option>");
                  		}
                  %>
              </select>
              <br>
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td width="50%"><a href="javascript:forward('trackPerform02.jsp')"><img src="buttons/beginRoutine.gif" width="84" height="19" border="0"></a></td>
                  <td><div align="right"><a href="question.jsp"><img src="buttons/finish.gif" width="43" height="19" border="0"></a></div></td>
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