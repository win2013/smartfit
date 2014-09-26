<%@include file="imports.jsp"%>
<%
    Trainer trainer = (Trainer)session.getAttribute("trainer");
    Enumeration enum = trainer.getRoutines().elements();
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
<form name="form1" method="post" action="">
  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="boxBorder">
    <tr> 
      <td><table width="100%" border="0" cellpadding="2" cellspacing="0" align="center" class="tableTop">
          <tr> 
            <td bgcolor="#99CCFF" class="largeHeading"> <div align="center">Routines 
                for Trainer <%=trainer.getFirstName() + " " + trainer.getLastName()%></div></td>
          </tr>
        </table>
        <table width="100%" border="0" align="center" cellpadding="3" cellspacing="0">
<%
	int counter = 0;
    while (enum.hasMoreElements()) {
        Routine routine = (Routine)enum.nextElement();%>
          <tr bgcolor="<%=( (counter++%2==0) ?"#C7E1E9" :"#FFFFFF")%>">
            <td width="66%" class="largeHeading"> <div align="center"></div>
              <div align="left"><%=routine.getName()%><br>
                <span class="normalText">Exercises: <%
        Enumeration exercises = routine.getExercises().elements();
        while (exercises.hasMoreElements()) {
            Exercise exercise = (Exercise)exercises.nextElement();%>
            <a href="#"><%=exercise.getName()%></a><%=( (exercises.hasMoreElements() ?"," :"") )%>
<%      }%>
          </span></div></td>
          </tr>
<%  }
%>
        </table></td>
    </tr>
  </table>
  <table width="100%" border="0" align="center" cellpadding="2" cellspacing="0">
    <tr> 
      <td><div align="right"><a href="javascript:history.back(1)" class="smallLinks">Back</a></div></td>
    </tr>
  </table>
  <div align="center"></div>
</form>
</body>
</html>
