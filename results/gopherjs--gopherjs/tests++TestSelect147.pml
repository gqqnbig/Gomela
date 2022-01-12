// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/gopherjs/gopherjs/blob//tests/goroutine_test.go#L147
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
	chan child_TestSelect1470 = [1] of {int};
	run TestSelect147(child_TestSelect1470);
	run receiver(child_TestSelect1470)
stop_process:skip
}

proctype TestSelect147(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_AnonymousTestSelect1581491 = [1] of {int};
	chan child_AnonymousTestSelect1521490 = [1] of {int};
	Chandef c_ch;
	Chandef b_ch;
	Chandef a_ch;
	run sync_monitor(a_ch);
	run sync_monitor(b_ch);
	run sync_monitor(c_ch);
	run AnonymousTestSelect152149(a_ch,b_ch,c_ch,child_AnonymousTestSelect1521490);
	run receiver(child_AnonymousTestSelect1521490);
	run AnonymousTestSelect158149(a_ch,b_ch,c_ch,child_AnonymousTestSelect1581491);
	run receiver(child_AnonymousTestSelect1581491);
	

	if
	:: c_ch.deq?state,num_msgs;
	:: c_ch.sync?state -> 
		c_ch.rcving!false
	fi;
	stop_process: skip;
	child!0
}
proctype AnonymousTestSelect152149(Chandef a_ch;Chandef b_ch;Chandef c_ch;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	do
	:: a_ch.deq?state,num_msgs -> 
		break
	:: a_ch.sync?state -> 
		a_ch.rcving!false;
		break
	:: b_ch.deq?state,num_msgs -> 
		break
	:: b_ch.sync?state -> 
		b_ch.rcving!false;
		break
	od;
	for10_exit: skip;
	for10_end: skip;
	stop_process: skip;
	child!0
}
proctype AnonymousTestSelect158149(Chandef a_ch;Chandef b_ch;Chandef c_ch;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	

	if
	:: a_ch.enq!0;
	:: a_ch.sync!false -> 
		a_ch.sending!false
	fi;
	do
	:: b_ch.enq!0 -> 
		break
	:: b_ch.sync!false -> 
		b_ch.sending!false;
		break
	:: true -> 
		break
	od;
	for20_exit: skip;
	for20_end: skip;
	

	if
	:: c_ch.enq!0;
	:: c_ch.sync!false -> 
		c_ch.sending!false
	fi;
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

