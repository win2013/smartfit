<%@include file="imports.jsp"%>
<%
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
<form name="form1" method="post" action="">
  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="boxBorder">
    <tr> 
      <td><table width="100%" border="0" cellpadding="2" cellspacing="0" align="center" class="tableTop">
          <tr> 
            <td bgcolor="#CCCCFF" class="largeHeading"> 
              <div align="center">All Appointments for 
                <%client.getFirstName() + " " + client.getLastName()%>
                Between <%=SMUtils.parseDate(startTime)%> and <%=SMUtils.parseDate(endTime)%></div></td>
          </tr>
        </table>
        <table width="100%" border="0" align="center" cellpadding="3" cellspacing="0">
          <tr> 
            <td width="66%" class="largeHeading"><div align="center"></div>
              <div align="left">
                <table width="100%" border="0" cellpadding="2" cellspacing="0" class="tableTop">
                  <tr class="largeHeading"> 
                    <td width="33%">Date</td>
                    <td width="21%"><div align="center">Trainer /Type</div></td>
                    <td width="23%"><div align="center">Time</div></td>
                    <td width="23%"><div align="right">Length (min.)</div></td>
                  </tr>
                </table>  
                <table width="100%" border="0" cellspacing="0" cellpadding="2">
                  <tr bgcolor="#C7E1E9" class="normalText"> 
                    <td width="33%">&lt;date1&gt;</td>
                    <td width="21%"> <div align="center">&lt;trainer1&gt;</div></td>
                    <td width="23%"> <div align="center">&lt;time1&gt;</div></td>
                    <td width="23%"><div align="right">30</div></td>
                  </tr>
                  <tr class="normalText"> 
                    <td>&lt;date2&gt;</td>
                    <td><div align="center">&lt;trainer2&gt;</div></td>
                    <td><div align="center">&lt;time2&gt;</div></td>
                    <td><div align="right">60</div></td>
                  </tr>
                  <tr bgcolor="#C7E1E9" class="normalText"> 
                    <td>&lt;date3&gt;</td>
                    <td> <div align="center">&lt;trainer3&gt;</div></td>
                    <td><div align="center">&lt;time3&gt; </div></td>
                    <td><div align="right">45</div></td>
                  </tr>
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
