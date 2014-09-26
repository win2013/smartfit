<%@include file="imports.jsp"%>
<%
    Vector selected = (Vector)session.getAttribute("selected");
    if (selected == null) {
        selected = new Vector();
        session.setAttribute("selected", selected);
    }

    String filterUsers = request.getParameter("users");
    Vector users = new Vector();
    if (filterUsers == null)
        filterUsers = "all";
    if (filterUsers.equals("all")) {
        Enumeration enum = club.getTrainers().elements();
        while (enum.hasMoreElements()) 
            users.add(enum.nextElement());
        enum = club.getAdmins().elements();
        while (enum.hasMoreElements()) 
            users.add(enum.nextElement());
    }
    else if (filterUsers.equals("trainers")) {
        Enumeration enum = club.getTrainers().elements();
        while (enum.hasMoreElements()) 
            users.add(enum.nextElement());
    }
    else if (filterUsers.equals("managers")) {
        Enumeration enum = club.getAdmins().elements();
        while (enum.hasMoreElements()) 
            users.add(enum.nextElement());        
    }

    String action = request.getParameter("action");
    if (action == null)
        action = "";
    if (action.equals("Add")) {
        String values[] = request.getParameterValues("to");
        for (int i=0;i < values.length;i++)
            selected.add(db.getUser(Integer.parseInt(values[i])));
        selected = SMUtils.sortUsers(selected);
    }
    if (action.equals("Send")) {
        response.sendRedirect("messaging_send.jsp");
    }
    if (action.equals("Remove")) {
        String values[] = request.getParameterValues("selected");
        for (int i=0;i < values.length;i++)
            selected.remove(db.getUser(Integer.parseInt(values[i])));
        selected = SMUtils.sortUsers(selected);
    }

    users = SMUtils.sortUsers(users);
    Enumeration enum = null;
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Untitled Document</title>
<script>
function refresh() {
    window.location = 'messaging_sendList.jsp?action=refresh&users=' + mainForm.users.value;
}
</script>
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
<form name="mainForm" method="post" action="messaging_sendList.jsp">
  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="boxBorder">
    <tr> 
      <td><table width="100%" border="0" cellpadding="2" cellspacing="0" align="center" class="tableTop">
          <tr> 
            <td bgcolor="#99CCFF" class="largeHeading"> <div align="center">Send 
                Message </div></td>
          </tr>
        </table>
        <div align="center">
          <table width="100%" border="0" cellspacing="0" cellpadding="2">
            <tr>
              <td><div align="center"><span class="largeHeading">See List of: 
                  <select name="users" onchange="javascript:refresh()">
                    <option value="all" <%=( (filterUsers.equals("all")) ?"selected" :"")%>>All</option>
                    <option value="trainers" <%=( (filterUsers.equals("trainers")) ?"selected" :"")%>>Trainers</option>
                    <option value="managers" <%=( (filterUsers.equals("managers")) ?"selected" :"")%>>Managers</option>
                  </select>
                  </span></div></td>
            </tr>
          </table>
          <span class="largeHeading"> </span></div>
        <table width="100%" border="0" cellpadding="2" cellspacing="0" class="dashedTopBottom">
          <tr> 
            <td>
<table width="100%" border="0" cellspacing="0" cellpadding="2">
                <tr> 
                  <td width="50%"> 
                    <div align="center"><span class="largeHeading">Send 
                      Message to Those Listed Below</span><br>
                    </div></td>
                  <td width="1%" rowspan="2"> 
                    <table width="90%" height="220" border="0" cellpadding="2" cellspacing="0" class="verticalDash">
                      <tr> 
                        <td height="100%">&nbsp;</td>
                      </tr>
                    </table></td>
                  <td width="49%"> 
                    <div align="center"><span class="largeHeading">Select 
                      from the List Below</span><br>
                    </div></td>
                </tr>
                <tr> 
                  <td> 
                    <div align="center"> 
                      <select name="selected" size="11" multiple>
<%
    enum = selected.elements();
    while (enum.hasMoreElements()) {
        User user = (User)enum.nextElement();%>
        <option value="<%=user.getID()%>"><%=user.getFirstName() + " " + user.getLastName()%></option>
<%
    }
%>  
                      </select>
                    </div></td>
                  <td width="49%"> 
                    <div align="center">
                      <select name="to" size="11" multiple>
<%
    enum = users.elements();
    while (enum.hasMoreElements()) {
        User user = (User)enum.nextElement();%>
        <option value="<%=user.getID()%>"><%=user.getFirstName() + " " + user.getLastName()%></option>
<%
    }
%>
                      </select>
                    </div></td>
                </tr>
              </table>
            </td>
          </tr>
        </table> 
        <table width="100%" border="0" cellpadding="2" cellspacing="0" class="tableTop">
          <tr> 
            <td width="33%"> 
              <div align="center">
                <input type="submit" name="action" value="Remove">
              </div></td>
            <td width="34%"><div align="center">
               <input type="submit" name="action" value="Send">
              </div></td>
            <td width="33%"> 
              <div align="center"> 
                <input type="submit" name="action" value="Add">
              </div></td>
          </tr>
        </table>
        <table width="100%" border="0" cellspacing="0" cellpadding="2">
          <tr>
            <td class="largeHeading"><div align="center" class="normalText">Select 
                names from the list on the right to add them to the send list.</div></td>
          </tr>
        </table> </td>
    </tr>
  </table>
  <table width="100%" border="0" align="center" cellpadding="2" cellspacing="0">
    <tr> 
      <td><div align="right"><a href="javascript:history.back(1)" class="smallLinks">Back</a></div></td>
    </tr>
  </table>
</form>
</body>
</html>


</body>
</html>
