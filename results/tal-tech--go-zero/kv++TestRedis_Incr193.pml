// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/tal-tech/go-zero/blob//core/stores/kv/store_test.go#L193
typedef Mutexdef {
	chan Lock = [0] of {bool};
	chan Unlock = [0] of {bool};
	chan RLock = [0] of {bool};
	chan RUnlock = [0] of {bool};
	int Counter = 0;}



init { 
	chan child_TestRedis_Incr1930 = [1] of {int};
	run TestRedis_Incr193(child_TestRedis_Incr1930);
	run receiver(child_TestRedis_Incr1930)
stop_process:skip
}

proctype TestRedis_Incr193(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_Incr2790 = [1] of {int};
	Mutexdef store_dispatcher_lock;
	run mutexMonitor(store_dispatcher_lock);
	run Incr279(store_dispatcher_lock,child_Incr2790);
	child_Incr2790?0;
	stop_process: skip;
	child!0
}
proctype Incr279(Mutexdef cs_dispatcher_lock;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_getRedis6600 = [1] of {int};
	run getRedis660(cs_dispatcher_lock,child_getRedis6600);
	child_getRedis6600?0;
	

	if
	:: true -> 
		goto stop_process
	:: true;
	fi;
	goto stop_process;
	stop_process: skip;
	child!0
}
proctype getRedis660(Mutexdef cs_dispatcher_lock;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	

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

