// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/istio/istio/blob/9a5df21188426a6a7dd7d7503e01330a79db8a48/security/pkg/testing/sdsc/sdsclient.go#L66
typedef Mutexdef {
	chan Lock = [0] of {bool};
	chan Unlock = [0] of {bool};
	chan RLock = [0] of {bool};
	chan RUnlock = [0] of {bool};
	int Counter = 0;}



init { 
	chan child_NewClient660 = [1] of {int};
	run NewClient66(child_NewClient660);
	run receiver(child_NewClient660)
stop_process:skip
}

proctype NewClient66(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	Mutexdef conn_lceMu;
	Mutexdef conn_balancerWrapper_mu;
	Mutexdef conn_balancerWrapper_balancerMu;
	Mutexdef conn_resolverWrapper_pollingMu;
	Mutexdef conn_resolverWrapper_resolverMu;
	Mutexdef conn_mu;
	Mutexdef conn_safeConfigSelector_mu;
	Mutexdef conn_blockingpicker_mu;
	Mutexdef conn_csMgr_mu;
	run mutexMonitor(conn_csMgr_mu);
	run mutexMonitor(conn_blockingpicker_mu);
	run mutexMonitor(conn_safeConfigSelector_mu);
	run mutexMonitor(conn_mu);
	run mutexMonitor(conn_resolverWrapper_resolverMu);
	run mutexMonitor(conn_resolverWrapper_pollingMu);
	run mutexMonitor(conn_balancerWrapper_balancerMu);
	run mutexMonitor(conn_balancerWrapper_mu);
	run mutexMonitor(conn_lceMu);
	

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

