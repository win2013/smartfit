<%@include file="imports.jsp"%>
<%
    Client client = (Client)session.getAttribute("client");
    String workoutSessionID = request.getParameter("workoutSessionID");
    String clientID = request.getParameter("clientID");
    int id = Integer.parseInt(clientID);    
    id = Integer.parseInt(workoutSessionID);
    WorkoutSession ws = client.getWorkoutSession(id);    
    Trainer sessionTrainer = (Trainer)ws.getTrainer();
    
    String base = "c:\\tomcat\\webapps\\smartfit\\desktopAdmin\\";    
    String imageFilename = "temp\\" + System.currentTimeMillis() + ".jpg";
    String filename = base + imageFilename;
    Signature signature = ws.getSignature();
    if (signature != null) {
        java.awt.image.BufferedImage bi = SMUtils.projectSignature(signature.getStarts(), signature.getEnds(), signature.getXCoors(), signature.getYCoors());
        System.out.println("asdf");
        javax.imageio.ImageIO.write(bi, "jpg", new java.io.File(filename));
        System.out.println("writen");
    }
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
<form name="form1" method="post" action="routeStatsOptions.jsp">
  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="boxBorder">
    <tr>
            <td><table width="100%" border="0" cellpadding="2" cellspacing="0" align="center" class="tableTop">
                <tr> 
                  <td bgcolor="#99CCFF" class="largeHeading">
    <div align="center">Session Detail for Client <%=client.getFirstName() + " " + client.getLastName() + " on " + SMUtils.parseDateAndTime(ws.getStartTime())%></div></td>
                </tr>
              </table>
              
        <table width="100%" border="0" cellpadding="2" cellspacing="0">
          <tr class="normalText"> 
            <td width="29%" class="largeHeading">Trainer:</td>
            <td width="71%"> <%=sessionTrainer.getFirstName() + " " + sessionTrainer.getLastName()%></td>
          </tr>
          <tr class="normalText"> 
            <td class="largeHeading">Routines:</td>
<%
    Enumeration enum = ws.getRoutines().elements();
    StringBuffer sb = new StringBuffer();
    while (enum.hasMoreElements()) {
        Routine routine = (Routine)enum.nextElement();
        sb.append(routine.getName() + ( (enum.hasMoreElements()) ?", " :""));
    }
%>
            <td><%=sb.toString()%></td>
          </tr>
          <tr class="normalText"> 
            <td class="largeHeading">Signature:</td>
            <td><img src="<%=imageFilename%>"></td>
          </tr>
          <tr class="normalText"> 
            <td class="largeHeading">Contract Purchase Date:</td>
            <td><%=SMUtils.parseDateAndTime(ws.getContract().getStartDate())%></td>
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