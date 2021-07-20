// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/Dreamacro/clash/blob/baf03b81e36e3c5d8b9a370ebb82dd2b25b4a58d/component/fakeip/pool_test.go#L73
typedef Mutexdef {
	chan Lock = [0] of {bool};
	chan Unlock = [0] of {bool};
	chan RLock = [0] of {bool};
	chan RUnlock = [0] of {bool};
	int Counter = 0;}



init { 
	chan child_TestPool_Error730 = [1] of {int};
	run TestPool_Error73(child_TestPool_Error730);
	run receiver(child_TestPool_Error730)
stop_process:skip
}

proctype TestPool_Error73(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	Mutexdef __cache_mu;
	Mutexdef __mux;
	run mutexMonitor(__mux);
	run mutexMonitor(__cache_mu);
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

