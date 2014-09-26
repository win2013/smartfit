<%@include file="imports.jsp"%>
<%
	
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
            <td bgcolor="#CCCCFF" class="largeHeading"> 
              <div align="center">Routines for <%=client.getFirstName() + " " + client.getLastName()%></div></td>
          </tr>
        </table>
        <table width="100%" border="0" align="center" cellpadding="3" cellspacing="0">
<%
	Enumeration enum = client.getRoutines().elements();
	int count = 0;
	while (enum.hasMoreElements()) {
		Routine routine = (Routine)enum.nextElement();
		StringBuffer exerciseList = new StringBuffer();
		Enumeration enum2 = routine.getExercises().elements();
		while (enum2.hasMoreElements()) {
			Exercise exercise = (Exercise)enum2.nextElement();
			exerciseList.append(exercise.getName());
			if (enum2.hasMoreElements())
				exerciseList.append(", ");
		}%>
        <tr> 
        	<td width="66%" bgcolor="#<%=( (count++%2==0) ?"C7E1E9" :"FFFFFF")%>" class="largeHeading"><%=routine.getName()%><br>
            <span class="normalText">Exercises:  <%=exerciseList.toString()%></span></div></td>
        </tr>
<%		
	}
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