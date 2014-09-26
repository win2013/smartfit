<%@include file="imports.jsp"%>
<%
    Client client = (Client)session.getAttribute("client");
    String contractID = request.getParameter("contractID");
    int id = Integer.parseInt(contractID);
    Contract contract = client.getContract(id);
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Untitled Document</title>
<script>
function updateEntry(value) {
    window.location = 'member_contracts_detail.jsp?action=updateTrainerPaidEntry&' + value;
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
<form name="form1" method="post" action="">
  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="boxBorder">
    <tr>
            <td><table width="100%" border="0" cellpadding="2" cellspacing="0" align="center" class="tableTop">
                <tr> 
                  
            <td bgcolor="#99CCFF" class="largeHeading"> 
              <div align="center">Payment Details for Client <%=client.getFirstName() + " " + client.getLastName()%> 
                on Contract created on <%=SMUtils.parseDateAndTime(contract.getStartDate())%></div></td>
                </tr>
              </table>
              
        <table width="100%" border="0" cellpadding="2" cellspacing="0" class="tableTop" height="39">
          <tr> 
            <td width="100%" class="largeHeading" height="31">Make payment for 
            Contact:<p>&nbsp;</td>
          </tr>
          </table>
        <table width="100%" border="0" cellpadding="2" cellspacing="0">
<%
	Enumeration enum = contract.getPayments().elements();
	int count = 0;
	while (enum.hasMoreElements()) {
		Payment payment = (Payment)enum.nextElement();%>
		<tr bgcolor="<%=( (count++%2==0) ?"#C7E1E9" :"#FFFFFF")%>" class="normalText"> 
		<td>Amount:  <%=payment.getAmount()%><br>
		Date:  <%=SMUtils.parseDateAndTime(payment.getDate())%><br>
		Description:  <%=payment.getDescription()%><br>
		</td>
        </tr><%	
	}
%>
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