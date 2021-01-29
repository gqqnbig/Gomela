#define doWriteKeys_parallelWriters  3

// /var/folders/28/gltwgskn4998yb1_d73qtg8h0000gn/T/clone-example810845148/cmd/networkdb-test/dbclient/ndbClient.go
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
	chan child_dbclientwaitWriters1 = [0] of {int};
	chan child_dbclientwaitWriters0 = [0] of {int};
	Chandef doneCh;
	int num_msgs = 0;
	bool state = false;
	int i;
	int numberOfKeys=0;
	int parallelWriters = doWriteKeys_parallelWriters;
	

	if
	:: parallelWriters > 0 -> 
		doneCh.size = parallelWriters;
		run AsyncChan(doneCh)
	:: else -> 
		run sync_monitor(doneCh)
	fi;
		for(i : 0.. parallelWriters-1) {
		for10: skip;
		run go_clientWatchTable(doneCh);
		for10_end: skip
	};
	for10_exit: skip;
	run dbclientwaitWriters(doneCh,parallelWriters,child_dbclientwaitWriters0);
	child_dbclientwaitWriters0?0;
		for(i : 0.. parallelWriters-1) {
		for30: skip;
		run go_writeKeysNumber(doneCh,numberOfKeys);
		for30_end: skip
	};
	for30_exit: skip;
	run dbclientwaitWriters(doneCh,parallelWriters,child_dbclientwaitWriters1);
	child_dbclientwaitWriters1?0;
	doneCh.closing!true
stop_process:skip
}

proctype go_clientWatchTable(Chandef doneCh) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	

	if
	:: true -> 
		

		if
		:: doneCh.async_send!0;
		:: doneCh.sync!false,0 -> 
			doneCh.sending?state
		fi
	:: true;
	fi;
	stop_process: skip
}
proctype dbclientwaitWriters(Chandef doneCh;int parallelWriters;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	

	if
	:: 0 != -2 && parallelWriters-1 != -3 -> 
				for(i : 0.. parallelWriters-1) {
			for20789: skip;
			

			if
			:: doneCh.async_rcv?state,num_msgs;
			:: doneCh.sync?state,num_msgs;
			fi;
			for20_end789: skip
		};
		for20_exit789: skip
	:: else -> 
		do
		:: true -> 
			for20: skip;
			

			if
			:: doneCh.async_rcv?state,num_msgs;
			:: doneCh.sync?state,num_msgs;
			fi;
			for20_end: skip
		:: true -> 
			break
		od;
		for20_exit: skip
	fi;
	goto stop_process;
	stop_process: skip;
	child!0
}
proctype go_writeKeysNumber(Chandef doneCh;int number) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	

	if
	:: doneCh.async_send!0;
	:: doneCh.sync!false,0 -> 
		doneCh.sending?state
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


