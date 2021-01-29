
// /var/folders/28/gltwgskn4998yb1_d73qtg8h0000gn/T/clone-example818916996/agent/sighandlers/termination_handler.go
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
	Chandef stateSaved;
	Chandef engineDisabled;
	int num_msgs = 0;
	bool state = false;
	int i;
	run sync_monitor(engineDisabled);
	run go_Anonymous0(engineDisabled);
	

	if
	:: engineDisabled.async_rcv?state,num_msgs;
	:: engineDisabled.sync?state,num_msgs;
	fi;
	run sync_monitor(stateSaved);
	run go_Anonymous1(engineDisabled,stateSaved);
	

	if
	:: stateSaved.async_rcv?state,num_msgs;
	:: stateSaved.sync?state,num_msgs;
	fi;
	

	if
	:: true -> 
		goto stop_process
	:: true;
	fi;
	goto stop_process
stop_process:skip
}

proctype go_Anonymous0(Chandef engineDisabled) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	

	if
	:: engineDisabled.async_send!0;
	:: engineDisabled.sync!false,0 -> 
		engineDisabled.sending?state
	fi;
	stop_process: skip
}
proctype go_Anonymous1(Chandef engineDisabled;Chandef stateSaved) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	

	if
	:: stateSaved.async_send!0;
	:: stateSaved.sync!false,0 -> 
		stateSaved.sending?state
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

