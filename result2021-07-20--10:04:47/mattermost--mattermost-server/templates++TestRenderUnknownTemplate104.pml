// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/mattermost/mattermost-server/blob/5c16de58a02099df38e1e8486df148d1b798460a/shared/templates/templates_test.go#L104
typedef Mutexdef {
	chan Lock = [0] of {bool};
	chan Unlock = [0] of {bool};
	chan RLock = [0] of {bool};
	chan RUnlock = [0] of {bool};
	int Counter = 0;}



init { 
	chan child_TestRenderUnknownTemplate1040 = [1] of {int};
	run TestRenderUnknownTemplate104(child_TestRenderUnknownTemplate1040);
	run receiver(child_TestRenderUnknownTemplate1040)
stop_process:skip
}

proctype TestRenderUnknownTemplate104(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_Render1441 = [1] of {int};
	chan child_RenderToString1340 = [1] of {int};
	Mutexdef mt_mutex;
	run mutexMonitor(mt_mutex);
	run RenderToString134(mt_mutex,child_RenderToString1340);
	child_RenderToString1340?0;
	run Render144(mt_mutex,child_Render1441);
	child_Render1441?0;
	stop_process: skip;
	child!0
}
proctype RenderToString134(Mutexdef c_mutex;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_Render1440 = [1] of {int};
	run Render144(c_mutex,child_Render1440);
	child_Render1440?0;
	

	if
	:: true -> 
		goto stop_process
	:: true;
	fi;
	goto stop_process;
	stop_process: skip;
	child!0
}
proctype Render144(Mutexdef c_mutex;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	c_mutex.RLock!false;
	c_mutex.RUnlock!false;
	

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

