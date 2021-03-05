
// https://github.com/dropbox/godropbox/blob/52ad444d35023d078d496d305d75511e772f0295/cinterop/server.go#L48
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
	run go_StartServer()
stop_process:skip
}

proctype go_StartServer() {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	Chandef connectionChan;
	Chandef exitChan;
	run sync_monitor(exitChan);
	run sync_monitor(connectionChan);
	run go_messageOnCloseAndRun(exitChan);
	run go_listenAccept(connectionChan);
	do
	:: true -> 
		for20: skip;
		do
		:: exitChan.async_rcv?state,num_msgs -> 
			goto stop_process
		:: exitChan.sync?state,num_msgs -> 
			goto stop_process
		:: connectionChan.async_rcv?state,num_msgs -> 
			break
		:: connectionChan.sync?state,num_msgs -> 
			break
		od;
		for20_end: skip
	od;
	for20_exit: skip;
	stop_process: skip;
	
}
proctype go_messageOnCloseAndRun(Chandef exitChan) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	

	if
	:: exitChan.async_send!0;
	:: exitChan.sync!false,0 -> 
		exitChan.sending?state
	fi;
	stop_process: skip
}
proctype go_listenAccept(Chandef newConnection) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	do
	:: true -> 
		for10: skip;
		

		if
		:: true -> 
			

			if
			:: newConnection.async_send!0;
			:: newConnection.sync!false,0 -> 
				newConnection.sending?state
			fi
		fi;
		for10_end: skip
	od;
	for10_exit: skip;
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

