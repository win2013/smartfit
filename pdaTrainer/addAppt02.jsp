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
	String isGeneric = request.getParameter("generic");
	String clientID = request.getParameter("clientID");
	String genericName = request.getParameter("genericName");
	String ok = request.getParameter("ok");
	if (ok == null)
		if (isGeneric.equals("no"))
		{
			session.setAttribute("genericName",null);
			session.setAttribute("clientID", clientID);
		}
		else
		{
			session.setAttribute("genericName", genericName);
			session.setAttribute("clientID", null);
		}
			
%>
<%
	String m = request.getParameter("month");
	String y = request.getParameter("year");
	int month = 1;
	int year = 1;
	
	if ( (m == null) || (y == null) )
	{
		GregorianCalendar gc = new GregorianCalendar();
		month = gc.get(Calendar.MONTH);
		year = gc.get(Calendar.YEAR);
	} else
	{
		month = Integer.parseInt(m);
		year = Integer.parseInt(y);
		
	}
	
	if (month == 12)
	{
		month = 0;
		year++;
	}
	if (month == -1)
	{
		month = 11;
		year--;
	}
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
      <table width="90%" border="0" align="center" cellpadding="1" cellspacing="0">
        <tr> 
          <td class="sectionText"><strong><font color="#000000" size="2" face="Arial, Helvetica, sans-serif">Add 
            Appointment </font></strong></td>
        </tr>
        <tr>
          <td class="sectionText"><strong><font size="1" face="Arial, Helvetica, sans-serif">Select 
            Day For Appointment</font></strong></td>
        </tr>
        <tr> 
          <td>
<table width="91%" border="0" align="center" cellpadding="1" cellspacing="1" bgcolor="#3366CC">
              <tr class="calendarDay"> 
                <td><font color="#FFFFFF"> <%=SMUtils.getMonth(month)%></font></td>
                <td> <div align="right"><font color="#FFFFFF"><%=year%></font></div></td>
              </tr>
            </table>
            <table width="92%" border="1" align="center" cellpadding="2" cellspacing="0" bordercolor="#6699FF">
              <tr class="calendarDay"> 
                <td><div align="center"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><strong>S</strong></font></div></td>
                <td><div align="center"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><strong>M</strong></font></div></td>
                <td><div align="center"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><strong>T</strong></font></div></td>
                <td><div align="center"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><strong>W</strong></font></div></td>
                <td><div align="center"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><strong>R</strong></font></div></td>
                <td><div align="center"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><strong>F</strong></font></div></td>
                <td><div align="center"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><strong>S</strong></font></div></td>
              </tr>
              <%
              	int currentDay = 1;
              	//First Row
              	GregorianCalendar gc = new GregorianCalendar(year, month, 1);
              	int firstDay = gc.get(Calendar.DAY_OF_WEEK);
              	out.println("<tr class=\"listText\">");
              	for (int i =0;i < (firstDay-1);i++)
              		out.println("<td>&nbsp</td>");
              	for (int i = (firstDay-1);i < 7;i++) {
              	    gc = new GregorianCalendar(year, month, currentDay++);
              	    if (gc.get(Calendar.MONTH) == month)
	              		out.println("<td><a href=\"addAppt03.jsp?year=" + year + "&month=" + month + "&day=" + (currentDay-1) + "\">" + (currentDay-1) + "</a></td>");
	              	else
	              		out.println("<td>&nbsp</td>");
              	}
              	out.println("</tr>");
              	//Rest Of Rows
              	for (int row = 1;row < 5;row++) {
              		out.println("<tr class=\"listText\">");
              		for (int i = 0;i < 7;i++) {
              			gc = new GregorianCalendar(year, month, currentDay++);
              	    if (gc.get(Calendar.MONTH) == month)
	              		out.println("<td><a href=\"addAppt03.jsp?year=" + year + "&month=" + month + "&day=" + (currentDay-1) + "\">" + (currentDay-1) + "</a></td>");
	              	else
	              		out.println("<td>&nbsp</td>");
              		}
	              	out.println("</tr>");
              	}
              	//In case of 6 weeks
                gc = new GregorianCalendar(year, month, currentDay);
                if (gc.get(Calendar.MONTH) == month) {
                	for (int row = 1;row < 2;row++) {
              		out.println("<tr class=\"listText\">");
              		for (int i = 0;i < 7;i++) {
              			gc = new GregorianCalendar(year, month, currentDay++);
              	    	if (gc.get(Calendar.MONTH) == month)
	              			out.println("<td><a href=\"addAppt03.jsp?year=" + year + "&month=" + month + "&day=" + (currentDay-1) + "\">" + (currentDay-1) + "</a></td>");
	              		else
	              			out.println("<td>&nbsp</td>");
              			}
	              			out.println("</tr>");
              		}
                }
      	%>
            </table>
            <table width="94%" border="0" align="center" cellpadding="1" cellspacing="1" bgcolor="#FFFFFF">
              <tr class="calendarDay"> 
                <td><div align="left"><font color="#0066CC" size="1" face="Arial, Helvetica, sans-serif">
                  <a href="addAppt02.jsp?ok=ok&month=<%=(month-1)%>&year=<%=year%>"><img src="buttons/prevMonth.gif" width="92" height="19" border="0"></a></font></div></td>
                <td> <div align="right">
                  <a href="addAppt02.jsp?ok=ok&month=<%=(month+1)%>&year=<%=year%>"><img src="buttons/nextMonth.gif" width="70" height="19" border="0"></a></div></td>
              </tr>
            </table>
            <strong><font face="Arial, Helvetica, sans-serif"> </font></strong></td>
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