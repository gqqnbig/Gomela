// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/prometheus/prometheus/blob/27b78c336e436e9eed8b55ab0b162b888ec641d8/storage/remote/intern_test.go#L39
typedef Mutexdef {
	chan Lock = [0] of {bool};
	chan Unlock = [0] of {bool};
	chan RLock = [0] of {bool};
	chan RUnlock = [0] of {bool};
	int Counter = 0;}



init { 
	chan child_TestIntern_MultiRef390 = [1] of {int};
	run TestIntern_MultiRef39(child_TestIntern_MultiRef390);
	run receiver(child_TestIntern_MultiRef390)
stop_process:skip
}

proctype TestIntern_MultiRef39(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_intern571 = [1] of {int};
	chan child_intern570 = [1] of {int};
	Mutexdef interner_mtx;
	run mutexMonitor(interner_mtx);
	run intern57(interner_mtx,child_intern570);
	child_intern570?0;
	run intern57(interner_mtx,child_intern571);
	child_intern571?0;
	stop_process: skip;
	child!0
}
proctype intern57(Mutexdef p_mtx;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	

	if
	:: true -> 
		goto stop_process
	:: true;
	fi;
	p_mtx.RLock!false;
	p_mtx.RUnlock!false;
	

	if
	:: true -> 
		goto stop_process
	:: true;
	fi;
	p_mtx.Lock!false;
	

	if
	:: true -> 
		goto defer1
	:: true;
	fi;
	goto defer1;
		defer1: skip;
	p_mtx.Unlock!false;
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

