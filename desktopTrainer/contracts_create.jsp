<%@include file="imports.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
	Client client = (Client)session.getAttribute("client");
	
	String action = request.getParameter("action");
	if (action == null)
		action = "";
		
	if (action.equals("Submit")) {
		String slots = request.getParameter("slots");
		String price = request.getParameter("price");
		String time = request.getParameter("time");
		String trainerID = request.getParameter("trainerID");
		
		response.sendRedirect("contracts_create_confirm.jsp?slots=" + slots + "&time=" + time + "&price=" + price + "&trainerID=" + trainerID);
		return;
	}
	if (action.equals("create")) {
		Enumeration enum = club.getContractTerms().elements();
		ContractTerm contractRules = null;
		ContractTerm contractWaiver = null;
		while (enum.hasMoreElements()) {
			ContractTerm term = (ContractTerm)enum.nextElement();
			if (term.getActive()) {
	    		if (term.getType().equals("PT Contract Waiver"))
					contractWaiver = term;
				if (term.getType().equals("PT Contract Rules"))
				    contractRules = term;
			}
		}
	
		int slots = Integer.parseInt(request.getParameter("slots"));
		float price = Float.parseFloat(request.getParameter("price"));
		int time = Integer.parseInt(request.getParameter("time"));
		
		Contract contract = db.createContract();
		contract.setClient(client);
		contract.setTrainer(trainer);
		contract.setTimePerSession(time);
		contract.setStartDate(System.currentTimeMillis());
		contract.setActive(true);
		contract.setPrice(price);
		contract.setNumberOfSessions(slots);
		contract.setApproved(false);
		contract.addTerm(contractRules);
		contract.addTerm(contractWaiver);
		trainer.addContract(contract);
		client.addContract(contract);
		//ADD SIGNATURE
		response.sendRedirect("clients_main.jsp");
		return;
	}
%>
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
            <td bgcolor="#99CCFF" class="largeHeading"> <div align="center">Create 
                a Contract for Client <%=client.getFirstName() + " " + client.getLastName()%>
				</div>
              <div align="center"></div></td>
                </tr>
              </table>
              
        <table width="100%" border="0" align="center">
          <tr> 
            <td width="36%" class="largeHeading"><p>Enter Total Number of Slots</p></td>
            <td width="27%" class="largeHeading">
            <input name="slots" type="text" size="2" maxlength="2"></td>
            <td width="37%" class="largeHeading">
            <p align="center">&nbsp;</td>
          </tr>
          <tr> 
            <td class="largeHeading">Enter Total Price</td>
            <td class="largeHeading">
            <input name="price" type="text" size="8" maxlength="8"></td>
            <td rowspan="3" class="largeHeading">
            <p align="center">&nbsp;</td>
          </tr>
          <tr> 
            <td class="largeHeading">Choose Session Length</td>
            <td class="largeHeading"><select name="time">
            <option value="15">15 min</option>
            <option value="30">30 min</option>
            <option value="45">45 min</option>
            <option value="60">60 min</option>
            <option value="75">75 min</option>
            <option value="90">90 min</option>
            <option value="105">105 min</option>
            <option value="120">120 min</option>
            </select></td>
          </tr>
          <tr> 
            <td class="largeHeading">&nbsp;</td>
            <td class="largeHeading">&nbsp;</td>
          </tr>
        </table>
              
        <table width="100%" border="0" cellpadding="2" cellspacing="0" class="dashedOnTop">
          <tr> 
            <td> <div align="left"> </div></td>
            <td><div align="right">
                <input type="submit" name="action" value="Submit">
              </div></td>
          </tr>
        </table> </td>
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