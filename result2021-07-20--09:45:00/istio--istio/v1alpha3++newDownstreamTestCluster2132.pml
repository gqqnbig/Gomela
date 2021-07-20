// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/istio/istio/blob/9a5df21188426a6a7dd7d7503e01330a79db8a48/pilot/pkg/networking/core/v1alpha3/cluster_builder_test.go#L2132
typedef Mutexdef {
	chan Lock = [0] of {bool};
	chan Unlock = [0] of {bool};
	chan RLock = [0] of {bool};
	chan RUnlock = [0] of {bool};
	int Counter = 0;}



init { 
	chan child_newDownstreamTestCluster21320 = [1] of {int};
	run newDownstreamTestCluster2132(child_newDownstreamTestCluster21320);
	run receiver(child_newDownstreamTestCluster21320)
stop_process:skip
}

proctype newDownstreamTestCluster2132(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_setUseDownstreamProtocol8510 = [1] of {int};
	Mutexdef cb_push_initializeMutex;
	Mutexdef cb_push_networksMu;
	Mutexdef cb_push_proxyStatusMutex;
	run mutexMonitor(cb_push_proxyStatusMutex);
	run mutexMonitor(cb_push_networksMu);
	run mutexMonitor(cb_push_initializeMutex);
	run setUseDownstreamProtocol851(cb_push_initializeMutex,cb_push_networksMu,cb_push_proxyStatusMutex,child_setUseDownstreamProtocol8510);
	child_setUseDownstreamProtocol8510?0;
	goto stop_process;
	stop_process: skip;
	child!0
}
proctype setUseDownstreamProtocol851(Mutexdef cb_push_initializeMutex;Mutexdef cb_push_networksMu;Mutexdef cb_push_proxyStatusMutex;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
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

