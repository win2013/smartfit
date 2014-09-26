<%@include file="imports.jsp"%>
<%
        Routine routine = (Routine)session.getAttribute("routine");

        String exerciseType = request.getParameter("exerciseType");
        String muscleGroup = request.getParameter("muscleGroup");
        String action = request.getParameter("action");
        String exerciseID = request.getParameter("exerciseID");
        if (exerciseID == null)
            exerciseID = "-1";
        if (action == null)
            action = "";
        if (exerciseType == null)
            exerciseType = "All";
        if (muscleGroup == null)
            muscleGroup = "All";

        //Populate BodyParts List
        Vector results[] = SMUtils.filterExercisesAndGetBodyParts(trainer.getExercises(), exerciseType, muscleGroup);
        Vector bodyParts = results[0];
        Vector exercises = results[1];

        //Actions
        if (action.equals("add")) {
            int id = Integer.parseInt(exerciseID);
            Exercise exercise = trainer.getExercise(id);
            System.out.println(exercise);
            Exercise newExercise = SMUtils.copyExercise(exercise, db);
            routine.addExercise(newExercise);
            response.sendRedirect("routines_modify_trainer.jsp?routineID=" + routine.getID());
            return;
        }
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Untitled Document</title>
<script>
function refresh() {
<%
    if ( (exerciseType.equals("Strength")) || (exerciseType.equals("Flexibility")) ) {
	%>httpLink = "routines_addEx.jsp?exerciseType=" + mainForm.exerciseType.value + "&muscleGroup=" + mainForm.muscleGroup.value;<%
    }
    else {
	%>httpLink = "routines_addEx.jsp?exerciseType=" + mainForm.exerciseType.value;<%
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
<form name="mainForm" method="post" action="routines_addEx.jsp?action=add">
  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="boxBorder">
    <tr> 
      <td><table width="100%" border="0" cellpadding="2" cellspacing="0" align="center" class="tableTop">
          <tr> 
            <td height="19" bgcolor="#FFCC66" class="largeHeading"> 
              <div align="center">Add Exercise </div></td>
          </tr>
        </table>
        <table width="100%" border="0" cellpadding="2" cellspacing="0" class="tableTop">
          <tr class="largeHeading"> 
            <td>Exercise Type: 
	<select name="exerciseType" onchange="javascript:refresh()">
                <option value="All" <%=exerciseType.equals("All") ?"selected" :""%>>All</option>
                <option value="Aerobic" <%=exerciseType.equals("Aerobic") ?"selected" :""%>>Aerobic</option>
                <option value="Strength" <%=exerciseType.equals("Strength") ?"selected" :""%>>Strength</option>
                <option value="Flexibility" <%=exerciseType.equals("Flexibility") ?"selected" :""%>>Flexibility</option>
              </select>
</td>
             <%
            	if ( (exerciseType.equals("Strength")) || (exerciseType.equals("Flexibility")) ) {                        
                  %>
                    <td class="largeHeading">Muscle Group:</td>
                    <td class="largeHeading">        
                    <select name="muscleGroup" onchange="javascript:refresh()">
                    <option value="All" <%=muscleGroup.equals("All") ?"selected" :""%>>All</option>
                    <% 
                    Enumeration enum = bodyParts.elements();
                    while (enum.hasMoreElements()) {
                        String currentBodyPart = (String)enum.nextElement();
                    %>
                    <option value="<%=currentBodyPart%>" <%=muscleGroup.equals(currentBodyPart) ?"selected" :""%>><%=currentBodyPart%></option>
                    <%
                    }
                    %>
                    </select></td><%   
            	}            
            %>    
          </tr>
        </table>
        <table width="100%" border="0" cellspacing="0" cellpadding="2">
          <tr> 
            <td><div align="center">
                <select name="exerciseID" size="14">
<%
    Enumeration enum = exercises.elements();
    while (enum.hasMoreElements()) {
        Exercise currentExercise = (Exercise)enum.nextElement();
        %><option value="<%=currentExercise.getID()%>"><%=currentExercise.getName()%></option><%
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
                  <td> <div align="right">
                      <input type="submit" name="Submit" value="Add">
                    </div></td>
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