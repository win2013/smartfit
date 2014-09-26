<%@include file="imports.jsp"%>
<%
    GregorianCalendar gc = new GregorianCalendar();
    String s_month = request.getParameter("month");
    String s_year = request.getParameter("year");
    int month = gc.get(Calendar.MONTH);
    int year = gc.get(Calendar.YEAR);
    if (s_month != null)
        month = Integer.parseInt(s_month);
    if (s_year != null)
        year = Integer.parseInt(s_year);

%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Untitled Document</title>
<script>
function refresh() {
    document.mainForm.submit();
}
</script>
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
<form name="mainForm" method="post" action="appointments_calendar.jsp">
  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="boxBorder">
    <tr> 
      <td><table width="100%" border="0" cellpadding="2" cellspacing="0" align="center" class="tableTop">
          <tr> 
            <td bgcolor="#FFCC66" class="largeHeading"> 
              <div align="center">Calendar View</div></td>
          </tr>
        </table>
        <table width="100%" border="0" cellpadding="2" cellspacing="0" class="tableTop">
          <tr>
            <td><div align="center" class="largeHeading"><%=SMUtils.month[month]%> <%=year%></div></td>
          </tr>
        </table>
        <table width="100%" border="0" align="center" cellpadding="3" cellspacing="0">
          <tr> 
            <td width="66%" class="largeHeading"><div align="center"></div>
              <div align="left"> </div></td>
          </tr>
        </table>
        <table width="100%" border="0" cellpadding="2" cellspacing="0" class="tableTop">
          <tr class="largeHeading"> 
            <td width="14%"> <div align="left">Sun</div></td>
            <td width="14%"><div align="left">Mon</div></td>
            <td width="14%"> <div align="left">Tues</div></td>
            <td width="14%"> <div align="left">Wed</div></td>
            <td width="14%"> <div align="left">Thur</div></td>
            <td width="14%"> <div align="left">Fri</div></td>
            <td width="15%"> <div align="left">Sat</div></td>
          </tr>
        </table>
        <table width="100%" border="1" cellspacing="0" cellpadding="2">
        <%
              	int currentDay = 1;
              	//First Row
              	gc = new GregorianCalendar(year, month, 1);
              	int firstDay = gc.get(Calendar.DAY_OF_WEEK);
              	out.println("<tr>");
              	for (int i =0;i < (firstDay-1);i++) {
                    out.println("<td><table width=\"100%\" height=\"100%\"><tr>");                  
                    out.println("<td bgcolor=\"#CCCCCC\" class=\"calendarTop\">&nbsp</td>"); 
                    out.println("</tr></table></td>");
                }

              	for (int i = (firstDay-1);i < 7;i++) {
              	    gc = new GregorianCalendar(year, month, currentDay++);
              	    if (gc.get(Calendar.MONTH) == month) {
                        out.println("<td><table width=\"100%\" height=\"100%\"><tr>");
	              	out.println("<td width=\"100%\" height=\"100%\"><a href=\"appointmentsMain.jsp?year=" + year + "&month=" + month + "&day=" + (currentDay-1) + "\">" + (currentDay-1) + "</a></td>");
                        out.println("</tr></table></td>");
                    } else {
                        out.println("<td><table width=\"100%\" height=\"100%\"><tr>");
                        out.println("<td width=\"100%\" height=\"100%\" bgcolor=\"#CCCCCC\">&nbsp</td>");
                        out.println("</tr></table></td>");
                    }
              	}
              	out.println("</tr>");

              	//Rest Of Rows
              	for (int row = 1;row < 5;row++) {
              		out.println("<tr>");
              		for (int i = 0;i < 7;i++) {
              			gc = new GregorianCalendar(year, month, currentDay++);
                        if (gc.get(Calendar.MONTH) == month) {
                            out.println("<td><table width=\"100%\" height=\"100%\"><tr>");
                            out.println("<td><a href=\"appointmentsMain.jsp?year=" + year + "&month=" + month + "&day=" + (currentDay-1) + "\">" + (currentDay-1) + "</a></td>");
                            out.println("</tr></table></td>");
                        } else {
                            out.println("<td><table width=\"100%\" height=\"100%\"><tr>");
                            out.println("<td bgcolor=\"#CCCCCC\">&nbsp</td>");
                            out.println("</tr></table></td>");
                        }
                    }
	            out.println("</tr>");
              	}

              	//In case of 6 weeks
                gc = new GregorianCalendar(year, month, currentDay);
                if (gc.get(Calendar.MONTH) == month) {
                	for (int row = 1;row < 2;row++) {
                            out.println("<tr>");
                            for (int i = 0;i < 7;i++) {
              			gc = new GregorianCalendar(year, month, currentDay++);
                            if (gc.get(Calendar.MONTH) == month) {
                                out.println("<td><table width=\"100%\" height=\"100%\"><tr>");
	            		out.println("<td><a href=\"appointmentsMain.jsp?year=" + year + "&month=" + month + "&day=" + (currentDay-1) + "\">" + (currentDay-1) + "</a></td>");	
                                out.println("</tr></table></td>");
                            } else {
                                out.println("<td><table width=\"100%\" height=\"100%\"><tr>");
                                out.println("<td bgcolor=\"#CCCCCC\">&nbsp</td>");
                                out.println("</tr></table></td>");
                            }
                  	}
                        out.println("</tr>");
                    }
                }
      	%>
        </table>
        <table width="100%" border="0" cellspacing="0" cellpadding="2">
          <tr> 
            <td width="50%"><span class="largeHeading">Month: </span> 
              <select name="month" onchange="javascript:refresh()">
                <option value="0" <%=( (month == 0) ?"selected" :"")%>>January</option>
                <option value="1" <%=( (month == 1) ?"selected" :"")%>>February</option>
                <option value="2" <%=( (month == 2) ?"selected" :"")%>>March</option>
                <option value="3" <%=( (month == 3) ?"selected" :"")%>>April</option>
                <option value="4" <%=( (month == 4) ?"selected" :"")%>>May</option>
                <option value="5" <%=( (month == 5) ?"selected" :"")%>>June</option>
                <option value="6" <%=( (month == 6) ?"selected" :"")%>>July</option>
                <option value="7" <%=( (month == 7) ?"selected" :"")%>>August</option>
                <option value="8" <%=( (month == 8) ?"selected" :"")%>>September</option>
                <option value="9" <%=( (month == 9) ?"selected" :"")%>>October</option>
                <option value="10" <%=( (month == 10) ?"selected" :"")%>>November</option>
                <option value="11" <%=( (month == 11) ?"selected" :"")%>>December</option>
              </select>
            </td>
            <td><span class="largeHeading">Year:</span> 
              <select name="year">
              </select></td>
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