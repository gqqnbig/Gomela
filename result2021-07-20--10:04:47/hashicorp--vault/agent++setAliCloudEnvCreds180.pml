// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/hashicorp/vault/blob/f8f289712a3d37115090591602a2b92503fb3a13/command/agent/alicloud_end_to_end_test.go#L180
typedef Mutexdef {
	chan Lock = [0] of {bool};
	chan Unlock = [0] of {bool};
	chan RLock = [0] of {bool};
	chan RUnlock = [0] of {bool};
	int Counter = 0;}



init { 
	chan child_setAliCloudEnvCreds1800 = [1] of {int};
	run setAliCloudEnvCreds180(child_setAliCloudEnvCreds1800);
	run receiver(child_setAliCloudEnvCreds1800)
stop_process:skip
}

proctype setAliCloudEnvCreds180(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	Mutexdef config_HttpTransport_connsPerHostMu;
	Mutexdef config_HttpTransport_altMu;
	Mutexdef config_HttpTransport_reqMu;
	Mutexdef config_HttpTransport_idleMu;
	run mutexMonitor(config_HttpTransport_idleMu);
	run mutexMonitor(config_HttpTransport_reqMu);
	run mutexMonitor(config_HttpTransport_altMu);
	run mutexMonitor(config_HttpTransport_connsPerHostMu);
	

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

