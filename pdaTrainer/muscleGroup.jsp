<%@page contentType="text/html"%>
<%@include file="imports.jsp"%>
<%@include file="init.jsp"%>
<%	
	String bodyPart = request.getParameter("bodyPart");
	session.setAttribute("bodyPart", bodyPart);
	if ( (bodyPart == null) )
	{
		response.sendRedirect("membersMain.jsp");
		return;
	}
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
<%
	String display = "";
	String lastExcercise = (String)session.getAttribute("lastAdded");
	if (lastExcercise != null)
	{
		display = "Last Exercise Added:  " + lastExcercise;
	}
%>
<html>
<head>
<title>Trainer - Create Routine</title>
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
    <td rowspan="2" bgcolor="#CCCCFF"><strong><font size="1" face="Arial, Helvetica, sans-serif">Create Routine</font></strong></td>
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
    <td colspan="4" valign="top"> <form name="form1" method="post" action="addExcercise.jsp">
        <table width="90%" border="0" align="center" cellpadding="1" cellspacing="1">
          <tr> 
            <td class="sectionText"><strong><font color="#000000" size="2" face="Arial, Helvetica, sans-serif"><strong>Choose 
              An Excercise</strong></font></strong></td>
          </tr>
          <tr> 
            <td class="sectionText"> <p><font color="#000000" size="2" face="Arial, Helvetica, sans-serif"><strong><font size="1" face="Arial, Helvetica, sans-serif">Muscle 
                Group: <%=bodyPart%></font></strong></font></p></td>
          </tr>
          <tr> 
            <td><select name="excerciseID" size="6">
                <%
                  		Vector exercises = trainer.getExercises();                  		
                  		Iterator i = exercises.iterator();
                  		while (i.hasNext())
                  		{
                  			Exercise exercise = (Exercise)i.next();
                  			if (exercise instanceof AnaerobicExercise)
                  				if ( ((AnaerobicExercise)exercise).getBodyPart().equals(bodyPart) )
                  			out.println("<option value=\"" + exercise.getID() + "\">" + exercise.getName() + "</option>");
                  		}
                  %>
              </select>
              <table width="90%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td><strong><font size="1" face="Arial, Helvetica, sans-serif"><%=display%></font></strong></td>
                </tr>
              </table>
              <table width="90%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td><div align="center">
                      <input name="Submit" type="image" value="Submit" src="buttons/add.gif" align="bottom" width="29" height="19">
                    </div></td>
                  <td><div align="center"><a href="anaerobicEx.jsp"><img src="buttons/back.gif" width="35" height="19" border="0"></a></div></td>
                </tr>
              </table> 
            </td>
          </tr>
        </table>
      </form>
      <div align="center"></div></td>
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