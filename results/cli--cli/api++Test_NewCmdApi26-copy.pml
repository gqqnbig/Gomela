// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/cli/cli/blob//pkg/cmd/api/api_test.go#L26
typedef Mutexdef {
	chan Lock = [0] of {bool};
	chan Unlock = [0] of {bool};
	chan RLock = [0] of {bool};
	chan RUnlock = [0] of {bool};
	int Counter = 0;}



init { 
	chan child_Test_NewCmdApi260 = [1] of {int};
	run Test_NewCmdApi26(child_Test_NewCmdApi260);
	run receiver(child_Test_NewCmdApi260)
stop_process:skip
}

proctype Test_NewCmdApi26(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	Mutexdef f_IOStreams_pagerProcess_sigMu;
	Mutexdef f_IOStreams_progressIndicator_mu;
	int var_tests = -2; // opt var_tests
	run mutexMonitor(f_IOStreams_progressIndicator_mu);
	run mutexMonitor(f_IOStreams_pagerProcess_sigMu);
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

