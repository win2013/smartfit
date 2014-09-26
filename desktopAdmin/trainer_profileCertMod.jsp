<%@include file="imports.jsp"%>
<%
        Trainer trainer = (Trainer)session.getAttribute("trainer");
		String action = request.getParameter("action");
        String eDay = request.getParameter("expireDay");
        String eMonth = request.getParameter("expireMonth");
        String eYear = request.getParameter("expireYear");
		String type = request.getParameter("type");
			
		if (action == null) 
			action = "";
	
        if (action.equals("remove")) {
			String certificaitonID = request.getParameter("certificationID");
			System.out.println("removing"  + certificaitonID);
			Certification c = trainer.getCertification(Integer.parseInt(certificaitonID));
			trainer.removeCertification(c);
        }
		if (action.equals("Add Certification")) {
            int newYear = Integer.parseInt(eYear);
            int newDay = Integer.parseInt(eDay);
            int newMonth = Integer.parseInt(eMonth);
	        GregorianCalendar gc = new GregorianCalendar(newYear, newMonth, newDay);
			
			Certification ci = db.createCertification();
			ci.setType(type);
			ci.setExpiration(gc.getTimeInMillis());
			trainer.addCertification(ci);			
			response.sendRedirect("trainer_profileCertMod.jsp");
			return;
		}
	
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Untitled Document</title>
<script>
function removeCertification() {
	window.location = 'trainer_profileCertMod.jsp?action=remove&certificationID=' + mainForm.certificationID.value;
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
<form name="mainForm" method="post" action="trainer_profileCertMod.jsp">
  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="boxBorder">
    <tr> 
      <td><table width="100%" border="0" cellpadding="2" cellspacing="0" align="center" class="tableTop">
          <tr> 
            <td bgcolor="#99CCFF" class="largeHeading"> <div align="center">Profile Editor 
                for Trainer <%=trainer.getFirstName() + " " + trainer.getLastName()%></div></td>
          </tr>
        </table>
        <table width="100%" border="0" align="center" cellpadding="3" cellspacing="0">
          <tr> 
            <td width="45%" class="largeHeading"> <div align="center">Current 
                Certifications</div></td>
            <td width="55%" class="largeHeading"> <div align="center">Certification 
                Info</div></td>
          </tr>
          <tr> 
            <td width="45%" height="6" rowspan="5" class="largeHeading"> <div align="center"> 
                <select name="certificationID" size="8">
<%
	Enumeration enum = trainer.getCertifications().elements();
	while (enum.hasMoreElements()) {
		Certification c = (Certification)enum.nextElement();%>
		<option value="<%=c.getID()%>"><%=c.getType() + ":" + SMUtils.parseDateShort(c.getExpiration())%></option>
<%
	}
%>
                </select>
              </div></td>
            <td height="6" class="normalText"><span class="largeHeading">Type:</span>&nbsp; 
            </td>
          </tr>
          <tr> 
            <td height="6" class="normalText"><input name="type" type="text" id="type" size="35" maxlength="35"> 
            </td>
          </tr>
          <tr> 
            <td height="6" class="normalText"><span class="largeHeading">Expiration 
              Date:</span> </td>
          </tr>
          <tr> 
            <td height="6" class="normalText" align="right"><div align="left">Month: 
                <select name="expireMonth">
                  <option value="0">January</option>
                  <option value="1">February</option>
                  <option value="2">March</option>
                  <option value="3">April</option>
                  <option value="4">May</option>
                  <option value="5">June</option>
                  <option value="6">July</option>
                  <option value="7">August</option>
                  <option value="8">September</option>
                  <option value="9">October</option>
                  <option value="10">November</option>
                  <option value="11">December</option>
                </select>
                <br>
                Day: 
                <input name="expireDay" type="text" size="2" maxlength="3">
                <br>
                Year: 
                <input name="expireYear" type="text" size="4" maxlength="4">
              </div></td>
          </tr>
          <tr> 
            <td height="6" class="normalText" align="center">&nbsp;</td>
          </tr>
          <tr> 
            <td width="45%" height="13" class="largeHeading"><div align="center"><a href="javascript:removeCertification()">Remove 
                Certification </a></div></td>
            <td class="largeHeading" height="13" width="55%"><div align="center">
                <input name="action" type="submit" id="action" value="Add Certification">
              </div></td>
          </tr>
        </table>
        <table width="100%" border="0" cellpadding="3" cellspacing="0" class="dashedOnTop">
          <tr>
            <td> <div align="center">
                <p class="largeHeading"><a href="trainer_profileMod.jsp">Done</a></p>
              </div></td>
          </tr>
        </table></td>
    </tr>
  </table>
  <table width="100%" border="0" align="center" cellpadding="2" cellspacing="0">
    <tr> 
      <td><div align="right"></div>
        <div align="right"><a href="javascript:history.back(1)" class="smallLinks">Back</a></div></td>
    </tr>
  </table>
</form>
</body>
</html>