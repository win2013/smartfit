<%@include file="imports.jsp"%>
<%
    String action = request.getParameter("action");
    String username = request.getParameter("username");
    if (action == null)
        action = "";

    String errorMessage = "";
    if (action.equals("Add")) {
    	Enumeration enum = club.getClients().elements();
    	while (enum.hasMoreElements()) {
            Client client = (Client)enum.nextElement();
            if (client.getUserName().equals(username)) {
                    trainer.addClient(client);
                    response.sendRedirect("clients_main.jsp");
                    return;
            }				
    	}
    	errorMessage = "Username " + username + " not found.";
    }
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="admin.css" rel="stylesheet" type="text/css">
<style type="text/css">
A:link {text-decoration: none}
A:visited {text-decoration: none}
A:active {text-decoration: none}
A:hover {text-decoration: underline; color: #000099;}
</style>
</head>

<body bgcolor="#ffffff" link="#3333CC" vlink="#3333CC" alink="#0099FF" >
<form name="form1" method="post" action="clients_add.jsp?action=Add">
  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="boxBorder">
    <tr> 
      <td><table width="100%" border="0" cellpadding="2" cellspacing="0" align="center" class="tableTop">
          <tr> 
            <td bgcolor="#FFCC66" class="largeHeading"> <div align="center">Add 
                Member</div></td>
          </tr>
        </table>
        <table width="100%" border="0" align="center" cellpadding="3" cellspacing="0">
          <tr> 
            <td colspan="2" class="largeHeading"></td>
          </tr>
          <%
    if (errorMessage.length() > 0) {%>
          <tr> 
            <td colspan="2" class="largeHeading"><p align="center"><font color="red"><%=errorMessage%></font></p></td>
          </tr>
          <%
    }
%>
          <tr> 
            <td class="largeHeading">Username:</td>
            <td class="normalText"> <input type="text" name="username" size="20"></td>
          </tr>
          </table>
        <table width="100%" border="0" cellpadding="2" cellspacing="0" class="dashedOnTop">
          <tr>
            <td><div align="right">
                <input type="submit" name="action" value="Add">
              </div></td>
          </tr>
        </table></td>
    </tr>
  </table>
  <table width="100%" border="0" align="center" cellpadding="2" cellspacing="0">
    <tr> 
      <td><div align="right"></div>
        <div align="right"><a href="javascript:history.back(1)" class="smallLinks">Back</a></div></td>
    </tr>
  </table>
</form>
</body>
</html>