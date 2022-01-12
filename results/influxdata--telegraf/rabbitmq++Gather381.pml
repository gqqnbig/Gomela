// num_comm_params=1
// num_mand_comm_params=1
// num_opt_comm_params=0

// git_link=https://github.com/influxdata/telegraf/blob//plugins/inputs/rabbitmq/rabbitmq.go#L381
#define def_var_gatherFunctions383  ?? // mand gatherFunctions line 383
typedef Wgdef {
	chan update = [0] of {int};
	chan wait = [0] of {int};
	int Counter = 0;}



init { 
	chan child_Gather3810 = [1] of {int};
	run Gather381(child_Gather3810);
	run receiver(child_Gather3810)
stop_process:skip
}

proctype Gather381(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_AnonymousGather3893890 = [1] of {int};
	Wgdef wg;
	int var_gatherFunctions = def_var_gatherFunctions383; // mand var_gatherFunctions
	run wgMonitor(wg);
		for(i : 0.. var_gatherFunctions-1) {
		for10: skip;
		

		if
		:: true -> 
			goto for10_end
		:: true;
		fi;
		wg.update!1;
		run AnonymousGather389389(wg,child_AnonymousGather3893890);
		run receiver(child_AnonymousGather3893890);
		for10_end: skip
	};
	for10_exit: skip;
	wg.wait?0;
	goto stop_process;
	stop_process: skip;
	child!0
}
proctype AnonymousGather389389(Wgdef wg;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
		defer1: skip;
	wg.update!-1;
	stop_process: skip;
	child!0
}

 /* ================================================================================== */
 /* ================================================================================== */
 /* ================================================================================== */ 
proctype wgMonitor(Wgdef wg) {
int i;
do
	:: wg.update?i ->
		wg.Counter = wg.Counter + i;
		assert(wg.Counter >= 0)
	:: wg.Counter == 0 ->
end: if
		:: wg.update?i ->
			wg.Counter = wg.Counter + i;
			assert(wg.Counter >= 0)
		:: wg.wait!0;
	fi
od
}

proctype receiver(chan c) {
c?0
}

