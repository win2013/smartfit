<%@include file="imports.jsp"%>
<%
    String clientID = request.getParameter("clientID");
    if (clientID != null) {
        Client client = club.getClient(Integer.parseInt(clientID));
        session.setAttribute("client", client);
    }

    Client client = (Client)session.getAttribute("client");
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
                for Member <%=client.getFirstName() + " " + client.getLastName()%></div></td>
          </tr>
        </table>
        <table width="100%" border="0" align="center" cellpadding="3" cellspacing="0">
          <tr> 
            <td width="10%" class="largeHeading"> 
              <div align="left"> 
                <table border="0" cellpadding="0" cellspacing="0" class="dashedBox">
                  <tr> 
                    <td><a href="member_routinesMain.jsp"><img onmouseout="javascript:change('white', 'A')" onmouseover="javascript:change('#F0F0F0', 'A')" src="pictures/routines.gif" width="75" height="60" border="0"></a></td>
                  </tr>
                </table>
              </div></td>
            <td ID="A" onmouseout="javascript:change('white', 'A')" onmouseover="javascript:change('#F0F0F0', 'A')" width="40%" class="largeHeading"><span class="largeHeading"><a href="member_routinesMain.jsp">Routines</a></span><span class="normalText"><br>
              <font color="#666666">View member's routines.</font></span></td>
            <td width="10%" class="largeHeading"> <table border="0" cellpadding="0" cellspacing="0" class="dashedBox">
                <tr> 
                  <td><a href="member_profileMain.jsp"><img onmouseout="javascript:change('white', 'B')" onmouseover="javascript:change('#F0F0F0', 'B')" src="pictures/profile.gif" width="75" height="60" border="0"></a></td>
                </tr>
              </table></td>
            <td ID="B" onmouseout="javascript:change('white', 'B')" onmouseover="javascript:change('#F0F0F0', 'B')" width="40%" class="largeHeading"><a href="member_profileMain.jsp">Profile</a><span class="normalText"><br>
              <font color="#666666">View member's registration information and 
              fitness profile.</font></span></td>
          </tr>
          <tr> 
            <td class="largeHeading"><table border="0" cellpadding="0" cellspacing="0" class="dashedBox">
                <tr> 
                  <td><a href="member_notesMain.jsp"><img onmouseout="javascript:change('white', 'C')" onmouseover="javascript:change('#F0F0F0', 'C')"src="pictures/notes.gif" width="75" height="60" border="0"></a></td>
                </tr>
              </table></td>
            <td ID="C" onmouseout="javascript:change('white', 'C')" onmouseover="javascript:change('#F0F0F0', 'C')" width="40%" class="largeHeading"><a href="member_notesMain.jsp">Notes</a><span class="normalText"><br>
              <font color="#666666">View member's notes and flags.</font></span></td>
            <td class="largeHeading"><table border="0" cellpadding="0" cellspacing="0" class="dashedBox">
                <tr> 
                  <td><a href="member_performanceMain.jsp"><img onmouseout="javascript:change('white', 'D')" onmouseover="javascript:change('#F0F0F0', 'D')" src="pictures/performance.gif" width="75" height="60" border="0"></a></td>
                </tr>
              </table></td>
            <td ID="D" onmouseout="javascript:change('white', 'D')" onmouseover="javascript:change('#F0F0F0', 'D')"width="40%" class="largeHeading"> 
              <p><a href="member_performanceMain.jsp">Performance</a><span class="normalText"><br>
                <font color="#666666">View member's performance tracking.</font></span></p></td>
          </tr>
          <tr> 
            <td class="largeHeading"><table border="0" cellpadding="0" cellspacing="0" class="dashedBox">
                <tr> 
                  <td><a href="appointment_setInterval.jsp"><img onmouseout="javascript:change('white', 'E')" onmouseover="javascript:change('#F0F0F0', 'E')" src="pictures/appointments.gif" width="75" height="60" border="0"></a></td>
                </tr>
              </table></td>
            <td width="40%" ID="E" onmouseover="javascript:change('#F0F0F0', 'E')" onmouseout="javascript:change('white', 'E')"><span class="largeHeading"><a href="appointment_setInterval.jsp">Appointments</a></span><br> 
              <span class="normalText"><font color="#666666">View member's appointments.</font></span></td>
            <td bgcolor="#FFFFFF" class="largeHeading"><table border="0" cellpadding="0" cellspacing="0" class="dashedBox">
                <tr> 
                  <td><a href="member_contracts_setInterval.jsp"><img onmouseout="javascript:change('white', 'G')" onmouseover="javascript:change('#F0F0F0', 'G')"src="pictures/contract.gif" width="75" height="60" border="0"></a></td>
                </tr>
              </table></td>
            <td width="40%" ID="G" onmouseover="javascript:change('#F0F0F0', 'G')" onmouseout="javascript:change('white', 'G')"><span class="largeHeading"><a href="member_contracts_setInterval.jsp">Contracts</a></span><br> 
              <span class="normalText"><font color="#666666">View current and 
              expired contracts.</font></span></td>
          </tr>
          <tr> 
            <td class="largeHeading"><table border="0" cellpadding="0" cellspacing="0" class="dashedBox">
                <tr>
                  <td><a href="member_flagsMain.jsp"><img onmouseover="javascript:change('#F0F0F0', 'H')" onmouseout="javascript:change('white', 'H')" src="pictures/flag.gif" width="75" height="60" border="0"></a></td>
                </tr>
              </table></td>
            <td ID="H" width="40%" class="largeHeading" onmouseover="javascript:change('#F0F0F0', 'H')" onmouseout="javascript:change('white', 'H')"><a href="member_flagsMain.jsp">Exercise 
              Flags</a><br>
              <span class="normalText"><font color="#666666">View member's exercise 
              flags.</font></span></td>
            <td width="10%" bgcolor="#FFFFFF" class="largeHeading">&nbsp;</td>
            
          </tr>
        </table></td>
    </tr>
  </table>
</form>
</body>
</html>
