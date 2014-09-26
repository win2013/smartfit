<%@page contentType="text/html"%>
<%@include file="imports.jsp"%>
<%@include file="init.jsp"%>
<html>
<body bgcolor="#ffffff" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<%
    String startTime = request.getParameter("startTime");
    String endTime = request.getParameter("endTime");
    long start = Long.parseLong(startTime);
    long end = Long.parseLong(endTime);

    Object o = session.getAttribute("conflict");
    StringBuffer sb = new StringBuffer();
    String apptStart = "";
    String apptEnd = "";
    if (o instanceof Appointment) {
        Appointment appt = (Appointment)o;
        apptStart = SMUtils.parseDateAndTime(appt.getStartTime());
        apptEnd = SMUtils.parseDateAndTime(appt.getEndTime());
        Enumeration users = appt.getUserAppointments().elements();
        while (users.hasMoreElements()) {
            User user = (User)users.nextElement();
            sb.append(user.getFirstName() + " " + user.getLastName());
            if (users.hasMoreElements()) {
                sb.append(", ");
            }
        }
    }
%>
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
    <td colspan="4" valign="top"> <table width="90%" border="0" align="center" cellpadding="2" cellspacing="0">
        <tr> 
          <td colspan="2">&nbsp;</td>
        </tr>
        <tr> 
          <td colspan="2"><p><font size="1" face="Arial, Helvetica, sans-serif"><strong><font color="#FF0000">Attention</font><font color="#FF0000">: 
              </font></strong>There is a conflict for the appointment between: 
              <%=SMUtils.parseDateAndTime(start)%> + " and " + <%=SMUtils.parseDateAndTime(end)%><br>
              </font><font size="1" face="Arial, Helvetica, sans-serif">A meeting 
              for <%=sb.toString()%> is scheduled between <%=apptStart + " and " + apptEnd%> 
              </font></p>
            </td>
        </tr>
        <tr> 
          <td width="50%"> <div align="center"></div></td>
          <td width="50%"> <div align="center"><a href="appointmentsMain.jsp"><img src="buttons/ok.gif" width="23" height="19" border="0"></a></div></td>
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