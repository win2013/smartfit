<%@include file="imports.jsp"%>
<%
    String action = request.getParameter("action");
    if (action == null)
        action = "";
    if (action.equals("delete")) {
        String routineID = request.getParameter("routineID");
        int id = Integer.parseInt(routineID);
        Routine routine = trainer.getRoutine(id);
        trainer.removeRoutine(routine);
    }
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Untitled Document</title>
<script>
function modify()
{
    httpLink = 'routines_modify_trainer.jsp?routineID=' + mainForm.routine.value;
    window.location = httpLink;
}

function deleteRoutine()
{
    httpLink = 'routines_view.jsp?action=delete&routineID=' + mainForm.routine.value;
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
              <div align="center">Workout Routines for <%=trainer.getFirstName() + " " + trainer.getLastName()%></div></td>
          </tr>
        </table>
        <table width="100%" border="0" cellspacing="0" cellpadding="2">
          <tr> 
            <td><table width="100%" border="0" cellspacing="0" cellpadding="2">
                <tr> 
                  <td valign="top"> <div align="center">
                      <div align="center"><br>
                        <select name="routine" size="14">
<%
    Enumeration enum  = trainer.getRoutines().elements();
    while (enum.hasMoreElements()) {
        Routine routine = (Routine)enum.nextElement();%>
        <option value="<%=routine.getID()%>"><%=routine.getName()%></option>
<%  }%>                        
                        </select>
                        <br>
                        <br>
                      </div>
                    </div></td>
                </tr>
              </table></td>
          </tr>
        </table>
        <table width="100%" border="0" cellpadding="2" cellspacing="0" class="dashedOnTop">
          <tr>
            <td><table width="100%" border="0" cellpadding="2" cellspacing="0">
                <tr class="largeHeading"> 
                  <td width="33%"> 
                    <div align="center"></div>
                    <div align="center"><a href="javascript:deleteRoutine()">Delete</a></div></td>
                  <td width="33%"> 
                    <div align="center"><a href="routines_create_trainer.jsp">Create</a></div>
                    <div align="center"></div></td>
                  <td width="33%"> 
                    <div align="center"><a href="javascript:modify()">Modify</a></div></td>
                </tr>
              </table>
              
            </td>
          </tr>
        </table>
        
      </td>
    </tr>
  </table>
  </form>
</body>
</html>