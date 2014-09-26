<%@include file="imports.jsp"%>
<%
		String action = request.getParameter("action");

        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String SSN = request.getParameter("SSN");
        String IDNum = request.getParameter("IDNum");
        String month = request.getParameter("month");
        String day = request.getParameter("day");
        String year= request.getParameter("year");
        String sexM = request.getParameter("male");
        String sexF = request.getParameter("female");
        String addr1 = request.getParameter("addr1");
        String addr2 = request.getParameter("addr2");
        String city =  request.getParameter("city");
        String state =  request.getParameter("state");
        String zip =  request.getParameter("zip");
        String county =  request.getParameter("country");
        String phoneHome =  request.getParameter("phoneHome");
        String phoneMobile =  request.getParameter("phoneMobile");   
        String email =  request.getParameter("email");
        Trainer trainer = (Trainer)session.getAttribute("trainer");
        GregorianCalendar gc = new GregorianCalendar();
        gc.setTimeInMillis(trainer.getBirthday());
        int Imonth = gc.get(Calendar.MONTH);
        int Iyear = gc.get(Calendar.YEAR);
        int Iday = gc.get(Calendar.DAY_OF_MONTH);
        
        gc.setTimeInMillis(trainer.getCertificationExpirationDate());
        int expireMonth = gc.get(Calendar.MONTH);
        int expireYear = gc.get(Calendar.YEAR);
        int expireDate = gc.get(Calendar.DAY_OF_MONTH);
        	
	if (action == null) 
		action = "";
	
        if (action.equals("update")) {
            //Type checking
            int newYear = Integer.parseInt(year);
            int newDay = Integer.parseInt(month);
            int newMonth = Integer.parseInt(month);
            gc = new GregorianCalendar(newYear, newMonth, newDay);

            trainer.setFirstName(firstName);
            trainer.setLastName(lastName);
            trainer.setSSN(SSN);
            trainer.setIDNum(Long.parseLong(IDNum));
            trainer.setBirthday(gc.getTimeInMillis());
            trainer.setMale( ((sexM == null)) );
        
            trainer.setAddress1(addr1);
            trainer.setAddress2(addr2);
            trainer.setCity(city);
            trainer.setState(state);
            trainer.setZipCode(zip);
            trainer.setPhoneHome(phoneHome);
            trainer.setPhoneMobile(phoneMobile);
            trainer.setEmail(email);

            response.sendRedirect("trainer_profileMain.jsp");
            return;
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
<form name="form1" method="post" action="trainer_profileMod.jsp?action=update">
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
            <td colspan="4" class="largeHeading" height="1" width="100%"><div align="center"></div></td>
          </tr>
          <tr> 
            <td width="30%" height="22" class="largeHeading"> First Name:</td>
            <td colspan="3" class="normalText" height="22"> <input type="text" name="firstName" size="20" value="<%=trainer.getFirstName()%>"> 
            </td>
          </tr>
          <tr> 
            <td height="22" class="largeHeading">Last Name:</td>
            <td colspan="3" class="normalText" height="22"> <input type="text" name="lastName" size="20" value="<%=trainer.getLastName()%>"> 
            </td>
          </tr>
          <tr> 
            <td height="22" class="largeHeading">User Name:</td>
            <td colspan="3" class="normalText" height="22"> <input name="username" type="text" id="username" value="<%=trainer.getUserName()%>" size="20"> 
            </td>
          </tr>
          <tr> 
            <td height="22" class="largeHeading">Birth Date:</td>
            <td colspan="3" class="normalText" height="22">Day: 
              <input name="day" type="text" size="2" maxlength="3" value="<%=Iday%>">
              Month: 
              <select name="month">
                <option value="0" <%=( (0 == Imonth) ?"selected" :"")%>>January</option>
                <option value="1" <%=( (1 == Imonth) ?"selected" :"")%>>February</option>
                <option value="2" <%=( (2 == Imonth) ?"selected" :"")%>>March</option>
                <option value="3" <%=( (3 == Imonth) ?"selected" :"")%>>April</option>
                <option value="4" <%=( (4 == Imonth) ?"selected" :"")%>>May</option>
                <option value="5" <%=( (5 == Imonth) ?"selected" :"")%>>June</option>
                <option value="6" <%=( (6 == Imonth) ?"selected" :"")%>>July</option>
                <option value="7" <%=( (7 == Imonth) ?"selected" :"")%>>August</option>
                <option value="8" <%=( (8 == Imonth) ?"selected" :"")%>>September</option>
                <option value="9" <%=( (9 == Imonth) ?"selected" :"")%>>October</option>
                <option value="10" <%=( (10 == Imonth) ?"selected" :"")%>>November</option>
                <option value="11" <%=( (11 == Imonth) ?"selected" :"")%>>December</option>
              </select>
              Year: 
              <input name="year" type="text" size="4" maxlength="4" value="<%=Iyear%>"> 
            </td>
          </tr>
          <tr> 
            <td height="20" class="largeHeading">Sex:</td>
            <td colspan="3" class="normalText" height="20"> <input type="radio" name="radiobutton" value="male" <%=( (trainer.getMale()) ?"checked" :"")%>>
              Male 
              <input type="radio" name="radiobutton" value="female" <%=( (!trainer.getMale()) ?"checked" :"")%>>
              Female </td>
          </tr>
          <tr> 
            <td height="28" class="largeHeading">Social Security Number:</td>
            <td colspan="3" class="normalText" height="22"> <input name="SSN" type="text" value="<%=trainer.getSSN()%>" size="11" maxlength="11"> 
            </td>
          </tr>
          <tr> 
            <td height="28" class="largeHeading">Employee Number:</td>
            <td colspan="3" class="normalText" height="22"> <input name="IDNum" type="text" value="<%=trainer.getIDNum()%>" size="20"> 
            </td>
          </tr>
          <tr> 
            <td height="28" class="largeHeading">Address:</td>
            <td colspan="3" class="normalText" height="22">Street: 
              <input name="addr1" type="text" size="35" value="<%=trainer.getAddress1()%>"> 
            </td>
          </tr>
          <tr> 
            <td height="17" class="largeHeading">&nbsp;</td>
            <td colspan="3" class="normalText" height="17" width="728">Street: 
              <input name="addr2" type="text" size="35" value="<%=trainer.getAddress2()%>"></td>
          </tr>
          <tr> 
            <td class="largeHeading">&nbsp;</td>
            <td colspan="3" class="normalText" height="22">City: 
              <input name="city" type="text" size="37" value="<%=trainer.getCity()%>"> 
            </td>
          </tr>
          <tr>
            <td class="largeHeading">&nbsp;</td>
            <td width="25%" class="normalText" height="22">State: 
              <input name="state" type="text" size="2" maxlength="2" value="<%=trainer.getState()%>"> 
            </td>
            <td height="22" colspan="2" class="normalText">Zip: 
              <input name="zip" type="text" size="5" maxlength="5" value="<%=trainer.getZipCode()%>"> 
            </td>
          </tr>
          <tr> 
            <td height="22" class="largeHeading">Phone:</td>
            <td colspan="3" class="normalText" height="22"> <input type="text" name="phoneHome" size="20" value="<%=trainer.getPhoneHome()%>"> 
            </td>
          </tr>
          <tr> 
            <td height="16" class="largeHeading">Mobile:</td>
            <td colspan="3" class="normalText" height="16"> <input type="text" name="phoneMobile" size="20" value="<%=trainer.getPhoneMobile()%>"> 
            </td>
          </tr>
          <tr> 
            <td height="11" class="largeHeading">E-Mail:</td>
            <td colspan="3" class="normalText" height="11"> <input type="text" name="email" size="20" value="<%=trainer.getEmail()%>"> 
            </td>
          </tr>
          <tr> 
            <td height="0" class="largeHeading"><a href="trainer_profileCertMod.jsp">Certification 
              Info:</a></td>
            <td colspan="3" class="normalText">
<select name="select2" size="<%=enum.%>">
<%
	Enumeration enum = trainer.getCertifications().elements();
	while (enum.hasMoreElements()) {
		Certification c = (Certification)enum.nextElement();%>
		<option><%=c.getType() + " : " + SMUtils.parseDateShort(c.getExpiration())%></option>
<%		
	}
%>
              </select>
            </td>
          </tr>
          <tr> 
            <td height="0" class="largeHeading">Trainer Level:</td>
            <td height="3" colspan="3" class="normalText"><select name="select">
<%
    String levels[] = club.getTrainingLevelss();
    if (levels != null)
        for (int i = 0;i < levels.length;i++) {

        }
%>
              </select></td>
          </tr>
          <tr> 
            <td height="6" class="largeHeading">Specialty:</td>
            <td height="6" colspan="3" class="normalText"> <input name="specialty" type="text" size="35" maxlength="35"></td>
          </tr>
          <tr> 
            <td colspan="4" class="largeHeading"> 
              <div align="right"> 
                <input type="submit" name="Submit" value="Submit">
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