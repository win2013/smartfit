<%@include file="imports.jsp"%>
<%
    GregorianCalendar startDate = (GregorianCalendar)session.getAttribute("startDate");
    GregorianCalendar endDate = (GregorianCalendar)session.getAttribute("endDate");
    long startTime = startDate.getTimeInMillis();
    long endTime = endDate.getTimeInMillis() + 24l*60l*60l*1000l - 1l;

    Vector info = new Vector();
    
    Enumeration trainers = club.getTrainers().elements();
    while (trainers.hasMoreElements()) {
    //Clients, meetings, time
        int totalMeetings = 0;
        int totalTime = 0;
        Trainer trainer = (Trainer)trainers.nextElement();
        Enumeration contracts = trainer.getContracts().elements();
        while (contracts.hasMoreElements()) {
            Contract contract = (Contract)contracts.nextElement();
            Enumeration contractEntries = contract.getContractEntrys().elements();
            while (contractEntries.hasMoreElements()) {
                ContractEntry contractEntry = (ContractEntry)contractEntries.nextElement();
                WorkoutSession workoutSession = contractEntry.getWorkoutSession();
                if (workoutSession != null) {
                    long time = workoutSession.getStartTime();
                    if ( (time > startTime) && (time < endTime) ) {
                        totalTime += contract.getTimePerSession();
                        totalMeetings++;
                    }
                }   
            }
        }

        String entry[] = { (trainer.getFirstName() + " " + trainer.getLastName()), Integer.toString(totalMeetings), Integer.toString(totalTime) };
        info.add(entry);
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
<form name="form1" method="post" action="">
  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="boxBorder">
    <tr> 
      <td><table width="100%" border="0" cellpadding="2" cellspacing="0" align="center" class="tableTop">
          <tr> 
            <td bgcolor="#99CCFF" class="largeHeading"> <div align="center">All 
                Trainer Appointments for <%=SMUtils.parseDate(startTime)%> 
                Through <%=SMUtils.parseDate(endTime)%></div></td>
          </tr>
        </table>
        <table width="100%" border="0" align="center" cellpadding="3" cellspacing="0">
          <tr> 
            <td width="66%" class="largeHeading"><div align="center"></div>
              <div align="left">
                <table width="100%" border="0" cellpadding="2" cellspacing="0" class="tableTop">
                  <tr class="largeHeading"> 
                    <td width="33%">Trainer</td>
                    <td width="23%"><div align="center"># of Meetings</div></td>
                    <td width="46%"><div align="right">Total Meeting Time</div></td>
                  </tr>
                </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="2">
                  <%
    Enumeration entries = info.elements();
	int counter = 0;
    while (entries.hasMoreElements()) {
        String entry[] = (String[])entries.nextElement();%>
                  <tr bgcolor="<%=((counter++ % 2 == 0)?"#C7E1E9" :"#FFFFFF") %>" class="normalText"> 
                    <td width="33%"><%=entry[0]%></td>
                    <td width="23%"> <div align="center"><%=entry[1]%></div></td>
                    <td width="46%"> <div align="right"><%=entry[2] + " min."%></div></td>
                  </tr>
                  <%}
%>
                </table>
              </div></td>
          </tr>
        </table></td>
    </tr>
  </table>
  <table width="100%" border="0" align="center" cellpadding="2" cellspacing="0">
    <tr> 
      <td><div align="right"><a href="javascript:history.back(1)" class="smallLinks">Back</a></div></td>
    </tr>
  </table>
</form>
</body>
</html>
