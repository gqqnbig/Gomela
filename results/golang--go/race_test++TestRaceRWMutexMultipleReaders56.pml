// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/golang/go/blob//runtime/race/testdata/rwmutex_test.go#L56
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
typedef Mutexdef {
	chan Lock = [0] of {bool};
	chan Unlock = [0] of {bool};
	chan RLock = [0] of {bool};
	chan RUnlock = [0] of {bool};
	int Counter = 0;}



init { 
	chan child_TestRaceRWMutexMultipleReaders560 = [1] of {int};
	run TestRaceRWMutexMultipleReaders56(child_TestRaceRWMutexMultipleReaders560);
	run receiver(child_TestRaceRWMutexMultipleReaders560)
stop_process:skip
}

proctype TestRaceRWMutexMultipleReaders56(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_AnonymousTestRaceRWMutexMultipleReaders81593 = [1] of {int};
	chan child_AnonymousTestRaceRWMutexMultipleReaders75592 = [1] of {int};
	chan child_AnonymousTestRaceRWMutexMultipleReaders69591 = [1] of {int};
	chan child_AnonymousTestRaceRWMutexMultipleReaders60590 = [1] of {int};
	Chandef ch_ch;
	Mutexdef mu;
	run mutexMonitor(mu);
	

	if
	:: 4 > 0 -> 
		ch_ch.size = 4;
		run AsyncChan(ch_ch)
	:: else -> 
		run sync_monitor(ch_ch)
	fi;
	run AnonymousTestRaceRWMutexMultipleReaders6059(ch_ch,mu,child_AnonymousTestRaceRWMutexMultipleReaders60590);
	run receiver(child_AnonymousTestRaceRWMutexMultipleReaders60590);
	run AnonymousTestRaceRWMutexMultipleReaders6959(ch_ch,mu,child_AnonymousTestRaceRWMutexMultipleReaders69591);
	run receiver(child_AnonymousTestRaceRWMutexMultipleReaders69591);
	run AnonymousTestRaceRWMutexMultipleReaders7559(ch_ch,mu,child_AnonymousTestRaceRWMutexMultipleReaders75592);
	run receiver(child_AnonymousTestRaceRWMutexMultipleReaders75592);
	run AnonymousTestRaceRWMutexMultipleReaders8159(ch_ch,mu,child_AnonymousTestRaceRWMutexMultipleReaders81593);
	run receiver(child_AnonymousTestRaceRWMutexMultipleReaders81593);
	

	if
	:: ch_ch.deq?state,num_msgs;
	:: ch_ch.sync?state -> 
		ch_ch.rcving!false
	fi;
	

	if
	:: ch_ch.deq?state,num_msgs;
	:: ch_ch.sync?state -> 
		ch_ch.rcving!false
	fi;
	

	if
	:: ch_ch.deq?state,num_msgs;
	:: ch_ch.sync?state -> 
		ch_ch.rcving!false
	fi;
	

	if
	:: ch_ch.deq?state,num_msgs;
	:: ch_ch.sync?state -> 
		ch_ch.rcving!false
	fi;
	stop_process: skip;
	child!0
}
proctype AnonymousTestRaceRWMutexMultipleReaders6059(Chandef ch_ch;Mutexdef mu;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	mu.Lock!false;
	

	if
	:: ch_ch.enq!0;
	:: ch_ch.sync!false -> 
		ch_ch.sending!false
	fi;
		defer1: skip;
	mu.Unlock!false;
	stop_process: skip;
	child!0
}
proctype AnonymousTestRaceRWMutexMultipleReaders6959(Chandef ch_ch;Mutexdef mu;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	mu.RLock!false;
	mu.RUnlock!false;
	

	if
	:: ch_ch.enq!0;
	:: ch_ch.sync!false -> 
		ch_ch.sending!false
	fi;
	stop_process: skip;
	child!0
}
proctype AnonymousTestRaceRWMutexMultipleReaders7559(Chandef ch_ch;Mutexdef mu;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	mu.RLock!false;
	mu.RUnlock!false;
	

	if
	:: ch_ch.enq!0;
	:: ch_ch.sync!false -> 
		ch_ch.sending!false
	fi;
	stop_process: skip;
	child!0
}
proctype AnonymousTestRaceRWMutexMultipleReaders8159(Chandef ch_ch;Mutexdef mu;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	mu.RLock!false;
	mu.RUnlock!false;
	

	if
	:: ch_ch.enq!0;
	:: ch_ch.sync!false -> 
		ch_ch.sending!false
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

proctype mutexMonitor(Mutexdef m) {
bool locked = false;
do
:: true ->
	if
	:: m.Counter > 0 ->
		if 
		:: m.RUnlock?false -> 
			m.Counter = m.Counter - 1;
		:: m.RLock?false -> 
			m.Counter = m.Counter + 1;
		fi;
	:: locked ->
		m.Unlock?false;
		locked = false;
	:: else ->	 end:	if
		:: m.Unlock?false ->
			assert(0==32);		:: m.Lock?false ->
			locked =true;
		:: m.RUnlock?false ->
			assert(0==32);		:: m.RLock?false ->
			m.Counter = m.Counter + 1;
		fi;
	fi;
od
}

proctype receiver(chan c) {
c?0
}

