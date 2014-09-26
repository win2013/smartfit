<%@include file="imports.jsp"%>
<%
	String view = request.getParameter("view");
	String action = request.getParameter("action");
        String clientID = request.getParameter("clientID");
        if (action == null)
            action = "";
	if (view == null)
            view = "active";
        if (clientID == null)
            clientID = "-1";

        //Perform action
        if (action.equals("activate")) {
            System.out.println("activating");
            Client client = club.getClient(Integer.parseInt(clientID));
            if (client != null)
                client.setActive(true);
            response.sendRedirect("membersMain.jsp?view=inactive");
            return;
        }
        if (action.equals("inactivate")) {
            System.out.println("inactivating");
            Client client = club.getClient(Integer.parseInt(clientID));
            if (client != null)
                client.setActive(false);
            response.sendRedirect("membersMain.jsp?view=active");
            return;
        }

	//Soret users by "activeness"	
	Vector active = new Vector();
	Vector inactive = new Vector();
	Enumeration enum = club.getClients().elements();
	while (enum.hasMoreElements()) {
		Client client = (Client)enum.nextElement();
		if (client.getActive())
			active.add(client);
		else
			inactive.add(client);
	}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Untitled Document</title>
<script>
function inactivateClient() {
	httpLink= "membersMain.jsp?action=inactivate&clientID=" + mainForm.members.value;
	window.location = httpLink;
}
function activateClient() {
	httpLink = "membersMain.jsp?action=activate&clientID=" + mainForm.members.value;
	window.location = httpLink;
}
function selectClient() {
	httpLink = "member_options.jsp?clientID=" + mainForm.members.value;
	window.location = httpLink;
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
<form name="mainForm" method="post" action="">
  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="boxBorder">
    <tr> 
      <td><table width="100%" border="0" cellpadding="2" cellspacing="0" align="center" class="tableTop">
          <tr> 
            <td bgcolor="#99CCFF" class="largeHeading"> <div align="center"><%=((view.equals("active")) ?"Active" :"Inactive")%> 
                Member List</div></td>
          </tr>
        </table>
        <table width="100%" border="0" cellpadding="2" cellspacing="0" class="tableTop">
          <tr>
            <td><div align="center"><br>
                <select name="members" size="14">
<%
    Vector clients = SMUtils.sortUsers((view.equals("active") ?active :inactive));
    enum = clients.elements();
    while (enum.hasMoreElements()) {
        User user = (User)enum.nextElement();%>
        <option value="<%=user.getID()%>"><%=user.getFirstName() + " " + user.getLastName()%></option>
        <%
    }
%>
                </select>
                <br>
                <br>
              </div></td>
          </tr>
        </table>
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr> 
            <td width="25%" align="center" class="largeHeading"> 
              <div align="center"><a href="member_create.jsp">Add</a></div></td>
            <td width="25%" align="center"> 
              <div align="center" class="largeHeading"> 
                <a href="javascript:<%=((view.equals("active")) ?"inactivateClient" :"activateClient")%>()">Make 
                <%=((view.equals("active")) ?"Inactive" :"Active")%></a></div></td>
            <td width="25%" align="center"> 
              <div align="center" class="largeHeading">
                <a href="javascript:selectClient()">Select</a></div></td>
            <td width="25%" align="center" class="largeHeading">
            <a href="membersMain.jsp?view=<%=((view.equals("active")) ?"inactive" :"active")%>">See <%=((view.equals("active")) ?"Inactive" :"Active")%></a></td>
          </tr>
        </table></td>
    </tr>
  </table>
</form>
</body>
</html>