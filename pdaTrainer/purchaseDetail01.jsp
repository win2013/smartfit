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
	String programID = request.getParameter("programID");
	Program program = club.getProgram(Long.parseLong(programID));
	session.setAttribute("program", program);	
%>
<html>
<head>
<meta http-equiv="Content-Language" content="en-us">

<title>Routines</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
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
        <table width="95%" border="0" align="center" cellpadding="1" cellspacing="2">
          <tr> 
            <td height="16" colspan="2" class="sectionText"><strong><font color="#000000" size="2" face="Arial, Helvetica, sans-serif">
            Selected Program</font></strong></td>
          </tr>
          <tr valign="top"> 
            <td height="13" colspan="2"> <div align="left"><strong><font color="#000000" size="1" face="Arial, Helvetica, sans-serif"><%=program.getName()%></font></strong></div></td>
          </tr>
          <tr valign="top"> 
            <td colspan="2" valign="top"><div align="left"><font color="#000000" size="1" face="Arial, Helvetica, sans-serif"><strong><%=program.getDescription()%></strong></font></div></td>
          </tr>
          <tr valign="top"> 
            <td colspan="2" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>Equipment:  <%=program.getEquipment()%></strong></font></td>
          </tr>
          <tr valign="top"> 
            <td colspan="2" valign="top"><font color="#000000" size="1" face="Arial, Helvetica, sans-serif"><strong>Price:  $<%=program.getPrice()%> 
              </strong></font></td>
          </tr>
          <tr valign="top"> 
            <td colspan="2" valign="top"><strong><font size="1" face="Arial, Helvetica, sans-serif">Instructor: <%
            Iterator i = program.getCoordinators().iterator();
            while (i.hasNext())
            {
            	Trainer t = (Trainer)i.next();
            	out.println(t.getFirstName() + " " + t.getLastName());
            	if (i.hasNext())
            		out.println(", ");
            }
            %>
              </font></strong></td>
          </tr>
          <tr valign="top"> 
            <td valign="top"><div align="center"><a href="purchaseDetail02.jsp">
              <img src="buttons/next.gif" width="35" height="19" border="0"></a></div></td>
            <td width="50%" valign="top"><div align="center">
              <a href="memberSelect.jsp">
              <img src="buttons/cancel.gif" width="47" height="19" border="0"></a></div></td>
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