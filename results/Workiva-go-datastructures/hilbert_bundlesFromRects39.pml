#define bundlesFromRects_chunks  1
#define bundlesFromRects_runtime_NumCPU4518  1

// /var/folders/28/gltwgskn4998yb1_d73qtg8h0000gn/T/clone-example114682176/rtree/hilbert/hilbert.go
typedef Wgdef {
	chan Add = [0] of {int};
	chan Wait = [0] of {int};
	int Counter = 0;}



init { 
	Wgdef wg;
	int num_msgs = 0;
	bool state = false;
	int i;
	int runtime_NumCPU4518 = bundlesFromRects_runtime_NumCPU4518;
	int chunks = bundlesFromRects_chunks;
	run wgMonitor(wg);
	wg.Add!chunks;
		for(i : 0.. runtime_NumCPU4518-1) {
		for10: skip;
		

		if
		:: true -> 
			wg.Add!-1;
			goto for10_end
		:: true;
		fi;
		run go_Anonymous0(wg);
		for10_end: skip
	};
	for10_exit: skip;
	wg.Wait?0;
	goto stop_process
stop_process:skip
}

proctype go_Anonymous0(Wgdef wg) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	wg.Add!-1;
	stop_process: skip
}

 /* ================================================================================== */
 /* ================================================================================== */
 /* ================================================================================== */ 
proctype wgMonitor(Wgdef wg) {
bool closed;
int i;
bool state;
do
	:: wg.Add?i ->
		wg.Counter = wg.Counter + i;
		assert(wg.Counter >= 0)
	:: wg.Counter == 0 ->
end: if
		:: wg.Add?i ->
			wg.Counter = wg.Counter + i;
			assert(wg.Counter >= 0)
		:: wg.Wait!0;
	fi
od
}

