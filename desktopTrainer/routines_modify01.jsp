<%@include file="imports.jsp"%>
<%
    Client client = (Client)session.getAttribute("client");
    
    String routineID = request.getParameter("routineID");
    int id = Integer.parseInt(routineID);
    Routine routine = client.getRoutine(id);
    session.setAttribute("routine", routine);
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
<form name="mainForm" method="post" action="">
  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="boxBorder">
    <tr> 
      <td><table width="100%" border="0" cellpadding="2" cellspacing="0" align="center" class="tableTop">
          <tr> 
            <td bgcolor="#FFCC66" class="largeHeading"> 
              <div align="center">Create/Modify Routine <i><%=routine.getName()%></i></div></td>
          </tr>
        </table>
        <table width="100%" border="0" cellspacing="0" cellpadding="2">
          <tr> 
            <td><div align="center">
                <select name="routine" size="16">
<%
    Enumeration enum = routine.getExercises().elements();
    while (enum.hasMoreElements()) {
        Exercise exercise = (Exercise)enum.nextElement();%>
        <option value="<%=exercise.getID()%>"><%=exercise.getName()%></option>
<%        
    }
%>
                </select>
              </div></td>
          </tr>
        </table>
        <table width="100%" border="0" cellpadding="2" cellspacing="0" class="dashedOnTop">
          <tr> 
            <td><table width="100%" border="0" cellpadding="2" cellspacing="0" class="normalText">
                <tr> 
                  <td width="33%"> 
                    <div align="center"><a href="routines_addEx.jsp">Add Exercise</a></div></td>
                  <td width="33%">
<div align="center">Remove Exercise</div></td>
                  <td width="33%">
<div align="center"><a href="routines_view.jsp">Finish</a></div></td>
                </tr>
              </table></td>
          </tr>
        </table></td>
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