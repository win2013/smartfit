<%@include file="imports.jsp"%>
<%
    String setDay = request.getParameter("setTime");
    if (setDay != null) {
        String startDay = request.getParameter("startDay");
        String startMonth = request.getParameter("startMonth");
        String startYear = request.getParameter("startYear");
        String endDay = request.getParameter("endDay");
        String endMonth = request.getParameter("endMonth");
        String endYear = request.getParameter("endYear");

        GregorianCalendar startDate = new GregorianCalendar(Integer.parseInt(startYear), Integer.parseInt(startMonth), Integer.parseInt(startDay));
        GregorianCalendar endDate = new GregorianCalendar(Integer.parseInt(endYear), Integer.parseInt(endMonth), Integer.parseInt(endDay));

        session.setAttribute("startDate", startDate);
        session.setAttribute("endDate", endDate);

        response.sendRedirect("contracts_main.jsp");
        return;
    }
%>
<%
    GregorianCalendar currentDate = new GregorianCalendar();
    int year = currentDate.get(Calendar.YEAR);
    int month = currentDate.get(Calendar.MONTH);
    int day = currentDate.get(Calendar.DAY_OF_MONTH);

    currentDate.setTimeInMillis(currentDate.getTimeInMillis() - 31l*24l*60l*60l*1000l);
    int startYear = currentDate.get(Calendar.YEAR);
    int startMonth = currentDate.get(Calendar.MONTH);
    int startDay = currentDate.get(Calendar.DAY_OF_MONTH);
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
<form name="form1" method="post" action="contracts_setInterval.jsp">
  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="boxBorder">
    <tr>
            <td><table width="100%" border="0" cellpadding="2" cellspacing="0" align="center" class="tableTop">
                
          <tr> 
            <td bgcolor="#CCCCFF" class="largeHeading"> 
              <div align="center">Set Interval to View Contracts</div>
              <div align="center"></div></td>
                </tr>
              </table>
              <table width="100%" border="0" align="center">
                <tr> 
                  <td width="45%" class="largeHeading"><div align="center"> </div>
                    <div align="left">Start Date</div></td>
                  <td colspan="4" class="largeHeading">&nbsp;</td>
                </tr>
                <tr class="largeHeading"> 
                  <td> <select name="startMonth">
                <option value="0" <%=( (0 == startMonth) ?"selected" :"")%>>January</option>
                <option value="1" <%=( (1 == startMonth) ?"selected" :"")%>>February</option>
                <option value="2" <%=( (2 == startMonth) ?"selected" :"")%>>March</option>
                <option value="3" <%=( (3 == startMonth) ?"selected" :"")%>>April</option>
                <option value="4" <%=( (4 == startMonth) ?"selected" :"")%>>May</option>
                <option value="5" <%=( (5 == startMonth) ?"selected" :"")%>>June</option>
                <option value="6" <%=( (6 == startMonth) ?"selected" :"")%>>July</option>
                <option value="7" <%=( (7 == startMonth) ?"selected" :"")%>>August</option>
                <option value="8" <%=( (8 == startMonth) ?"selected" :"")%>>September</option>
                <option value="9" <%=( (9 == startMonth) ?"selected" :"")%>>October</option>
                <option value="10" <%=( (10 == startMonth) ?"selected" :"")%>>November</option>
                <option value="11" <%=( (11 == startMonth) ?"selected" :"")%>>December</option>
                    </select></td>
                  <td width="7%">Day</td>
                  <td width="16%"> <input name="startDay" type="text" size="2" maxlength="2" value="<%=startDay%>"></td>
                  <td width="10%">Year</td>
                  <td width="22%"> <input name="startYear" type="text" size="4" maxlength="4" value="<%=startYear%>"></td>
                </tr>
                <tr> 
                  <td class="largeHeading">End Date</td>
                  <td colspan="4" class="largeHeading">&nbsp;</td>
                </tr>
                <tr class="largeHeading"> 
                  <td> <select name="endMonth">
                <option value="0" <%=( (0 == month) ?"selected" :"")%>>January</option>
                <option value="1" <%=( (1 == month) ?"selected" :"")%>>February</option>
                <option value="2" <%=( (2 == month) ?"selected" :"")%>>March</option>
                <option value="3" <%=( (3 == month) ?"selected" :"")%>>April</option>
                <option value="4" <%=( (4 == month) ?"selected" :"")%>>May</option>
                <option value="5" <%=( (5 == month) ?"selected" :"")%>>June</option>
                <option value="6" <%=( (6 == month) ?"selected" :"")%>>July</option>
                <option value="7" <%=( (7 == month) ?"selected" :"")%>>August</option>
                <option value="8" <%=( (8 == month) ?"selected" :"")%>>September</option>
                <option value="9" <%=( (9 == month) ?"selected" :"")%>>October</option>
                <option value="10" <%=( (10 == month) ?"selected" :"")%>>November</option>
                <option value="11" <%=( (11 == month) ?"selected" :"")%>>December</option>
                    </select></td>
                  <td>Day</td>
                  <td> <input name="endDay" type="text" size="2" maxlength="2" value="<%=day%>"></td>
                  <td>Year</td>
                  <td> <input name="endYear" type="text" size="4" value="<%=year%>" maxlength="4"></td>
                </tr>
              </table>
              
        <table width="100%" border="0" cellpadding="2" cellspacing="0" class="dashedOnTop">
          <tr>
            <td><div align="right">
                <input type="submit" name="setTime" value="Submit">
              </div></td>
          </tr>
        </table> </td>
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