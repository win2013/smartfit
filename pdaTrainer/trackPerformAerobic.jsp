<%@page contentType="text/html"%>
<%@include file="imports.jsp"%>
<%@include file="init.jsp"%>
<%
	Routine routine = (Routine)session.getAttribute("routine");
	String exerciseID = request.getParameter("id");
	
	AerobicExercise exercise = null;
	if (exerciseID != null) {
		exercise = (AerobicExercise)routine.getExercise(Integer.parseInt(exerciseID));
		session.setAttribute("exercise", exercise);
	}
	else
		exercise = (AerobicExercise)session.getAttribute("exercise");
	
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
    session.setAttribute("lastPage", ("trackPerformAerobic.jsp?id=" + exercise.getID()));
    Vector flags = new Vector();
    Enumeration enum = client.getExerciseFlags().elements();
    while (enum.hasMoreElements()) {
        ExerciseFlag flag = (ExerciseFlag)enum.nextElement();
        if (flag.getActive())
            if (flag.getExerciseName().equals(exercise.getName()))
                flags.add(flag);
    }
%>
<%
    //Last Exercise Code
    AerobicSet lastSet = null;
    Hashtable table = (Hashtable)session.getAttribute("lastExerciseTable");
    System.out.println(table);
    WorkoutSession ws = (WorkoutSession)table.get(exercise.getName());
    if (ws != null) {
        enum = ws.getRoutines().elements();
        while ( (enum.hasMoreElements()) && (lastSet == null) ) {
            Routine r = (Routine)enum.nextElement();
            Enumeration enum2 = r.getExercises().elements();
            while ( (enum2.hasMoreElements()) && (lastSet == null) ) {
                Exercise l_exercise = (Exercise)enum2.nextElement();
                if (l_exercise.getName().equals(exercise.getName())) {
                    Enumeration enum3 = ((AerobicExercise)l_exercise).getSets().elements();
                    while (enum3.hasMoreElements()) {
                        AerobicSet as = (AerobicSet)enum3.nextElement();
                        if (lastSet == null)
                            lastSet = as;
                        if (lastSet.getSetNum() < as.getSetNum())
                            lastSet = as;
                    }
                    break;
                }
            }
        }
    }
            enum = table.keys();
            while (enum.hasMoreElements())
                System.out.println(enum.nextElement());  
%>
<html>
<head>
<title>pda2.gif</title>
<script>
function forward(baseLink)
{
	httpLink = baseLink + '&min=' + mainForm.min.value + '&intensity=' + mainForm.intensity.value + '&heartrate=' + mainForm.heartrate.valuel;
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
	<form method="post" name="mainForm" action="addSet.jsp?type=<%="1"%>">
        <table width="95%" border="0" align="center" cellpadding="1" cellspacing="1">
          <tr> 
            <td colspan="4" class="sectionText"><strong><font color="#000000" size="1" face="Arial, Helvetica, sans-serif">Routine: 
              <%=routine.getName()%> </font></strong></td>
          </tr>
          <tr> 
            <td colspan="4"><strong><font size="1" face="Arial, Helvetica, sans-serif">Exercise: 
              <%=exercise.getName()%> </font></strong></td>
          </tr>
<%
    if (flags.size() > 0) {
        enum = flags.elements();
        StringBuffer sb = new StringBuffer();
        while (enum.hasMoreElements()) {
            ExerciseFlag flag = (ExerciseFlag)enum.nextElement();
            sb.append("<a href=\"flag_view.jsp?flagID=" + flag.getID() + "\">" + flag.getSubject() + "</a>");
            if (enum.hasMoreElements())
                sb.append(", ");
        }
        %>
          <tr> 
            <td colspan="4"><strong><font color="red" size="1" face="Arial, Helvetica, sans-serif">Flag(s):  <%=sb.toString()%></font></a></strong></td>
          </tr>
          <%
    }
%>
          <tr> 
            <td><div align="center"><font size="1" face="Arial, Helvetica, sans-serif">Set 
                #</font></div></td>
            <td> <div align="center"><font size="1" face="Arial, Helvetica, sans-serif">Time</font></div></td>
            <td> <div align="center"><font size="1" face="Arial, Helvetica, sans-serif">Intensity</font></div></td>
            <td> <div align="center"><font size="1" face="Arial, Helvetica, sans-serif">Heart 
                Rate</font></div></td>
          </tr>
<%
    if (lastSet != null) {%>
          <tr> 
            <td width="20%"><div align="center"><font  size="1" face="Arial, Helvetica, sans-serif">Prev (<%=lastSet.getSetNum()%>)</font></div></td>
            <td><div align="center"><font  size="1" face="Arial, Helvetica, sans-serif"><%=lastSet.getTime()%></font></div></td>
            <td><div align="center"><font  size="1" face="Arial, Helvetica, sans-serif"><%=lastSet.getIntensity()%></font></div></td>
            <td><div align="center"><font  size="1" face="Arial, Helvetica, sans-serif"><%=lastSet.getHeartRate()%></font></div></td>
          </tr>
<%}%>
<%
            int count = 1;
        	Iterator i = exercise.getSets().iterator();
        	while (i.hasNext()) {
                    AerobicSet set = (AerobicSet)i.next();
                    if (set.getSetNum() >= count)
                        count = set.getSetNum() + 1;
        		%>
          <tr>
            <td width="20%"><div align="center"><font  size="1" face="Arial, Helvetica, sans-serif"><%=set.getSetNum()%></font></div></td>
            <td><div align="center"><font  size="1" face="Arial, Helvetica, sans-serif"><%=set.getTime()%></font></div></td>
            <td><div align="center"><font  size="1" face="Arial, Helvetica, sans-serif"><%=set.getIntensity()%></font></div></td>
            <td><div align="center"><font  size="1" face="Arial, Helvetica, sans-serif"><%=set.getHeartRate()%></font></div></td>
          </tr>
          
          <%	}
        %>
        <tr>
            <td width="20%"><font face="Arial, Helvetica, sans-serif"><strong><font size="1">Current 
              Set:</font></strong></font></td>
            <td><div align="center"><font face="Arial, Helvetica, sans-serif"><input name="min" type="text" size="4"></font></div></td>
            <td><div align="center"><font face="Arial, Helvetica, sans-serif"> 
                <input name="intensity" type="text" id="intensity2" size="3" maxlength="3">
                </font></div></td>
            <td><div align="center">
                <input name="heartrate" type="text" size="4" maxlength="4">
              </div></td>
          </tr>
        </table>
	  
        <table width="95%" border="0" align="center" cellpadding="2" cellspacing="0">
          <tr> 
            <td width="33%">
<input type="image" src="buttons/add.gif" value="Submit" name="B1" width="29" height="19">
            </td>
            <td width="33%"><a href="finishExcercise.jsp"><img src="buttons/finish.gif" width="43" height="19" border="0"></a></td>
            <td width="34%"><font size="1" face="Arial, Helvetica, sans-serif"><strong><a href="flags_compose.jsp?exerciseID=<%=exercise.getID()%>"><img src="buttons/createFlag.gif" width="75" height="19" border="0"></a></strong></font></td>
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