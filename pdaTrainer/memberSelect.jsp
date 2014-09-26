<%@page contentType="text/html"%>
<%@include file="imports.jsp"%>
<%@include file="init.jsp"%>
<%
	session.setAttribute("routine", null);
	session.setAttribute("excercise", null);

        Enumeration enum = client.getNotes().elements();
        boolean hasActive = false;
        while (enum.hasMoreElements() && !hasActive) {
            Note note = (Note)enum.nextElement();   
            hasActive = note.getActive();
        }
%>
<html>
<head>
<title>Trainer - Members</title>
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
    <td colspan="2" rowspan="2" bgcolor="#CCCCFF"><a href="main.jsp"><img src="buttons/mainMenu.gif" width="59" height="14" border="0"></a></td>
   <td rowspan="6"><img name="pda2_r2_c7" src="images/pda2_r2_c7.gif" width="11" height="255" border="0" alt=""></td>
   <td><img src="images/spacer.gif" width="1" height="11" border="0" alt=""></td>
  </tr>
  <tr>
   <td rowspan="3" colspan="2"><img name="pda2_r3_c1" src="images/pda2_r3_c1.gif" width="12" height="18" border="0" alt=""></td>
    <td rowspan="2" bgcolor="#CCCCFF"><font size="1" face="Arial, Helvetica, sans-serif"><strong>Clients</strong></font></td>
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
    <td colspan="4" valign="middle"> 
      <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <td><div align="center"><font size="2" face="Arial, Helvetica, sans-serif"><strong>Now 
              Training <%=(client.getFirstName() + " " + client.getLastName())%></strong></font></div></td>
        </tr>
        <tr>
          <td height="10">&nbsp;</td>
        </tr>
      </table>
      <table width="95%" border="0" align="center" cellpadding="1" cellspacing="1">
        <tr align="center"> 
          <td width="25%"> <div align="left"><a href="memberRoutines.jsp"><img src="images/personDumbbell.gif" width="35" height="35" border="0" align="middle"></a></div></td>
          <td width="25%">
<div align="left"><font size="1" face="Arial, Helvetica, sans-serif">Routines</font></div></td>
          <td width="25%"><div align="left"><a href="performMain.jsp"><img src="images/personChart.gif" width="35" height="35" border="0" align="middle"></a></div></td>
          <td width="25%"><div align="left"><font size="1" face="Arial, Helvetica, sans-serif">Performance</font></div></td>
        </tr>
        <tr align="center"> 
          <td width="35"> <div align="left"><a href="viewClientProfile.jsp"> 
              <font size="1" face="Arial, Helvetica, sans-serif"><img src="images/personFolder.gif" width="35" height="35" border="0" align="middle"></font></a></div></td>
          <td width="25%"><div align="left"><font size="1" face="Arial, Helvetica, sans-serif">Profile 
              and Contracts</font></div></td>
          <td><div align="left"><a href="appointmentsMain.jsp"><img src="images/personBook.gif" width="35" height="35" border="0" align="middle"></a></div></td>
          <td><div align="left"><font size="1" face="Arial, Helvetica, sans-serif">Appointments</font></div></td>
        </tr>
        <tr align="center"> 
          <td width="35">
<div align="left"><font size="1" face="Arial, Helvetica, sans-serif"><a href="viewNotes.jsp"><img src="images/personNote.gif" width="35" height="35" border="0" align="middle"></a></font></div></td>
<%
    if (hasActive) {%>
            
          <td width="25%">
<div align="left"><font color="#FF0000" size="1" face="Arial, Helvetica, sans-serif">Active Notes</font></div></td>
<%  } else {%>
            <td><div align="left"><font size="1" face="Arial, Helvetica, sans-serif">Notes</font></div></td>
<%  }
%>
          
          <td><div align="left"><a href="purchaseSelect.jsp"><img src="images/personDollar.gif" width="35" height="35" border="0" align="middle"></a></div></td>
          <td><div align="left"><font size="1" face="Arial, Helvetica, sans-serif">Buy 
              Service Or Program</font></div></td>
        </tr>
        <tr align="center"> 
          <td width="35">
<div align="left"><font size="1" face="Arial, Helvetica, sans-serif"><a href="membersMain.jsp"><img src="images/personX.gif" width="35" height="35" border="0" align="middle"></a></font></div></td>
          <td width="25%">
<div align="left"><font size="1" face="Arial, Helvetica, sans-serif">Logout</font></div></td>
          <td><a href="messaging_choose.jsp"><img src="images/messaging.gif" width="35" height="35" border="0"></a></td>
          <td><div align="left"><font size="1" face="Arial, Helvetica, sans-serif">Messaging</font></div></td>
        </tr>
      </table>
    </td>
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