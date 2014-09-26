<%@page contentType="text/html"%>
<%@include file="imports.jsp"%>
<%@include file="init.jsp"%>
<%
	session.setAttribute("selectedClient", null);
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
    <td colspan="2" rowspan="2" bgcolor="#CCCCFF"></td>
   <td rowspan="6"><img name="pda2_r2_c7" src="images/pda2_r2_c7.gif" width="11" height="255" border="0" alt=""></td>
   <td><img src="images/spacer.gif" width="1" height="11" border="0" alt=""></td>
  </tr>
  <tr>
   <td rowspan="3" colspan="2"><img name="pda2_r3_c1" src="images/pda2_r3_c1.gif" width="12" height="18" border="0" alt=""></td>
    <td rowspan="2" bgcolor="#CCCCFF"><font size="1" face="Arial, Helvetica, sans-serif"><strong>Trainer 
      Main Menu</strong></font></td>
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
    <td colspan="4" valign="top"><div align="right"><img src="images/ghfc2.gif" width="73" height="33"> 
      </div>
      <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr align="center"> 
          <td colspan="2"><div align="center"><strong><font size="2" face="Arial, Helvetica, sans-serif">Welcome 
              <%=(trainer.getFirstName() + " " + trainer.getLastName())%></font></strong></div></td>
        </tr>
        <tr align="center"> 
          <td> <div align="center"><font face="Arial, Helvetica, sans-serif"><strong><a href="membersMain.jsp"><img src="images/person.gif" width="35" height="35" border="0"></a></strong></font></div></td>
          <td> <div align="center"><strong><font face="Arial, Helvetica, sans-serif"><a href="appointmentsMain.jsp"><img src="images/addressbook.gif" width="35" height="35" border="0"></a></font></strong></div></td>
        </tr>
        <tr align="center"> 
          <td> <div align="center"><font size="1" face="Arial, Helvetica, sans-serif"><strong>Clients</strong></font></div></td>
          <td> <div align="center"><strong><font face="Arial, Helvetica, sans-serif"><font size="1">Appointments</font></font></strong></div></td>
        </tr>
        <tr align="center"> 
          <td> <div align="center"><strong><font face="Arial, Helvetica, sans-serif"><a href="routinesMain.jsp"><img src="images/dumbbell.gif" width="35" height="35" border="0"></a></font></strong></div></td>
          <td> <div align="center"><strong><font face="Arial, Helvetica, sans-serif"><a href="messaging_choose.jsp"><img src="images/messaging.gif" width="35" height="35" border="0"></a></font></strong></div></td>
        </tr>
        <tr align="center"> 
          <td><div align="center"><strong><font face="Arial, Helvetica, sans-serif"><font size="1">Workout 
              Routines </font></font></strong></div></td>
          <td> <div align="center"><strong><font face="Arial, Helvetica, sans-serif"><font size="1">Messaging</font></font></strong></div></td>
        </tr>
        <tr align="center"> 
          <td colspan="2"><strong><font face="Arial, Helvetica, sans-serif"><a href="index.jsp"><img src="images/logout.gif" width="35" height="35" border="0"></a></font></strong></td>
        </tr>
        <tr align="center"> 
          <td colspan="2"><strong><font face="Arial, Helvetica, sans-serif"><font size="1">Logout</font></font></strong></td>
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