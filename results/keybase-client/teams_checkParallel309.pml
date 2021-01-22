
// /var/folders/28/gltwgskn4998yb1_d73qtg8h0000gn/T/clone-example587037361/go/teams/proofs.go
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
	Chandef queue;
	int num_msgs = 0;
	bool state = false;
	int i;
	int p_proofs=1;
	run sync_monitor(queue);
	run go_Anonymous0(queue,p_proofs);
	goto stop_process
stop_process:skip
}

proctype go_Anonymous0(Chandef queue;int p_proofs) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	int v=3;
	

	if
	:: p_proofs-1 != -3 -> 
				for(i : 0.. p_proofs-1) {
			for20: skip;
			

			if
			:: v-1 != -3 -> 
								for(i : 0.. v-1) {
					for21: skip;
					

					if
					:: queue.async_send!0;
					:: queue.sync!false,0 -> 
						queue.sending?state
					fi;
					for21_end: skip
				};
				for21_exit: skip
			:: else -> 
				do
				:: true -> 
					for21802: skip;
					

					if
					:: queue.async_send!0;
					:: queue.sync!false,0 -> 
						queue.sending?state
					fi;
					for21_end802: skip
				:: true -> 
					break
				od;
				for21_exit802: skip
			fi;
			for20_end: skip
		};
		for20_exit: skip
	:: else -> 
		do
		:: true -> 
			for20803: skip;
			

			if
			:: v-1 != -3 -> 
								for(i : 0.. v-1) {
					for21803: skip;
					

					if
					:: queue.async_send!0;
					:: queue.sync!false,0 -> 
						queue.sending?state
					fi;
					for21_end803: skip
				};
				for21_exit803: skip
			:: else -> 
				do
				:: true -> 
					for21802803: skip;
					

					if
					:: queue.async_send!0;
					:: queue.sync!false,0 -> 
						queue.sending?state
					fi;
					for21_end802803: skip
				:: true -> 
					break
				od;
				for21_exit802803: skip
			fi;
			for20_end803: skip
		:: true -> 
			break
		od;
		for20_exit803: skip
	fi;
	queue.closing!true;
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


