<%@include file="imports.jsp"%>
<%
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

        if (action.equals("deleteExercise")) {
            Exercise exercise = club.getExercise(Integer.parseInt(exerciseID));
            if (exercise != null)
                club.removeExercise(exercise);
	}

        System.out.println(muscleGroup);

	Vector exercises = new Vector();
	Enumeration enum = club.getExercises().elements();
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
            } else if (exerciseType.equals("All")) {
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
        //Filter Exercises
        if (exerciseType.equals("Strength")) {
            Vector temp = new Vector();
            enum = exercises.elements();
            while (enum.hasMoreElements()) {
                AnaerobicExercise currentExercise = (AnaerobicExercise)enum.nextElement();
                if ( (muscleGroup.equals("All")) || (muscleGroup.equals(currentExercise.getBodyPart())) )
                    temp.add(currentExercise);
            }
            exercises = temp;
        }
        if (exerciseType.equals("Flexibility")) {
            Vector temp = new Vector();
            enum = exercises.elements();
            while (enum.hasMoreElements()) {
                FlexibilityExercise currentExercise = (FlexibilityExercise)enum.nextElement();
                if ( (muscleGroup.equals("All")) || (muscleGroup.equals(currentExercise.getBodyPart())) )
                    temp.add(currentExercise);
            }
            exercises = temp;
        }
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Untitled Document</title>
<script>
function deleteExercise()
{
    httpLink = "clubInfo_viewEx.jsp?exerciseType=<%=exerciseType%>&muscleGroup=<%=muscleGroup%>&action=deleteExercise&exerciseID=" + mainForm.exercise.value;
    window.location = httpLink;
}
function refresh() {
<%
    if ( (exerciseType.equals("Strength")) || (exerciseType.equals("Flexibility")) ) {
	%>httpLink = "clubInfo_viewEx.jsp?exerciseType=" + mainForm.exerciseType.value + "&muscleGroup=" + mainForm.muscleGroup.value;<%
    }
    else {
	%>httpLink = "clubInfo_viewEx.jsp?exerciseType=" + mainForm.exerciseType.value;<%
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
      <td><table width="100%" border="0" cellpadding="2" cellspacing="0" align="center" class="tableTop">
          <tr> 
            <td bgcolor="#99CCFF" class="largeHeading"> <div align="center">Exercises 
                for <%=club.getName()%></div></td>
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
             
            <%
            	if ( (exerciseType.equals("Strength")) || (exerciseType.equals("Flexibility")) ) {                        
                  %>
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
                    </select></td><%   
            	}            
            %>      
          </tr>
        </table>
        <table width="100%" border="0" cellspacing="0" cellpadding="2">
          <tr> 
            <td><table width="100%" border="0" cellspacing="0" cellpadding="2">
                <tr> 
                  <td valign="top"> <div align="center">
                      <div align="center">
                        <select name="exercise" size="13">
                          <%
    enum = exercises.elements();
    while (enum.hasMoreElements()) {
        Exercise currentExercise = (Exercise)enum.nextElement();
        %>
                          <option value="<%=currentExercise.getID()%>"><%=currentExercise.getName()%></option><%
    }
%>
                        </select>
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
                  <td width="50%"> 
                    <div align="center"></div>
                    <div align="center"><a href="javascript:deleteExercise()">Delete</a></div></td>
                  <td width="50%"> 
                    <div align="center"><a href="clubInfo_createEx.jsp">Create</a></div>
                    <div align="center"></div></td>
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