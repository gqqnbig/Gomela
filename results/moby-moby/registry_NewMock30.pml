
// /var/folders/28/gltwgskn4998yb1_d73qtg8h0000gn/T/clone-example277733731/testutil/registry/registry_mock.go
typedef Wgdef {
	chan Add = [0] of {int};
	chan Wait = [0] of {int};
	int Counter = 0;}



init { 
	Wgdef testReg_server_wg;
	Wgdef ts_wg;
	int num_msgs = 0;
	bool state = false;
	int i;
	run wgMonitor(ts_wg);
	run wgMonitor(testReg_server_wg);
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

