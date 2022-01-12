// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/photoprism/photoprism/blob//internal/config/server_test.go#L25
typedef Mutexdef {
	chan Lock = [0] of {bool};
	chan Unlock = [0] of {bool};
	chan RLock = [0] of {bool};
	chan RUnlock = [0] of {bool};
	int Counter = 0;}



init { 
	chan child_TestConfig_HttpServerMode2250 = [1] of {int};
	run TestConfig_HttpServerMode225(child_TestConfig_HttpServerMode2250);
	run receiver(child_TestConfig_HttpServerMode2250)
stop_process:skip
}

proctype TestConfig_HttpServerMode225(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_HttpMode342 = [1] of {int};
	chan child_HttpMode341 = [1] of {int};
	chan child_HttpMode340 = [1] of {int};
	Mutexdef c_db_values_mu;
	Mutexdef c_once_m;
	run mutexMonitor(c_once_m);
	run mutexMonitor(c_db_values_mu);
	run HttpMode34(c_db_values_mu,c_once_m,child_HttpMode340);
	child_HttpMode340?0;
	run HttpMode34(c_db_values_mu,c_once_m,child_HttpMode341);
	child_HttpMode341?0;
	run HttpMode34(c_db_values_mu,c_once_m,child_HttpMode342);
	child_HttpMode342?0;
	stop_process: skip;
	child!0
}
proctype HttpMode34(Mutexdef c_db_values_mu;Mutexdef c_once_m;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_Debug3450 = [1] of {int};
	

	if
	:: true -> 
		run Debug345(c_db_values_mu,c_once_m,child_Debug3450);
		child_Debug3450?0;
		

		if
		:: true -> 
			goto stop_process
		:: true;
		fi;
		goto stop_process
	:: true;
	fi;
	goto stop_process;
	stop_process: skip;
	child!0
}
proctype Debug345(Mutexdef c_db_values_mu;Mutexdef c_once_m;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
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

