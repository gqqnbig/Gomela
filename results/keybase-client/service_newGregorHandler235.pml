
// /var/folders/28/gltwgskn4998yb1_d73qtg8h0000gn/T/clone-example587037361/go/service/gregor.go
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
	Chandef gh_forcePingCh;
	Chandef gh_pushStateCh;
	Chandef gh_replayCh;
	Chandef gh_connectHappened;
	Chandef gh_broadcastCh;
	int num_msgs = 0;
	bool state = false;
	int i;
	

	if
	:: 10000 > 0 -> 
		gh_broadcastCh.size = 10000;
		run AsyncChan(gh_broadcastCh)
	:: else -> 
		run sync_monitor(gh_broadcastCh)
	fi;
	run sync_monitor(gh_connectHappened);
	

	if
	:: 10 > 0 -> 
		gh_replayCh.size = 10;
		run AsyncChan(gh_replayCh)
	:: else -> 
		run sync_monitor(gh_replayCh)
	fi;
	

	if
	:: 100 > 0 -> 
		gh_pushStateCh.size = 100;
		run AsyncChan(gh_pushStateCh)
	:: else -> 
		run sync_monitor(gh_pushStateCh)
	fi;
	

	if
	:: 5 > 0 -> 
		gh_forcePingCh.size = 5;
		run AsyncChan(gh_forcePingCh)
	:: else -> 
		run sync_monitor(gh_forcePingCh)
	fi;
	goto stop_process
stop_process:skip
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

