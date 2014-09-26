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
	String y = request.getParameter("year");
	String m = request.getParameter("month");
	String d = request.getParameter("day");
	int year = Integer.parseInt(y);
	int month = Integer.parseInt(m);
	int day = Integer.parseInt(d);
	
	GregorianCalendar gc = new GregorianCalendar(year, month, day);
%>	
<%
	String dateDisplay = SMUtils.getDay(gc.get(Calendar.DAY_OF_WEEK)) + ", " + SMUtils.getMonth(month) + " " + day + " " + year;
%>
<html>
<head>
<meta http-equiv="Content-Language" content="en-us">

<title>pda2.gif</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
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
	<form name="mainForm" action="addAppointment.jsp" method="POST">
	    <table width="90%" border="0" align="center" cellpadding="1" cellspacing="1">
          <tr> 
            <td colspan="2" class="sectionText"><div align="center"><font size="2" face="Arial, Helvetica, sans-serif"><strong>Add 
                Appointment</strong></font></div></td>
          </tr>
          <tr bgcolor="#3366CC"> 
            <td colspan="2" class="sectionText"> 
              <div align="center"><font size="1" color="#FFFFFF" face="Arial, Helvetica, sans-serif"><strong><%=dateDisplay%><br>
                </strong></font></div></td>
          </tr>
          <tr> 
            <td width="21"><font size="1" face="Arial, Helvetica, sans-serif"><strong> 
              Start Time</strong></font></td>
            <td width="103"> <select name="startTime" size="1" maxlength="4">
                <%
            	long startTime = gc.getTimeInMillis();
            	long openTime = startTime + (1000*60*60*6);
		long closeTime = startTime + (1000*60*60*23);
		long increment = (1000*60*15);

                DaySchedule ds = new DaySchedule(openTime, closeTime, increment);
                ds.populateSchedule(trainer);
                session.setAttribute("ds", ds);
		for (int i =0 ;i < ds.time.length;i++) {            	
                    if (ds.appointment[i] == null) {%>
                        <option value="<%=ds.time[i]%>"><%=SMUtils.parseTime(ds.time[i])%>
                        </option>
                    <%}
                }
            %>
              </select> </td>
          </tr>
          <tr> 
            <td width="21"><strong> <font face="Arial, Helvetica, sans-serif" size="1">Duration&nbsp; 
              </font></strong></td>
            <td> <select name="duration" size="1" maxlength="4">
                <%
				increment = 15;
				long currentTime = increment;
				
				while (currentTime < 240) {
					%>
                <option value="<%=currentTime*60*1000%>"><%=currentTime%> Min</option>
                <%
					currentTime += increment;
				}
				
			%>
              </select> </td>
          </tr>
          <tr> 
            <td colspan="2"><font size="1" face="Arial, Helvetica, sans-serif"><strong>Description</strong></font></td>
          </tr>
          <tr> 
            <td colspan="2"><font size="1" face="Arial, Helvetica, sans-serif"><strong> 
              <textarea name="description" cols="20" rows="3"></textarea>
              </strong></font> <table width="90%" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td>
                  <input type="image" src="buttons/finish.gif" value="Submit" name="B1" width="43" height="19"></td>
                </tr>
              </table></td>
          </tr>
        </table>
	  </form>
	  </td>
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