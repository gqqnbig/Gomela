// num_comm_params=1
// num_mand_comm_params=0
// num_opt_comm_params=1

// git_link=https://github.com/kubernetes/kubernetes/blob/0277cff2682d5a0d3c6fa2109f7f82e8db3f2ed8/pkg/proxy/winuserspace/roundrobin_test.go#L312
#define not_found_227  -2 // opt newEndpoints line 194
typedef Mutexdef {
	chan Lock = [0] of {bool};
	chan Unlock = [0] of {bool};
	chan RLock = [0] of {bool};
	chan RUnlock = [0] of {bool};
	int Counter = 0;}



init { 
	chan child_TestStickyLoadBalanceWorksWithNewServiceCalledFirst3120 = [1] of {int};
	run TestStickyLoadBalanceWorksWithNewServiceCalledFirst312(child_TestStickyLoadBalanceWorksWithNewServiceCalledFirst3120);
	run receiver(child_TestStickyLoadBalanceWorksWithNewServiceCalledFirst3120)
stop_process:skip
}

proctype TestStickyLoadBalanceWorksWithNewServiceCalledFirst312(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_expectEndpoint4120 = [1] of {int};
	chan child_expectEndpoint4119 = [1] of {int};
	chan child_expectEndpoint4118 = [1] of {int};
	chan child_expectEndpoint4117 = [1] of {int};
	chan child_expectEndpoint4116 = [1] of {int};
	chan child_expectEndpoint4115 = [1] of {int};
	chan child_expectEndpoint4114 = [1] of {int};
	chan child_expectEndpoint4113 = [1] of {int};
	chan child_expectEndpoint4112 = [1] of {int};
	chan child_NextEndpoint12511 = [1] of {int};
	chan child_expectEndpoint4110 = [1] of {int};
	chan child_expectEndpoint419 = [1] of {int};
	chan child_expectEndpoint418 = [1] of {int};
	chan child_NextEndpoint1257 = [1] of {int};
	chan child_expectEndpoint416 = [1] of {int};
	chan child_expectEndpoint415 = [1] of {int};
	chan child_expectEndpoint414 = [1] of {int};
	chan child_NextEndpoint1253 = [1] of {int};
	chan child_OnEndpointsAdd2142 = [1] of {int};
	chan child_NewService841 = [1] of {int};
	chan child_NextEndpoint1250 = [1] of {int};
	Mutexdef loadBalancer_lock;
	run mutexMonitor(loadBalancer_lock);
	run NextEndpoint125(loadBalancer_lock,child_NextEndpoint1250);
	child_NextEndpoint1250?0;
	run NewService84(loadBalancer_lock,child_NewService841);
	child_NewService841?0;
	run OnEndpointsAdd214(loadBalancer_lock,child_OnEndpointsAdd2142);
	child_OnEndpointsAdd2142?0;
	run NextEndpoint125(loadBalancer_lock,child_NextEndpoint1253);
	child_NextEndpoint1253?0;
	run expectEndpoint41(loadBalancer_lock,child_expectEndpoint414);
	child_expectEndpoint414?0;
	run expectEndpoint41(loadBalancer_lock,child_expectEndpoint415);
	child_expectEndpoint415?0;
	run expectEndpoint41(loadBalancer_lock,child_expectEndpoint416);
	child_expectEndpoint416?0;
	run NextEndpoint125(loadBalancer_lock,child_NextEndpoint1257);
	child_NextEndpoint1257?0;
	run expectEndpoint41(loadBalancer_lock,child_expectEndpoint418);
	child_expectEndpoint418?0;
	run expectEndpoint41(loadBalancer_lock,child_expectEndpoint419);
	child_expectEndpoint419?0;
	run expectEndpoint41(loadBalancer_lock,child_expectEndpoint4110);
	child_expectEndpoint4110?0;
	run NextEndpoint125(loadBalancer_lock,child_NextEndpoint12511);
	child_NextEndpoint12511?0;
	run expectEndpoint41(loadBalancer_lock,child_expectEndpoint4112);
	child_expectEndpoint4112?0;
	run expectEndpoint41(loadBalancer_lock,child_expectEndpoint4113);
	child_expectEndpoint4113?0;
	run expectEndpoint41(loadBalancer_lock,child_expectEndpoint4114);
	child_expectEndpoint4114?0;
	run expectEndpoint41(loadBalancer_lock,child_expectEndpoint4115);
	child_expectEndpoint4115?0;
	run expectEndpoint41(loadBalancer_lock,child_expectEndpoint4116);
	child_expectEndpoint4116?0;
	run expectEndpoint41(loadBalancer_lock,child_expectEndpoint4117);
	child_expectEndpoint4117?0;
	run expectEndpoint41(loadBalancer_lock,child_expectEndpoint4118);
	child_expectEndpoint4118?0;
	run expectEndpoint41(loadBalancer_lock,child_expectEndpoint4119);
	child_expectEndpoint4119?0;
	run expectEndpoint41(loadBalancer_lock,child_expectEndpoint4120);
	child_expectEndpoint4120?0;
	stop_process: skip;
	child!0
}
proctype NextEndpoint125(Mutexdef lb_lock;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	lb_lock.Lock!false;
	

	if
	:: true -> 
		goto defer1
	:: true;
	fi;
	

	if
	:: true -> 
		goto defer1
	:: true;
	fi;
	

	if
	:: true -> 
		

		if
		:: true -> 
			goto defer1
		:: true;
		fi;
		

		if
		:: true -> 
			

			if
			:: true -> 
				goto defer1
			:: true;
			fi
		:: true;
		fi
	:: true;
	fi;
	goto defer1;
		defer1: skip;
	lb_lock.Unlock!false;
	stop_process: skip;
	child!0
}
proctype NewService84(Mutexdef lb_lock;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_newServiceInternal931 = [1] of {int};
	lb_lock.Lock!false;
	run newServiceInternal93(lb_lock,child_newServiceInternal931);
	child_newServiceInternal931?0;
	goto defer1;
		defer1: skip;
	lb_lock.Unlock!false;
	stop_process: skip;
	child!0
}
proctype newServiceInternal93(Mutexdef lb_lock;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	goto stop_process;
	stop_process: skip;
	child!0
}
proctype OnEndpointsAdd214(Mutexdef lb_lock;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_newServiceInternal933 = [1] of {int};
	chan child_updateAffinityMap1942 = [1] of {int};
	chan child_newServiceInternal935 = [1] of {int};
	chan child_updateAffinityMap1944 = [1] of {int};
	int var_portsToEndpointsportsToEndpoints = -2; // opt var_portsToEndpointsportsToEndpoints
	lb_lock.Lock!false;
	

	if
	:: var_portsToEndpoints-1 != -3 -> 
				for(i : 0.. var_portsToEndpoints-1) {
			for10: skip;
			

			if
			:: true -> 
				run updateAffinityMap194(lb_lock,not_found_227,child_updateAffinityMap1942);
				child_updateAffinityMap1942?0;
				run newServiceInternal93(lb_lock,child_newServiceInternal933);
				child_newServiceInternal933?0
			:: true;
			fi;
			for10_end: skip
		};
		for10_exit: skip
	:: else -> 
		do
		:: true -> 
			for17: skip;
			

			if
			:: true -> 
				run updateAffinityMap194(lb_lock,not_found_227,child_updateAffinityMap1944);
				child_updateAffinityMap1944?0;
				run newServiceInternal93(lb_lock,child_newServiceInternal935);
				child_newServiceInternal935?0
			:: true;
			fi;
			for17_end: skip
		:: true -> 
			break
		od;
		for17_exit: skip
	fi;
		defer1: skip;
	lb_lock.Unlock!false;
	stop_process: skip;
	child!0
}
proctype updateAffinityMap194(Mutexdef lb_lock;int newEndpoints;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	int var_allEndpointsallEndpoints = -2; // opt var_allEndpointsallEndpoints
	int var_state_endpointsstate_endpoints = -2; // opt var_state_endpointsstate_endpoints
	

	if
	:: true -> 
		goto stop_process
	:: true;
	fi;
	stop_process: skip;
	child!0
}
proctype expectEndpoint41(Mutexdef loadBalancer_lock;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_NextEndpoint1254 = [1] of {int};
	run NextEndpoint125(loadBalancer_lock,child_NextEndpoint1254);
	child_NextEndpoint1254?0;
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

