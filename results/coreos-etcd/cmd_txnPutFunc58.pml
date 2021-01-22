#define txnPutFunc_totalClients  3
#define txnPutFunc_clients  1

// /var/folders/28/gltwgskn4998yb1_d73qtg8h0000gn/T/clone-example061874643/tools/benchmark/cmd/txn_put.go
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
	Chandef requests;
	int num_msgs = 0;
	bool state = false;
	int i;
	int clients = txnPutFunc_clients;
	int totalClients = txnPutFunc_totalClients;
	

	if
	:: totalClients > 0 -> 
		requests.size = totalClients;
		run AsyncChan(requests)
	:: else -> 
		run sync_monitor(requests)
	fi;
		for(i : 0.. clients-1) {
		for10: skip;
		run go_Anonymous0(requests);
		for10_end: skip
	};
	for10_exit: skip;
	run go_Anonymous1(requests)
stop_process:skip
}

proctype go_Anonymous0(Chandef requests) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	do
	:: true -> 
		

		if
		:: requests.async_rcv?state,num_msgs;
		:: requests.sync?state,num_msgs;
		fi;
		

		if
		:: state && num_msgs <= 0 -> 
			break
		:: else -> 
			for11: skip;
			for11_end: skip
		fi
	od;
	for11_exit: skip;
	stop_process: skip
}
proctype go_Anonymous1(Chandef requests) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	int txnPutTotal = -2;
	

	if
	:: 0 != -2 && txnPutTotal-1 != -3 -> 
				for(i : 0.. txnPutTotal-1) {
			for20141: skip;
			

			if
			:: requests.async_send!0;
			:: requests.sync!false,0 -> 
				requests.sending?state
			fi;
			for20_end141: skip
		};
		for20_exit141: skip
	:: else -> 
		do
		:: true -> 
			for20: skip;
			

			if
			:: requests.async_send!0;
			:: requests.sync!false,0 -> 
				requests.sending?state
			fi;
			for20_end: skip
		:: true -> 
			break
		od;
		for20_exit: skip
	fi;
	requests.closing!true;
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

