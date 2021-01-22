#define ub_for110_0  -2

// /var/folders/28/gltwgskn4998yb1_d73qtg8h0000gn/T/clone-example000849088/udf/test/test_udf.go
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
	Chandef writeErrC;
	Chandef readErrC;
	int num_msgs = 0;
	bool state = false;
	int i;
	

	if
	:: 1 > 0 -> 
		readErrC.size = 1;
		run AsyncChan(readErrC)
	:: else -> 
		run sync_monitor(readErrC)
	fi;
	

	if
	:: 1 > 0 -> 
		writeErrC.size = 1;
		run AsyncChan(writeErrC)
	:: else -> 
		run sync_monitor(writeErrC)
	fi;
	run go_Anonymous0(readErrC,writeErrC);
	run go_Anonymous1(readErrC,writeErrC);
	

	if
	:: 0 != -2 && ub_for110_0 != -2 -> 
				for(i : 0.. ub_for110_0) {
			for101727: skip;
			do
			:: readErrC.async_rcv?state,num_msgs -> 
				break
			:: readErrC.sync?state,num_msgs -> 
				break
			:: writeErrC.async_rcv?state,num_msgs -> 
				break
			:: writeErrC.sync?state,num_msgs -> 
				break
			od;
			for10_end1727: skip
		};
		for10_exit1727: skip
	:: else -> 
		do
		:: true -> 
			for10: skip;
			do
			:: readErrC.async_rcv?state,num_msgs -> 
				break
			:: readErrC.sync?state,num_msgs -> 
				break
			:: writeErrC.async_rcv?state,num_msgs -> 
				break
			:: writeErrC.sync?state,num_msgs -> 
				break
			od;
			for10_end: skip
		:: true -> 
			break
		od;
		for10_exit: skip
	fi
stop_process:skip
}

proctype go_Anonymous0(Chandef readErrC;Chandef writeErrC) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	

	if
	:: readErrC.async_send!0;
	:: readErrC.sync!false,0 -> 
		readErrC.sending?state
	fi;
	stop_process: skip
}
proctype go_Anonymous1(Chandef readErrC;Chandef writeErrC) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	

	if
	:: writeErrC.async_send!0;
	:: writeErrC.sync!false,0 -> 
		writeErrC.sending?state
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

