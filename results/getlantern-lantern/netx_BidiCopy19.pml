
// /var/folders/28/gltwgskn4998yb1_d73qtg8h0000gn/T/clone-example550807409/archive/src/github.com/getlantern/netx/copy.go
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
	Chandef inErrCh;
	Chandef outErrCh;
	int num_msgs = 0;
	bool state = false;
	int i;
	

	if
	:: 1 > 0 -> 
		outErrCh.size = 1;
		run AsyncChan(outErrCh)
	:: else -> 
		run sync_monitor(outErrCh)
	fi;
	

	if
	:: 1 > 0 -> 
		inErrCh.size = 1;
		run AsyncChan(inErrCh)
	:: else -> 
		run sync_monitor(inErrCh)
	fi;
	run go_doCopy(outErrCh);
	run go_doCopy(inErrCh);
	

	if
	:: outErrCh.async_rcv?state,num_msgs;
	:: outErrCh.sync?state,num_msgs;
	fi;
	

	if
	:: inErrCh.async_rcv?state,num_msgs;
	:: inErrCh.sync?state,num_msgs;
	fi;
	goto stop_process
stop_process:skip
}

proctype go_doCopy(Chandef errCh) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	stop_process: skip;
	

	if
	:: errCh.async_send!0;
	:: errCh.sync!false,0 -> 
		errCh.sending?state
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

