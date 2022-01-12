// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/jmoiron/sqlx/blob//reflectx/reflect_test.go#L110
typedef Mutexdef {
	chan Lock = [0] of {bool};
	chan Unlock = [0] of {bool};
	chan RLock = [0] of {bool};
	chan RUnlock = [0] of {bool};
	int Counter = 0;}



init { 
	chan child_TestBasicEmbeddedWithTags1100 = [1] of {int};
	run TestBasicEmbeddedWithTags110(child_TestBasicEmbeddedWithTags1100);
	run receiver(child_TestBasicEmbeddedWithTags1100)
stop_process:skip
}

proctype TestBasicEmbeddedWithTags110(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_FieldByName1332 = [1] of {int};
	chan child_FieldByName1331 = [1] of {int};
	chan child_TypeMap1050 = [1] of {int};
	Mutexdef m_mutex;
	run mutexMonitor(m_mutex);
	run TypeMap105(m_mutex,child_TypeMap1050);
	child_TypeMap1050?0;
	run FieldByName133(m_mutex,child_FieldByName1331);
	child_FieldByName1331?0;
	run FieldByName133(m_mutex,child_FieldByName1332);
	child_FieldByName1332?0;
	stop_process: skip;
	child!0
}
proctype TypeMap105(Mutexdef m_mutex;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	m_mutex.Lock!false;
	m_mutex.Unlock!false;
	goto stop_process;
	stop_process: skip;
	child!0
}
proctype FieldByName133(Mutexdef m_mutex;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_TypeMap1051 = [1] of {int};
	run TypeMap105(m_mutex,child_TypeMap1051);
	child_TypeMap1051?0;
	

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

