<%@page contentType="text/html"%>
<%@include file="../common/imports.jsp"%>
<%@include file="init.jsp"%>
<%
	String backButtonImage = "";
	String backButtonLink = "";
	if (client == null)
	{
		backButtonImage = "buttons/mainMenu.gif";
		backButtonLink = "main.jsp";
	}
	else
	{
		backButtonImage = "buttons/mainMembers.gif";
		backButtonLink = "memberSelect.jsp";
	}
%>
<%
	FitnessAssessment a = client.getFitnessAssessment();
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
    <td rowspan="2" colspan="2"><a href="<%=backButtonLink%>" ><img src="<%=backButtonImage%>" alt="Main Menu" name="Image27" width="59" height="14" border="0"></a></td>
   <td rowspan="6"><img name="pda2_r2_c7" src="images/pda2_r2_c7.gif" width="11" height="255" border="0" alt=""></td>
   <td><img src="images/spacer.gif" width="1" height="11" border="0" alt=""></td>
  </tr>
  <tr>
   <td rowspan="3" colspan="2"><img name="pda2_r3_c1" src="images/pda2_r3_c1.gif" width="12" height="18" border="0" alt=""></td>
    <td rowspan="2" bgcolor="#CCCCFF"><font size="1" face="Arial, Helvetica, sans-serif"><strong>Fitness 
      Assessment</strong></font></td>
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
    <td colspan="4" valign="top"><table width="90%" border="0" align="center" cellpadding="1" cellspacing="0">
        <tr bgcolor="#3366CC"> 
          <td colspan="2"><font color="#FFFFFF" size="2" face="Arial, Helvetica, sans-serif"><strong>Body 
            Composition </strong></font></td>
        </tr>
        <tr> 
          <td colspan="2"><font size="1" face="Arial, Helvetica, sans-serif">Pectoralis 
            (Chest) : <%=a.pecs[0] + "/" + a.pecs[1]%></font></td>
        </tr>
        <tr> 
          <td colspan="2"><font size="1" face="Arial, Helvetica, sans-serif"><strong>Abdominal: <%=a.abs[0] + "/" + a.abs[1]%>
            </strong></font></td>
        </tr>
        <tr> 
          <td colspan="2"><strong><font size="1" face="Arial, Helvetica, sans-serif">Thigh: <%=a.maleThigh[0] + "/" + a.maleThigh[1]%>
            </font></strong></td>
        </tr>
        <tr> 
          <td colspan="2"><strong><font size="1" face="Arial, Helvetica, sans-serif">Total 
            % Body Fat: <%=a.maleTotal[0] + "/" + a.maleTotal[1]%></font></strong></td>
        </tr>
        <tr> 
          <td colspan="2"><font size="1" face="Arial, Helvetica, sans-serif"><strong>Category:  <%=a.malCat%>
            </strong></font></td>
        </tr>
        <tr> 
          <td width="61%"><div align="left"><a href="viewFitnessAssess01.jsp"><img src="buttons/back.gif" width="35" height="19" border="0"></a></div></td>
          <td width="31%"><div align="right"><a href="viewFitnessAssess03.jsp"><img src="buttons/next.gif" width="35" height="19" border="0"></a></div></td>
        </tr>
      </table> </td>
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