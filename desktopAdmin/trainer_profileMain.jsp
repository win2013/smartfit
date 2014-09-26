<%@include file="imports.jsp"%>
<%
	Trainer trainer = (Trainer)session.getAttribute("trainer");
        GregorianCalendar gc = new GregorianCalendar();
        gc.setTimeInMillis(trainer.getBirthday());
        int year = gc.get(Calendar.YEAR);
        int month = gc.get(Calendar.MONTH);
        int day = gc.get(Calendar.DAY_OF_MONTH);
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
            <td bgcolor="#99CCFF" class="largeHeading"> <div align="center"> Profile 
                for Trainer <%=trainer.getFirstName() + " " + trainer.getLastName()%></div></td>
          </tr>
        </table>
        <table width="100%" border="0" align="center" cellpadding="3" cellspacing="0">
          <tr> 
            <td colspan="3" class="largeHeading"></td>
          </tr>
          <tr> 
            <td colspan="3" class="largeHeading"><div align="right" class="normalText"><a href="trainer_profileMod.jsp">Modify 
                Information</a></div></td>
          </tr>
          <tr> 
            <td width="30%" class="largeHeading">Name:</td>
            <td width="78%" colspan="2" class="normalText"><%=trainer.getFirstName() + " " + trainer.getLastName()%></td>
          </tr>
          <tr> 
            <td class="largeHeading">Birth Date:</td>
            <td colspan="2" class="normalText"><%=(month+1) + "/" + day + "/" + year%></td>
          </tr>
          <tr> 
            <td class="largeHeading">Gender:</td>
            <td colspan="2" class="normalText"><%= ( (trainer.getMale()) ?"Male" :"Female")%></td>
          </tr>
          <tr> 
            <td class="largeHeading">Social Security Number:</td>
            <td colspan="2" class="normalText"><%=trainer.getSSN()%></td>
          </tr>
          <tr> 
            <td class="largeHeading">Employee Number:</td>
            <td colspan="2" class="normalText"><%=trainer.getIDNum()%></td>
          </tr>
          <tr> 
            <td class="largeHeading">Address:</td>
            <td colspan="2" class="normalText"><%=trainer.getAddress1()%></td>
          </tr>
          <%
          if (trainer.getAddress2().length() > 0) {%>
          <tr> 
            <td class="largeHeading">&nbsp;</td>
            <td colspan="2" class="normalText"><%=trainer.getAddress2()%></td>
          </tr>
          <%
    }
%>
          <tr> 
            <td class="largeHeading"></td>
            <td colspan="2" class="normalText"><%=trainer.getCity() + ", " + trainer.getState() + " " + trainer.getZipCode()%></td>
          </tr>
          <tr> 
            <td class="largeHeading">Phone:</td>
            <td colspan="2" class="normalText"><%=trainer.getPhoneHome()%></td>
          </tr>
          <tr> 
            <td class="largeHeading">Mobile:</td>
            <td colspan="2" class="normalText"><%=trainer.getPhoneMobile()%></td>
          </tr>
          <tr> 
            <td class="largeHeading">E-Mail</td>
            <td colspan="2" class="normalText"><%=trainer.getEmail()%></td>
          </tr>
          <tr> 
            <td class="largeHeading">Username:</td>
            <td colspan="2" class="normalText"><%=trainer.getUserName()%></td>
          </tr>
          <tr> 
            <td class="largeHeading">Certification Info:</td>
            <td class="normalText"><%=trainer.getCertificationType()%></td>
            <td class="normalText"><span class="largeHeading">Exp. Date:</span> 
              <%=SMUtils.parseDate(trainer.getCertificationExpirationDate())%></td>
          </tr>
          <tr> 
            <td class="largeHeading">Trainer Level:</td>
            <td colspan="2" class="largeHeading">&nbsp;</td>
          </tr>
          <tr> 
            <td class="largeHeading">Specialty:</td>
            <td colspan="2" class="largeHeading">&nbsp;</td>
          </tr>
        </table></td>
    </tr>
  </table>
  <table width="100%" border="0" align="center" cellpadding="2" cellspacing="0">
    <tr>
      <td class="smallLinks"><div align="right"><a href="javascript:history.back(1)">Back</a></div></td>
    </tr>
  </table>
  
</form>
</body>
</html>