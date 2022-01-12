// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/photoprism/photoprism/blob//internal/config/raw_test.go#L50
typedef Mutexdef {
	chan Lock = [0] of {bool};
	chan Unlock = [0] of {bool};
	chan RLock = [0] of {bool};
	chan RUnlock = [0] of {bool};
	int Counter = 0;}



init { 
	chan child_TestConfig_DarktableEnabled500 = [1] of {int};
	run TestConfig_DarktableEnabled50(child_TestConfig_DarktableEnabled500);
	run receiver(child_TestConfig_DarktableEnabled500)
stop_process:skip
}

proctype TestConfig_DarktableEnabled50(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_DarktableEnabled191 = [1] of {int};
	chan child_DarktableEnabled190 = [1] of {int};
	Mutexdef c_db_values_mu;
	Mutexdef c_once_m;
	run mutexMonitor(c_once_m);
	run mutexMonitor(c_db_values_mu);
	run DarktableEnabled19(c_db_values_mu,c_once_m,child_DarktableEnabled190);
	child_DarktableEnabled190?0;
	run DarktableEnabled19(c_db_values_mu,c_once_m,child_DarktableEnabled191);
	child_DarktableEnabled191?0;
	stop_process: skip;
	child!0
}
proctype DarktableEnabled19(Mutexdef c_db_values_mu;Mutexdef c_once_m;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_DisableDarktable740 = [1] of {int};
	run DisableDarktable74(c_db_values_mu,c_once_m,child_DisableDarktable740);
	child_DisableDarktable740?0;
	goto stop_process;
	stop_process: skip;
	child!0
}
proctype DisableDarktable74(Mutexdef c_db_values_mu;Mutexdef c_once_m;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_DarktableBin90 = [1] of {int};
	run DarktableBin9(c_db_values_mu,c_once_m,child_DarktableBin90);
	child_DarktableBin90?0;
	goto stop_process;
	stop_process: skip;
	child!0
}
proctype DarktableBin9(Mutexdef c_db_values_mu;Mutexdef c_once_m;chan child) {
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

