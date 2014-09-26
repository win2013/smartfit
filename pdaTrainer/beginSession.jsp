<%@page contentType="text/html"%>
<%@include file="imports.jsp"%>
<%@include file="init.jsp"%>
<%
//Last Exercises
//    session.removeAttribute("lastExerciseTable");
    {        
        System.out.println("a");
        Hashtable table = (Hashtable)session.getAttribute("lastExerciseTable");
        System.out.println("a" + table);
        if (table == null) {
            table = new Hashtable();
            Enumeration enum = client.getWorkoutSessions().elements();
            while (enum.hasMoreElements()) {
                WorkoutSession ws = (WorkoutSession)enum.nextElement();
                Enumeration enum2 = ws.getRoutines().elements();
                while (enum2.hasMoreElements()) {
                    Enumeration enum3 = ((Routine)enum2.nextElement()).getExercises().elements();
                    while (enum3.hasMoreElements()) {
                        Exercise l_exercise = (Exercise)enum3.nextElement();
                        WorkoutSession temp = (WorkoutSession)table.get(l_exercise.getName());
                        if (temp == null)
                            table.put(l_exercise.getName(), ws);
                        else
                            if (temp.getStartTime() < ws.getStartTime())
                                table.put(l_exercise.getName(), ws);
                    }
                }
            }
            enum = table.keys();
            while (enum.hasMoreElements())
                System.out.println(enum.nextElement());            
            session.setAttribute("lastExerciseTable", table);
        }
    }
%>
<%
    String useOtherTrainer = request.getParameter("useOtherTrainer");
    if (useOtherTrainer == null)
        useOtherTrainer = "";
    //get active contracts
    Enumeration enum = client.getContracts().elements();
    Vector activeContracts = new Vector();
    while (enum.hasMoreElements()) {
        Contract contract = (Contract)enum.nextElement();
        if (contract.getActive())
        	if (contract.getApproved())
	            activeContracts.add(contract);
    }
    //no active contracts
    if (activeContracts.size() == 0) {
        response.sendRedirect("warning_noContract.jsp");
        return;
    }
    //filter out contracts for trainer
    Vector thisTrainer = new Vector();
    Vector otherTrainer = new Vector();
    enum = activeContracts.elements();
    while (enum.hasMoreElements()) {
        Contract contract = (Contract)enum.nextElement();
        if (contract.getTrainer().getID() == trainer.getID())
            thisTrainer.add(contract);
        else
            otherTrainer.add(contract);
    }
    if (thisTrainer.size() == 0) {
        if (useOtherTrainer.equals("OK")) {
            thisTrainer = otherTrainer;
        } else
        {
            response.sendRedirect("warning_noContractWithTrainer.jsp");
            return;
        }
    }
    //check for unsigned
    enum = thisTrainer.elements();
    while (enum.hasMoreElements()) {
        Contract contract = (Contract)enum.nextElement();
        Enumeration enum2 = contract.getContractEntrys().elements();
        while (enum2.hasMoreElements()) {
            ContractEntry entry = (ContractEntry)enum2.nextElement();
            WorkoutSession ws = (WorkoutSession)entry.getWorkoutSession();
            if (ws != null) {
                if (ws.getSignature() == null) {
                    response.sendRedirect("warning_notClosed.jsp?workoutSessionID=" + ws.getID() + "&contractID=" + contract.getID());
                    return;
                }
            }
        }
    }
    //get current contract to use
    enum = thisTrainer.elements();
    int max = -10;
    Contract contractToUse = null;
    while (enum.hasMoreElements()) {
        Contract contract = (Contract)enum.nextElement();
        if (contract.getContractEntrys().size() > max)
            contractToUse = contract;
    }

    if (contractToUse == null)
        out.println("Error - null contract to use..>");
    else {
        if (contractToUse.getContractEntrys().size() + 1 > contractToUse.getNumberOfSessions()) {
            contractToUse.setActive(false);
            response.sendRedirect("beginSession.jsp");
            return;
        }
        
        float totalPaid = 0;
        enum = contractToUse.getPayments().elements();
        while (enum.hasMoreElements()) {
            Payment payment = (Payment)enum.nextElement();
            totalPaid += payment.getAmount();
        }
        int paidSessions = (int)((float)contractToUse.getNumberOfSessions()*(totalPaid/contractToUse.getPrice()));
        if ( (contractToUse.getContractEntrys().size() + 1) > paidSessions) {
            response.sendRedirect("warning_noPay.jsp?contractID=" + contractToUse.getID());
            return;
        }
        
        WorkoutSession ws = db.createWorkoutSession();
        ws.setTrainer(trainer);
        ws.setStartTime(System.currentTimeMillis());
        ws.setContract(contractToUse);
	client.addWorkoutSession(ws);
        ContractEntry contractEntry = db.createContractEntry();
        contractEntry.setWorkoutSession(ws);
        contractEntry.setTrainerPaid(false);
        contractEntry.setSessionNumber(contractToUse.getContractEntrys().size() + 1);
        contractToUse.addContractEntry(contractEntry);
        session.setAttribute("workoutSession", ws);
        session.setAttribute("contract", contractToUse);
        response.sendRedirect("trackPerform01.jsp");
        return;
    }
%>