<%@include file="imports.jsp"%>
<%
    String trainerID = request.getParameter("trainerID");
    int id = Integer.parseInt(trainerID);
    Trainer trainer = club.getTrainer(id);
    session.setAttribute("trainer", trainer);
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
            <td bgcolor="#99CCFF" class="largeHeading"> <div align="center">Options 
                for Trainer <%=trainer.getFirstName() + " " + trainer.getLastName()%></div></td>
          </tr>
        </table>
        <table width="100%" border="0" align="center" cellpadding="3" cellspacing="0">
          <tr> 
            <td width="12%" class="largeHeading"> <div align="left"> 
                <table border="0" cellpadding="0" cellspacing="0" class="dashedBox">
                  <tr> 
                    <td><a href="trainer_routinesMain.jsp"><img onmouseout="javascript:change('white', 'A')" onmouseover="javascript:change('#F0F0F0', 'A')" src="pictures/routines.gif" width="75" height="60" border="0"></a></td>
                  </tr>
                </table>
              </div></td>
            <td width="40%" ID="A" onmouseout="javascript:change('white', 'A')" onmouseover="javascript:change('#F0F0F0', 'A')" class="largeHeading"><span class="largeHeading"><a href="trainer_routinesMain.jsp">Routines</a></span><span class="normalText"><br>
              <font color="#666666">View trainer's routines.</font></span></td>
            <td width="9%" class="largeHeading"><table border="0" cellpadding="0" cellspacing="0" class="dashedBox">
                <tr> 
                  <td><a href="trainer_exercises.jsp"><img onmouseout="javascript:change('white', 'B')" onmouseover="javascript:change('#F0F0F0', 'B')"  src="pictures/exercises.gif" width="75" height="60" border="0"></a></td>
                </tr>
              </table></td>
            <td ID="B" onmouseout="javascript:change('white', 'B')" onmouseover="javascript:change('#F0F0F0', 'B')"  width="40%" class="largeHeading"><a href="trainer_exercises.jsp">Exercises</a><br> 
              <span class="normalText"><font color="#666666">View trainer's exercises.</font></span></td>
          </tr>
          <tr> 
            <td class="largeHeading"><table border="0" cellpadding="0" cellspacing="0" class="dashedBox">
                <tr> 
                  <td><a href="trainer_notesMain.jsp"><img onmouseout="javascript:change('white', 'C')" onmouseover="javascript:change('#F0F0F0', 'C')" src="pictures/notes.gif" width="75" height="60" border="0"></a></td>
                </tr>
              </table></td>
            <td  ID="C" onmouseout="javascript:change('white', 'C')" onmouseover="javascript:change('#F0F0F0', 'C')" width="40%" class="largeHeading"><a href="trainer_notesMain.jsp">Notes</a><span class="normalText"><br>
              <font color="#666666">View trainer's notes and flags.</font></span></td>
            <td class="largeHeading"><table border="0" cellpadding="0" cellspacing="0" class="dashedBox">
                <tr> 
                  <td><a href="trainer_profileMain.jsp"><img onmouseout="javascript:change('white', 'D')" onmouseover="javascript:change('#F0F0F0', 'D')" src="pictures/profile.gif" width="75" height="60" border="0"></a></td>
                </tr>
              </table></td>
            <td  ID="D" onmouseout="javascript:change('white', 'D')" onmouseover="javascript:change('#F0F0F0', 'D')" class="largeHeading"><a href="trainer_profileMain.jsp">Profile</a><span class="normalText"><br>
              <font color="#666666">View and edit trainer's profile.</font></span></td>
          </tr>
          <tr> 
            <td class="largeHeading"><table border="0" cellpadding="0" cellspacing="0" class="dashedBox">
                <tr> 
                  <td><a href="appointment_setInterval.jsp"><img onmouseout="javascript:change('white', 'F')" onmouseover="javascript:change('#F0F0F0', 'F')" src="pictures/appointments.gif" width="75" height="60" border="0"></a></td>
                </tr>
              </table></td>
            <td  ID="F" onmouseout="javascript:change('white', 'F')" onmouseover="javascript:change('#F0F0F0', 'F')" class="largeHeading"><a href="appointment_setInterval.jsp">Appointments</a><br> 
              <span class="normalText"><font color="#666666">View trainer's appointments.</font></span></td>
            <td class="largeHeading"><table border="0" cellpadding="0" cellspacing="0" class="dashedBox">
                <tr> 
                  <td><a href="trainer_contracts_setInterval.jsp"><img onmouseout="javascript:change('white', 'G')" onmouseover="javascript:change('#F0F0F0', 'G')"src="pictures/contract.gif" width="75" height="60" border="0"></a></td>
                </tr>
              </table></td>
            <td ID="G" onmouseout="javascript:change('white', 'G')" onmouseover="javascript:change('#F0F0F0', 'G')" class="largeHeading"><a href="trainer_contracts_setInterval.jsp">Contracts</a><br>
              <span class="normalText"><font color="#666666">View trainer's contracts.</font></span></td>
          </tr>
        </table></td>
    </tr>
  </table>
</form>
</body>
</html>
