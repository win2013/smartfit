<%@include file="imports.jsp"%>
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
            <td bgcolor="#99CCFF" class="largeHeading"> <div align="center">Profile 
                for &lt;staffName&gt;</div></td>
          </tr>
        </table>
        <table width="100%" border="0" align="center" cellpadding="3" cellspacing="0">
          <tr> 
            <td colspan="3" class="largeHeading"><div align="center"></div></td>
          </tr>
          <tr> 
            <td width="21%" class="largeHeading"> First Name:</td>
            <td colspan="2" class="normalText"> <input type="text" name="textfield"></td>
          </tr>
          <tr> 
            <td class="largeHeading">Last Name:</td>
            <td colspan="2" class="normalText"><input type="text" name="textfield13"></td>
          </tr>
          <tr> 
            <td class="largeHeading">Birth Date:</td>
            <td colspan="2" class="normalText">Day: 
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
            <td class="largeHeading">Sex:</td>
            <td colspan="2" class="normalText"><input type="radio" name="radiobutton" value="male" <%=( (client.getMale()) ?"checked" :"")%>>
              Male 
              <input type="radio" name="radiobutton" value="female" <%=( (!client.getMale()) ?"checked" :"")%>>
              Female </td>
          </tr>
          <tr> 
            <td class="largeHeading">Position:</td>
            <td colspan="2" class="normalText"><input type="text" name="textfield12"></td>
          </tr>
          <tr> 
            <td class="largeHeading">Address:</td>
            <td colspan="2" class="normalText">Street 1: 
              <input name="textfield2" type="text" size="35"></td>
          </tr>
          <tr> 
            <td rowspan="3" class="largeHeading">&nbsp;</td>
            <td colspan="2" class="normalText">Street 2: 
              <input name="textfield22" type="text" size="35"></td>
          </tr>
          <tr> 
            <td colspan="2" class="normalText">City: 
              <input name="textfield3" type="text" size="37"></td>
          </tr>
          <tr> 
            <td width="36%" class="normalText">State: 
              <input name="textfield4" type="text" size="2" maxlength="2"> </td>
            <td width="43%" class="normalText">Zip: 
              <input name="textfield5" type="text" size="5" maxlength="5">
            </td>
          </tr>
          <tr> 
            <td class="largeHeading">&nbsp;</td>
            <td colspan="2" class="normalText">Country: 
              <input type="text" name="textfield7"></td>
          </tr>
          <tr> 
            <td class="largeHeading">Phone:</td>
            <td colspan="2" class="normalText"><input type="text" name="textfield8"></td>
          </tr>
          <tr> 
            <td class="largeHeading">Mobile:</td>
            <td colspan="2" class="normalText"><input type="text" name="textfield11"></td>
          </tr>
          <tr> 
            <td class="largeHeading">Fax:</td>
            <td colspan="2" class="normalText"><input type="text" name="textfield9"></td>
          </tr>
          <tr> 
            <td class="largeHeading">E-Mail:</td>
            <td colspan="2" class="normalText"><input type="text" name="textfield10"></td>
          </tr>
          <tr> 
            <td class="largeHeading">Other:</td>
            <td colspan="2" class="normalText">something</td>
          </tr>
          <tr> 
            <td colspan="3" class="largeHeading"><div align="right"> 
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
