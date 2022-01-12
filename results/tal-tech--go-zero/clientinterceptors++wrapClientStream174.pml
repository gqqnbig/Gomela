// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/tal-tech/go-zero/blob//zrpc/internal/clientinterceptors/tracinginterceptor.go#L174
typedef Chandef {
	chan sync = [0] of {bool};
	chan enq = [0] of {int};
	chan deq = [0] of {bool,int};
	chan sending = [0] of {bool};
	chan rcving = [0] of {bool};
	chan closing = [0] of {bool};
	int size = 0;
	int num_msgs = 0;
	bool closed = false;
}



init { 
	chan child_wrapClientStream1740 = [1] of {int};
	run wrapClientStream174(child_wrapClientStream1740);
	run receiver(child_wrapClientStream1740)
stop_process:skip
}

proctype wrapClientStream174(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_AnonymouswrapClientStream1791750 = [1] of {int};
	Chandef finished_ch;
	Chandef eventsDone_ch;
	Chandef events_ch;
	run sync_monitor(events_ch);
	run sync_monitor(eventsDone_ch);
	run sync_monitor(finished_ch);
	run AnonymouswrapClientStream179175(events_ch,eventsDone_ch,finished_ch,child_AnonymouswrapClientStream1791750);
	run receiver(child_AnonymouswrapClientStream1791750);
	goto stop_process;
	stop_process: skip;
	child!0
}
proctype AnonymouswrapClientStream179175(Chandef events_ch;Chandef eventsDone_ch;Chandef finished_ch;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	do
	:: true -> 
		for10: skip;
		do
		:: events_ch.deq?state,num_msgs -> 
			

			if
			:: true -> 
				

				if
				:: finished_ch.enq!0;
				:: finished_ch.sync!false -> 
					finished_ch.sending!false
				fi;
				goto defer1
			:: true -> 
				

				if
				:: finished_ch.enq!0;
				:: finished_ch.sync!false -> 
					finished_ch.sending!false
				fi;
				goto defer1
			fi;
			break
		:: events_ch.sync?state -> 
			events_ch.rcving!false;
			

			if
			:: true -> 
				

				if
				:: finished_ch.enq!0;
				:: finished_ch.sync!false -> 
					finished_ch.sending!false
				fi;
				goto defer1
			:: true -> 
				

				if
				:: finished_ch.enq!0;
				:: finished_ch.sync!false -> 
					finished_ch.sending!false
				fi;
				goto defer1
			fi;
			break
		:: true -> 
			

			if
			:: finished_ch.enq!0;
			:: finished_ch.sync!false -> 
				finished_ch.sending!false
			fi;
			goto defer1
		od;
		for11_exit: skip;
		for11_end: skip;
		for10_end: skip
	od;
	for10_exit: skip;
		defer1: skip;
	eventsDone_ch.closing!true;
	stop_process: skip;
	child!0
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
  :: ch.num_msgs > 0 -> // cannot send on closed channel
    end4: if
    :: ch.enq?0-> // cannot send on closed channel
      assert(1 == 0)
    :: ch.closing?true -> // cannot close twice a channel
      assert(2 == 0)
    :: ch.rcving?false;
    :: ch.sending?false -> // sending state of channel (closed)
      assert(1 == 0)
    :: ch.deq!true,ch.num_msgs -> 
  		 ch.num_msgs = ch.num_msgs - 1
    fi;
  :: else ->    end5: if
    :: ch.enq?0-> // cannot send on closed channel
      assert(1 == 0)
    :: ch.closing?true -> // cannot close twice a channel
      assert(2 == 0)
    :: ch.rcving?false;
    :: ch.sending?false -> // sending state of channel (closed)
      assert(1 == 0)
    :: ch.sync!true; 
    fi;
  fi;
:: else ->
	if
	:: ch.num_msgs == ch.size ->
		end1: if
		  :: ch.deq!false,ch.num_msgs ->
		    ch.num_msgs = ch.num_msgs - 1
		  :: ch.closing?true -> // closing the channel
		    ch.closed = true
		   :: ch.rcving?false ->
 		    ch.sending?false;
		fi;
	:: ch.num_msgs == 0 -> 
end2:		if
		:: ch.enq?0 -> // a message has been received
			ch.num_msgs = ch.num_msgs + 1
		:: ch.closing?true -> // closing the channel
			ch.closed = true
		:: ch.rcving?false ->
 		    ch.sending?false;
		fi;
		:: else -> 
		end3: if
		  :: ch.enq?0->
		     ch.num_msgs = ch.num_msgs + 1
		  :: ch.deq!false,ch.num_msgs
		     ch.num_msgs = ch.num_msgs - 1
		  :: ch.closing?true -> // closing the channel
		     ch.closed = true
		  :: ch.rcving?false ->
 		    ch.sending?false;
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
  :: ch.enq?0-> // cannot send on closed channel
    assert(1 == 0)
  :: ch.closing?true -> // cannot close twice a channel
    assert(2 == 0)
  :: ch.sending?false -> // sending state of channel (closed)
    assert(1 == 0)
  :: ch.rcving?false;
  :: ch.sync!true; // can always receive on a closed chan
  fi;
:: else -> 
end1: if
    :: ch.rcving?false ->
       ch.sending?false;
    :: ch.closing?true ->
      ch.closed = true
    fi;
fi;
od
stop_process:
}

proctype receiver(chan c) {
c?0
}

