#define MoveUpReplicas_replicas  1

// /var/folders/28/gltwgskn4998yb1_d73qtg8h0000gn/T/clone-example123082596/go/inst/instance_topology.go
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
	Chandef barrier;
	Chandef replicaMutex;
	int num_msgs = 0;
	bool state = false;
	int i;
	int replicas = MoveUpReplicas_replicas;
	

	if
	:: 1 > 0 -> 
		replicaMutex.size = 1;
		run AsyncChan(replicaMutex)
	:: else -> 
		run sync_monitor(replicaMutex)
	fi;
	

	if
	:: true -> 
		goto stop_process
	:: true;
	fi;
	

	if
	:: true -> 
		goto stop_process
	:: true;
	fi;
	

	if
	:: true -> 
		goto stop_process
	:: true;
	fi;
	

	if
	:: true -> 
		goto stop_process
	:: true;
	fi;
	

	if
	:: true -> 
		goto stop_process
	:: true;
	fi;
	

	if
	:: true -> 
		goto stop_process
	:: true;
	fi;
	

	if
	:: true -> 
		goto Cleanup
	fi;
	

	if
	:: true -> 
		goto Cleanup
	:: true;
	fi;
	run sync_monitor(barrier);
		for(i : 0.. replicas-1) {
		for20: skip;
		run go_Anonymous0(replicaMutex,barrier);
		for20_end: skip
	};
	for20_exit: skip;
	

	if
	:: replicas-1 != -3 -> 
				for(i : 0.. replicas-1) {
			for30: skip;
			

			if
			:: barrier.async_rcv?state,num_msgs;
			:: barrier.sync?state,num_msgs;
			fi;
			for30_end: skip
		};
		for30_exit: skip
	:: else -> 
		do
		:: true -> 
			for301625: skip;
			

			if
			:: barrier.async_rcv?state,num_msgs;
			:: barrier.sync?state,num_msgs;
			fi;
			for30_end1625: skip
		:: true -> 
			break
		od;
		for30_exit1625: skip
	fi;
	Cleanup: skip;
	;
	

	if
	:: true -> 
		goto stop_process
	:: true;
	fi;
	

	if
	:: true -> 
		goto stop_process
	:: true;
	fi;
	goto stop_process
stop_process:skip
}

proctype go_Anonymous0(Chandef replicaMutex;Chandef barrier) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	

	if
	:: replicaMutex.async_send!0;
	:: replicaMutex.sync!false,0 -> 
		replicaMutex.sending?state
	fi;
	

	if
	:: replicaMutex.async_rcv?state,num_msgs;
	:: replicaMutex.sync?state,num_msgs;
	fi;
	stop_process: skip;
	

	if
	:: barrier.async_send!0;
	:: barrier.sync!false,0 -> 
		barrier.sending?state
	fi
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

