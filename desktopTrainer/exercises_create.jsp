<%@include file="imports.jsp"%>
<%
	String exerciseType = request.getParameter("exerciseType");
	String muscleGroup = request.getParameter("muscleGroup");
        String action = request.getParameter("action");
        String exerciseName = request.getParameter("exerciseName");
        if (muscleGroup == null)
            muscleGroup = "";	
	if (exerciseType == null)  
            exerciseType = "Aerobic";
        if (action == null)
            action = "";
        if (exerciseName == null)
            exerciseName = "";

            System.out.println(action + ", " + exerciseType + ", " + muscleGroup + ", " + exerciseName);

        if (action.equals("createExercise")) {
            if (exerciseType.equals("Aerobic")) {
                AerobicExercise exercise = db.createAerobicExercise();
                trainer.addExercise(exercise);
                exercise.setName(exerciseName);
                response.sendRedirect("exercises_view.jsp?exerciseType=Aerobic&muscleGroup=" + muscleGroup);
                return;
            } else if (exerciseType.equals("Strength")) {
                AnaerobicExercise exercise = db.createAnaerobicExercise();
                trainer.addExercise(exercise);
                exercise.setName(exerciseName);
                exercise.setBodyPart(muscleGroup);
                response.sendRedirect("exercises_view.jsp?exerciseType=Strength&muscleGroup=" + muscleGroup);
                return;
            } else if (exerciseType.equals("Flexibility")) {
                FlexibilityExercise exercise = db.createFlexibilityExercise();
                trainer.addExercise(exercise);
                exercise.setName(exerciseName);
                exercise.setBodyPart(muscleGroup);
                response.sendRedirect("exercises_view.jsp?exerciseType=Flexibility&muscleGroup=" + muscleGroup);
                return;
            }
        }

        Vector exercises = new Vector();
	Enumeration enum = trainer.getExercises().elements();
        while (enum.hasMoreElements()) {
            Exercise currentExercise = (Exercise)enum.nextElement();

            if (exerciseType.equals("Aerobic")) {
        		if (currentExercise instanceof AerobicExercise)
        			exercises.add(currentExercise);
            } else if (exerciseType.equals("Strength")) {
        		if (currentExercise instanceof AnaerobicExercise)                            
                                exercises.add(currentExercise);
            } else if (exerciseType.equals("Flexibility")) {
        		if (currentExercise instanceof FlexibilityExercise)
        			exercises.add(currentExercise);
            } 
        }
        //Populate BodyParts List
        Vector bodyParts = new Vector();
        if (exerciseType.equals("Strength")) {
            enum = exercises.elements();
            while (enum.hasMoreElements()) {
                AnaerobicExercise currentExercise = (AnaerobicExercise)enum.nextElement();
                String bodyPart = currentExercise.getBodyPart();
                if (!bodyParts.contains(bodyPart))
                    bodyParts.add(bodyPart);
            }
        }
        if (exerciseType.equals("Flexibility")) {
            enum = exercises.elements();
            while (enum.hasMoreElements()) {
                FlexibilityExercise currentExercise = (FlexibilityExercise)enum.nextElement();
                String bodyPart = currentExercise.getBodyPart();
                if (!bodyParts.contains(bodyPart))
                    bodyParts.add(bodyPart);
            }
        }
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Untitled Document</title>
<script>
function refreshExerciseType(value)
{    
	httpLink = "exercises_create.jsp?exerciseType=" + value;
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
<form name="mainForm" method="post" action="exercises_create.jsp?action=createExercise">
  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="boxBorder">
    <tr> 
      <td><table width="100%" border="0" cellpadding="2" cellspacing="0" align="center" class="tableTop">
          <tr> 
            <td bgcolor="#FFCC66" class="largeHeading"> 
              <div align="center">Create Exercise </div></td>
          </tr>
        </table>
        <table width="100%" border="0" cellpadding="2" cellspacing="0" class="tableTop">
          <tr>
            <td class="largeHeading"><div align="left">Create Exercise of Type: 
                <input type="radio" name="exerciseType" value="Aerobic" onclick="javascript:refreshExerciseType(this.value)" <%=exerciseType.equals("Aerobic") ?"checked" :""%>>Aerobic
                <input type="radio" name="exerciseType" value="Strength" onclick="javascript:refreshExerciseType(this.value)" <%=exerciseType.equals("Strength") ?"checked" :""%>>Strength
                <input type="radio" name="exerciseType" value="Flexibility" onclick="javascript:refreshExerciseType(this.value)" <%=exerciseType.equals("Flexibility") ?"checked" :""%>>Flexibility
           </div></td>
          </tr>
        </table>
        <table width="100%" border="0" cellspacing="0" cellpadding="2">
          <tr> 
            <td><table width="100%" border="0" cellspacing="0" cellpadding="2">
               <tr> 
                  <td><span class="largeHeading">Exercise Name:</span> </td>
                  <td><input type="text" name="exerciseName" size="20"></td>
                </tr>
<%
if (!exerciseType.equals("Aerobic")) {
%>
    <tr> 
    <td> 
    <div align="left"><span class="largeHeading">Muscle Group:</span></div></td>
    <td valign="top"> <%
    if (muscleGroup.equals("createNew")) {%>
        <input type="text" name="muscleGroup" size="20"><%
    }
    else {%>
        <select name="muscleGroup"><%
        enum = bodyParts.elements();
        while (enum.hasMoreElements()) {
            String currentBodyPart = (String)enum.nextElement();%>        
            <option value="<%=currentBodyPart%>"><%=currentBodyPart%></option><%
        }%>
        </select>
                    <a href="exercises_create.jsp?exerciseType=<%=exerciseType%>&muscleGroup=createNew" class="normalText">Create 
                    New</a></td>        
        </tr><%
        }
    }
%>             
              </table></td>
          </tr>
        </table>
        <table width="100%" border="0" cellpadding="2" cellspacing="0" class="dashedOnTop">
          <tr>
            <td><table width="100%" border="0" cellpadding="2" cellspacing="0" class="normalText">
                <tr> 
                  <td> <div align="center">
                      <input type="submit" name="Submit" value="Submit">
                    </div>
                    </td>
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