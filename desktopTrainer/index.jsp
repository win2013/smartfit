<%@page import="sf.*"%>
<%@page import="sf.users.*"%>
<%@page import="sf.activity.*"%>
<%@page import="sf.data.*"%>
<%@page import="sf.scheduling.*"%>
<%@page import="java.util.*"%>


<jsp:useBean id="db" class="sf.DatabaseImpl" scope="application"/>
 <%
session.setAttribute("db", db);

	/*sf.Database db = (sf.Database)session.getAttribute("db");
	if (db == null) {
		java.rmi.registry.Registry registry = java.rmi.registry.LocateRegistry.getRegistry(1098);
		db = (sf.Database)registry.lookup("sf");
		session.setAttribute("db", db);
	}
*/
	sf.Club club = (sf.Club)session.getAttribute("club");
	if (club == null) {
		club = db.getClub(0);
		session.setAttribute("club", club);
	}
	session.removeAttribute("trainer");
%>

<%
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	if ( (username != null) && (password != null) ) {
		Enumeration enum = db.getTrainers().elements();
		while (enum.hasMoreElements())
		{
			Trainer temp = (Trainer)enum.nextElement();
			if ( (temp.getUserName().equals(username)) && (temp.getPassword().equals(password)) )
			{				
				session.setAttribute("trainer", temp);
				response.sendRedirect("mainFrame.jsp");
				return;
			}
		}
	}


%>
<HTML>
<HEAD>
<TITLE>SmartFit: Trainer Login</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=iso-8859-1">
<link href="admin.css" rel="stylesheet" type="text/css">
<style type="text/css">
A:link {text-decoration: none}
A:visited {text-decoration: none}
A:active {text-decoration: none}
A:hover {text-decoration: underline; color: #000099;}
</style>
</HEAD>
<body bgcolor="#FF9933" link="#3333CC" vlink="#3333CC" alink="#0099FF" leftmargin="0" topmargin="0">
<!-- ImageReady Slices (pagelayout.psd) -->
<TABLE WIDTH=760 BORDER=0 CELLPADDING=0 CELLSPACING=0>
  <TR> 
    <TD ROWSPAN=2> <IMG SRC="images/pagelayout_01.gif" WIDTH=49 HEIGHT=90 ALT=""></TD>
    <TD> <IMG SRC="images/pagelayout_02.gif" WIDTH=73 HEIGHT=62 ALT=""></TD>
    <TD COLSPAN=2> <IMG SRC="images/pagelayout_03.gif" WIDTH=464 HEIGHT=62 ALT=""></TD>
    <TD COLSPAN=2 background="images/pagelayout_04.gif">&nbsp; </TD>
    <TD> <IMG SRC="images/spacer.gif" WIDTH=1 HEIGHT=62 ALT=""></TD>
  </TR>
  <TR> 
    <TD COLSPAN=4 ROWSPAN=2 bgcolor="#FF9933"><TABLE BORDER=0 align="center" CELLPADDING=0 CELLSPACING=0>
        <TR> 
          <TD> <IMG SRC="images/left-box_01.gif" WIDTH=15 HEIGHT=16 ALT=""></TD>
          <TD> <IMG SRC="images/left-box_02.gif" WIDTH=380 HEIGHT=16 ALT=""></TD>
          <TD> <IMG SRC="images/left-box_03.gif" WIDTH=13 HEIGHT=16 ALT=""></TD>
        </TR>
        <TR> 
          <TD> <IMG SRC="images/left-box_04.gif" WIDTH=15 HEIGHT=175 ALT=""></TD>
          <TD bgcolor="#FFFFFF"> <form name="form1" method="post" action="index.jsp">
              <table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="boxBorder">
                <tr> 
                  <td><table width="100%" border="0" cellpadding="2" cellspacing="0" align="center" class="tableTop">
                      <tr> 
                        <td bgcolor="#FFCC66" class="largeHeading"> 
                          <div align="center">Login</div></td>
                      </tr>
                    </table>
                    <table width="100%" border="0" align="center">
                      <tr> 
                        <td class="largeHeading">&nbsp;</td>
                        <td> <div align="left"></div></td>
                      </tr>
                      <tr> 
                        <td class="largeHeading">Username</td>
                        <td> <div align="left"> 
                            <input name="username" type="text" id="username" size="20">
                          </div></td>
                      </tr>
                      <tr> 
                        <td class="largeHeading">Password</td>
                        <td> <div align="left"> 
                            <input name="password" type="password" id="password" size="20">
                          </div></td>
                      </tr>
                      <tr> 
                        <td class="largeHeading">&nbsp;</td>
                        <td><div align="right"> 
                            <input type="submit" name="Submit" value="Submit">
                          </div></td>
                      </tr>
                    </table></td>
                </tr>
              </table>
            </form></TD>
          <TD> <IMG SRC="images/left-box_06.gif" WIDTH=13 HEIGHT=175 ALT=""></TD>
        </TR>
        <TR> 
          <TD> <IMG SRC="images/left-box_07.gif" WIDTH=15 HEIGHT=14 ALT=""></TD>
          <TD> <IMG SRC="images/left-box_08.gif" WIDTH=380 HEIGHT=14 ALT=""></TD>
          <TD> <IMG SRC="images/left-box_09.gif" WIDTH=13 HEIGHT=14 ALT=""></TD>
        </TR>
      </TABLE></TD>
    <TD ROWSPAN=3 bgcolor="#FF9933">&nbsp; </TD>
    <TD> <IMG SRC="images/spacer.gif" WIDTH=1 HEIGHT=28 ALT=""></TD>
  </TR>
  <TR> 
    <TD> <IMG SRC="images/pagelayout_08.gif" WIDTH=49 HEIGHT=400 ALT=""></TD>
    <TD> <IMG SRC="images/spacer.gif" WIDTH=1 HEIGHT=352 ALT=""></TD>
  </TR>
  <TR> 
    <TD> <IMG SRC="images/pagelayout_09.gif" WIDTH=49 HEIGHT=38 ALT=""></TD>
    <TD COLSPAN=2 bgcolor="#FF9933">&nbsp; </TD>
    <TD COLSPAN=2 bgcolor="#FF9933">&nbsp; </TD>
    <TD> <IMG SRC="images/spacer.gif" WIDTH=1 HEIGHT=38 ALT=""></TD>
  </TR>
  <TR> 
    <TD> <IMG SRC="images/spacer.gif" WIDTH=49 HEIGHT=1 ALT=""></TD>
    <TD> <IMG SRC="images/spacer.gif" WIDTH=73 HEIGHT=1 ALT=""></TD>
    <TD> <IMG SRC="images/spacer.gif" WIDTH=134 HEIGHT=1 ALT=""></TD>
    <TD> <IMG SRC="images/spacer.gif" WIDTH=330 HEIGHT=1 ALT=""></TD>
    <TD> <IMG SRC="images/spacer.gif" WIDTH=129 HEIGHT=1 ALT=""></TD>
    <TD> <IMG SRC="images/spacer.gif" WIDTH=45 HEIGHT=1 ALT=""></TD>
    <TD></TD>
  </TR>
</TABLE>
<!-- End ImageReady Slices -->
</BODY>
</HTML>