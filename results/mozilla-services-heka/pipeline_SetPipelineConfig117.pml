
// /var/folders/28/gltwgskn4998yb1_d73qtg8h0000gn/T/clone-example323682997/pipeline/stat_accum_input.go
typedef Wgdef {
	chan Add = [0] of {int};
	chan Wait = [0] of {int};
	int Counter = 0;}



init { 
	Wgdef sm_pConfig_inputsWg;
	Wgdef sm_pConfig_decodersWg;
	Wgdef sm_pConfig_filtersWg;
	int num_msgs = 0;
	bool state = false;
	int i;
	run wgMonitor(sm_pConfig_filtersWg);
	run wgMonitor(sm_pConfig_decodersWg);
	run wgMonitor(sm_pConfig_inputsWg)
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

