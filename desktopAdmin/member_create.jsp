<%@include file="imports.jsp"%>
<%
    String action = request.getParameter("action");
    String firstName = request.getParameter("firstName");
    String lastName = request.getParameter("lastName");
    String username = request.getParameter("username");
    String pass1 = request.getParameter("pass1");    
    String pass2 = request.getParameter("pass2");
    String message = request.getParameter("message");
    String parameterPass = "";

    if (action == null) {
        action = "";
        firstName = "";
        lastName = "";
        username = "";
        pass1 = "";
        pass2 = "";
    }
    else
        parameterPass = "&firstName=" + firstName + "&lastName="  +lastName + "&username=" + username + "&pass1=" + pass1 + "&pass2=" + pass2;

    if (action.equals("add")) {
    System.out.println("asdf");
        if (firstName.length() < 1) {
            response.sendRedirect("member_create.jsp?action=error&message=No first name entered." + parameterPass);
            return;
        }
        if (lastName.length() < 1) {
            response.sendRedirect("member_create.jsp?action=error&message=No last name entered." + parameterPass);
            return;
        }
        if (username.length() < 1) {
            response.sendRedirect("member_create.jsp?action=error&message=No username entered." + parameterPass);
            return;
        }
        if (pass1.length() < 1) {
            response.sendRedirect("member_create.jsp?action=error&message=No password entered." + parameterPass);
            return;
        }
        if (!pass1.equals(pass2)) {
            response.sendRedirect("member_create.jsp?action=error&message=Passwords do not match." + parameterPass);
            return;
        }

        Enumeration enum = club.getClients().elements();
        while (enum.hasMoreElements()) {
            Client client = (Client)enum.nextElement();
            if (client.getUserName().equals(username)) {
                response.sendRedirect("member_create.jsp?action=error&message=Username " + username + " already taken." + parameterPass);
                return;
            }
        }

        Client client = db.createClient();
        club.addClient(client);
        client.setFirstName(firstName);
        client.setLastName(lastName);
        client.setUserName(username);
        client.setPassword(pass1);
        client.setActive(true);
        session.setAttribute("client", client);
        response.sendRedirect("member_profileMod.jsp");
        return;
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
<form name="form1" method="post" action="member_create.jsp?action=add">
  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="boxBorder">
    <tr> 
      <td><table width="100%" border="0" cellpadding="2" cellspacing="0" align="center" class="tableTop">
          <tr> 
            <td bgcolor="#99CCFF" class="largeHeading"> <div align="center">Create 
                Member</div></td>
          </tr>
        </table>
        <table width="100%" border="0" align="center" cellpadding="3" cellspacing="0">
          <tr> 
            <td colspan="3" class="largeHeading"></td>
          </tr>
          <%
    if (action.equals("error")) {%>
          <tr> 
            <td colspan="3" class="largeHeading"><p align="center"><font color="red"><%=message%></font></p></td>
          </tr>
          <%
    }
%>
          <tr> 
            <td width="35%" class="largeHeading"> First Name:</td>
            <td width="66%" colspan="2" class="normalText"> <input type="text" name="firstName" size="20" value="<%=firstName%>"></td>
          </tr>
          <tr> 
            <td class="largeHeading">Last Name:</td>
            <td colspan="2" class="normalText"> <input type="text" name="lastName" size="20" value="<%=lastName%>"></td>
          </tr>
          <tr> 
            <td class="largeHeading">Username:</td>
            <td colspan="2" class="normalText"> <input type="text" name="username" size="20" value="<%=username%>"></td>
          </tr>
          <tr> 
            <td class="largeHeading">Password:</td>
            <td colspan="2" class="normalText"> <input type="password" name="pass1" size="20" value="<%=pass1%>"></td>
          </tr>
          <tr> 
            <td class="largeHeading">Retype Password:</td>
            <td colspan="2" class="normalText"> <input type="password" name="pass2" size="20" value="<%=pass2%>"></td>
          </tr>
        </table>
        <table width="100%" border="0" cellpadding="2" cellspacing="0" class="dashedOnTop">
          <tr>
            <td><div align="right">
                <input type="submit" name="Submit" value="Next">
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