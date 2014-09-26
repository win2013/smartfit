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
            Client client = trainer.getInactiveClient(Integer.parseInt(clientID));
            if (client != null) {
                trainer.addClient(client);
                trainer.removeInactiveClient(client);
            }
            response.sendRedirect("clients_select.jsp?view=inactive");
            return;
        }
        if (action.equals("inactivate")) {            
            Client client = club.getClient(Integer.parseInt(clientID));
            if (client != null) {
                trainer.removeClient(client);
                trainer.addInactiveClient(client);                
            }
            response.sendRedirect("clients_select.jsp?view=active");
            return;
        }
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Untitled Document</title>
<script>
function inactivateClient() {
	httpLink= "clients_select.jsp?action=inactivate&clientID=" + mainForm.clients.value;
	window.location = httpLink;
}
function activateClient() {
	httpLink = "clients_select.jsp?action=activate&clientID=" + mainForm.clients.value;
	window.location = httpLink;
}
function selectClient() {
	httpLink = "clients_main.jsp?clientID=" + mainForm.clients.value;
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
            <td bgcolor="#FFCC66" class="largeHeading"> 
              <div align="center"><%=((view.equals("active")) ?"Active" :"Inactive")%> 
                Member List</div></td>
          </tr>
        </table>
        <table width="100%" border="0" cellpadding="2" cellspacing="0" class="tableTop">
          <tr>
            <td><div align="center"><br>
                <select name="clients" size="14">
<%
    Vector clients = SMUtils.sortUsers((view.equals("active") ?trainer.getClients() :trainer.getInactiveClients()));
    Enumeration enum = clients.elements();
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
        <table width="100%" border="0" align="center" cellpadding="2" cellspacing="0">
          <tr class="largeHeading"> 
            <td width="25%" align="center"> 
              <div align="center"><a href="clients_add.jsp">Add</a></div></td>
            <td width="25%" align="center"> 
              <div align="center" class="largeHeading"> 
                <a href="javascript:<%=((view.equals("active")) ?"inactivateClient" :"activateClient")%>()">Make 
                <%=((view.equals("active")) ?"Inactive" :"Active")%></a></div></td>
            <td width="25%" align="center"> 
              <div align="center" class="largeHeading">
                <a href="javascript:selectClient()">Select</a></div></td>
            <td width="25%" align="center"> <a href="clients_select.jsp?view=<%=((view.equals("active")) ?"inactive" :"active")%>">See 
              <%=((view.equals("active")) ?"Inactive" :"Active")%></a></td>
          </tr>
        </table></td>
    </tr>
  </table>
</form>
</body>
</html>