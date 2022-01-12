// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/hashicorp/terraform/blob//terraform/graph_builder_plan_test.go#L133
typedef Mutexdef {
	chan Lock = [0] of {bool};
	chan Unlock = [0] of {bool};
	chan RLock = [0] of {bool};
	chan RUnlock = [0] of {bool};
	int Counter = 0;}



init { 
	chan child_TestPlanGraphBuilder_attrAsBlocks1330 = [1] of {int};
	run TestPlanGraphBuilder_attrAsBlocks133(child_TestPlanGraphBuilder_attrAsBlocks1330);
	run receiver(child_TestPlanGraphBuilder_attrAsBlocks1330)
stop_process:skip
}

proctype TestPlanGraphBuilder_attrAsBlocks133(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_Build610 = [1] of {int};
	Mutexdef b_once_m;
	run mutexMonitor(b_once_m);
	run Build61(b_once_m,child_Build610);
	child_Build610?0;
	stop_process: skip;
	child!0
}
proctype Build61(Mutexdef b_once_m;chan child) {
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

