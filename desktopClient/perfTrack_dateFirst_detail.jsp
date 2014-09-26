<%@include file="imports.jsp"%>
<%
    String workoutSessionID = request.getParameter("workoutSessionID");
    int id = Integer.parseInt(workoutSessionID);
    WorkoutSession ws = db.getWorkoutSession(id);    
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
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="boxBorder">
  <tr>
    <td><table width="100%" border="0" cellpadding="2" cellspacing="0" class="tableTop">
        <tr>
                
          <td bgcolor="#CCCCFF"> 
            <div align="center" class="largeHeading">Workout Session Info for 
              <%=SMUtils.parseDateAndTime(ws.getStartTime())%></div>           </td>
            </tr>
        </table>
      <%
    Enumeration routines = ws.getRoutines().elements();
    while (routines.hasMoreElements()) {
        Routine routine = (Routine)routines.nextElement();%>
        <table width="100%" border="0" cellpadding="2" cellspacing="0">
        <tr class="largeHeading" bgcolor="#FFCC66">           
          <td bgcolor="#CCCCFF" colspan="4">
<p bgcolor="#CCCCFF" align="center"><%=routine.getName()%></p></td>          
        </tr>
        </table>
<%
        Enumeration exercises = routine.getExercises().elements();
        while (exercises.hasMoreElements()) {
            Exercise exercise = (Exercise)exercises.nextElement();%>
        
<table width="100%" border="0" cellpadding="2" cellspacing="0">
  <tr class="largeHeading" bgcolor="#FFCC66"> 
          <td colspan="3" bgcolor="#CCCCFF"><%=exercise.getName()%></td>
          <td bgcolor="#CCCCFF">&nbsp;</td>
  </tr>
  <%
            if (exercise instanceof AerobicExercise) {%>
  <tr bgcolor="#FFCC66" class="largeHeading"> 
          <td bgcolor="#CCCCFF" width="25%">Set #</td>
          <td bgcolor="#CCCCFF" width="25%">Intensity</td>
          <td bgcolor="#CCCCFF" width="25%">Time (min)</td>
          <td bgcolor="#CCCCFF" width="25%">
<div align="left"></div></td>
  </tr>
  <%
            Enumeration sets = ((AerobicExercise)exercise).getSets().elements();
            int count = 0;
            while (sets.hasMoreElements()) {
                AerobicSet set = (AerobicSet)sets.nextElement();%>
  <tr bgcolor="<%=( (count++%2==0) ?"#C7E1E9" :"FFFFF")%>"> 
    <td width="25%" class="normalText"><%=set.getSetNum()%></td>
    <td width="25%" class="normalText"><%=set.getIntensity()%></td>
    <td width="25%" class="normalText"><%=set.getTime()%></td>
    <td class="normalText"><div align="left"></div></td>
  </tr>
  <%
            }%>
</table>        
<%

            } else if (exercise instanceof AnaerobicExercise) {%>
                <tr bgcolor="#FFCC66" class="largeHeading"> 
                  
    <td width="25%" bgcolor="#CCCCFF">Set #</td>
                  
    <td width="25%" bgcolor="#CCCCFF">Reps</td>
                  
    <td width="25%" bgcolor="#CCCCFF">Weight</td>
                  
    <td width="25%" bgcolor="#CCCCFF">
<div align="left">Rest Time</div></td>
                </tr>
<%
            Enumeration sets = ((AnaerobicExercise)exercise).getSets().elements();
            int count = 0;
            while (sets.hasMoreElements()) {
                AnaerobicSet set = (AnaerobicSet)sets.nextElement();%>
                <tr bgcolor="<%=( (count++%2==0) ?"#C7E1E9" :"FFFFF")%>"> 
                  <td width="25%" class="normalText"><%=set.getSetNum()%></td>
                  <td width="25%" class="normalText"><%=set.getReps()%></td>
                  <td width="25%" class="normalText"><%=set.getWeight()%></td>
                  <td class="normalText"><div align="left"></div><%=set.getRestTime()%></td>
                </tr>
<%
            }%>
            </table>        
<%

            } else if (exercise instanceof FlexibilityExercise) {%>
        <tr bgcolor="#FFCC66" class="largeHeading"> 
          <td width="25%">Set #</td>
          <td width="25%">flex 1</td>
          <td width="25%">flex 2</td>
          <td width="25%"><div align="left">flex 3</div></td>
        </tr>
    </table>             
<%
            }
        }
    }
%>

    </td>
    </tr>
</table>    


<table width="100%" border="0" align="center" cellpadding="2" cellspacing="0">
  <tr> 
    <td><div align="right"><a href="javascript:history.back(1)" class="smallLinks">Back</a></div></td>
  </tr>
</table>
</body>
</html>
