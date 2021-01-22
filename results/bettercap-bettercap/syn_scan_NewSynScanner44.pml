
// /var/folders/28/gltwgskn4998yb1_d73qtg8h0000gn/T/clone-example235033259/modules/syn_scan/syn_scan.go
typedef Wgdef {
	chan Add = [0] of {int};
	chan Wait = [0] of {int};
	int Counter = 0;}



init { 
	Wgdef mod_bannerQueue_done;
	Wgdef mod_bannerQueue_jobs;
	Wgdef mod_scanQueue_done;
	Wgdef mod_scanQueue_jobs;
	int num_msgs = 0;
	bool state = false;
	int i;
	run wgMonitor(mod_scanQueue_jobs);
	run wgMonitor(mod_scanQueue_done);
	run wgMonitor(mod_bannerQueue_jobs);
	run wgMonitor(mod_bannerQueue_done);
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

