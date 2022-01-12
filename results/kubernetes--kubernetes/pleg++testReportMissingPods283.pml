// num_comm_params=1
// num_mand_comm_params=1
// num_opt_comm_params=0

// git_link=https://github.com/kubernetes/kubernetes/blob//pkg/kubelet/pleg/generic_test.go#L283
#define def_var_numRelists  ?? // mand numRelists line 283
typedef Mutexdef {
	chan Lock = [0] of {bool};
	chan Unlock = [0] of {bool};
	chan RLock = [0] of {bool};
	chan RUnlock = [0] of {bool};
	int Counter = 0;}



init { 
	chan child_testReportMissingPods2830 = [1] of {int};
	run testReportMissingPods283(def_var_numRelists,child_testReportMissingPods2830);
	run receiver(child_testReportMissingPods2830)
stop_process:skip
}

proctype testReportMissingPods283(int var_numRelists;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	Mutexdef runtime_T_context_mu;
	Mutexdef runtime_T_context_match_mu;
	Mutexdef testPleg_runtime_T_context_mu;
	run mutexMonitor(testPleg_runtime_T_context_mu);
	run mutexMonitor(runtime_T_context_match_mu);
	run mutexMonitor(runtime_T_context_mu);
	for10_exit: skip;
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

