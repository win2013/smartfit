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
	Routine routine = (Routine)session.getAttribute("routine");
	String exerciseID = request.getParameter("id");
	
	AnaerobicExercise exercise = null;
	if (exerciseID != null) {
		exercise = (AnaerobicExercise)routine.getExercise(Integer.parseInt(exerciseID));
		session.setAttribute("exercise", exercise);
	}
	else
		exercise = (AnaerobicExercise)session.getAttribute("exercise");
%>
<%
    session.setAttribute("lastPage", ("trackPerformAnaerob.jsp?id=" + exercise.getID()));
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
    AnaerobicSet lastSet = null;
    Hashtable table = (Hashtable)session.getAttribute("lastExerciseTable");
    System.out.println(exercise.getName());
    WorkoutSession ws = (WorkoutSession)table.get(exercise.getName());
    System.out.println(ws);
    if (ws != null) {
        enum = ws.getRoutines().elements();
        while ( (enum.hasMoreElements()) && (lastSet == null) ) {
            Routine r = (Routine)enum.nextElement();
            Enumeration enum2 = r.getExercises().elements();
            while ( (enum2.hasMoreElements()) && (lastSet == null) ) {
                Exercise l_exercise = (Exercise)enum2.nextElement();
                System.out.println(l_exercise.getName());
                if (l_exercise.getName().equals(exercise.getName())) {
                    Enumeration enum3 = ((AnaerobicExercise)l_exercise).getSets().elements();
                    while (enum3.hasMoreElements()) {
                        AnaerobicSet as = (AnaerobicSet)enum3.nextElement();
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
%>
<html>
<head>
<title>pda2.gif</title>
<script>
function forward(baseLink)
{
	httpLink = baseLink + '&reps=' + document.mainForm.reps.value + '&weight=' + document.mainForm.weight.value + '&rest=' + document.mainForm.rest.value;
	window.location = httpLink;
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<!-- Fireworks MX Dreamweaver MX target.  Created Wed May 14 12:19:09 GMT-0400 (Eastern Daylight Time) 2003-->

</head>
<body bgcolor="#ffffff" link="#FF3333" vlink="#FF3333" alink="#FF0000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
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
	<form name="mainForm" method="POST" action="addSet.jsp?type=<%="0"%>">
        <table width="95%" border="0" align="center" cellpadding="1" cellspacing="0">
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
            <td colspan="4"><strong><font color="red" size="1" face="Arial, Helvetica, sans-serif">Flag(s): 
              <%=sb.toString()%></font></strong></td>
          </tr>
          <%
    }
%>
          <tr> 
            <td><div align="center"><strong><font size="1" face="Arial, Helvetica, sans-serif">Set 
                #</font></strong></div></td>
            <td width="12%"><div align="center"><font size="1" face="Arial, Helvetica, sans-serif">Reps</font></div></td>
            <td width="21%"><div align="center"><font size="1" face="Arial, Helvetica, sans-serif">Weight</font></div></td>
            <td width="37%"><div align="center"><font size="1" face="Arial, Helvetica, sans-serif">Rest 
                Time</font></div></td>
          </tr>
<%
    if (lastSet != null) {%>
          <tr> 
            <td><div align="center"><font size="1" face="Arial, Helvetica, sans-serif">Prev(<%=lastSet.getSetNum()%>)</font></div></td>
            <td align="center"><font size="1" face="Arial, Helvetica, sans-serif"><%=lastSet.getReps()%></font></td>
            <td align="center"><font size="1" face="Arial, Helvetica, sans-serif"><%=lastSet.getWeight()%></font></td>
            <td align="center"><font size="1" face="Arial, Helvetica, sans-serif"><%=lastSet.getRestTime()%></font></td>
          </tr>
<%}%>

<%
        	int count = 1;
                Enumeration exerciseSets = exercise.getSets().elements();
                while (exerciseSets.hasMoreElements()) {
                    AnaerobicSet set = (AnaerobicSet)exerciseSets.nextElement();                    
        %>
          <tr> 
            <td width="30%"><div align="center"><font size="1" face="Arial, Helvetica, sans-serif"><%=set.getSetNum()%></font></div></td>
            <td><div align="center"><font size="1" face="Arial, Helvetica, sans-serif"><%=set.getReps()%></font></div></td>
            <td><div align="center"><font size="1" face="Arial, Helvetica, sans-serif"><%=set.getWeight()%></font></div></td>
            <td><div align="center"><font size="1" face="Arial, Helvetica, sans-serif"><%=set.getRestTime()%></font></div></td>
          </tr>          
          <%
                    if (set.getSetNum() >= count)
                        count = set.getSetNum() + 1;
        	}                
        %>
          <tr>
            <td width="30%"><font face="Arial, Helvetica, sans-serif"><strong><font size="1">Current 
              Set:</font></strong></font></td>
            <td><div align="center"><font face="Arial, Helvetica, sans-serif"> 
                <input name="reps" type="text" size="3" maxlength="3">
                </font></div></td>
            <td><div align="center"><font face="Arial, Helvetica, sans-serif"> 
                <input name="weight" type="text" size="3" maxlength="3">
                </font></div></td>
            <td><div align="center"><font face="Arial, Helvetica, sans-serif"> 
                <input name="rest" type="text" id="rest2" size="3" maxlength="3">
                </font></div></td>
          </tr>
        </table>
	  
        <table width="95%" border="0" align="center" cellpadding="2" cellspacing="0">
          <tr> 
            <td width="33%"><a href="javascript:forward('<%="addSet.jsp?type=" + "0"%>')"><img src="buttons/add.gif" width="29" height="19" border="0"></a></td>
            <td width="33%"> <div align="left"><a href="finishExcercise.jsp"><img src="buttons/finish.gif" width="43" height="19" border="0"></a></div></td>
            <td width="34%">
<div align="right"><a href="flags_compose.jsp?exerciseID=<%=exercise.getID()%>"><img src="buttons/createFlag.gif" width="75" height="19" border="0"></a></div></td>
          </tr>
        </table>
      </form> </td>
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