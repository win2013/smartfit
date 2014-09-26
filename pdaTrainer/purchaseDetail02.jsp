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
	Program program = (Program)session.getAttribute("program");
	
%>
<html>
<head>
<title>Routines</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<body bgcolor="#ffffff" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" >
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
    <td rowspan="2" bgcolor="#CCCCFF"><strong><font size="1" face="Arial, Helvetica, sans-serif">Purchase 
      </font></strong></td>
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
    <td colspan="4" valign="top">
<form name="routinesForm" method="post" action="">
        <table width="90%" border="0" align="center" cellpadding="1" cellspacing="0">
          <tr> 
            <td height="16" colspan="2" class="sectionText"><strong><font color="#000000" size="2" face="Arial, Helvetica, sans-serif">Select 
              A Date And Time</font></strong></td>
          </tr>
          <tr valign="top"> 
            <td height="13" colspan="2"> <div align="left"><strong><font color="#000000" size="1" face="Arial, Helvetica, sans-serif"><%=program.getName()%></font></strong></div></td>
          </tr>
          <tr valign="top"> 
            <td valign="top"><div align="left"><font color="#000000" size="1" face="Arial, Helvetica, sans-serif"><strong>Date</strong></font></div></td>
            <td valign="top"><select name="select">
                <option>Monday May 12</option>
                <option>Wednesday May 14</option>
                <option>Friday May 16</option>
                <option>Monday May 19</option>
                <option>Wednesday May 21</option>
                <option>Friday May 23</option>
              </select></td>
          </tr>
          <tr valign="top"> 
            <td valign="top"><strong><font color="#000000" size="1" face="Arial, Helvetica, sans-serif">Time</font></strong></td>
            <td valign="top"><select name="select2">
                <option>10:00 AM</option>
                <option>1:00 PM</option>
                <option>7:00 PM</option>
              </select></td>
          </tr>
          <tr valign="top"> 
            <td valign="top"><div align="center"><img src="buttons/next.gif" width="35" height="19"></div></td>
            <td width="50%" valign="top"><div align="center"><img src="buttons/cancel.gif" width="47" height="19"></div></td>
          </tr>
        </table>
            </form></td>
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