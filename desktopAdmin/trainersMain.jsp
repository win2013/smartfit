<%@include file="imports.jsp"%>
<%
	String view = request.getParameter("view");
	String action = request.getParameter("action");
        String trainerID = request.getParameter("trainerID");
        if (action == null)
            action = "";
	if (view == null)
            view = "active";
        if (trainerID == null)
            trainerID = "-1";

        //Perform action
        if (action.equals("activate")) {    
            Trainer trainer = club.getTrainer(Integer.parseInt(trainerID));
            if (trainer != null)
                trainer.setActive(true);
            response.sendRedirect("trainersMain.jsp?view=inactive");
            return;
        }
        if (action.equals("inactivate")) {            
            Trainer trainer = club.getTrainer(Integer.parseInt(trainerID));
            if (trainer != null)
                trainer.setActive(false);
            response.sendRedirect("trainersMain.jsp?view=active");
            return;
        }

	//Soret users by "activeness"	
	Vector active = new Vector();
	Vector inactive = new Vector();
	Enumeration enum = club.getTrainers().elements();
	while (enum.hasMoreElements()) {
		Trainer trainer = (Trainer)enum.nextElement();
		if (trainer.getActive())
			active.add(trainer);
		else
			inactive.add(trainer);
	}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Untitled Document</title>
<script>
function inactivateTrainer() {
	httpLink= "trainersMain.jsp?action=inactivate&trainerID=" + mainForm.trainers.value;
	window.location = httpLink;
}
function activateTrainer() {
	httpLink = "trainersMain.jsp?action=activate&trainerID=" + mainForm.trainers.value;
	window.location = httpLink;
}
function selectTrainer() {
	httpLink = "trainer_options.jsp?trainerID=" + mainForm.trainers.value;
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
            <td bgcolor="#99CCFF" class="largeHeading"> <div align="center"><%=((view.equals("active")) ?"Active" :"Inactive")%> Trainer List</div></td>
          </tr>
        </table>
        <table width="100%" border="0" cellpadding="2" cellspacing="0" class="tableTop">
          <tr>
            <td><div align="center"><br>
                <select name="trainers" size="14">
<%
    Vector trainers = SMUtils.sortUsers((view.equals("active") ?active :inactive));
    enum = trainers.elements();
    while (enum.hasMoreElements()) {
        User user = (User)enum.nextElement();%>
        <option value="<%=user.getID()%>"><%=user.getFirstName() + " " + user.getLastName()%></option>
        <%
    }
%>
                </select>
                <br>
                <br>
              </div></td>
          </tr>
        </table>
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
         <tr> 
            <td width="25%" align="center" class="largeHeading"> 
              <div align="center"><a href="trainer_create.jsp">Add</a></div></td>
            <td width="25%" align="center"> 
              <div align="center" class="largeHeading"> 
                <a href="javascript:<%=((view.equals("active")) ?"inactivateTrainer" :"activateTrainer")%>()">Make 
                <%=((view.equals("active")) ?"Inactive" :"Active")%></a></div></td>
            <td width="25%" align="center"> 
              <div align="center" class="largeHeading">
                <a href="javascript:selectTrainer()">Select</a></div></td>
            <td width="25%" align="center" class="largeHeading">
            <a href="trainersMain.jsp?view=<%=((view.equals("active")) ?"inactive" :"active")%>">See <%=((view.equals("active")) ?"Inactive" :"Active")%></a></td>
          </tr>
        </table></td>
    </tr>
  </table>
</form>
</body>
</html>
