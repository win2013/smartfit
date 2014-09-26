<%@page contentType="text/html"%>
<%@include file="imports.jsp"%>
<%@include file="init.jsp"%>
<%
	String username = request.getParameter("username");
		
	if ( (username != null) )
	{
		Vector clients = db.getClients();
		Enumeration e = clients.elements();
		while (e.hasMoreElements())
		{
			Client cclient = (Client)e.nextElement();		
			if (cclient.getUserName().equals(username))
			{
				trainer.addClient(cclient);
				cclient.addTrainer(trainer);
				response.sendRedirect("membersMain.jsp");
				return;
			}
		}
	}
%>

<html>
<head>
<title>Trainer - Add Member</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
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
    <td colspan="4" valign="top">
<form name="membersMain" method="post" action="addMember.jsp">
        <div align="center">
          <table width="90%" border="0" cellspacing="1" cellpadding="1">
            <tr> 
              <td colspan="2" class="sectionText"> <div align="left"><font color="#000000" size="2" face="Arial, Helvetica, sans-serif"><strong>Add 
                  Existing Club Member</strong></font></div></td>
            </tr>
            <tr> 
              <td colspan="2" class="sectionText"><font color="#000000" size="1" face="Arial, Helvetica, sans-serif"><strong>User 
                Name</strong></font></td>
            </tr>
            <tr> 
              <td colspan="2" class="sectionText"><font size="1" face="Arial, Helvetica, sans-serif"> 
                <input name="username" type="text" size="18">
                </font></td>
            </tr>
            <tr> 
              <td width="50%" class="sectionText"><div align="center"><font face="Arial, Helvetica, sans-serif"> 
                  <input type="image" src="buttons/submit.gif" name="Submit" value="Submit" width="45" height="19">
                  </font></div></td>
              <td class="sectionText"><div align="center"><a href="membersMain.jsp"><img src="buttons/cancel.gif" width="47" height="19" border="0"></a></div></td>
            </tr>
          </table>
        </div>
      </form>
      <p align="center" class="smallLink">&nbsp;</p></td>
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