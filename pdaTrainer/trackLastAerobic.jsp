<%@page contentType="text/html"%>
<%@include file="../common/imports.jsp"%>
<%@include file="init.jsp"%>
<%
	Routine routine = (Routine)session.getAttribute("routine");
	String excerciseID = request.getParameter("id");
	
	AerobicExcercise excercise = null;
	if (excerciseID != null) {
		excercise = (AerobicExcercise)routine.getExcercise(Long.parseLong(excerciseID));
		session.setAttribute("excercise", excercise);
	}
	else
		excercise = (AerobicExcercise)session.getAttribute("excercise");
	
%>
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
<html>
<head>
<title>pda2.gif</title>
<script>
function forward(baseLink)
{
	httpLink = baseLink + '&min=' + mainForm.min.value + '&intensity=' + mainForm.intensity.value + '&heartrate=' + mainForm.heartrate.valuel;
	window.location = httpLink;
}
</script>
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
    <td rowspan="2" bgcolor="#CCCCFF"><strong><font color="#000000" size="1" face="Arial, Helvetica, sans-serif">Track 
      Performance</font></strong></td>
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
      <table width="95%" border="0" align="center" cellpadding="1" cellspacing="1">
        <tr> 
          <td colspan="4" class="sectionText"><strong><font size="2" face="Arial, Helvetica, sans-serif">Last 
            Session</font></strong></td>
        </tr>
        <tr> 
          <td colspan="4" class="sectionText"><strong><font color="#000000" size="1" face="Arial, Helvetica, sans-serif">Routine: 
            <%=routine.getName()%> </font></strong></td>
        </tr>
        <tr> 
          <td colspan="4"><strong><font size="1" face="Arial, Helvetica, sans-serif">Exercise: 
            <%=excercise.getName()%> </font></strong></td>
        </tr>
        <tr> 
          <td colspan="4"><strong><font size="1" face="Arial, Helvetica, sans-serif">Date:</font></strong></td>
        </tr>
        <tr> 
          <td colspan="4"><strong><font size="1" face="Arial, Helvetica, sans-serif">Trainer:</font></strong></td>
        </tr>
        <tr> 
          <td><div align="center"><font size="1" face="Arial, Helvetica, sans-serif">Set 
              #</font></div></td>
          <td> <div align="center"><font size="1" face="Arial, Helvetica, sans-serif">Time</font></div></td>
          <td> <div align="center"><font size="1" face="Arial, Helvetica, sans-serif">Intensity</font></div></td>
          <td> <div align="center"><font size="1" face="Arial, Helvetica, sans-serif">Heart 
              Rate</font></div></td>
        </tr>
        <%
            int count = 1;
        	Iterator i = excercise.getSets().iterator();
        	while (i.hasNext())
        	{
        		int set[] = (int[])i.next();   
        		%>
        <tr> 
          <td width="20%"><div align="center"><%=count++%></div></td>
          <td><div align="center"><%=set[0]%></div></td>
          <td><div align="center"><%=set[1]%></div></td>
          <td><div align="center"><%=set[2]%></div></td>
        </tr>
        <%	}
        %>
      </table>
      <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td><div align="right"><img src="buttons/back.gif" width="35" height="19"></div></td>
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