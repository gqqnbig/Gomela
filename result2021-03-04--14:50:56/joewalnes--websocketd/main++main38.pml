#define main_config_Addr  3

// https://github.com/joewalnes/websocketd/blob/2190c8ab4c6c615180183b3abc59c995e333fb66/main.go#L38
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
	run go_main()
stop_process:skip
}

proctype go_main() {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	Chandef rejects;
	int config_Addr = main_config_Addr;
	

	if
	:: 1 > 0 -> 
		rejects.size = 1;
		run AsyncChan(rejects)
	:: else -> 
		run sync_monitor(rejects)
	fi;
		for(i : 0.. config_Addr-1) {
		for10: skip;
		run go_Anonymous1(rejects);
		

		if
		:: true -> 
			run go_Anonymous2(rejects)
		:: true;
		fi;
		for10_end: skip
	};
	for10_exit: skip;
	

	if
	:: rejects.async_rcv?state,num_msgs;
	:: rejects.sync?state,num_msgs;
	fi;
	stop_process: skip
}
proctype go_Anonymous1(Chandef rejects) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	

	if
	:: true -> 
		

		if
		:: rejects.async_send!0;
		:: rejects.sync!false,0 -> 
			rejects.sending?state
		fi
	:: true -> 
		

		if
		:: rejects.async_send!0;
		:: rejects.sync!false,0 -> 
			rejects.sending?state
		fi
	fi;
	stop_process: skip
}
proctype go_Anonymous2(Chandef rejects) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	

	if
	:: rejects.async_send!0;
	:: rejects.sync!false,0 -> 
		rejects.sending?state
	fi;
	stop_process: skip
}
proctype go_Anonymous3(Chandef rejects) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	

	if
	:: true -> 
		

		if
		:: rejects.async_send!0;
		:: rejects.sync!false,0 -> 
			rejects.sending?state
		fi
	:: true -> 
		

		if
		:: rejects.async_send!0;
		:: rejects.sync!false,0 -> 
			rejects.sending?state
		fi
	fi;
	stop_process: skip
}
proctype go_Anonymous4(Chandef rejects) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	

	if
	:: rejects.async_send!0;
	:: rejects.sync!false,0 -> 
		rejects.sending?state
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

