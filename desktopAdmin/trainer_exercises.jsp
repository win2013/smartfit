<%@include file="imports.jsp"%>

<%
  Trainer trainer = (Trainer)session.getAttribute("trainer");
%>
<%
	String exerciseType = request.getParameter("exerciseType");
	String muscleGroup = request.getParameter("muscleGroup");
	if (exerciseType == null)
		exerciseType = "All";
	if (muscleGroup == null)
		muscleGroup = "All";
		
	Vector result[] = SMUtils.filterExercisesAndGetBodyParts(trainer.getExercises(), exerciseType, muscleGroup);        
        Vector bodyParts = result[0];
        Vector exercises = result[1];
	Enumeration enum = null;
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Untitled Document</title>
<script>
function refresh() {
<%
    if ( (exerciseType.equals("Strength")) || (exerciseType.equals("Flexibility")) ) {
	%>httpLink = "trainer_exercises.jsp?exerciseType=" + mainForm.exerciseType.value + "&muscleGroup=" + mainForm.muscleGroup.value;<%
    }
    else {
	%>httpLink = "trainer_exercises.jsp?exerciseType=" + mainForm.exerciseType.value;<%
    }
%>
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
    <td><table width="100%" border="0" cellpadding="2" cellspacing="0" class="tableTop">
        <tr> 
          <td bgcolor="#99CCFF"> <div align="center" class="largeHeading">Exercises 
              for <%=trainer.getFirstName() + " " + trainer.getLastName()%> </div></td>
        </tr>
      </table>
      <table width="100%" border="0" cellpadding="2" cellspacing="0" class="tableTop">
        <tr>
            <td width="50%" class="largeHeading">
<div align="left">View Exercise of Type: </div></td>
            <td width="50%" class="largeHeading">
	<select name="exerciseType" onchange="javascript:refresh()">
                <option value="All" <%=exerciseType.equals("All") ?"selected" :""%>>All</option>
                <option value="Aerobic" <%=exerciseType.equals("Aerobic") ?"selected" :""%>>Aerobic</option>
                <option value="Strength" <%=exerciseType.equals("Strength") ?"selected" :""%>>Strength</option>
                <option value="Flexibility" <%=exerciseType.equals("Flexibility") ?"selected" :""%>>Flexibility</option>
              </select>
            </td>
          </tr>
        <tr>
                    <td class="largeHeading">Muscle Group:</td>
                    <td class="largeHeading">        
                    <select name="muscleGroup" onchange="javascript:refresh()">
                    <option value="All" <%=muscleGroup.equals("All") ?"selected" :""%>>All</option>
                    <% 
                    enum = bodyParts.elements();
                    while (enum.hasMoreElements()) {
                        String currentBodyPart = (String)enum.nextElement();
                    %>
                    <option value="<%=currentBodyPart%>" <%=muscleGroup.equals(currentBodyPart) ?"selected" :""%>><%=currentBodyPart%></option>
                    <%
                    }
                    %>
                    </select></td>
        </tr>
      </table>
        <table width="100%" border="0" cellspacing="0" cellpadding="2">
        <tr> 
          <td width="34%" bgcolor="#FFFFFF" class="largeHeading">Name</td>                    
        </tr>
<%
    enum = exercises.elements();
    int count = 0;
    while (enum.hasMoreElements()) {
        Exercise exercise = (Exercise)enum.nextElement();%>
          <tr class="normalText" bgcolor="#<%=( (count++%2==0) ?"C7E1E9" :"FFFFFF")%>"> 
            <td><%=exercise.getName()%></td>
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
</form>
</body>
</html>