<%@include file="imports.jsp"%>
<%
        String finish = request.getParameter("finish");        
	String exerciseType = request.getParameter("exerciseType");
	String muscleGroup = request.getParameter("muscleGroup");
        String action = request.getParameter("action");
        if (muscleGroup == null)
            muscleGroup = "";	
	if (exerciseType == null)  
            exerciseType = "Aerobic";
        if (action == null)
            action = "";

       if (action.equals("add")) {        
            String exercises[] = request.getParameterValues("clubExercise");
            if (exercises != null) {            
                for(int i = 0;i < exercises.length;i++) {                    
                    Exercise exercise = club.getExercise(Integer.parseInt(exercises[i]));
                    if (exercise == null)
                        continue;
                    Exercise newExercise = SMUtils.copyExercise(exercise, db);
                    trainer.addExercise(newExercise);
                }
            }
       }
       if (finish != null) {
        response.sendRedirect("exercises_view.jsp");
        return;
       }
%>

<%
        Vector trainerExercises = new Vector();
	Enumeration enum = trainer.getExercises().elements();
        while (enum.hasMoreElements()) {
            Exercise currentExercise = (Exercise)enum.nextElement();
            if (exerciseType.equals("Aerobic")) {
        		if (currentExercise instanceof AerobicExercise)
        			trainerExercises.add(currentExercise);
            } else if (exerciseType.equals("Strength")) {
        		if (currentExercise instanceof AnaerobicExercise)                            
                                trainerExercises.add(currentExercise);
            } else if (exerciseType.equals("Flexibility")) {
        		if (currentExercise instanceof FlexibilityExercise)
        			trainerExercises.add(currentExercise);
            } else if (exerciseType.equals("All")) {        		
                        trainerExercises.add(currentExercise);
            }
        }

        Vector clubExercises = new Vector();
	enum = club.getExercises().elements();
        while (enum.hasMoreElements()) {
            Exercise currentExercise = (Exercise)enum.nextElement();
            if (exerciseType.equals("Aerobic")) {
        		if (currentExercise instanceof AerobicExercise)
        			clubExercises.add(currentExercise);
            } else if (exerciseType.equals("Strength")) {
        		if (currentExercise instanceof AnaerobicExercise)                            
                                clubExercises.add(currentExercise);
            } else if (exerciseType.equals("Flexibility")) {
        		if (currentExercise instanceof FlexibilityExercise)
        			clubExercises.add(currentExercise);
            } else if (exerciseType.equals("All")) {        		
        		clubExercises.add(currentExercise);
            }
        }

        //Populate BodyParts List
        //club
        Vector bodyParts = new Vector();
        if (exerciseType.equals("Strength")) {
            enum = trainerExercises.elements();
            while (enum.hasMoreElements()) {
                AnaerobicExercise currentExercise = (AnaerobicExercise)enum.nextElement();
                String bodyPart = currentExercise.getBodyPart();
                if (!bodyParts.contains(bodyPart))
                    bodyParts.add(bodyPart);
            }        
            enum = clubExercises.elements();
            while (enum.hasMoreElements()) {
                AnaerobicExercise currentExercise = (AnaerobicExercise)enum.nextElement();
                String bodyPart = currentExercise.getBodyPart();
                if (!bodyParts.contains(bodyPart))
                    bodyParts.add(bodyPart);
            }
        }
        if (exerciseType.equals("Flexibility")) {
            enum = trainerExercises.elements();
            while (enum.hasMoreElements()) {
                FlexibilityExercise currentExercise = (FlexibilityExercise)enum.nextElement();
                String bodyPart = currentExercise.getBodyPart();
                if (!bodyParts.contains(bodyPart))
                    bodyParts.add(bodyPart);
            }
            enum = clubExercises.elements();
            while (enum.hasMoreElements()) {
                FlexibilityExercise currentExercise = (FlexibilityExercise)enum.nextElement();
                String bodyPart = currentExercise.getBodyPart();
                if (!bodyParts.contains(bodyPart))
                    bodyParts.add(bodyPart);
            }
        }
        //Make sure ody part is appropriate
        if (!bodyParts.contains(muscleGroup))
            muscleGroup = "All";

    //Filter Exercises
        if (exerciseType.equals("Strength")) {
            Vector temp = new Vector();
            enum = trainerExercises.elements();
            while (enum.hasMoreElements()) {
                AnaerobicExercise currentExercise = (AnaerobicExercise)enum.nextElement();
                if ( (muscleGroup.equals("All")) || (muscleGroup.equals(currentExercise.getBodyPart())) )
                    temp.add(currentExercise);
            }
            trainerExercises = temp;
            
            temp = new Vector();
            enum = clubExercises.elements();
            while (enum.hasMoreElements()) {
                AnaerobicExercise currentExercise = (AnaerobicExercise)enum.nextElement();
                if ( (muscleGroup.equals("All")) || (muscleGroup.equals(currentExercise.getBodyPart())) )
                    temp.add(currentExercise);
            }
            clubExercises = temp;
        }
        if (exerciseType.equals("Flexibility")) {
            Vector temp = new Vector();
            enum = trainerExercises.elements();
            while (enum.hasMoreElements()) {
                FlexibilityExercise currentExercise = (FlexibilityExercise)enum.nextElement();
                if ( (muscleGroup.equals("All")) || (muscleGroup.equals(currentExercise.getBodyPart())) )
                    temp.add(currentExercise);
            }
            trainerExercises = temp;

            temp = new Vector();
            enum = clubExercises.elements();
            while (enum.hasMoreElements()) {
                FlexibilityExercise currentExercise = (FlexibilityExercise)enum.nextElement();
                if ( (muscleGroup.equals("All")) || (muscleGroup.equals(currentExercise.getBodyPart())) )
                    temp.add(currentExercise);
            }
            clubExercises = temp;
        }
%>

<html>
<head>
<title>Untitled Document</title>
<script>
function deleteExercise()
{
    httpLink = "exercises_view.jsp?exerciseType=<%=exerciseType%>&muscleGroup=<%=muscleGroup%>&action=deleteExercise&exerciseID=" + mainForm.exercise.value;
    window.location = httpLink;
}
function refresh() {
<%
    if ( (exerciseType.equals("Strength")) || (exerciseType.equals("Flexibility")) ) {
	%>httpLink = "exercises_import.jsp?exerciseType=" + mainForm.exerciseType.value + "&muscleGroup=" + mainForm.muscleGroup.value;<%
    }
    else {
	%>httpLink = "exercises_import.jsp?exerciseType=" + mainForm.exerciseType.value;<%
    }
%>
	window.location = httpLink;
}
function back()
{
    document.writeln('asdfsadf');
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
<form name="mainForm" method="post" action="exercises_import.jsp?action=add">
  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="boxBorder">
    <tr> 
      <td>
      <table width="100%" border="0" cellpadding="2" cellspacing="0" align="center" class="tableTop" height="19">
          <tr> 
            <td bgcolor="#FFCC66" class="largeHeading" height="15"> <div align="center">Import Exercises 
                for <%=trainer.getFirstName() + " " + trainer.getLastName()%></div></td>
          </tr>
        </table>
        <table width="100%" border="0" cellpadding="2" cellspacing="0" class="tableTop">
          <tr>
            <td class="largeHeading"><div align="center">View Exercise of Type: 
                <select name="exerciseType" onchange="javascript:refresh()" size="1">
                <option value="All" <%=exerciseType.equals("All") ?"selected" :""%>>All</option>
                <option value="Aerobic" <%=exerciseType.equals("Aerobic") ?"selected" :""%>>Aerobic</option>
                <option value="Strength" <%=exerciseType.equals("Strength") ?"selected" :""%>>Strength</option>
                <option value="Flexibility" <%=exerciseType.equals("Flexibility") ?"selected" :""%>>Flexibility</option>
                </select>
              </div><div align="center">
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
                    </select></div></td>
          </tr>
        </table>
        <table width="100%" border="0" cellspacing="0" cellpadding="2">
          <tr> 
            <td><table width="100%" border="0" cellspacing="0" cellpadding="2">
                <tr> 
                  <td width="49%" valign="top"> 
                    <div align="center">
                      <div align="center"><b><span class="largeHeading">Trainer's Exercises</span><br>
                        </b>
                        <br>
                        <select name="trainerExercise" size="10">
<%
    enum = trainerExercises.elements();
    while (enum.hasMoreElements()) {
        Exercise currentExercise = (Exercise)enum.nextElement();
    %><option value="<%=currentExercise.getID()%>"><%=currentExercise.getName()%></option><%
}
%>
                        </select>
                      </div>
                      </div>
                    </td>
                  <td width="2%" valign="top"> 
                    <table width="1%" height="200" border="0" cellpadding="2" cellspacing="0">
                      <tr> 
                        <td class="verticalDash">&nbsp;</td>
                      </tr>
                    </table></td>
                  <td width="49%" valign="top"> 
                    <div align="center"><b><span class="largeHeading">Club's Exercises</span></b><br>
                      <br>
                      <select name="clubExercise" size="10" multiple>
<%
    enum = clubExercises.elements();
    while (enum.hasMoreElements()) {
        Exercise currentExercise = (Exercise)enum.nextElement();        
    %><option value="<%=currentExercise.getID()%>"><%=currentExercise.getName()%></option><%
}
%>
                      </select>
                    </div>
                    </td>
                </tr>
              </table></td>
          </tr>
        </table>
        <table width="100%" border="0" cellpadding="2" cellspacing="0" class="dashedOnTop">
          <tr>
            <td><table width="100%" border="0" cellpadding="2" cellspacing="0" class="normalText">
                <tr> 
                    <td width="50%">
                    <center> <input type="submit" value="Add/Import" name="B1"> </center> </td>
					<td width="50%">
					<center><input type="submit" value="Finish" name="finish"></center>
					</td>
					
                </tr>
              </table>
              <table width="100%" border="0" cellpadding="2" cellspacing="0" class="dashedOnTop">
                <tr>
                  <td class="normalText">Select an exercise from Club's list to 
                    add to Trainer's list. Exercises may only be deleted from 
                    Trainer's list.</td>
                </tr>
              </table></td>
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