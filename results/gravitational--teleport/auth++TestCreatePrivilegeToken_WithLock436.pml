// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/gravitational/teleport/blob//lib/auth/usertoken_test.go#L436
typedef Wgdef {
	chan update = [0] of {int};
	chan wait = [0] of {int};
	int Counter = 0;}
typedef Mutexdef {
	chan Lock = [0] of {bool};
	chan Unlock = [0] of {bool};
	chan RLock = [0] of {bool};
	chan RUnlock = [0] of {bool};
	int Counter = 0;}



init { 
	chan child_TestCreatePrivilegeToken_WithLock4360 = [1] of {int};
	run TestCreatePrivilegeToken_WithLock436(child_TestCreatePrivilegeToken_WithLock4360);
	run receiver(child_TestCreatePrivilegeToken_WithLock4360)
stop_process:skip
}

proctype TestCreatePrivilegeToken_WithLock436(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	Mutexdef srv_TLSServer_cfg_TLS_mutex;
	Wgdef srv_TLSServer_grpcServer_server_serveWG;
	Mutexdef srv_TLSServer_grpcServer_server_mu;
	Mutexdef srv_TLSServer_httpServer_mu;
	Mutexdef srv_TLSServer_httpServer_nextProtoOnce_m;
	Mutexdef srv_TLSServer_httpServer_ErrorLog_mu;
	Mutexdef srv_TLSServer_httpServer_TLSConfig_mutex;
	int var_defaults_MaxLoginAttempts = -2; // opt var_defaults_MaxLoginAttempts
	int var_tests = -2; // opt var_tests
	run mutexMonitor(srv_TLSServer_httpServer_TLSConfig_mutex);
	run mutexMonitor(srv_TLSServer_httpServer_ErrorLog_mu);
	run mutexMonitor(srv_TLSServer_httpServer_nextProtoOnce_m);
	run mutexMonitor(srv_TLSServer_httpServer_mu);
	run mutexMonitor(srv_TLSServer_grpcServer_server_mu);
	run wgMonitor(srv_TLSServer_grpcServer_server_serveWG);
	run mutexMonitor(srv_TLSServer_cfg_TLS_mutex);
	stop_process: skip;
	child!0
}

 /* ================================================================================== */
 /* ================================================================================== */
 /* ================================================================================== */ 
proctype wgMonitor(Wgdef wg) {
int i;
do
	:: wg.update?i ->
		wg.Counter = wg.Counter + i;
		assert(wg.Counter >= 0)
	:: wg.Counter == 0 ->
end: if
		:: wg.update?i ->
			wg.Counter = wg.Counter + i;
			assert(wg.Counter >= 0)
		:: wg.wait!0;
	fi
od
}

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

