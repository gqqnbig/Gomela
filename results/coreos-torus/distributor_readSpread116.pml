#define readSpread_peers_Replication  0
#define not_found_peers_Peers12120  0

// /var/folders/28/gltwgskn4998yb1_d73qtg8h0000gn/T/clone-example336840242/distributor/storage.go
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
	Chandef errch;
	Chandef resch;
	int num_msgs = 0;
	bool state = false;
	int i;
	int peers_Replication = readSpread_peers_Replication;
	run sync_monitor(resch);
	

	if
	:: peers_Replication > 0 -> 
		errch.size = peers_Replication;
		run AsyncChan(errch)
	:: else -> 
		run sync_monitor(errch)
	fi;
		for(i : 0.. not_found_peers_Peers12120-1) {
		for10: skip;
		

		if
		:: true -> 
			goto for10_end
		:: true;
		fi;
		run go_Anonymous0(resch,errch);
		for10_end: skip
	};
	for10_exit: skip;
	do
	:: true -> 
		for20: skip;
		do
		:: resch.async_rcv?state,num_msgs -> 
			goto stop_process
		:: resch.sync?state,num_msgs -> 
			goto stop_process
		:: errch.async_rcv?state,num_msgs -> 
			

			if
			:: true -> 
				goto stop_process
			:: true;
			fi;
			break
		:: errch.sync?state,num_msgs -> 
			

			if
			:: true -> 
				goto stop_process
			:: true;
			fi;
			break
		od;
		for20_end: skip
	od;
	for20_exit: skip
stop_process:skip
}

proctype go_Anonymous0(Chandef resch;Chandef errch) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	

	if
	:: true -> 
		goto stop_process
	:: true;
	fi;
	

	if
	:: errch.async_send!0;
	:: errch.sync!false,0 -> 
		errch.sending?state
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

