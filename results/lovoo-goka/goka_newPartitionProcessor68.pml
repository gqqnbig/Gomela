#define newPartitionProcessor_opts_partitionChannelSize  3

// /var/folders/28/gltwgskn4998yb1_d73qtg8h0000gn/T/clone-example855454519/partition_processor.go
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
	Chandef partProc_updateStats;
	Chandef partProc_responseStats;
	Chandef partProc_requestStats;
	Chandef partProc_input;
	int num_msgs = 0;
	bool state = false;
	int i;
	int opts_partitionChannelSize = newPartitionProcessor_opts_partitionChannelSize;
	

	if
	:: opts_partitionChannelSize > 0 -> 
		partProc_input.size = opts_partitionChannelSize;
		run AsyncChan(partProc_input)
	:: else -> 
		run sync_monitor(partProc_input)
	fi;
	run sync_monitor(partProc_requestStats);
	

	if
	:: 1 > 0 -> 
		partProc_responseStats.size = 1;
		run AsyncChan(partProc_responseStats)
	:: else -> 
		run sync_monitor(partProc_responseStats)
	fi;
	

	if
	:: 10 > 0 -> 
		partProc_updateStats.size = 10;
		run AsyncChan(partProc_updateStats)
	:: else -> 
		run sync_monitor(partProc_updateStats)
	fi;
	goto stop_process
stop_process:skip
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

