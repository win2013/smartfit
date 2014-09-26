<%@page contentType="text/html"%>
<%@include file="imports.jsp"%>
<%@include file="init.jsp"%>
<%
	String m = request.getParameter("month");
	String y = request.getParameter("year");
	String d = request.getParameter("day");
	int month = 1;
	int day = 1;
	int year = 1;
	GregorianCalendar gc = null;
	
	if ( (m == null) || (y == null) || (d == null) )
	{
		gc = new GregorianCalendar();
		month = gc.get(Calendar.MONTH);
		year = gc.get(Calendar.YEAR);
		day = gc.get(Calendar.DAY_OF_MONTH);
		gc = new GregorianCalendar(year, month, day);
	} else
	{
		month = Integer.parseInt(m);
		year = Integer.parseInt(y);
		day = Integer.parseInt(d);	
		gc = new GregorianCalendar(year, month, day);
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
<%
	String addLink = "addAppt01.jsp";
	if (client != null)
		addLink = "addAppt02.jsp?generic=no&clientID=" + client.getID();
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
    <td rowspan="2" bgcolor="#CCCCFF"><font size="1" face="Arial, Helvetica, sans-serif"><strong>Appointments</strong></font></td>
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
<table width="190" border="0" align="center" cellpadding="1" cellspacing="0">
        <tr>
          <td colspan="2"><div align="center"><strong><font size="1" face="Arial, Helvetica, sans-serif">Select 
              Name For Detail Or To Edit</font></strong></div></td>
        </tr>
        <tr> 
          <td colspan="2" bgcolor="#3366CC"> <center>
              <font color="#FFFFFF" size="1" face="Arial, Helvetica, sans-serif"><strong><%=SMUtils.getDay(gc.get(Calendar.DAY_OF_WEEK))%>, 
              <%=SMUtils.getMonth(gc.get(Calendar.MONTH))%> <%=day%> <%=year%></strong></font></center></td>
        </tr>
<%     		
    User user = (User)trainer;

    if (client != null)
        user = (User)client;
    long startTimeFilter = gc.getTimeInMillis();
    long endTimeFilter = startTimeFilter + 24l*60l*60l*1000l;
    DaySchedule ds = new DaySchedule(startTimeFilter, endTimeFilter, 15l*60l*1000l);
    System.out.println(user);
    ds.populateSchedule(user);
    int count = 0;
    Object lastAppt = null;
    for (int i = 0;i < ds.time.length;i++)
    {
        System.out.println(i);
        if (ds.appointment[i] == null)
            continue;
        if (ds.appointment[i] == lastAppt)
            continue;
        lastAppt = ds.appointment[i];

        String timeDisplay = "";
        String linkDisplay = "";
        String link = "";
        if (ds.appointment[i] instanceof Appointment) {
            Appointment appt = (Appointment)ds.appointment[i];
            link = Integer.toString(appt.getID());
            timeDisplay = SMUtils.parseTime(appt.getStartTime()) + " - " + SMUtils.parseTime(appt.getEndTime());
            Enumeration userLinks = appt.getUserAppointments().elements();
            while (userLinks.hasMoreElements()) {
            User tempUser = (User)userLinks.nextElement();
            if (tempUser.getID() != trainer.getID()) {
                linkDisplay += tempUser.getFirstName() + " " + tempUser.getLastName();
                if (userLinks.hasMoreElements())
                    linkDisplay += ",";
                }
            }	
        }
%>
        <tr> 
          <td width="95" bgcolor="<%=( (count%2==0) ?"#FFCC66" :"#FFFFFF")%>"><font size="1" face="Arial, Helvetica, sans-serif"><%=timeDisplay%></font></td>
          <td width="95" bgcolor="<%=( (count++%2==0) ?"#FFCC66" :"#FFFFFF")%>"><div align="right"><a href="apptDetail.jsp?id=<%=link%>"><font size="1" face="Arial, Helvetica, sans-serif"><%=linkDisplay%></font></a></div></td>
          <%
    }		
               %>
        </tr>
      </table>

      <table width="95%" border="0" align="center" cellpadding="1" cellspacing="1">
        <tr> 
          <td align="left"> <div align="left"><a href="<%=addLink%>"><img src="buttons/add.gif" width="29" height="19" border="0"></a></div></td>
          <td width="34%" align="right"> <div align="right"><a href="calendarView.jsp"><img src="buttons/calendar.gif" width="59" height="19" border="0" align="right"></a></div> 
            </div></td>
        </tr>
      </table> </td>
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