// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/fyne-io/fyne/blob//internal/preferences_test.go#L34
typedef Mutexdef {
	chan Lock = [0] of {bool};
	chan Unlock = [0] of {bool};
	chan RLock = [0] of {bool};
	chan RUnlock = [0] of {bool};
	int Counter = 0;}



init { 
	chan child_TestPrefs_Bool_Zero340 = [1] of {int};
	run TestPrefs_Bool_Zero34(child_TestPrefs_Bool_Zero340);
	run receiver(child_TestPrefs_Bool_Zero340)
stop_process:skip
}

proctype TestPrefs_Bool_Zero34(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_Bool790 = [1] of {int};
	Mutexdef p_lock;
	run mutexMonitor(p_lock);
	run Bool79(p_lock,child_Bool790);
	child_Bool790?0;
	stop_process: skip;
	child!0
}
proctype Bool79(Mutexdef p_lock;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_BoolWithFallback840 = [1] of {int};
	run BoolWithFallback84(p_lock,child_BoolWithFallback840);
	child_BoolWithFallback840?0;
	goto stop_process;
	stop_process: skip;
	child!0
}
proctype BoolWithFallback84(Mutexdef p_lock;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_get540 = [1] of {int};
	run get54(p_lock,child_get540);
	child_get540?0;
	

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
proctype get54(Mutexdef p_lock;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	p_lock.RLock!false;
	goto defer1;
		defer1: skip;
	p_lock.RUnlock!false;
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

