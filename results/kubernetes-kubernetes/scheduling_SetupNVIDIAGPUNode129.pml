
// /var/folders/28/gltwgskn4998yb1_d73qtg8h0000gn/T/clone-example090168717/test/e2e/scheduling/nvidia-gpus.go
typedef Wgdef {
	chan Add = [0] of {int};
	chan Wait = [0] of {int};
	int Counter = 0;}



init { 
	Wgdef rsgather_workerWg;
	int num_msgs = 0;
	bool state = false;
	int i;
	

	if
	:: true -> 
		run wgMonitor(rsgather_workerWg)
	:: true;
	fi;
	goto stop_process
stop_process:skip
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

