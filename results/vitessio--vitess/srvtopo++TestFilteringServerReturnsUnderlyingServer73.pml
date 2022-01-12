// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/vitessio/vitess/blob//go/vt/srvtopo/keyspace_filtering_server_test.go#L73
typedef Mutexdef {
	chan Lock = [0] of {bool};
	chan Unlock = [0] of {bool};
	chan RLock = [0] of {bool};
	chan RUnlock = [0] of {bool};
	int Counter = 0;}



init { 
	chan child_TestFilteringServerReturnsUnderlyingServer730 = [1] of {int};
	run TestFilteringServerReturnsUnderlyingServer73(child_TestFilteringServerReturnsUnderlyingServer730);
	run receiver(child_TestFilteringServerReturnsUnderlyingServer730)
stop_process:skip
}

proctype TestFilteringServerReturnsUnderlyingServer73(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	Mutexdef got_mu;
	Mutexdef __WatchedSrvVSchema_state_atomicMessageInfo_initMu;
	Mutexdef __SrvKeyspace_state_atomicMessageInfo_initMu;
	Mutexdef __TopoServer_mu;
	Mutexdef __mu;
	run mutexMonitor(__mu);
	run mutexMonitor(__TopoServer_mu);
	run mutexMonitor(__SrvKeyspace_state_atomicMessageInfo_initMu);
	run mutexMonitor(__WatchedSrvVSchema_state_atomicMessageInfo_initMu);
	run mutexMonitor(got_mu);
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

