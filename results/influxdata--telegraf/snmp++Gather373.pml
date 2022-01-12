// num_comm_params=1
// num_mand_comm_params=1
// num_opt_comm_params=0

// git_link=https://github.com/influxdata/telegraf/blob//plugins/inputs/snmp/snmp.go#L373
#define def_var_s_Agents379  ?? // mand s.Agents line 379
typedef Wgdef {
	chan update = [0] of {int};
	chan wait = [0] of {int};
	int Counter = 0;}



init { 
	chan child_Gather3730 = [1] of {int};
	run Gather373(child_Gather3730);
	run receiver(child_Gather3730)
stop_process:skip
}

proctype Gather373(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_AnonymousGather3813810 = [1] of {int};
	Wgdef wg;
	int var_s_Agents = def_var_s_Agents379; // mand var_s_Agents
	

	if
	:: true -> 
		goto stop_process
	:: true;
	fi;
	run wgMonitor(wg);
		for(i : 0.. var_s_Agents-1) {
		for10: skip;
		wg.update!1;
		run AnonymousGather381381(wg,child_AnonymousGather3813810);
		run receiver(child_AnonymousGather3813810);
		for10_end: skip
	};
	for10_exit: skip;
	wg.wait?0;
	goto stop_process;
	stop_process: skip;
	child!0
}
proctype AnonymousGather381381(Wgdef wg;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	int var_s_Tables = -2; // opt var_s_Tables
	

	if
	:: true -> 
		goto defer1
	:: true;
	fi;
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

