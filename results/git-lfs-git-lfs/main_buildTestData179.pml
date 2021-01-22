
// /var/folders/28/gltwgskn4998yb1_d73qtg8h0000gn/T/clone-example289104344/t/git-lfs-test-server-api/main.go
typedef Wgdef {
	chan Add = [0] of {int};
	chan Wait = [0] of {int};
	int Counter = 0;}



init { 
	Wgdef uploadQueue_errorwait;
	Wgdef uploadQueue_collectorWait;
	int num_msgs = 0;
	bool state = false;
	int i;
	run wgMonitor(uploadQueue_collectorWait);
	run wgMonitor(uploadQueue_errorwait);
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

