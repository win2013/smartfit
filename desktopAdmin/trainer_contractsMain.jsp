<%@include file="imports.jsp"%>
<%
    GregorianCalendar startDate = (GregorianCalendar)session.getAttribute("startDate");
    GregorianCalendar endDate = (GregorianCalendar)session.getAttribute("endDate");
    long startTime = startDate.getTimeInMillis();
    long endTime = endDate.getTimeInMillis() + 24l*60l*60l*1000l - 1l;
%>
<%
    Trainer trainer = (Trainer)session.getAttribute("trainer");

    String contractState = request.getParameter("contractState");
    if (contractState == null)
        contractState = "all";
    
    Vector contracts = trainer.getContracts();
    Vector temp = new Vector();
    //Filter contract dates
    Enumeration enum = contracts.elements();
    while (enum.hasMoreElements()) {
        Contract contract = (Contract)enum.nextElement();
        if ( (contract.getStartDate() > startTime) && (contract.getStartDate() < endTime) )
            temp.add(contract);
        contracts = temp;
    }
    //Filter Contract States
    int state = 0;
    if (contractState.equals("inactive"))
        state = 1;
    else if (contractState.equals("active"))
        state = 2;
    if (state != 0) {
        enum = contracts.elements();
        temp = new Vector();
        while (enum.hasMoreElements()) {
            Contract contract = (Contract)enum.nextElement();
            if ( (state == 1) && (!contract.getActive()) )
                temp.add(contract);
            else if ( (state == 2) && (contract.getActive()) )
                temp.add(contract);
        }
        contracts = temp;
    }
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Untitled Document</title>
<script>
function refresh() {
    window.location = 'trainer_contractsMain.jsp?contractState=' + mainForm.contractState.value;
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
<form name="mainForm" method="post" action="routeStatsOptions.jsp">
  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="boxBorder">
    <tr>
            <td><table width="100%" border="0" cellpadding="2" cellspacing="0" align="center" class="tableTop">
                <tr> 
                  <td bgcolor="#99CCFF" class="largeHeading">
<div align="center">Contracts for Trainer <%=trainer.getFirstName() + " " + trainer.getLastName()%> between <%=SMUtils.parseDate(startTime)%> 
                and <%=SMUtils.parseDate(endTime)%>
              </div></td>
                </tr>
              </table>
              
        <table width="100%" border="0" cellpadding="2" cellspacing="0" class="tableTop">
          <tr> 
            <td width="50%" class="largeHeading"> Revenues From Contracts: </td>
            <td class="largeHeading">New Contracts:</td>
          </tr>
          <tr> 
            <td colspan="2" class="largeHeading">Show: 
              <select name="contractState" onchange="javascript:refresh()">
                <option value="all" <%=( (contractState.equals("all")) ?"selected" :"")%>>All 
                Contracts</option>
                <option value="active" <%=( (contractState.equals("active")) ?"selected" :"")%>>Active 
                Contracts</option>
                <option value="inactive" <%=( (contractState.equals("inactive")) ?"selected" :"")%>>Finished 
                / Inactive Contracts</option>
              </select></td>
          </tr>
        </table>
        <table width="100%" border="0" align="center" class="tableTop">
          <tr> 
            <td width="50%" class="largeHeading">Contracts By Client</td>
            <td width="50%" class="largeHeading">Purchase Date</td>
          </tr>
        </table>
        <table width="100%" border="0" cellpadding="2" cellspacing="0">
<%
    enum = contracts.elements();
    int count = 0;
    while (enum.hasMoreElements()) {
        Contract contract = (Contract)enum.nextElement();
        Client client = contract.getClient();%>
          <tr bgcolor="<%=( (count++%2 == 0) ?"#C7E1E9" :"#FFFFFF")%>"class="normalText"> 
            <td ><%=client.getFirstName() + " " + client.getLastName()%></td>
            <td width="50%"><a href="trainer_contracts_detail.jsp?contractID=<%=contract.getID()%>"><%=SMUtils.parseDateAndTime(contract.getStartDate())%></a></td>
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