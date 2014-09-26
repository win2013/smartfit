
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
<script language="JavaScript">
function change(desiredColor, desiredElement)
{
	o=document.getElementById(desiredElement);
	o.style.backgroundColor=desiredColor;
}
</script>
</head>

<body bgcolor="#ffffff" link="#3333CC" vlink="#3333CC" alink="#0099FF" >
<form name="form1" method="post" action="">
  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="boxBorder">
    <tr> 
      <td><table width="100%" border="0" cellpadding="2" cellspacing="0" align="center" class="tableTop">
          <tr> 
            <td bgcolor="#FFCC66" class="largeHeading"> 
              <div align="center">Appointment Options</div></td>
          </tr>
        </table>
        <table width="100%" border="0" align="center" cellpadding="3" cellspacing="0">
          <tr> 
            <td width="10%" class="largeHeading"> <div align="center"> 
                <div align="left"> 
                  <table border="0" cellpadding="0" cellspacing="0" class="dashedBox">
                    <tr> 
                      <td><a href="appointments_today.jsp"><img onmouseout="javascript:change('white', 'A')" onmouseover="javascript:change('#F0F0F0', 'A')" src="pictures/daily.gif" width="75" height="60" border="0"></a></td>
                    </tr>
                  </table>
                </div>
              </div></td>
            <td ID="A" onmouseout="javascript:change('white', 'A')" onmouseover="javascript:change('#F0F0F0', 'A')" width="40%" class="largeHeading"><a href="appointments_today.jsp">Today's 
              Appointments</a><span class="normalText"><br>
              <font color="#666666">View or modify appointments scheduled for 
              today.</font></span></td>
            <td width="10%" class="largeHeading"> <table border="0" cellpadding="0" cellspacing="0" class="dashedBox">
                <tr> 
                  <td><a href="appointments_calendar.jsp"><img src="pictures/calendar.gif" width="75" height="60" border="0" onmouseover="javascript:change('#F0F0F0', 'B')" onmouseout="javascript:change('white', 'B')"></a></td>
                </tr>
              </table></td>
            <td ID="B" onmouseout="javascript:change('white', 'B')" onmouseover="javascript:change('#F0F0F0', 'B')" width="40%" class="largeHeading"><a href="appointments_calendar.jsp">View 
              Calendar</a><span class="normalText"><br>
              <font color="#666666">Use the calendar view to select a day.</font></span></td>
          </tr>
          <tr> 
            <td width="17%" class="largeHeading"><table border="0" cellpadding="0" cellspacing="0" class="dashedBox">
                <tr> 
                  <td><a href="appointments_setInterval.jsp"><img src="pictures/range.gif" width="75" height="60" border="0" onmouseover="javascript:change('#F0F0F0', 'C')" onmouseout="javascript:change('white', 'C')"></a></td>
                </tr>
              </table></td>
            <td ID="C" onmouseout="javascript:change('white', 'C')" onmouseover="javascript:change('#F0F0F0', 'C')" width="40%" class="largeHeading"><span class="largeHeading"><a href="appointments_setInterval.jsp">View 
              a Range of Days</a></span><span class="normalText"><br>
              <font color="#666666">View appointments in a user specified range 
              of days.</font></span></td>
            <td class="largeHeading"><table border="0" cellpadding="0" cellspacing="0" class="dashedBox">
                <tr> 
                  <td><a href="appointments_createMod.jsp"><img onmouseout="javascript:change('white', 'D')" onmouseover="javascript:change('#F0F0F0', 'D')" src="pictures/createappointment.gif" width="75" height="60" border="0"></a></td>
                </tr>
              </table></td>
            <td ID="D" onmouseout="javascript:change('white', 'D')" onmouseover="javascript:change('#F0F0F0', 'D')" class="largeHeading"><a href="appointments_createMod.jsp">Create 
              Appointment</a><br>
              <span class="normalText"><font color="#666666">Create an appointment 
              on a specific day.</font></span></td>
          </tr>
        </table></td>
    </tr>
  </table>
</form>
</body>
</html>
