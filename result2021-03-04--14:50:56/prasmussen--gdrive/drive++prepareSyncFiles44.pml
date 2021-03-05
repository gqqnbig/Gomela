
// https://github.com/prasmussen/gdrive/blob/31d0829c180795d17e00b7a354fffe4d72be712b/drive/sync.go#L44
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
	run go_prepareSyncFiles()
stop_process:skip
}

proctype go_prepareSyncFiles() {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	Chandef remoteCh;
	Chandef localCh;
	run sync_monitor(localCh);
	run sync_monitor(remoteCh);
	run go_Anonymous1(localCh,remoteCh);
	run go_Anonymous2(localCh,remoteCh);
	

	if
	:: localCh.async_rcv?state,num_msgs;
	:: localCh.sync?state,num_msgs;
	fi;
	

	if
	:: true -> 
		goto stop_process
	:: true;
	fi;
	

	if
	:: remoteCh.async_rcv?state,num_msgs;
	:: remoteCh.sync?state,num_msgs;
	fi;
	

	if
	:: true -> 
		goto stop_process
	:: true;
	fi;
	goto stop_process;
	stop_process: skip
}
proctype go_Anonymous1(Chandef localCh;Chandef remoteCh) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	

	if
	:: localCh.async_send!0;
	:: localCh.sync!false,0 -> 
		localCh.sending?state
	fi;
	stop_process: skip
}
proctype go_Anonymous2(Chandef localCh;Chandef remoteCh) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	

	if
	:: remoteCh.async_send!0;
	:: remoteCh.sync!false,0 -> 
		remoteCh.sending?state
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

