<%@include file="imports.jsp"%>
<%
	String action = request.getParameter("action");

        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String month = request.getParameter("month");
        String day = request.getParameter("day");
        String year= request.getParameter("year");
        String gender = request.getParameter("gender");
        String addr1 = request.getParameter("addr1");
        String addr2 = request.getParameter("addr2");
        String city =  request.getParameter("city");
        String state =  request.getParameter("state");
        String zip =  request.getParameter("zip");
        String county =  request.getParameter("country");
        String phoneHome =  request.getParameter("phoneHome");
        String phoneMobile =  request.getParameter("phoneMobile");   
        String email =  request.getParameter("email");

        GregorianCalendar gc = new GregorianCalendar();
        gc.setTimeInMillis(client.getBirthday());
        int Imonth = gc.get(Calendar.MONTH);
        int Iyear = gc.get(Calendar.YEAR);
        int Iday = gc.get(Calendar.DAY_OF_MONTH);

	
	if (action == null) 
		action = "";
	
        if (action.equals("update")) {
            //Type checking
            int newYear = Integer.parseInt(year);
            int newDay = Integer.parseInt(month);
            int newMonth = Integer.parseInt(month);
            gc = new GregorianCalendar(newYear, newMonth, newDay);

            client.setFirstName(firstName);
            client.setLastName(lastName);            
            client.setBirthday(gc.getTimeInMillis());
            client.setMale(gender.equals("male"));
        
            client.setAddress1(addr1);
            client.setAddress2(addr2);
            client.setCity(city);
            client.setState(state);
            client.setZipCode(zip);
            client.setPhoneHome(phoneHome);
            client.setPhoneMobile(phoneMobile);
            client.setEmail(email);

            response.sendRedirect("profileMain.jsp");
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
<form name="form1" method="post" action="profileMod.jsp?action=update">
  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="boxBorder">
    <tr> 
      <td><table width="100%" border="0" cellpadding="2" cellspacing="0" align="center" class="tableTop">
          <tr> 
            <td bgcolor="#CCCCFF" class="largeHeading"> 
              <div align="center">Profile for <%=client.getFirstName() + " " + client.getLastName()%></div></td>
          </tr>
        </table>
        <table width="100%" border="0" align="center" cellpadding="3" cellspacing="0" height="361">
          <tr> 
            <td colspan="3" class="largeHeading" height="1"><div align="center"></div></td>
          </tr>
          <tr> 
            <td width="20%" class="largeHeading" height="22"> First Name:</td>
            <td colspan="2" class="normalText" height="22"> <input type="text" name="firstName" size="20" value="<%=client.getFirstName()%>"></td>
          </tr>
          <tr> 
            <td width="20%" class="largeHeading" height="22">Last Name:</td>
            <td colspan="2" class="normalText" height="22"> <input type="text" name="lastName" size="20" value="<%=client.getLastName()%>"></td>
          </tr>
          <tr> 
            <td width="20%" class="largeHeading" height="22">Birth Date:</td>

            <td colspan="2" class="normalText" height="22">Day: 
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
              <input name="year" type="text" size="4" maxlength="4" value="<%=Iyear%>"></td>
          </tr>
          <tr> 
            <td width="20%" class="largeHeading" height="20">Sex:</td>
            <td colspan="2" class="normalText" height="20"> 
            <input type="radio" name="gender" value="male" <%=( (client.getMale()) ?"checked" :"")%>>
              Male 
              <input type="radio" name="gender" value="female" <%=( (!client.getMale()) ?"checked" :"")%>>
              Female </td>
          </tr>
          <tr> 
            <td width="20%" class="largeHeading" height="28">Address:</td>
            <td colspan="2" class="normalText" height="22">Street: 
              <input name="addr1" type="text" size="35" value="<%=client.getAddress1()%>"></td>
          </tr>
          <tr>
            <td width="20%" class="largeHeading" height="17">&nbsp;</td>
            <td colspan="2" class="normalText" height="17">Street: 
              <input name="addr2" type="text" size="35" value="<%=client.getAddress2()%>"></td>
          </tr>
          <tr> 
            <td width="20%" rowspan="2" class="largeHeading" height="50">&nbsp;</td>
            <td colspan="2" class="normalText" height="22">City: 
              <input name="city" type="text" size="37" value="<%=client.getCity()%>"></td>
          </tr>
          <tr> 
            <td width="36%" class="normalText" height="22">State: 
              <input name="state" type="text" size="2" maxlength="2" value="<%=client.getState()%>"> 
            </td>
            <td width="43%" class="normalText" height="22">Zip: 
              <input name="zip" type="text" size="5" maxlength="5" value="<%=client.getZipCode()%>"> 
            </td>
          </tr>
          <tr> 
            <td width="20%" class="largeHeading" height="22">Phone:</td>
            <td colspan="2" class="normalText" height="22"> <input type="text" name="phoneHome" size="20" value="<%=client.getPhoneHome()%>"></td>
          </tr>
          <tr> 
            <td width="20%" class="largeHeading" height="16">Mobile:</td>
            <td colspan="2" class="normalText" height="16"> <input type="text" name="phoneMobile" size="20" value="<%=client.getPhoneMobile()%>"></td>
          </tr>
          <tr> 
            <td width="20%" class="largeHeading" height="22">E-Mail:</td>
            <td colspan="2" class="normalText" height="22"> <input type="text" name="email" size="20" value="<%=client.getEmail()%>"></td>
          </tr>
          <tr> 
            <td colspan="3" class="largeHeading" height="26"><div align="right"> 
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