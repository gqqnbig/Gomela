// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/tal-tech/go-zero/blob//rest/handler/gunziphandler_test.go#L17
typedef Wgdef {
	chan update = [0] of {int};
	chan wait = [0] of {int};
	int Counter = 0;}



init { 
	chan child_TestGunzipHandler170 = [1] of {int};
	run TestGunzipHandler17(child_TestGunzipHandler170);
	run receiver(child_TestGunzipHandler170)
stop_process:skip
}

proctype TestGunzipHandler17(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	Wgdef wg;
	run wgMonitor(wg);
	wg.update!1;
	wg.wait?0;
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

