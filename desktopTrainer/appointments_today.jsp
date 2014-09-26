<%@include file="imports.jsp"%>
<%
	GregorianCalendar gc = new GregorianCalendar();
	gc = new GregorianCalendar(gc.get(Calendar.YEAR), gc.get(Calendar.MONTH), gc.get(Calendar.DAY_OF_MONTH));
	long startTime = gc.getTimeInMillis();
	long endTime = startTime + 24l*60l*60l*1000l;
	DaySchedule ds = new DaySchedule(startTime, endTime, 15l*60l*1000l);
	ds.populateSchedule(trainer);
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
            <td bgcolor="#FFCC66" class="largeHeading"> 
              <div align="center"> Appointments for <%=SMUtils.parseDate(startTime)%></div></td>
          </tr>
        </table>
        <table width="100%" border="0" align="center" cellpadding="3" cellspacing="0">
          <tr> 
            <td width="66%" class="largeHeading"><div align="center"></div>
              <div align="left">
                <table width="100%" border="0" cellpadding="2" cellspacing="0" class="tableTop">
                  <tr class="largeHeading"> 
                    <td width="35%"> <div align="left" class="largeHeading">Time</div></td>
                    <td width="65%">Appointment Description</td>
                  </tr>
                </table>  
                <table width="100%" border="0" cellspacing="0" cellpadding="2">
<%
	int count = 0;
	Appointment last = null;
	for (int i = 0;i < ds.appointment.length;i++) {
		if ( (ds.appointment[i] != null) && (ds.appointment[i] != last) ) {
                        StringBuffer description = new StringBuffer();
			Appointment appointment = (Appointment)ds.appointment[i];
                        last = appointment;
                        Enumeration enum = appointment.getUserAppointments().elements();
                        while (enum.hasMoreElements()) {
                            User user = (User)enum.nextElement();
                            if (user.getID() != trainer.getID())
                                description.append(user.getFirstName() + " " + user.getLastName());
                        }
                        if (description.length() == 0)
                            description = new StringBuffer(appointment.getDescription());

%>
            <tr bgcolor="#<%=( (count++%2==0) ?"C7E1E9" :"FFFFFF")%>" class="normalText"> 
            	<td><%=SMUtils.parseTime(appointment.getStartTime())%> - <%=SMUtils.parseTime(appointment.getEndTime())%></td>
                <td bgcolor="#C7E1E9"><a href="appointments_detail.jsp"><%=description.toString()%></a></td>
            </tr>			
<%		
		}
	}
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