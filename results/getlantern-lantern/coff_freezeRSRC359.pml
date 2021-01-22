
// /var/folders/28/gltwgskn4998yb1_d73qtg8h0000gn/T/clone-example550807409/archive/src/github.com/akavel/rsrc/coff/coff.go
typedef Chandef {
	chan sync = [0] of {bool,int};
	chan async_send = [0] of {int};
	chan async_rcv = [0] of {bool,int};
	chan sending = [0] of {int};
	chan closing = [0] of {bool};
	int size = 0;
	int num_msgs = 0;
	bool closed = false;
}



init { 
	Chandef leafwalker;
	int num_msgs = 0;
	bool state = false;
	int i;
	run sync_monitor(leafwalker);
	run go_Anonymous0(leafwalker)
stop_process:skip
}

proctype go_Anonymous0(Chandef leafwalker) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	int dir2_DirEntries=3;
	int dir1_Dirs=3;
	int coff_Dir_Dirs=3;
	

	if
	:: coff_Dir_Dirs-1 != -3 -> 
				for(i : 0.. coff_Dir_Dirs-1) {
			for10: skip;
			

			if
			:: dir1_Dirs-1 != -3 -> 
								for(i : 0.. dir1_Dirs-1) {
					for11: skip;
					

					if
					:: dir2_DirEntries-1 != -3 -> 
												for(i : 0.. dir2_DirEntries-1) {
							for12: skip;
							

							if
							:: leafwalker.async_send!0;
							:: leafwalker.sync!false,0 -> 
								leafwalker.sending?state
							fi;
							for12_end: skip
						};
						for12_exit: skip
					:: else -> 
						do
						:: true -> 
							for12114: skip;
							

							if
							:: leafwalker.async_send!0;
							:: leafwalker.sync!false,0 -> 
								leafwalker.sending?state
							fi;
							for12_end114: skip
						:: true -> 
							break
						od;
						for12_exit114: skip
					fi;
					for11_end: skip
				};
				for11_exit: skip
			:: else -> 
				do
				:: true -> 
					for11115: skip;
					

					if
					:: dir2_DirEntries-1 != -3 -> 
												for(i : 0.. dir2_DirEntries-1) {
							for12115: skip;
							

							if
							:: leafwalker.async_send!0;
							:: leafwalker.sync!false,0 -> 
								leafwalker.sending?state
							fi;
							for12_end115: skip
						};
						for12_exit115: skip
					:: else -> 
						do
						:: true -> 
							for12114115: skip;
							

							if
							:: leafwalker.async_send!0;
							:: leafwalker.sync!false,0 -> 
								leafwalker.sending?state
							fi;
							for12_end114115: skip
						:: true -> 
							break
						od;
						for12_exit114115: skip
					fi;
					for11_end115: skip
				:: true -> 
					break
				od;
				for11_exit115: skip
			fi;
			for10_end: skip
		};
		for10_exit: skip
	:: else -> 
		do
		:: true -> 
			for10116: skip;
			

			if
			:: dir1_Dirs-1 != -3 -> 
								for(i : 0.. dir1_Dirs-1) {
					for11116: skip;
					

					if
					:: dir2_DirEntries-1 != -3 -> 
												for(i : 0.. dir2_DirEntries-1) {
							for12116: skip;
							

							if
							:: leafwalker.async_send!0;
							:: leafwalker.sync!false,0 -> 
								leafwalker.sending?state
							fi;
							for12_end116: skip
						};
						for12_exit116: skip
					:: else -> 
						do
						:: true -> 
							for12114116: skip;
							

							if
							:: leafwalker.async_send!0;
							:: leafwalker.sync!false,0 -> 
								leafwalker.sending?state
							fi;
							for12_end114116: skip
						:: true -> 
							break
						od;
						for12_exit114116: skip
					fi;
					for11_end116: skip
				};
				for11_exit116: skip
			:: else -> 
				do
				:: true -> 
					for11115116: skip;
					

					if
					:: dir2_DirEntries-1 != -3 -> 
												for(i : 0.. dir2_DirEntries-1) {
							for12115116: skip;
							

							if
							:: leafwalker.async_send!0;
							:: leafwalker.sync!false,0 -> 
								leafwalker.sending?state
							fi;
							for12_end115116: skip
						};
						for12_exit115116: skip
					:: else -> 
						do
						:: true -> 
							for12114115116: skip;
							

							if
							:: leafwalker.async_send!0;
							:: leafwalker.sync!false,0 -> 
								leafwalker.sending?state
							fi;
							for12_end114115116: skip
						:: true -> 
							break
						od;
						for12_exit114115116: skip
					fi;
					for11_end115116: skip
				:: true -> 
					break
				od;
				for11_exit115116: skip
			fi;
			for10_end116: skip
		:: true -> 
			break
		od;
		for10_exit116: skip
	fi;
	stop_process: skip
}

 /* ================================================================================== */
 /* ================================================================================== */
 /* ================================================================================== */ 
proctype AsyncChan(Chandef ch) {
do
:: true ->
if
:: ch.closed -> 
end: if
  :: ch.async_send?0-> // cannot send on closed channel
    assert(false)
  :: ch.closing?true -> // cannot close twice a channel
    assert(false)
  :: ch.sending!true -> // sending state of channel (closed)
    assert(false)
  :: ch.sync!true,ch.num_msgs -> // can always receive on a closed chan
		 ch.num_msgs = ch.num_msgs - 1
  fi;
:: else ->
	if
	:: ch.num_msgs == ch.size ->
		end1: if
		  :: ch.async_rcv!false,ch.num_msgs ->
		    ch.num_msgs = ch.num_msgs - 1
		  :: ch.closing?true -> // closing the channel
		      ch.closed = true
		  :: ch.sending!false;
		fi;
	:: ch.num_msgs == 0 -> 
end2:		if
		:: ch.async_send?0 -> // a message has been received
			ch.num_msgs = ch.num_msgs + 1
		:: ch.closing?true -> // closing the channel
			ch.closed = true
		:: ch.sending!false;
		fi;
		:: else -> 
		end3: if
		  :: ch.async_send?0->
		     ch.num_msgs = ch.num_msgs + 1
		  :: ch.async_rcv!false,ch.num_msgs
		     ch.num_msgs = ch.num_msgs - 1
		  :: ch.closing?true -> // closing the channel
		      ch.closed = true
		  :: ch.sending!false;  // sending channel is open
		fi;
	fi;
fi;
od;
}

proctype sync_monitor(Chandef ch) {
do
:: true
if
:: ch.closed ->
end: if
  :: ch.async_send?0-> // cannot send on closed channel
    assert(false)
  :: ch.closing?true -> // cannot close twice a channel
    assert(false)
  :: ch.sending!true -> // sending state of channel (closed)
    assert(false)
  :: ch.sync!true,0; // can always receive on a closed chan
  fi;
:: else -> 
end1: if
    :: ch.sending!false;
    :: ch.closing?true ->
      ch.closed = true
    fi;
fi;
od
stop_process:
}


