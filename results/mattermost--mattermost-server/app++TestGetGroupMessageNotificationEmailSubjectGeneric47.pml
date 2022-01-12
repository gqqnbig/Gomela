// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/mattermost/mattermost-server/blob//app/notification_email_test.go#L47
typedef Mutexdef {
	chan Lock = [0] of {bool};
	chan Unlock = [0] of {bool};
	chan RLock = [0] of {bool};
	chan RUnlock = [0] of {bool};
	int Counter = 0;}



init { 
	chan child_TestGetGroupMessageNotificationEmailSubjectGeneric470 = [1] of {int};
	run TestGetGroupMessageNotificationEmailSubjectGeneric47(child_TestGetGroupMessageNotificationEmailSubjectGeneric470);
	run receiver(child_TestGetGroupMessageNotificationEmailSubjectGeneric470)
stop_process:skip
}

proctype TestGetGroupMessageNotificationEmailSubjectGeneric47(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_getGroupMessageNotificationEmailSubject1500 = [1] of {int};
	Mutexdef post_propsMu;
	run mutexMonitor(post_propsMu);
	run getGroupMessageNotificationEmailSubject150(post_propsMu,child_getGroupMessageNotificationEmailSubject1500);
	child_getGroupMessageNotificationEmailSubject1500?0;
	stop_process: skip;
	child!0
}
proctype getGroupMessageNotificationEmailSubject150(Mutexdef post_propsMu;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_getFormattedPostTime2590 = [1] of {int};
	run getFormattedPostTime259(post_propsMu,child_getFormattedPostTime2590);
	child_getFormattedPostTime2590?0;
	

	if
	:: true -> 
		goto stop_process
	:: true;
	fi;
	goto stop_process;
	stop_process: skip;
	child!0
}
proctype getFormattedPostTime259(Mutexdef post_propsMu;chan child) {
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

