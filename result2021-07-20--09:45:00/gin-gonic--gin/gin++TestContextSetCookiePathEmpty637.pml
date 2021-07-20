// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/gin-gonic/gin/blob/5452a1d3ef0982ffea95fb9e88e5425b0928c431/context_test.go#L637
typedef Mutexdef {
	chan Lock = [0] of {bool};
	chan Unlock = [0] of {bool};
	chan RLock = [0] of {bool};
	chan RUnlock = [0] of {bool};
	int Counter = 0;}



init { 
	chan child_TestContextSetCookiePathEmpty6370 = [1] of {int};
	run TestContextSetCookiePathEmpty637(child_TestContextSetCookiePathEmpty6370);
	run receiver(child_TestContextSetCookiePathEmpty6370)
stop_process:skip
}

proctype TestContextSetCookiePathEmpty637(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_SetCookie8741 = [1] of {int};
	chan child_SetSameSite8670 = [1] of {int};
	Mutexdef c_mu;
	run mutexMonitor(c_mu);
	run SetSameSite867(c_mu,child_SetSameSite8670);
	child_SetSameSite8670?0;
	run SetCookie874(c_mu,child_SetCookie8741);
	child_SetCookie8741?0;
	stop_process: skip;
	child!0
}
proctype SetSameSite867(Mutexdef c_mu;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	stop_process: skip;
	child!0
}
proctype SetCookie874(Mutexdef c_mu;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
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

