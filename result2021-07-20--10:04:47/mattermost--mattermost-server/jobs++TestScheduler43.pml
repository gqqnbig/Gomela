// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/mattermost/mattermost-server/blob/5c16de58a02099df38e1e8486df148d1b798460a/jobs/schedulers_test.go#L43
typedef Mutexdef {
	chan Lock = [0] of {bool};
	chan Unlock = [0] of {bool};
	chan RLock = [0] of {bool};
	chan RUnlock = [0] of {bool};
	int Counter = 0;}



init { 
	chan child_TestScheduler430 = [1] of {int};
	run TestScheduler43(child_TestScheduler430);
	run receiver(child_TestScheduler430)
stop_process:skip
}

proctype TestScheduler43(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	Mutexdef jobServer_mut;
	int var_jobServer_schedulers_nextRunTimesjobServer_schedulers_nextRunTimes = -2; // opt var_jobServer_schedulers_nextRunTimesjobServer_schedulers_nextRunTimes
	run mutexMonitor(jobServer_mut);
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

