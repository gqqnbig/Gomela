// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/gin-gonic/gin/blob/5452a1d3ef0982ffea95fb9e88e5425b0928c431/context_test.go#L1642
typedef Mutexdef {
	chan Lock = [0] of {bool};
	chan Unlock = [0] of {bool};
	chan RLock = [0] of {bool};
	chan RUnlock = [0] of {bool};
	int Counter = 0;}



init { 
	chan child_TestContextAutoShouldBindJSON16420 = [1] of {int};
	run TestContextAutoShouldBindJSON1642(child_TestContextAutoShouldBindJSON16420);
	run receiver(child_TestContextAutoShouldBindJSON16420)
stop_process:skip
}

proctype TestContextAutoShouldBindJSON1642(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_ShouldBind6610 = [1] of {int};
	Mutexdef c_mu;
	run mutexMonitor(c_mu);
	run ShouldBind661(c_mu,child_ShouldBind6610);
	child_ShouldBind6610?0;
	stop_process: skip;
	child!0
}
proctype ShouldBind661(Mutexdef c_mu;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_ShouldBindWith7021 = [1] of {int};
	chan child_ContentType8050 = [1] of {int};
	run ContentType805(c_mu,child_ContentType8050);
	child_ContentType8050?0;
	run ShouldBindWith702(c_mu,child_ShouldBindWith7021);
	child_ShouldBindWith7021?0;
	goto stop_process;
	stop_process: skip;
	child!0
}
proctype ContentType805(Mutexdef c_mu;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_requestHeader8190 = [1] of {int};
	run requestHeader819(c_mu,child_requestHeader8190);
	child_requestHeader8190?0;
	goto stop_process;
	stop_process: skip;
	child!0
}
proctype requestHeader819(Mutexdef c_mu;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	goto stop_process;
	stop_process: skip;
	child!0
}
proctype ShouldBindWith702(Mutexdef c_mu;chan child) {
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

