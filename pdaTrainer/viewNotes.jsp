<%@page contentType="text/html"%>
<%@include file="imports.jsp"%>
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
<html>
<head>
<title>Routines</title>
<script>
function forward(httpLink)
{
	clientID = document.routinesForm.routines.value;
	httpLink = httpLink + '?routineID=' + clientID;
	window.location = httpLink;	
}
</script>
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
    <td rowspan="2" bgcolor="#CCCCFF"><strong><font size="1" face="Arial, Helvetica, sans-serif">Notes</font></strong></td>
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
    <table width="200" border="0" align="center" cellpadding="1" cellspacing="0" height="63">
        <tr> 
          <td width="74" height="12"> <div align="left"><strong><font size="1" face="Arial, Helvetica, sans-serif">Subject</font></strong></div></td>
          <td width="63" height="12"> <div align="center"><strong><font size="1" face="Arial, Helvetica, sans-serif">Date</font></strong></div></td>
          <td width="57" height="12"> <div align="right"><strong><font size="1" face="Arial, Helvetica, sans-serif">Confidential?</font></strong></div></td>
        </tr>
        <%
        	Iterator i  = client.getNotes().iterator();
        	int count = 0;
        	while (i.hasNext())
        	{
        		Note note = (Note)i.next();

                        if (!note.getActive())
                            continue;
        		
        		String link = "noteDetail.jsp";
        		String confidential = "NO";
        		if (note.getConfidential())
        		{
        			confidential = "YES";
        			link = "privateNote.jsp";
        		}
        			
        		String date = "";
        		GregorianCalendar gc = new GregorianCalendar();        		
        		gc.setTimeInMillis(note.getDate());
        		date += (gc.get(Calendar.MONTH)+1) + "-" + gc.get(Calendar.DAY_OF_MONTH) + "-";
        		date += gc.get(Calendar.YEAR);
        		
        		String subject = note.getSubject();
        		
        		String background = "#FFCC66";
        		if (count %2 != 0)
        			background = "#FFFFFF";
        		count++;
        		%>
        	    <tr bgcolor="<%=background%>"> 
					<td height="11"><font size="1" face="Arial, Helvetica, sans-serif"><a href="<%=link%>?id=<%=note.getID()%>"><%=note.getSubject()%></a></font></td>
          			<td height="11"><div align="center"><font size="1" face="Arial, Helvetica, sans-serif"><%=date%></font></div></td>
          			<td height="11"><div align="center"><font size="1" face="Arial, Helvetica, sans-serif"><%=confidential%></font></div></td>
        		</tr>
        		<%
        	}
        %>
        <tr> 
          <td width="74" height="19"><a href="notesMain.jsp">
          <img src="buttons/makeNote.gif" width="75" height="19" border="0"></a></td>
          <td width="63" height="19"><div align="center"></div></td>
          <td width="57" height="19"><div align="center"><a href="notesMain.jsp"><img src="buttons/back.gif" width="35" height="19" border="0"></a></div></td>
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