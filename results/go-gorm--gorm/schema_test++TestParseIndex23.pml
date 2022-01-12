// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/go-gorm/gorm/blob//schema/index_test.go#L23
typedef Mutexdef {
	chan Lock = [0] of {bool};
	chan Unlock = [0] of {bool};
	chan RLock = [0] of {bool};
	chan RUnlock = [0] of {bool};
	int Counter = 0;}



init { 
	chan child_TestParseIndex230 = [1] of {int};
	run TestParseIndex23(child_TestParseIndex230);
	run receiver(child_TestParseIndex230)
stop_process:skip
}

proctype TestParseIndex23(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_ParseIndexes290 = [1] of {int};
	Mutexdef user_cacheStore_mu;
	int var_result_Fields = -2; // opt var_result_Fields
	int var_results = -2; // opt var_results
	run mutexMonitor(user_cacheStore_mu);
	run ParseIndexes29(user_cacheStore_mu,child_ParseIndexes290);
	child_ParseIndexes290?0;
	stop_process: skip;
	child!0
}
proctype ParseIndexes29(Mutexdef schema_cacheStore_mu;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	int var_parseFieldIndexes = -2; // opt var_parseFieldIndexes
	int var_schema_Fields = -2; // opt var_schema_Fields
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

