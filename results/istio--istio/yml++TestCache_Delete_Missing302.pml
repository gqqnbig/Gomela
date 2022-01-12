// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/istio/istio/blob//pkg/test/util/yml/cache_test.go#L302
typedef Mutexdef {
	chan Lock = [0] of {bool};
	chan Unlock = [0] of {bool};
	chan RLock = [0] of {bool};
	chan RUnlock = [0] of {bool};
	int Counter = 0;}



init { 
	chan child_TestCache_Delete_Missing3020 = [1] of {int};
	run TestCache_Delete_Missing302(child_TestCache_Delete_Missing3020);
	run receiver(child_TestCache_Delete_Missing3020)
stop_process:skip
}

proctype TestCache_Delete_Missing302(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_Delete971 = [1] of {int};
	chan child_Apply590 = [1] of {int};
	Mutexdef c_mu;
	run mutexMonitor(c_mu);
	run Apply59(c_mu,child_Apply590);
	child_Apply590?0;
	run Delete97(c_mu,child_Delete971);
	child_Delete971?0;
	stop_process: skip;
	child!0
}
proctype Apply59(Mutexdef c_mu;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_writeFile1642 = [1] of {int};
	chan child_generateFileName1721 = [1] of {int};
	chan child_deleteFile1680 = [1] of {int};
	chan child_writeFile1645 = [1] of {int};
	chan child_generateFileName1724 = [1] of {int};
	chan child_deleteFile1683 = [1] of {int};
	int var_parts = -2; // opt var_parts
	c_mu.Lock!false;
	

	if
	:: true -> 
		goto defer1
	:: true;
	fi;
	

	if
	:: var_parts-1 != -3 -> 
				for(i : 0.. var_parts-1) {
			for10: skip;
			

			if
			:: true -> 
				run deleteFile168(c_mu,child_deleteFile1680);
				child_deleteFile1680?0;
				

				if
				:: true -> 
					goto defer1
				:: true;
				fi
			fi;
			run generateFileName172(c_mu,child_generateFileName1721);
			child_generateFileName1721?0;
			run writeFile164(c_mu,child_writeFile1642);
			child_writeFile1642?0;
			

			if
			:: true -> 
				goto defer1
			:: true;
			fi;
			for10_end: skip
		};
		for10_exit: skip
	:: else -> 
		do
		:: true -> 
			for11: skip;
			

			if
			:: true -> 
				run deleteFile168(c_mu,child_deleteFile1683);
				child_deleteFile1683?0;
				

				if
				:: true -> 
					goto defer1
				:: true;
				fi
			fi;
			run generateFileName172(c_mu,child_generateFileName1724);
			child_generateFileName1724?0;
			run writeFile164(c_mu,child_writeFile1645);
			child_writeFile1645?0;
			

			if
			:: true -> 
				goto defer1
			:: true;
			fi;
			for11_end: skip
		:: true -> 
			break
		od;
		for11_exit: skip
	fi;
	goto defer1;
		defer1: skip;
	c_mu.Unlock!false;
	stop_process: skip;
	child!0
}
proctype deleteFile168(Mutexdef c_mu;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	goto stop_process;
	stop_process: skip;
	child!0
}
proctype generateFileName172(Mutexdef c_mu;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	goto stop_process;
	stop_process: skip;
	child!0
}
proctype writeFile164(Mutexdef c_mu;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	goto stop_process;
	stop_process: skip;
	child!0
}
proctype Delete97(Mutexdef c_mu;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_deleteFile1681 = [1] of {int};
	chan child_deleteFile1682 = [1] of {int};
	int var_parts = -2; // opt var_parts
	c_mu.Lock!false;
	

	if
	:: true -> 
		goto defer1
	:: true;
	fi;
	

	if
	:: var_parts-1 != -3 -> 
				for(i : 0.. var_parts-1) {
			for20: skip;
			

			if
			:: true -> 
				run deleteFile168(c_mu,child_deleteFile1681);
				child_deleteFile1681?0;
				

				if
				:: true -> 
					goto defer1
				:: true;
				fi
			:: true;
			fi;
			for20_end: skip
		};
		for20_exit: skip
	:: else -> 
		do
		:: true -> 
			for21: skip;
			

			if
			:: true -> 
				run deleteFile168(c_mu,child_deleteFile1682);
				child_deleteFile1682?0;
				

				if
				:: true -> 
					goto defer1
				:: true;
				fi
			:: true;
			fi;
			for21_end: skip
		:: true -> 
			break
		od;
		for21_exit: skip
	fi;
	goto defer1;
		defer1: skip;
	c_mu.Unlock!false;
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

