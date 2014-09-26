<%@include file="imports.jsp"%>
<%
    Client client = (Client)session.getAttribute("client");

    GregorianCalendar startDate = (GregorianCalendar)session.getAttribute("startDate");
    GregorianCalendar endDate = (GregorianCalendar)session.getAttribute("endDate");
    long startTime = startDate.getTimeInMillis();
    long endTime = endDate.getTimeInMillis() + 24l*60l*60l*1000l - 1l;
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
          <td bgcolor="#FFCC66"> 
            <div align="center" class="largeHeading">View By Date</div></td>
        </tr>
      </table>
      <table width="100%" border="0" cellpadding="2" cellspacing="0" class="tableTop">
        <tr class="largeHeading"> 
          <td width="30%">Date</td>
          <td width="45%">Routines</td>
          <td width="25%">Exercises Completed</td>
        </tr>
      </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="2">
<%
    GregorianCalendar gc = new GregorianCalendar();
    int count = 0;
    Enumeration sessions = client.getWorkoutSessions().elements();
    while (sessions.hasMoreElements()) {
        WorkoutSession ws = (WorkoutSession)sessions.nextElement();
        if ( (ws.getStartTime() < startTime) || (ws.getStartTime() > endTime) )
            continue;
        
        gc.setTimeInMillis(ws.getStartTime());
        int year = gc.get(Calendar.YEAR);
        int month = gc.get(Calendar.MONTH);
        int day = gc.get(Calendar.DAY_OF_MONTH);
        gc = new GregorianCalendar(year, month, day);
        String time = SMUtils.getTime(ws.getStartTime() ,gc.getTimeInMillis());
        String routines = "";
        Enumeration enum = ws.getRoutines().elements();
        int totalExercises = 0;
        while (enum.hasMoreElements()) {
            Routine routine = (Routine)enum.nextElement();
            routines += routine.getName() + ((enum.hasMoreElements()) ?", " :"");
            totalExercises += routine.getExercises().size();
        }
%>
        <tr bgcolor="#<%= (( (count++%2==0) ?"C7E1E9" :"FFFFFF"))%>"> 
          <td width="30%"  class="normalText"><a href="perfTrack_dateFirst_detail.jsp?workoutSessionID=<%=ws.getID()%>"><%=month + "/" + day + "/" + year + "  " + time%></a></td>
          <td width="45%" class="normalText"><%=routines%></td>
          <td class="normalText"><div align="center"><%=totalExercises%></div></td>
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
