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
  <table width="400" border="0" align="center" cellpadding="0" cellspacing="0" class="boxBorder">
    <tr>
            <td><table width="100%" border="0" cellpadding="2" cellspacing="0" align="center" class="tableTop">
                <tr> 
                  <td bgcolor="#99CCFF" class="largeHeading">
<div align="center">Report View Method</div></td>
                </tr>
              </table>
              <table width="100%" border="0" align="center">
                <tr> 
                  <td width="45%" class="largeHeading"><div align="center"> </div>
                    <div align="left">Start Date</div></td>
                  <td colspan="4" class="largeHeading">&nbsp;</td>
                </tr>
                <tr class="largeHeading"> 
                  <td> <select name="select">
                      <option selected>January</option>
                      <option>February</option>
                      <option>March</option>
                      <option>April</option>
                      <option>May</option>
                      <option>June</option>
                      <option>July</option>
                      <option>August</option>
                      <option>September</option>
                      <option>October</option>
                      <option>November</option>
                      <option>December</option>
                    </select></td>
                  <td width="7%">Day</td>
                  <td width="16%"> <input name="textfield" type="text" size="2" maxlength="2"></td>
                  <td width="10%">Year</td>
                  <td width="22%"> <input name="textfield2" type="text" size="4" maxlength="4"></td>
                </tr>
                <tr> 
                  <td class="largeHeading">End Date</td>
                  <td colspan="4" class="largeHeading">&nbsp;</td>
                </tr>
                <tr class="largeHeading"> 
                  <td> <select name="select">
                      <option selected>January</option>
                      <option>February</option>
                      <option>March</option>
                      <option>April</option>
                      <option>May</option>
                      <option>June</option>
                      <option>July</option>
                      <option>August</option>
                      <option>September</option>
                      <option>October</option>
                      <option>November</option>
                      <option>December</option>
                    </select></td>
                  <td>Day</td>
                  <td> <input name="textfield" type="text" size="2" maxlength="2"></td>
                  <td>Year</td>
                  <td> <input name="textfield2" type="text" size="4" maxlength="4"></td>
                </tr>
              </table>
              <table width="100%" border="0" cellpadding="2" cellspacing="0" class="dividerCell">
                <tr>
                  <td class="largeHeading"> 
                    <div align="center">View By</div></td>
                </tr>
              </table>
              <table width="100%" border="0">
                <tr class="largeHeading"> 
                  <td> 
                    <p class="largeHeading"> 
                      <input name="radiobutton" type="radio" value="radiobutton" checked>
                      Date<br>
                      <input type="radio" name="radiobutton" value="radiobutton">
                      Exercise<br>
                    </p></td>
                  <td> 
                    <input type="radio" name="radiobutton" value="radiobutton">
              <a href="report_byRoutine.jsp">Routine</a> <br> <input type="radio" name="radiobutton" value="radiobutton">
                    Trainer </td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                  <td align="right" valign="bottom"><input type="submit" name="Submit" value="Submit"></td>
                </tr>
              </table> </td>
          </tr>
        </table>
        </form>
</body>
</html>
