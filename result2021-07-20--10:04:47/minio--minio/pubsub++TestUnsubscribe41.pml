// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/minio/minio/blob/e948e7cdf65028f7a8545d1a05c2baea75198bd0/pkg/pubsub/pubsub_test.go#L41
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
	chan child_TestUnsubscribe410 = [1] of {int};
	run TestUnsubscribe41(child_TestUnsubscribe410);
	run receiver(child_TestUnsubscribe410)
stop_process:skip
}

proctype TestUnsubscribe41(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_Subscribe561 = [1] of {int};
	chan child_Subscribe560 = [1] of {int};
	Chandef doneCh2_ch;
	Chandef doneCh1_ch;
	Chandef ch2_ch;
	Chandef ch1_ch;
	

	if
	:: 1 > 0 -> 
		ch1_ch.size = 1;
		run AsyncChan(ch1_ch)
	:: else -> 
		run sync_monitor(ch1_ch)
	fi;
	

	if
	:: 1 > 0 -> 
		ch2_ch.size = 1;
		run AsyncChan(ch2_ch)
	:: else -> 
		run sync_monitor(ch2_ch)
	fi;
	run sync_monitor(doneCh1_ch);
	run sync_monitor(doneCh2_ch);
	run Subscribe56(ch1_ch,doneCh1_ch,child_Subscribe560);
	child_Subscribe560?0;
	run Subscribe56(ch2_ch,doneCh2_ch,child_Subscribe561);
	child_Subscribe561?0;
	doneCh1_ch.closing!true;
	doneCh2_ch.closing!true;
	stop_process: skip;
	child!0
}
proctype Subscribe56(Chandef subCh_ch;Chandef doneCh_ch;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_AnonymousSubscribe64560 = [1] of {int};
	run AnonymousSubscribe6456(subCh_ch,doneCh_ch,child_AnonymousSubscribe64560);
	run receiver(child_AnonymousSubscribe64560);
	stop_process: skip;
	child!0
}
proctype AnonymousSubscribe6456(Chandef subCh_ch;Chandef doneCh_ch;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	int var_ps_subsps_subs = -2; // opt var_ps_subsps_subs
	

	if
	:: doneCh_ch.deq?state,num_msgs;
	:: doneCh_ch.sync?state -> 
		doneCh_ch.rcving!false
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

