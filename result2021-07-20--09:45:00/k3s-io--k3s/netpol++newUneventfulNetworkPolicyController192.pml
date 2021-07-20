// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/k3s-io/k3s/blob/64577a070d70654125bd2af0069e49eaa10f284f/pkg/agent/netpol/network_policy_controller_test.go#L192
typedef Mutexdef {
	chan Lock = [0] of {bool};
	chan Unlock = [0] of {bool};
	chan RLock = [0] of {bool};
	chan RUnlock = [0] of {bool};
	int Counter = 0;}



init { 
	chan child_newUneventfulNetworkPolicyController1920 = [1] of {int};
	run newUneventfulNetworkPolicyController192(child_newUneventfulNetworkPolicyController1920);
	run receiver(child_newUneventfulNetworkPolicyController1920)
stop_process:skip
}

proctype newUneventfulNetworkPolicyController192(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	Mutexdef npc_mu;
	run mutexMonitor(npc_mu);
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

