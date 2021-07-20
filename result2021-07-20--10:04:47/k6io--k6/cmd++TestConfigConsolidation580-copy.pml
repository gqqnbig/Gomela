// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/k6io/k6/blob/af1e032ebf949cde092d4a2eddb78528ea0a5864/cmd/config_consolidation_test.go#L580
typedef Mutexdef {
	chan Lock = [0] of {bool};
	chan Unlock = [0] of {bool};
	chan RLock = [0] of {bool};
	chan RUnlock = [0] of {bool};
	int Counter = 0;}



init { 
	chan child_TestConfigConsolidation5800 = [1] of {int};
	run TestConfigConsolidation580(child_TestConfigConsolidation5800);
	run receiver(child_TestConfigConsolidation5800)
stop_process:skip
}

proctype TestConfigConsolidation580(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	Mutexdef logHook_mutex;
	int var_flagSetInitsflagSetInits = -2; // opt var_flagSetInitsflagSetInits
	int var_getConfigConsolidationTestCases__getConfigConsolidationTestCases__ = -2; // opt var_getConfigConsolidationTestCases__getConfigConsolidationTestCases__
	run mutexMonitor(logHook_mutex);
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

