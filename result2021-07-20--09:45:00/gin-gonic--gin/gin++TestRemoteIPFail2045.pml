// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/gin-gonic/gin/blob/5452a1d3ef0982ffea95fb9e88e5425b0928c431/context_test.go#L2045
typedef Mutexdef {
	chan Lock = [0] of {bool};
	chan Unlock = [0] of {bool};
	chan RLock = [0] of {bool};
	chan RUnlock = [0] of {bool};
	int Counter = 0;}



init { 
	chan child_TestRemoteIPFail20450 = [1] of {int};
	run TestRemoteIPFail2045(child_TestRemoteIPFail20450);
	run receiver(child_TestRemoteIPFail20450)
stop_process:skip
}

proctype TestRemoteIPFail2045(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_RemoteIP7600 = [1] of {int};
	Mutexdef c_mu;
	run mutexMonitor(c_mu);
	run RemoteIP760(c_mu,child_RemoteIP7600);
	child_RemoteIP7600?0;
	stop_process: skip;
	child!0
}
proctype RemoteIP760(Mutexdef c_mu;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	int var_c_engine_trustedCIDRsc_engine_trustedCIDRs = -2; // opt var_c_engine_trustedCIDRsc_engine_trustedCIDRs
	

	if
	:: true -> 
		goto stop_process
	:: true;
	fi;
	

	if
	:: true -> 
		goto stop_process
	:: true;
	fi;
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

