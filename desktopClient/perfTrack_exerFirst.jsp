<%@include file="imports.jsp"%>
<%
    Client client = (Client)session.getAttribute("client");

    GregorianCalendar startDate = (GregorianCalendar)session.getAttribute("startDate");
    GregorianCalendar endDate = (GregorianCalendar)session.getAttribute("endDate");
    long startTime = startDate.getTimeInMillis();
    long endTime = endDate.getTimeInMillis() + 24l*60l*60l*1000l - 1l;
    //Get All exercises
    Hashtable exerciseInfo = new Hashtable();
    Vector allExercises = new Vector();
    Enumeration enum = client.getWorkoutSessions().elements();
    while (enum.hasMoreElements()) {
        WorkoutSession ws = (WorkoutSession)enum.nextElement();
        if ( (ws.getStartTime() < startTime) || (ws.getStartTime() > endTime) )
            continue;
        Enumeration routines = ws.getRoutines().elements();
        while (routines.hasMoreElements()) {
            Routine routine = (Routine)routines.nextElement();
            Enumeration exercises = routine.getExercises().elements();
            while (exercises.hasMoreElements()) {
                Exercise exercise = (Exercise)exercises.nextElement();
                allExercises.add(exercise);
                String info[] = (String[])exerciseInfo.get(exercise.getName());
                if (info == null) {
                    info = new String[3];
                    info[2] = "0";
                }
                    
                if (exercise instanceof AerobicExercise) {
                    info[0] = "Aerobic";
                    info[1] = "n/a";
                    if ( Integer.parseInt(info[2]) < ((AerobicExercise)exercise).getSets().size() ) {
                        info[2] = Integer.toString(((AerobicExercise)exercise).getSets().size());
                    }
                } else if (exercise instanceof AnaerobicExercise) {
                    info[0] = "Strength";
                    info[1] = ((AnaerobicExercise)exercise).getBodyPart();
                    if ( Integer.parseInt(info[2]) < ((AnaerobicExercise)exercise).getSets().size() ) {
                        info[2] = Integer.toString(((AnaerobicExercise)exercise).getSets().size());
                    }                    
                } else if (exercise instanceof FlexibilityExercise) {
                    info[0] = "Flexibility";
                    info[1] = ((FlexibilityExercise)exercise).getBodyPart();
                    if ( Integer.parseInt(info[2]) < ((FlexibilityExercise)exercise).getSets().size() ) {
                        info[2] = Integer.toString(((FlexibilityExercise)exercise).getSets().size());
                    } 
                }
                exerciseInfo.put(exercise.getName(), info); 
            }
        }
    }
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
            <div align="center" class="largeHeading">The Following Exercises Were 
              Performed From <%=SMUtils.parseDate(startTime) + " to " + SMUtils.parseDate(endTime)%></div></td>
        </tr>
      </table>
      <table width="100%" border="0" cellpadding="2" cellspacing="0" class="tableTop">
        <tr> 
          <td width="50%" class="largeHeading">Exercise Name</td>
          <td width="25%" class="largeHeading">Exercise Type</td>
          <td width="25%" class="largeHeading">Muscle Group</td>
        </tr>
      </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="2">
<%
    Enumeration keys = exerciseInfo.keys();
    int count = 1;
    while (keys.hasMoreElements()) {
        String exerciseName = (String)keys.nextElement();        
        count++;
        String info[] = (String[])exerciseInfo.get(exerciseName);%>        
        <tr> 
          <td width="50%" bgcolor="#<%=( (count%2==0) ?"C7E1E9" :"FFFFFF")%>" class="normalText"><a href="../trainerModule/perfTrack_exerFirst_detail.jsp?exerciseName=<%=exerciseName%>&exerciseType=<%=info[0]%>&sets=<%=info[2]%>"><%=exerciseName%></a></td>
          <td width="25%" bgcolor="#<%=( (count%2==0) ?"C7E1E9" :"FFFFFF")%>" class="normalText"><%=info[0]%></td>
          <td bgcolor="#<%=( (count%2==0) ?"C7E1E9" :"FFFFFF")%>" class="normalText"><%=info[1]%></td>
        </tr>
<%
        }
%>
      </table></td>
  </tr>
</table>
<table width="100%" border="0" align="center" cellpadding="2" cellspacing="0">
  <tr> 
    <td><div align="right"><a href="javascript:history.back(1)" class="smallLinks">Back</a></div></td>
  </tr>
</table>
</body>
</html>
