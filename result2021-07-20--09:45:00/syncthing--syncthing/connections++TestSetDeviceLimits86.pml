// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/syncthing/syncthing/blob/87a0eecc31a0a5eeef1d0da510f4d5832e022e1f/lib/connections/limiter_test.go#L86
typedef Mutexdef {
	chan Lock = [0] of {bool};
	chan Unlock = [0] of {bool};
	chan RLock = [0] of {bool};
	chan RUnlock = [0] of {bool};
	int Counter = 0;}



init { 
	chan child_TestSetDeviceLimits860 = [1] of {int};
	run TestSetDeviceLimits86(child_TestSetDeviceLimits860);
	run receiver(child_TestSetDeviceLimits860)
stop_process:skip
}

proctype TestSetDeviceLimits86(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	Mutexdef lim_read_mu;
	Mutexdef lim_write_mu;
	run mutexMonitor(lim_write_mu);
	run mutexMonitor(lim_read_mu);
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

