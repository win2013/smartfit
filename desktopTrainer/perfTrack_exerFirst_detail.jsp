<%@include file="imports.jsp"%>
<%
    String dataType = request.getParameter("dataType");
    String setNumString = request.getParameter("setNum");
    String exerciseName = request.getParameter("exerciseName");
    String exerciseType = request.getParameter("exerciseType");
    String n_setsS = request.getParameter("sets");
    System.out.println(dataType + ", " + setNumString + ", " + exerciseName + ", " + exerciseType + ", " + n_setsS);
    
    int setNum = 0;
    int n_sets = Integer.parseInt(n_setsS);

    if (dataType == null)
        dataType = "reps";
    if (setNumString != null)
        setNum = Integer.parseInt(setNumString);
    

        

    Client client = (Client)session.getAttribute("client");
    GregorianCalendar startDate = (GregorianCalendar)session.getAttribute("startDate");
    GregorianCalendar endDate = (GregorianCalendar)session.getAttribute("endDate");
    long startTime = startDate.getTimeInMillis();
    long endTime = endDate.getTimeInMillis() + 24l*60l*60l*1000l - 1l;

    
    
%>
<%
            //Get All exercises
            Hashtable exerciseInfo = new Hashtable();
            Vector allExercises = new Vector(); {
                Enumeration enum = client.getWorkoutSessions().elements();
                while (enum.hasMoreElements()) {
                    WorkoutSession ws = (WorkoutSession)enum.nextElement();
                    if ( (ws.getStartTime() < startTime) || (ws.getStartTime() > endTime) )
                        continue;
                    Enumeration routines = ws.getRoutines().elements();
                    while (routines.hasMoreElements()) {
                        Routine routine = (Routine)routines.nextElement();
                        Enumeration exercises = routine.getExercises().elements();
                        while (exercises.hasMoreElements()) {
                            Exercise exercise = (Exercise)exercises.nextElement();
                            allExercises.add(exercise);
                            String info[] = (String[])exerciseInfo.get(exercise.getName());
                            if (info == null) {
                                info = new String[2];
                                if (exercise instanceof AerobicExercise) {
                                    info[0] = "Aerobic";
                                    info[1] = "n/a";
                                } else if (exercise instanceof AnaerobicExercise) {
                                    info[0] = "Strenth";
                                    info[1] = ((AnaerobicExercise)exercise).getBodyPart();
                                } else if (exercise instanceof FlexibilityExercise) {
                                    info[0] = "Flexibility";
                                    info[1] = ((FlexibilityExercise)exercise).getBodyPart();
                                }
                                exerciseInfo.put(exercise.getName(), info);
                            }
                        }
                    }
                }
            }
            
            //Start            
            double x[] = new double[allExercises.size()];
            double y[] = new double[allExercises.size()];
            int index = 0;
            
            //Get data
            {
                Enumeration enum = client.getWorkoutSessions().elements();
                while (enum.hasMoreElements()) {
                    WorkoutSession ws = (WorkoutSession)enum.nextElement();
                    if ( (ws.getStartTime() < startTime) || (ws.getStartTime() > endTime) )
                        continue;
                    Enumeration routines = ws.getRoutines().elements();
                    while (routines.hasMoreElements()) {
                        Routine routine = (Routine)routines.nextElement();
                        Enumeration exercises = routine.getExercises().elements();
                        while (exercises.hasMoreElements()) {
                            Exercise exercise = (Exercise)exercises.nextElement();
                            if (exercise.getName().equals(exerciseName)) {
                                if (exercise instanceof AerobicExercise) {
                                    if (dataType.equals("reps")) {
                                        x[index] = (double)ws.getStartTime();
                                        y[index] = (double)(((AerobicExercise)exercise).getSets()).size();
                                        index++;
                                        continue;
                                    }   
                                    Enumeration sets = ( ((AerobicExercise)exercise).getSets() ).elements();                                     
                                    while (sets.hasMoreElements()) {
                                        AerobicSet set = (AerobicSet)sets.nextElement();
                                        if (set.getSetNum() == setNum) {
                                            if (dataType.equals("intensity")) {
                                                x[index] = (double)ws.getStartTime();
                                                y[index] = (double)Double.parseDouble(set.getIntensity());
                                                index++;
                                            }else if(dataType.equals("time")) {
                                                x[index] = (double)ws.getStartTime();
                                                y[index] = (double)set.getTime();
                                                index++;
                                            }
                                        }
                                    }
                                } else if (exercise instanceof AnaerobicExercise) {
                                    if (dataType.equals("reps")) {
                                        x[index] = (double)ws.getStartTime();
                                        y[index] = (double)(((AnaerobicExercise)exercise).getSets()).size();
                                        index++;
                                        continue;
                                    }  
                                    Enumeration sets = ( ((AnaerobicExercise)exercise).getSets() ).elements();
                                    while (sets.hasMoreElements()) {
                                        AnaerobicSet set = (AnaerobicSet)sets.nextElement();
                                        if (set.getSetNum() == setNum) {
                                            if (dataType.equals("weight")) {
                                                x[index] = (double)ws.getStartTime();
                                                y[index] = (double)set.getWeight();
                                                index++;
                                            }else if(dataType.equals("rest time")) {
                                                x[index] = (double)ws.getStartTime();
                                                y[index] = (double)set.getRestTime();
                                                index++;
                                            }
                                        }
                                    }
                                    
                                } else if (exercise instanceof FlexibilityExercise) {
                                    if (dataType.equals("reps")) {
                                        x[index] = (double)ws.getStartTime();
                                        y[index] = (double)(((AnaerobicExercise)exercise).getSets()).size();
                                        index++;
                                        continue;
                                    }  
                                    Enumeration sets = ( ((AnaerobicExercise)exercise).getSets() ).elements();
                                    while (sets.hasMoreElements()) {
                                        AnaerobicSet set = (AnaerobicSet)sets.nextElement();
                                        if (set.getSetNum() == setNum) {
                                            
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }

            //Find min.max y values
            double minY = Double.MAX_VALUE;
            double maxY = Double.MIN_VALUE;
            for (int i = 0;i < index;i++){
                if (y[i] < minY)
                    minY = y[i];
                if (y[i] > maxY)
                    maxY = y[i];
            }
            
            //Make graph
            System.out.println(index);
            java.awt.image.BufferedImage image = SMUtils.generateGraphShell(500, 250, "Time", dataType, (double)startTime, (double)endTime, minY, maxY);
            image = SMUtils.generateGraph(image, x, y, index, (double)startTime, (double)endTime, minY, maxY, new java.awt.Color(51,102,204));
            //image = SMUtils.generateTicks((double)startTime, (double)endTime, minY, maxY, image);
            String filename = System.currentTimeMillis() + ".jpg";
            javax.imageio.ImageIO.write(image, "jpg", new java.io.File("c:\\tomcat\\webapps\\smartfit\\desktop\\trainerModule\\temp\\" + filename));
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Untitled Document</title>
<script>
function forward() {
    httpLink = 'perfTrack_exerFirst_detail.jsp?exerciseType=<%=exerciseType%>&sets=<%=n_sets%>&exerciseName=<%=exerciseName%>&dataType=' + mainForm.dataType.value + '&setNum=' + mainForm.sets.value;
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
            <td bgcolor="#FFCC66"> 
              <div align="center" class="largeHeading">Exercise Info for <%=SMUtils.parseDate(startTime)%>
                through <%=SMUtils.parseDate(endTime)%></div></td>
        </tr>
      </table>
      <table width="100%" border="0" cellpadding="2" cellspacing="0" class="tableTop">
        <tr class="largeHeading"> 
            <td width="50%">Select Set Details to View 
              <select name="dataType" onchange="javascript:forward()">
<%
    if (exerciseType.equals("Aerobic")) {%>
        <option value="time" <%=( (dataType.equals("time")) ?"selected" :"")%>>Time</option>
        <option value="intensity" <%=( (dataType.equals("intensity")) ?"selected" :"")%>>Intensity</option>
<%
    } else if (exerciseType.equals("Strength")) {%>
        <option value="reps" <%=( (dataType.equals("reps")) ?"selected" :"")%>>Repetitions</option>
        <option value="weight" <%=( (dataType.equals("weight")) ?"selected" :"")%>>Weight</option>
        <option value="rest time" <%=( (dataType.equals("rest time")) ?"selected" :"")%>>Rest Time</option>
<%
    } else if (exerciseType.equals("Fliexibility")) {
    }
%>
              </select></td>
            <td width="50%">Select Set to View
              <select name="sets" onchange="javascript:forward()">
<%
    for (int i = 1;i <= n_sets;i++) {%>
                <option value="<%=i%>" <%=( (i == setNum) ?"selected" :"")%>><%=i%></option>                
  <%}
%>
              </select></td>
        </tr>
      </table>
        <table width="100%" border="0" cellspacing="0" cellpadding="2">
          <tr>
            <td><image align="center" src="temp/<%=filename%>"/></td>
        </tr>
      </table> </td>
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
