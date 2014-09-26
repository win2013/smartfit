<%@include file="imports.jsp"%>
<%
    Client client = (Client)session.getAttribute("client");
    GregorianCalendar currentDate = new GregorianCalendar();
    int year = currentDate.get(Calendar.YEAR);
    int month = currentDate.get(Calendar.MONTH);
    int day = currentDate.get(Calendar.DAY_OF_MONTH);

    currentDate.setTimeInMillis(currentDate.getTimeInMillis() - 31l*24l*60l*60l*1000l);
    int startYear = currentDate.get(Calendar.YEAR);
    int startMonth = currentDate.get(Calendar.MONTH);
    int startDay = currentDate.get(Calendar.DAY_OF_MONTH);
%>
<%
	String contractState = request.getParameter("contractState");
	if (contractState == null)
		contractState = "All";
%>
<%
	Vector contracts = new Vector();
	if (contractState.equals("All")) {
		contracts = client.getContracts();
	}
	else
	{
		Enumeration enum = client.getContracts().elements();
		while (enum.hasMoreElements()) {
			Contract contract = (Contract)enum.nextElement();
			if ( (contractState.equals("Pending")) && (!contract.getApproved()) ) {
				contracts.add(contract);
				continue;
			}
			if ( (contractState.equals("Inactive")) && (!contract.getActive()) ) {
				contracts.add(contract);
				continue;
			}
			if ( (contractState.equals("Active")) && (contract.getActive()) ) {
				contracts.add(contract);
				continue;
			}
		}
	}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Untitled Document</title>
<script>
function refresh() {
	window.location = 'clients_contractsMain.jsp?contractState=' + mainForm.contractState.value;
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="../adminModule/admin.css" rel="stylesheet" type="text/css">
<style type="text/css">
A:link {text-decoration: none}
A:visited {text-decoration: none}
A:active {text-decoration: none}
A:hover {text-decoration: underline; color: #000099;}
</style>
</head>

<body bgcolor="#ffffff" link="#3333CC" vlink="#3333CC" alink="#0099FF" >
<form name="mainForm" method="post" action="../adminModule/routeStatsOptions.jsp">
  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="boxBorder">
    <tr>
            <td><table width="100%" border="0" cellpadding="2" cellspacing="0" align="center" class="tableTop">
                <tr> 
                  
            <td bgcolor="#FFCC66" class="largeHeading"> 
              <div align="center">Contracts for <%=client.getFirstName() + " " + client.getLastName()%></div></td>
                </tr>
              </table>
              
        <table width="100%" border="0" cellpadding="2" cellspacing="0" class="tableTop">
          <tr>
            <td class="largeHeading">Show: 
              <select name="contractState" onchange="javascript:refresh()">
                <option value="All" <%=( (contractState.equals("All")) ?"selected" :"")%>>All Contracts</option>
                <option value="Active" <%=( (contractState.equals("Active")) ?"selected" :"")%>>Active Contracts</option>
                <option value="Inactive" <%=( (contractState.equals("Inactive")) ?"selected" :"")%>>Finished / Inactive Contracts</option>
                <option value="Pending" <%=( (contractState.equals("Pending")) ?"selected" :"")%>>Pending</option>
              </select></td>
          </tr>
        </table>
        <table width="100%" border="0" align="center" class="tableTop">
          <tr> 
            <td width="33%" class="largeHeading">Purchase Date</td>
            <td width="34%" class="largeHeading">Slots Remaing / Total</td>
            <td width="33%" class="largeHeading">Slots Paid For / Total</td>
          </tr>
        </table>
        <table width="100%" border="0" cellpadding="2" cellspacing="0">
<%
	Enumeration enum = contracts.elements();
	int count = 0;
	while (enum.hasMoreElements()) {
		Contract contract = (Contract)enum.nextElement();
	    float total = contract.getPrice();
    	float paid = 0;
    
	    Enumeration enum2 = contract.getPayments().elements();
	    while (enum2.hasMoreElements()) {
	        Payment payment = (Payment)enum2.nextElement();
    	    paid += payment.getAmount();
	    }
	    int sessionsPaidFor = (int)Math.floor((double)(paid*(float)contract.getNumberOfSessions()/contract.getPrice()));
%>
          <tr class="normalText" bgcolor="#<%=( (count++%2==0) ?"C7E1E9" :"FFFFFF")%>"> 
            <td width="33%"><a href="contracts_detail.jsp?contractID=<%=contract.getID()%>"><%=SMUtils.parseDateAndTime(contract.getStartDate())%></a></td>
            <td width="34%"><%=contract.getNumberOfSessions()-contract.getContractEntrys().size()%>/<%=contract.getNumberOfSessions()%></td>
            <td width="33%"><%=sessionsPaidFor%>/<%=contract.getNumberOfSessions()%></td>
          </tr>
		
<%				
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