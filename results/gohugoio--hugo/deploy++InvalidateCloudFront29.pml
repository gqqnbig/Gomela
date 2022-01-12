// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/gohugoio/hugo/blob//deploy/cloudfront.go#L29
typedef Mutexdef {
	chan Lock = [0] of {bool};
	chan Unlock = [0] of {bool};
	chan RLock = [0] of {bool};
	chan RUnlock = [0] of {bool};
	int Counter = 0;}



init { 
	chan child_InvalidateCloudFront290 = [1] of {int};
	run InvalidateCloudFront29(child_InvalidateCloudFront290);
	run receiver(child_InvalidateCloudFront290)
stop_process:skip
}

proctype InvalidateCloudFront29(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	Mutexdef sess_options_Config_Credentials_m;
	Mutexdef sess_Config_Credentials_m;
	Mutexdef sess_Config_Credentials_sf_mu;
	run mutexMonitor(sess_Config_Credentials_sf_mu);
	run mutexMonitor(sess_Config_Credentials_m);
	run mutexMonitor(sess_options_Config_Credentials_m);
	

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

