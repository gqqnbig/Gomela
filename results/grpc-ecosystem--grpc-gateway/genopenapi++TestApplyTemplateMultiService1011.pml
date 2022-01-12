// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/grpc-ecosystem/grpc-gateway/blob//protoc-gen-openapiv2/internal/genopenapi/template_test.go#L1011
typedef Mutexdef {
	chan Lock = [0] of {bool};
	chan Unlock = [0] of {bool};
	chan RLock = [0] of {bool};
	chan RUnlock = [0] of {bool};
	int Counter = 0;}



init { 
	chan child_TestApplyTemplateMultiService10110 = [1] of {int};
	run TestApplyTemplateMultiService1011(child_TestApplyTemplateMultiService10110);
	run receiver(child_TestApplyTemplateMultiService10110)
stop_process:skip
}

proctype TestApplyTemplateMultiService1011(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	Mutexdef svc2_Options_state_atomicMessageInfo_initMu;
	Mutexdef svc2_state_atomicMessageInfo_initMu;
	Mutexdef svc_Options_state_atomicMessageInfo_initMu;
	Mutexdef svc_state_atomicMessageInfo_initMu;
	Mutexdef meth_Options_state_atomicMessageInfo_initMu;
	Mutexdef meth_state_atomicMessageInfo_initMu;
	Mutexdef msgdesc_Options_state_atomicMessageInfo_initMu;
	Mutexdef msgdesc_state_atomicMessageInfo_initMu;
	run mutexMonitor(msgdesc_state_atomicMessageInfo_initMu);
	run mutexMonitor(msgdesc_Options_state_atomicMessageInfo_initMu);
	run mutexMonitor(meth_state_atomicMessageInfo_initMu);
	run mutexMonitor(meth_Options_state_atomicMessageInfo_initMu);
	run mutexMonitor(svc_state_atomicMessageInfo_initMu);
	run mutexMonitor(svc_Options_state_atomicMessageInfo_initMu);
	run mutexMonitor(svc2_state_atomicMessageInfo_initMu);
	run mutexMonitor(svc2_Options_state_atomicMessageInfo_initMu);
	

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

