// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/rclone/rclone/blob/6ef7178ee4465f2361b6e2cf483cef5bbfd9c95c/vfs/dir_test.go#L212
typedef Mutexdef {
	chan Lock = [0] of {bool};
	chan Unlock = [0] of {bool};
	chan RLock = [0] of {bool};
	chan RUnlock = [0] of {bool};
	int Counter = 0;}



init { 
	chan child_TestDirSetModTime2120 = [1] of {int};
	run TestDirSetModTime212(child_TestDirSetModTime2120);
	run receiver(child_TestDirSetModTime2120)
stop_process:skip
}

proctype TestDirSetModTime212(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_SetModTime7554 = [1] of {int};
	chan child_ModTime7423 = [1] of {int};
	chan child_SetModTime7552 = [1] of {int};
	chan child_ModTime7421 = [1] of {int};
	chan child_SetModTime7550 = [1] of {int};
	Mutexdef dir_modTimeMu;
	Mutexdef dir_mu;
	Mutexdef dir_vfs_usageMu;
	Mutexdef vfs_usageMu;
	Mutexdef vfs_cache_kickerMu;
	Mutexdef vfs_cache_mu;
	Mutexdef vfs_root_modTimeMu;
	Mutexdef vfs_root_mu;
	run mutexMonitor(vfs_root_mu);
	run mutexMonitor(vfs_root_modTimeMu);
	run mutexMonitor(vfs_cache_mu);
	run mutexMonitor(vfs_cache_kickerMu);
	run mutexMonitor(vfs_usageMu);
	run mutexMonitor(dir_vfs_usageMu);
	run mutexMonitor(dir_mu);
	run mutexMonitor(dir_modTimeMu);
	run SetModTime755(dir_modTimeMu,dir_mu,dir_vfs_usageMu,child_SetModTime7550);
	child_SetModTime7550?0;
	run ModTime742(dir_modTimeMu,dir_mu,dir_vfs_usageMu,child_ModTime7421);
	child_ModTime7421?0;
	run SetModTime755(dir_modTimeMu,dir_mu,dir_vfs_usageMu,child_SetModTime7552);
	child_SetModTime7552?0;
	run ModTime742(dir_modTimeMu,dir_mu,dir_vfs_usageMu,child_ModTime7423);
	child_ModTime7423?0;
	run SetModTime755(dir_modTimeMu,dir_mu,dir_vfs_usageMu,child_SetModTime7554);
	child_SetModTime7554?0;
	stop_process: skip;
	child!0
}
proctype SetModTime755(Mutexdef d_modTimeMu;Mutexdef d_mu;Mutexdef d_vfs_usageMu;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	

	if
	:: true -> 
		goto stop_process
	:: true;
	fi;
	d_modTimeMu.Lock!false;
	d_modTimeMu.Unlock!false;
	goto stop_process;
	stop_process: skip;
	child!0
}
proctype ModTime742(Mutexdef d_modTimeMu;Mutexdef d_mu;Mutexdef d_vfs_usageMu;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	d_modTimeMu.Lock!false;
	goto defer1;
		defer1: skip;
	d_modTimeMu.Unlock!false;
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

