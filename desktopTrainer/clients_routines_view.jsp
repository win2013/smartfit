<%@include file="imports.jsp"%>
<%
    Client client = (Client)session.getAttribute("client");

    String action = request.getParameter("action");
    if (action == null)
        action = "";

    if (action.equals("remove")) {
        Routine routine = client.getRoutine(Integer.parseInt(request.getParameter("routineID")));
        if (routine != null)
            client.removeRoutine(routine);
        response.sendRedirect("clients_routines_view.jsp");
        return;
    }

%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Untitled Document</title>
<script>
function modifyRoutine()
{
    httpLink = "routines_modify01.jsp?routineID=" + mainForm.routines.value;
    window.location = httpLink;
}
function removeRoutine()
{
    httpLink = "clients_routines_view.jsp?action=remove&routineID=" + mainForm.routines.value;
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
              <div align="center">Workout Routines for <%=client.getFirstName() + " " + client.getLastName()%></div></td>
          </tr>
        </table>
        <table width="100%" border="0" cellspacing="0" cellpadding="2">
          <tr> 
            <td><table width="100%" border="0" cellspacing="0" cellpadding="2">
                <tr> 
                  <td> 
                    <div align="center">
                      <div align="center">
                        <p><br>
                          <select name="routines" size="15">
<%
    Enumeration enum = client.getRoutines().elements();
    while (enum.hasMoreElements()) {
        Routine routine = (Routine)enum.nextElement();
        if (routine.getCreator().getID() != trainer.getID())
            continue;%>
        <option value="<%=routine.getID()%>"><%=routine.getName()%></option>
<%
    }
%>
                          </select>
                        </p>
                        </div>
                    </div></td>
                </tr>
              </table></td>
          </tr>
        </table>
        <table width="100%" border="0" cellpadding="2" cellspacing="0" class="dashedOnTop">
          <tr>
            <td><table width="100%" border="0" cellpadding="2" cellspacing="0" class="normalText">
                <tr> 
                  <td width="33%"> 
                    <div align="center"></div>
                    <div align="center"><a href="javascript:removeRoutine()">Delete</a></div></td>
                  <td width="33%"> 
                    <div align="center"><a href="routines_create01.jsp">Create</a></div>
                    <div align="center"></div></td>
                  <td width="33%"><div align="center"><a href="javascript:modifyRoutine()">Modify</a></div></td>
                </tr>
              </table>
              
            </td>
          </tr>
        </table>
        
      </td>
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