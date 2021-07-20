// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/ethereum/go-ethereum/blob/b8040a430e34117f121c67e8deee4a5e889e8372/trie/hasher.go#L119
typedef Wgdef {
	chan update = [0] of {int};
	chan wait = [0] of {int};
	int Counter = 0;}



init { 
	chan child_hashFullNodeChildren1190 = [1] of {int};
	run hashFullNodeChildren119(child_hashFullNodeChildren1190);
	run receiver(child_hashFullNodeChildren1190)
stop_process:skip
}

proctype hashFullNodeChildren119(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_AnonymoushashFullNodeChildren1271270 = [1] of {int};
	Wgdef wg;
	

	if
	:: true -> 
		run wgMonitor(wg);
		wg.update!16;
				for(i : 0.. 16-1) {
			for10: skip;
			run AnonymoushashFullNodeChildren127127(wg,child_AnonymoushashFullNodeChildren1271270);
			run receiver(child_AnonymoushashFullNodeChildren1271270);
			for10_end: skip
		};
		for10_exit: skip;
		wg.wait?0
	fi;
	goto stop_process;
	stop_process: skip;
	child!0
}
proctype AnonymoushashFullNodeChildren127127(Wgdef wg;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
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

