// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/mattermost/mattermost-server/blob/5c16de58a02099df38e1e8486df148d1b798460a/model/integration_action_test.go#L102
typedef Mutexdef {
	chan Lock = [0] of {bool};
	chan Unlock = [0] of {bool};
	chan RLock = [0] of {bool};
	chan RUnlock = [0] of {bool};
	int Counter = 0;}



init { 
	chan child_TestPostActionIntegrationResponseToJson1020 = [1] of {int};
	run TestPostActionIntegrationResponseToJson102(child_TestPostActionIntegrationResponseToJson1020);
	run receiver(child_TestPostActionIntegrationResponseToJson1020)
stop_process:skip
}

proctype TestPostActionIntegrationResponseToJson102(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	Mutexdef ro_Update_propsMu;
	chan child_ToJson3400 = [1] of {int};
	Mutexdef o_Update_propsMu;
	run mutexMonitor(o_Update_propsMu);
	run ToJson340(o_Update_propsMu,child_ToJson3400);
	child_ToJson3400?0;
	run mutexMonitor(ro_Update_propsMu);
	stop_process: skip;
	child!0
}
proctype ToJson340(Mutexdef r_Update_propsMu;chan child) {
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

