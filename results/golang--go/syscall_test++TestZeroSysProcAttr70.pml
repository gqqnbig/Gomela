// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/golang/go/blob//syscall/exec_unix_test.go#L70
typedef Mutexdef {
	chan Lock = [0] of {bool};
	chan Unlock = [0] of {bool};
	chan RLock = [0] of {bool};
	chan RUnlock = [0] of {bool};
	int Counter = 0;}



init { 
	chan child_TestZeroSysProcAttr700 = [1] of {int};
	run TestZeroSysProcAttr70(child_TestZeroSysProcAttr700);
	run receiver(child_TestZeroSysProcAttr700)
stop_process:skip
}

proctype TestZeroSysProcAttr70(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_Stop471 = [1] of {int};
	chan child_Info302 = [1] of {int};
	chan child_Start410 = [1] of {int};
	Mutexdef cmd_test_context_mu;
	Mutexdef cmd_test_context_match_mu;
	Mutexdef cmd_proc_Process_sigMu;
	run mutexMonitor(cmd_proc_Process_sigMu);
	run mutexMonitor(cmd_test_context_match_mu);
	run mutexMonitor(cmd_test_context_mu);
	run Start41(cmd_proc_Process_sigMu,cmd_test_context_match_mu,cmd_test_context_mu,child_Start410);
	child_Start410?0;
	run Info30(cmd_proc_Process_sigMu,cmd_test_context_match_mu,cmd_test_context_mu,child_Info302);
	child_Info302?0;
		defer1: skip;
	run Stop47(cmd_proc_Process_sigMu,cmd_test_context_match_mu,cmd_test_context_mu,child_Stop471);
	child_Stop471?0;
	stop_process: skip;
	child!0
}
proctype Start41(Mutexdef c_proc_Process_sigMu;Mutexdef c_test_context_match_mu;Mutexdef c_test_context_mu;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	stop_process: skip;
	child!0
}
proctype Stop47(Mutexdef c_proc_Process_sigMu;Mutexdef c_test_context_match_mu;Mutexdef c_test_context_mu;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	stop_process: skip;
	child!0
}
proctype Info30(Mutexdef c_proc_Process_sigMu;Mutexdef c_test_context_match_mu;Mutexdef c_test_context_mu;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	goto stop_process;
	stop_process: skip;
	child!0
}

 /* ================================================================================== */
 /* ================================================================================== */
 /* ================================================================================== */ 
proctype mutexMonitor(Mutexdef m) {
bool locked = false;
do
:: true ->
	if
	:: m.Counter > 0 ->
		if 
		:: m.RUnlock?false -> 
			m.Counter = m.Counter - 1;
		:: m.RLock?false -> 
			m.Counter = m.Counter + 1;
		fi;
	:: locked ->
		m.Unlock?false;
		locked = false;
	:: else ->	 end:	if
		:: m.Unlock?false ->
			assert(0==32);		:: m.Lock?false ->
			locked =true;
		:: m.RUnlock?false ->
			assert(0==32);		:: m.RLock?false ->
			m.Counter = m.Counter + 1;
		fi;
	fi;
od
}

proctype receiver(chan c) {
c?0
}

