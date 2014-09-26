<%@page contentType="text/html"%>
<%@include file="imports.jsp"%>
<jsp:useBean id="db" class="sf.DatabaseImpl" scope="application"/>
<%
        session.setAttribute("db", db);
	sf.Club club = (sf.Club)session.getAttribute("club");
	if (club == null) {
		club = db.getClub(0);
		session.setAttribute("club", club);
	}

/*
	Database db = (sf.Database)java.rmi.registry.LocateRegistry.getRegistry(1098).lookup("sf");
	Club club = db.getClub(0);
	session.setAttribute("club", club);
	session.setAttribute("db", db);
*/
%>

<%
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	
	if ( (username != null) && (password != null) )
	{
		System.out.println("looking");
		Iterator i = db.getTrainers().iterator();
		User user = null;
		while (i.hasNext())
		{
			System.out.println("next");
			User tempUser = (User)i.next();
			if (tempUser.getUserName().equals(username))
			{
				user = tempUser;
				break;
			}
		}
		
		if (user != null)
			if (user.getPassword().equals(password))
			{
				if (user instanceof Trainer)
				{
					session.putValue("user", user);
					session.putValue("club", club);
					response.sendRedirect("main.jsp");
					return;
				}
			}
		}
%>
<html>
<head>
<title>Index</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<body bgcolor="#ffffff" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table border="0" cellpadding="0" cellspacing="0" width="226">
<!-- fwtable fwsrc="newPDADesign.png" fwbase="pda2.gif" fwstyle="Dreamweaver" fwdocid = "742308039" fwnested="0" -->
  <tr>
   <td>
   <img src="images/spacer.gif" width="8" height="1" border="0" alt=""></td>
   <td>
   <img src="images/spacer.gif" width="4" height="1" border="0" alt=""></td>
   <td>
   <img src="images/spacer.gif" width="132" height="1" border="0" alt=""></td>
   <td>
   <img src="images/spacer.gif" width="12" height="1" border="0" alt=""></td>
   <td>
   <img src="images/spacer.gif" width="55" height="1" border="0" alt=""></td>
   <td>
   <img src="images/spacer.gif" width="4" height="1" border="0" alt=""></td>
   <td>
   <img src="images/spacer.gif" width="11" height="1" border="0" alt=""></td>
   <td>
   <img src="images/spacer.gif" width="1" height="1" border="0" alt=""></td>
  </tr>

  <tr>
   <td colspan="7">
   <img name="pda2_r1_c1" src="images/pda2_r1_c1.gif" width="226" height="7" border="0" alt=""></td>
   <td>
   <img src="images/spacer.gif" width="1" height="7" border="0" alt=""></td>
  </tr>
  <tr>
   <td colspan="4">
   <img name="pda2_r2_c1" src="images/pda2_r2_c1.gif" width="156" height="11" border="0" alt=""></td>
    <td colspan="2" rowspan="2" bgcolor="#CCCCFF"></td>
   <td rowspan="6">
   <img name="pda2_r2_c7" src="images/pda2_r2_c7.gif" width="11" height="255" border="0" alt=""></td>
   <td>
   <img src="images/spacer.gif" width="1" height="11" border="0" alt=""></td>
  </tr>
  <tr>
   <td rowspan="3" colspan="2">
   <img name="pda2_r3_c1" src="images/pda2_r3_c1.gif" width="12" height="18" border="0" alt=""></td>
    <td rowspan="2" bgcolor="#CCCCFF"><font size="1" face="Arial, Helvetica, sans-serif"><strong>Login</strong></font></td>
   <td rowspan="3">
   <img name="pda2_r3_c4" src="images/pda2_r3_c4.gif" width="12" height="18" border="0" alt=""></td>
   <td>
   <img src="images/spacer.gif" width="1" height="3" border="0" alt=""></td>
  </tr>
  <tr>
   <td rowspan="2" colspan="2">
   <img name="pda2_r4_c5" src="images/pda2_r4_c5.gif" width="59" height="15" border="0" alt=""></td>
   <td>
   <img src="images/spacer.gif" width="1" height="11" border="0" alt=""></td>
  </tr>
  <tr>
   <td>
   <img name="pda2_r5_c3" src="images/pda2_r5_c3.gif" width="132" height="4" border="0" alt=""></td>
   <td>
   <img src="images/spacer.gif" width="1" height="4" border="0" alt=""></td>
  </tr>
  <tr>
   <td rowspan="2">
   <img name="pda2_r6_c1" src="images/pda2_r6_c1.gif" width="8" height="226" border="0" alt=""></td>
    <td colspan="4" valign="middle">
<form method="POST" action="index.jsp">
        <table width="90%" border="0" align="center" cellpadding="1" cellspacing="1">
          <tr>
            <td colspan="2" valign="middle"><div align="center">
              <img src="images/ghfc.gif" width="152" height="86"></div></td>
          </tr>
          <tr> 
            <td colspan="2" valign="middle"><div align="center"><strong><font size="2" face="Arial, Helvetica, sans-serif">Welcome 
                To Smartfit</font></strong></div></td>
          </tr>
          <tr> 
            <td width="37%" valign="middle"><font size="1" face="Arial, Helvetica, sans-serif"><strong>Username:</strong></font></td>
            <td width="63%" valign="middle"><font size="2" face="Arial, Helvetica, sans-serif"> 
              <input type="text" name="username" size="15">
              </font></td>
          </tr>
          <tr> 
            <td valign="middle"><font color="#000000" size="1" face="Arial, Helvetica, sans-serif"><strong>Password:</strong></font></td>
            <td valign="middle"> <input name="password" type="password" id="password2" size="15"> 
            </td>
          </tr>
          <tr> 
            <td>&nbsp;</td>
            <td> 
            <input type="image" src="buttons/submit.gif" value="Submit" name="B1" width="45" height="19"> 
            </td>
          </tr>
        </table>
        </form></td>
   <td rowspan="2">
   <img name="pda2_r6_c6" src="images/pda2_r6_c6.gif" width="4" height="226" border="0" alt=""></td>
   <td>
   <img src="images/spacer.gif" width="1" height="214" border="0" alt=""></td>
  </tr>
  <tr>
   <td colspan="4">
   <img name="pda2_r7_c2" src="images/pda2_r7_c2.gif" width="203" height="12" border="0" alt=""></td>
   <td>
   <img src="images/spacer.gif" width="1" height="12" border="0" alt=""></td>
  </tr>
</table>
</body>
</html>