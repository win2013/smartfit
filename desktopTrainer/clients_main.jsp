<%@include file="imports.jsp"%>
<%    
    String clientID = request.getParameter("clientID");
    if (clientID != null) {
        int id = Integer.parseInt(clientID);
        Client client = (Client)trainer.getClient(id);
        if (client == null) {
            response.sendRedirect("main.jsp");
            return;
        }
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
            <td bgcolor="#FFCC66" class="largeHeading"> 
              <div align="center">Managing <%=client.getFirstName() + " " + client.getLastName()%></div></td>
          </tr>
        </table>
        <table width="100%" border="0" align="center" cellpadding="3" cellspacing="0">
          <tr> 
            <td width="10%" class="largeHeading"> <div align="center"> 
                <div align="left"> 
                  <table border="0" cellpadding="0" cellspacing="0" class="dashedBox">
                    <tr> 
                      <td><a href="clients_profileMain.jsp"><img onmouseout="javascript:change('white', 'A')" onmouseover="javascript:change('#F0F0F0', 'A')" src="pictures/profile.gif" width="75" height="60" border="0"></a></td>
                    </tr>
                  </table>
                </div>
              </div></td>
            <td ID="A" onmouseout="javascript:change('white', 'A')" onmouseover="javascript:change('#F0F0F0', 'A')" width="37%" class="largeHeading"><a href="clients_profileMain.jsp">Profile</a><span class="normalText"><br>
              <font color="#666666">View or modify client's profile and fitness 
              assessment.</font></span></td>
            <td width="10%" class="largeHeading"> <table border="0" cellpadding="0" cellspacing="0" class="dashedBox">
                <tr> 
                  <td><a href="clients_notesMain.jsp"><img src="pictures/notes.gif" width="75" height="60" border="0" onmouseover="javascript:change('#F0F0F0', 'B')" onmouseout="javascript:change('white', 'B')"></a></td>
                </tr>
              </table></td>
            <td ID="B" onmouseout="javascript:change('white', 'B')" onmouseover="javascript:change('#F0F0F0', 'B')" width="41%" class="largeHeading"><a href="clients_notesMain.jsp">Notes</a><span class="normalText"><br>
              <font color="#666666">View or create notes for client.</font></span></td>
          </tr>
          <tr> 
            <td class="largeHeading"><table border="0" cellpadding="0" cellspacing="0" class="dashedBox">
                <tr> 
                  <td><a href="clients_routines_view.jsp"><img onmouseout="javascript:change('white', 'C')" onmouseover="javascript:change('#F0F0F0', 'C')" src="pictures/routines.gif" width="75" height="60" border="0"></a></td>
                </tr>
              </table></td>
            <td ID="C" onmouseout="javascript:change('white', 'C')" onmouseover="javascript:change('#F0F0F0', 'C')" class="largeHeading"><span class="largeHeading"><a href="clients_routines_view.jsp">Routines</a></span><span class="normalText"><br>
              <font color="#666666">Create or modify client's routines.</font></span></td>
            <td class="largeHeading"><table border="0" cellpadding="0" cellspacing="0" class="dashedBox">
                <tr> 
                  <td><a href="clients_appointment.jsp"><img onmouseout="javascript:change('white', 'D')" onmouseover="javascript:change('#F0F0F0', 'D')" src="pictures/appointments.gif" width="75" height="60" border="0"></a></td>
                </tr>
              </table></td>
            <td ID="D" onmouseout="javascript:change('white', 'D')" onmouseover="javascript:change('#F0F0F0', 'D')" class="largeHeading"><a href="clients_appointment.jsp">Appointments</a><br> 
              <span class="normalText"><font color="#666666">View or create appointments 
              for client.</font></span></td>
          </tr>
          <tr> 
            <td class="largeHeading"><table border="0" cellpadding="0" cellspacing="0" class="dashedBox">
                <tr> 
                  <td><a href="clients_performanceMain.jsp"><img onmouseout="javascript:change('white', 'E')" onmouseover="javascript:change('#F0F0F0', 'E')" src="pictures/performance.gif" width="75" height="60" border="0"></a></td>
                </tr>
              </table></td>
            <td class="largeHeading" ID="E" onmouseover="javascript:change('#F0F0F0', 'E')" onmouseout="javascript:change('white', 'E')"><span class="largeHeading"><font color="#666666"><a href="clients_performanceMain.jsp">View 
              Performance Reports</a></font></span><font color="#666666"><span class="normalText"><br>
              View performance tracking for client.</span></font></td>
            <td class="largeHeading"><table border="0" cellpadding="0" cellspacing="0" class="dashedBox">
                <tr> 
                  <td><img onmouseout="javascript:change('white', 'F')" onmouseover="javascript:change('#F0F0F0', 'F')" src="pictures/programs.gif" width="75" height="60"></td>
                </tr>
              </table></td>
            <td ID="F" onmouseout="javascript:change('white', 'F')" onmouseover="javascript:change('#F0F0F0', 'F')" class="largeHeading">Buy 
              Service or Program<br> <span class="normalText"><font color="#666666">Purchase 
              a service or program for client.</font></span></td>
          </tr>
          <tr> 
            <td class="largeHeading"><table border="0" cellpadding="0" cellspacing="0" class="dashedBox">
                <tr> 
                  <td><a href="contracts_setInterval.jsp"><img onmouseout="javascript:change('white', 'G')" onmouseover="javascript:change('#F0F0F0', 'G')" src="pictures/contract.gif" width="75" height="60" border="0"></a></td>
                </tr>
              </table></td>
            <td class="largeHeading" ID="G" onmouseover="javascript:change('#F0F0F0', 'G')" onmouseout="javascript:change('white', 'G')" ><a href="contracts_setInterval.jsp">Contracts</a><br> 
              <span class="normalText"><font color="#666666">View current and 
              expired contracts.</font></span><br> <span class="normalText">
            <td colspan="4"><font color="#666666"> </tr>
        </table></td>
    </tr>
  </table>
</form>
</body>
</html>
