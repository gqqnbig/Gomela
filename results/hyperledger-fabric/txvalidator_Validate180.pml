
// /var/folders/28/gltwgskn4998yb1_d73qtg8h0000gn/T/clone-example738497340/core/committer/txvalidator/v20/validator.go
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
	Chandef results;
	int num_msgs = 0;
	bool state = false;
	int i;
	int block_Data_Data = -2;
	run sync_monitor(results);
	run go_Anonymous0(results,block_Data_Data);
	

	if
	:: true -> 
		goto stop_process
	:: true;
	fi;
	

	if
	:: true -> 
		goto stop_process
	:: true;
	fi;
	goto stop_process
stop_process:skip
}

proctype go_Anonymous0(Chandef results;int block_Data_Data) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
		for(i : 0.. block_Data_Data-1) {
		for10: skip;
		run go_Anonymous1(results);
		for10_end: skip
	};
	for10_exit: skip;
	stop_process: skip
}
proctype go_Anonymous1(Chandef results) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_validateTx0 = [0] of {int};
	run validateTx(results,child_validateTx0);
	child_validateTx0?0;
	stop_process: skip
}
proctype validateTx(Chandef results;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	

	if
	:: true -> 
		

		if
		:: results.async_send!0;
		:: results.sync!false,0 -> 
			results.sending?state
		fi;
		goto stop_process
	:: true;
	fi;
	

	if
	:: true -> 
		

		if
		:: results.async_send!0;
		:: results.sync!false,0 -> 
			results.sending?state
		fi;
		goto stop_process
	:: true -> 
		

		if
		:: true -> 
			

			if
			:: true -> 
				

				if
				:: results.async_send!0;
				:: results.sync!false,0 -> 
					results.sending?state
				fi;
				goto stop_process
			:: true;
			fi;
			

			if
			:: true -> 
				

				if
				:: results.async_send!0;
				:: results.sync!false,0 -> 
					results.sending?state
				fi;
				goto stop_process
			:: true;
			fi;
			

			if
			:: true -> 
				

				if
				:: results.async_send!0;
				:: results.sync!false,0 -> 
					results.sending?state
				fi;
				goto stop_process
			:: true;
			fi;
			

			if
			:: true -> 
				

				if
				:: true -> 
					

					if
					:: results.async_send!0;
					:: results.sync!false,0 -> 
						results.sending?state
					fi;
					goto stop_process
				:: true;
				fi
			:: true -> 
				

				if
				:: true -> 
					

					if
					:: true -> 
						

						if
						:: results.async_send!0;
						:: results.sync!false,0 -> 
							results.sending?state
						fi;
						goto stop_process
					:: true;
					fi;
					

					if
					:: true -> 
						

						if
						:: results.async_send!0;
						:: results.sync!false,0 -> 
							results.sending?state
						fi;
						goto stop_process
					:: true;
					fi
				:: true -> 
					

					if
					:: results.async_send!0;
					:: results.sync!false,0 -> 
						results.sending?state
					fi;
					goto stop_process
				fi
			fi;
			

			if
			:: true -> 
				

				if
				:: results.async_send!0;
				:: results.sync!false,0 -> 
					results.sending?state
				fi;
				goto stop_process
			:: true;
			fi;
			

			if
			:: results.async_send!0;
			:: results.sync!false,0 -> 
				results.sending?state
			fi;
			goto stop_process
		:: true -> 
			

			if
			:: results.async_send!0;
			:: results.sync!false,0 -> 
				results.sending?state
			fi;
			goto stop_process
		fi
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

