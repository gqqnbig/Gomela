// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/hashicorp/vault/blob/f8f289712a3d37115090591602a2b92503fb3a13/vault/barrier_aes_gcm_test.go#L90
typedef Mutexdef {
	chan Lock = [0] of {bool};
	chan Unlock = [0] of {bool};
	chan RLock = [0] of {bool};
	chan RUnlock = [0] of {bool};
	int Counter = 0;}



init { 
	chan child_TestAESGCMBarrier_Upgrade900 = [1] of {int};
	run TestAESGCMBarrier_Upgrade90(child_TestAESGCMBarrier_Upgrade900);
	run receiver(child_TestAESGCMBarrier_Upgrade900)
stop_process:skip
}

proctype TestAESGCMBarrier_Upgrade90(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_testBarrier_Upgrade4380 = [1] of {int};
	Mutexdef b2_cacheLock;
	Mutexdef b2_l;
	Mutexdef b1_cacheLock;
	Mutexdef b1_l;
	run mutexMonitor(b1_l);
	run mutexMonitor(b1_cacheLock);
	run mutexMonitor(b2_l);
	run mutexMonitor(b2_cacheLock);
	run testBarrier_Upgrade438(b1_cacheLock,b1_l,b1_cacheLock,b1_l,child_testBarrier_Upgrade4380);
	child_testBarrier_Upgrade4380?0;
	stop_process: skip;
	child!0
}
proctype testBarrier_Upgrade438(Mutexdef b1_cacheLock;Mutexdef b1_l;Mutexdef b2_cacheLock;Mutexdef b2_l;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_CheckUpgrade63711 = [1] of {int};
	chan child_DestroyUpgrade63110 = [1] of {int};
	chan child_CreateUpgrade5929 = [1] of {int};
	chan child_Rotate5488 = [1] of {int};
	chan child_CheckUpgrade6377 = [1] of {int};
	chan child_CheckUpgrade6376 = [1] of {int};
	chan child_CreateUpgrade5925 = [1] of {int};
	chan child_Rotate5484 = [1] of {int};
	chan child_Unseal4223 = [1] of {int};
	chan child_Unseal4222 = [1] of {int};
	chan child_Initialize1531 = [1] of {int};
	chan child_GenerateKey2740 = [1] of {int};
	run GenerateKey274(b1_cacheLock,b1_l,child_GenerateKey2740);
	child_GenerateKey2740?0;
	run Initialize153(b1_cacheLock,b1_l,child_Initialize1531);
	child_Initialize1531?0;
	run Unseal422(b1_cacheLock,b1_l,child_Unseal4222);
	child_Unseal4222?0;
	run Unseal422(b2_cacheLock,b2_l,child_Unseal4223);
	child_Unseal4223?0;
	run Rotate548(b1_cacheLock,b1_l,child_Rotate5484);
	child_Rotate5484?0;
	run CreateUpgrade592(b1_cacheLock,b1_l,child_CreateUpgrade5925);
	child_CreateUpgrade5925?0;
	run CheckUpgrade637(b2_cacheLock,b2_l,child_CheckUpgrade6376);
	child_CheckUpgrade6376?0;
	run CheckUpgrade637(b2_cacheLock,b2_l,child_CheckUpgrade6377);
	child_CheckUpgrade6377?0;
	run Rotate548(b1_cacheLock,b1_l,child_Rotate5488);
	child_Rotate5488?0;
	run CreateUpgrade592(b1_cacheLock,b1_l,child_CreateUpgrade5929);
	child_CreateUpgrade5929?0;
	run DestroyUpgrade631(b1_cacheLock,b1_l,child_DestroyUpgrade63110);
	child_DestroyUpgrade63110?0;
	run CheckUpgrade637(b2_cacheLock,b2_l,child_CheckUpgrade63711);
	child_CheckUpgrade63711?0;
	stop_process: skip;
	child!0
}
proctype GenerateKey274(Mutexdef b_cacheLock;Mutexdef b_l;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	goto stop_process;
	stop_process: skip;
	child!0
}
proctype Initialize153(Mutexdef b_cacheLock;Mutexdef b_l;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_putInternal7986 = [1] of {int};
	chan child_aeadFromKey9445 = [1] of {int};
	chan child_persistKeyring2104 = [1] of {int};
	chan child_GenerateKey2743 = [1] of {int};
	chan child_Initialized1272 = [1] of {int};
	chan child_KeyLength2831 = [1] of {int};
	run KeyLength283(b_cacheLock,b_l,child_KeyLength2831);
	child_KeyLength2831?0;
	

	if
	:: true -> 
		goto stop_process
	:: true;
	fi;
	run Initialized127(b_cacheLock,b_l,child_Initialized1272);
	child_Initialized1272?0;
	

	if
	:: true -> 
		goto stop_process
	:: true -> 
		

		if
		:: true -> 
			goto stop_process
		:: true;
		fi
	fi;
	run GenerateKey274(b_cacheLock,b_l,child_GenerateKey2743);
	child_GenerateKey2743?0;
	

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
	run persistKeyring210(b_cacheLock,b_l,child_persistKeyring2104);
	child_persistKeyring2104?0;
	

	if
	:: true -> 
		goto stop_process
	:: true;
	fi;
	

	if
	:: true -> 
		run aeadFromKey944(b_cacheLock,b_l,child_aeadFromKey9445);
		child_aeadFromKey9445?0;
		

		if
		:: true -> 
			goto stop_process
		:: true;
		fi;
		run putInternal798(b_cacheLock,b_l,child_putInternal7986);
		child_putInternal7986?0;
		

		if
		:: true -> 
			goto stop_process
		:: true;
		fi
	:: true;
	fi;
	goto stop_process;
	stop_process: skip;
	child!0
}
proctype KeyLength283(Mutexdef b_cacheLock;Mutexdef b_l;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	goto stop_process;
	stop_process: skip;
	child!0
}
proctype Initialized127(Mutexdef b_cacheLock;Mutexdef b_l;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	

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
	goto stop_process;
	stop_process: skip;
	child!0
}
proctype persistKeyring210(Mutexdef b_cacheLock;Mutexdef b_l;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_encryptTracked11237 = [1] of {int};
	chan child_aeadFromKey9446 = [1] of {int};
	chan child_encrypt9605 = [1] of {int};
	chan child_aeadFromKey9444 = [1] of {int};
	

	if
	:: true -> 
		goto stop_process
	:: true;
	fi;
	run aeadFromKey944(b_cacheLock,b_l,child_aeadFromKey9444);
	child_aeadFromKey9444?0;
	

	if
	:: true -> 
		goto stop_process
	:: true;
	fi;
	run encrypt960(b_cacheLock,b_l,child_encrypt9605);
	child_encrypt9605?0;
	

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
	

	if
	:: true -> 
		goto stop_process
	:: true;
	fi;
	run aeadFromKey944(b_cacheLock,b_l,child_aeadFromKey9446);
	child_aeadFromKey9446?0;
	

	if
	:: true -> 
		goto stop_process
	:: true;
	fi;
	run encryptTracked1123(b_cacheLock,b_l,child_encryptTracked11237);
	child_encryptTracked11237?0;
	

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
	goto stop_process;
	stop_process: skip;
	child!0
}
proctype aeadFromKey944(Mutexdef b_cacheLock;Mutexdef b_l;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	

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
	goto stop_process;
	stop_process: skip;
	child!0
}
proctype encrypt960(Mutexdef b_cacheLock;Mutexdef b_l;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	

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
	

	if
	:: true -> 
		goto stop_process
	:: true;
	fi;
	

	if
	:: true;
	:: true;
	:: true;
	fi;
	goto stop_process;
	stop_process: skip;
	child!0
}
proctype encryptTracked1123(Mutexdef b_cacheLock;Mutexdef b_l;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_encrypt9607 = [1] of {int};
	run encrypt960(b_cacheLock,b_l,child_encrypt9607);
	child_encrypt9607?0;
	

	if
	:: true -> 
		goto stop_process
	:: true;
	fi;
	goto stop_process;
	stop_process: skip;
	child!0
}
proctype putInternal798(Mutexdef b_cacheLock;Mutexdef b_l;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_encryptTracked11236 = [1] of {int};
	run encryptTracked1123(b_cacheLock,b_l,child_encryptTracked11236);
	child_encryptTracked11236?0;
	

	if
	:: true -> 
		goto stop_process
	:: true;
	fi;
	goto stop_process;
	stop_process: skip;
	child!0
}
proctype Unseal422(Mutexdef b_cacheLock;Mutexdef b_l;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_persistKeyring2106 = [1] of {int};
	chan child_decrypt10135 = [1] of {int};
	chan child_recoverKeyring3594 = [1] of {int};
	chan child_decrypt10133 = [1] of {int};
	chan child_aeadFromKey9442 = [1] of {int};
	b_l.Lock!false;
	

	if
	:: true -> 
		goto defer1
	:: true;
	fi;
	run aeadFromKey944(b_cacheLock,b_l,child_aeadFromKey9442);
	child_aeadFromKey9442?0;
	

	if
	:: true -> 
		goto defer1
	:: true;
	fi;
	

	if
	:: true -> 
		goto defer1
	:: true;
	fi;
	

	if
	:: true -> 
		

		if
		:: true -> 
			goto defer1
		:: true;
		fi;
		run decrypt1013(b_cacheLock,b_l,child_decrypt10133);
		child_decrypt10133?0;
		

		if
		:: true -> 
			

			if
			:: true -> 
				goto defer1
			:: true;
			fi;
			goto defer1
		:: true;
		fi;
		run recoverKeyring359(b_cacheLock,b_l,child_recoverKeyring3594);
		child_recoverKeyring3594?0;
		

		if
		:: true -> 
			goto defer1
		:: true;
		fi;
		goto defer1
	:: true;
	fi;
	

	if
	:: true -> 
		goto defer1
	:: true;
	fi;
	

	if
	:: true -> 
		goto defer1
	:: true;
	fi;
	

	if
	:: true -> 
		goto defer1
	:: true;
	fi;
	run decrypt1013(b_cacheLock,b_l,child_decrypt10135);
	child_decrypt10135?0;
	

	if
	:: true -> 
		

		if
		:: true -> 
			goto defer1
		:: true;
		fi;
		goto defer1
	:: true;
	fi;
	

	if
	:: true -> 
		goto defer1
	:: true;
	fi;
	

	if
	:: true -> 
		goto defer1
	:: true;
	fi;
	run persistKeyring210(b_cacheLock,b_l,child_persistKeyring2106);
	child_persistKeyring2106?0;
	

	if
	:: true -> 
		goto defer1
	:: true;
	fi;
	

	if
	:: true -> 
		goto defer1
	:: true;
	fi;
	goto defer1;
		defer1: skip;
	b_l.Unlock!false;
	stop_process: skip;
	child!0
}
proctype decrypt1013(Mutexdef b_cacheLock;Mutexdef b_l;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	

	if
	:: true -> 
		goto stop_process
	:: true -> 
		goto stop_process
	:: true -> 
		goto stop_process
	fi;
	stop_process: skip;
	child!0
}
proctype recoverKeyring359(Mutexdef b_cacheLock;Mutexdef b_l;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	

	if
	:: true -> 
		goto stop_process
	:: true;
	fi;
	goto stop_process;
	stop_process: skip;
	child!0
}
proctype Rotate548(Mutexdef b_cacheLock;Mutexdef b_l;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_persistKeyring2105 = [1] of {int};
	chan child_GenerateKey2744 = [1] of {int};
	b_l.Lock!false;
	

	if
	:: true -> 
		goto defer1
	:: true;
	fi;
	run GenerateKey274(b_cacheLock,b_l,child_GenerateKey2744);
	child_GenerateKey2744?0;
	

	if
	:: true -> 
		goto defer1
	:: true;
	fi;
	

	if
	:: true -> 
		goto defer1
	:: true;
	fi;
	run persistKeyring210(b_cacheLock,b_l,child_persistKeyring2105);
	child_persistKeyring2105?0;
	

	if
	:: true -> 
		goto defer1
	:: true;
	fi;
	goto defer1;
		defer1: skip;
	b_l.Unlock!false;
	stop_process: skip;
	child!0
}
proctype CreateUpgrade592(Mutexdef b_cacheLock;Mutexdef b_l;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_encryptTracked11236 = [1] of {int};
	chan child_aeadForTerm9095 = [1] of {int};
	b_l.RLock!false;
	

	if
	:: true -> 
		b_l.RUnlock!false;
		goto stop_process
	:: true;
	fi;
	

	if
	:: true -> 
		b_l.RUnlock!false;
		goto stop_process
	:: true;
	fi;
	run aeadForTerm909(b_cacheLock,b_l,child_aeadForTerm9095);
	child_aeadForTerm9095?0;
	

	if
	:: true -> 
		b_l.RUnlock!false;
		goto stop_process
	:: true;
	fi;
	run encryptTracked1123(b_cacheLock,b_l,child_encryptTracked11236);
	child_encryptTracked11236?0;
	b_l.RUnlock!false;
	

	if
	:: true -> 
		goto stop_process
	:: true;
	fi;
	goto stop_process;
	stop_process: skip;
	child!0
}
proctype aeadForTerm909(Mutexdef b_cacheLock;Mutexdef b_l;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_aeadFromKey9445 = [1] of {int};
	

	if
	:: true -> 
		goto stop_process
	:: true;
	fi;
	b_cacheLock.RLock!false;
	b_cacheLock.RUnlock!false;
	

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
	run aeadFromKey944(b_cacheLock,b_l,child_aeadFromKey9445);
	child_aeadFromKey9445?0;
	

	if
	:: true -> 
		goto stop_process
	:: true;
	fi;
	b_cacheLock.Lock!false;
	b_cacheLock.Unlock!false;
	goto stop_process;
	stop_process: skip;
	child!0
}
proctype CheckUpgrade637(Mutexdef b_cacheLock;Mutexdef b_l;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_lockSwitchedGet8167 = [1] of {int};
	chan child_lockSwitchedGet8166 = [1] of {int};
	b_l.RLock!false;
	

	if
	:: true -> 
		b_l.RUnlock!false;
		goto stop_process
	:: true;
	fi;
	run lockSwitchedGet816(b_cacheLock,b_l,child_lockSwitchedGet8166);
	child_lockSwitchedGet8166?0;
	

	if
	:: true -> 
		b_l.RUnlock!false;
		goto stop_process
	:: true;
	fi;
	

	if
	:: true -> 
		b_l.RUnlock!false;
		goto stop_process
	:: true;
	fi;
	b_l.RUnlock!false;
	b_l.Lock!false;
	

	if
	:: true -> 
		goto defer1
	:: true;
	fi;
	run lockSwitchedGet816(b_cacheLock,b_l,child_lockSwitchedGet8167);
	child_lockSwitchedGet8167?0;
	

	if
	:: true -> 
		goto defer1
	:: true;
	fi;
	

	if
	:: true -> 
		goto defer1
	:: true;
	fi;
	

	if
	:: true -> 
		goto defer1
	:: true;
	fi;
	

	if
	:: true -> 
		goto defer1
	:: true;
	fi;
	goto defer1;
		defer1: skip;
	b_l.Unlock!false;
	stop_process: skip;
	child!0
}
proctype lockSwitchedGet816(Mutexdef b_cacheLock;Mutexdef b_l;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_decrypt10137 = [1] of {int};
	chan child_aeadForTerm9096 = [1] of {int};
	

	if
	:: true -> 
		b_l.RLock!false
	:: true;
	fi;
	

	if
	:: true -> 
		

		if
		:: true -> 
			b_l.RUnlock!false
		:: true;
		fi;
		goto stop_process
	:: true;
	fi;
	

	if
	:: true -> 
		

		if
		:: true -> 
			b_l.RUnlock!false
		:: true;
		fi;
		goto stop_process
	:: true -> 
		

		if
		:: true -> 
			

			if
			:: true -> 
				b_l.RUnlock!false
			:: true;
			fi;
			goto stop_process
		:: true;
		fi
	fi;
	

	if
	:: true -> 
		

		if
		:: true -> 
			b_l.RUnlock!false
		:: true;
		fi;
		goto stop_process
	:: true;
	fi;
	run aeadForTerm909(b_cacheLock,b_l,child_aeadForTerm9096);
	child_aeadForTerm9096?0;
	

	if
	:: true -> 
		b_l.RUnlock!false
	:: true;
	fi;
	

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
	run decrypt1013(b_cacheLock,b_l,child_decrypt10137);
	child_decrypt10137?0;
	

	if
	:: true -> 
		goto stop_process
	:: true;
	fi;
	goto stop_process;
	stop_process: skip;
	child!0
}
proctype DestroyUpgrade631(Mutexdef b_cacheLock;Mutexdef b_l;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_Delete88210 = [1] of {int};
	run Delete882(b_cacheLock,b_l,child_Delete88210);
	child_Delete88210?0;
	goto stop_process;
	stop_process: skip;
	child!0
}
proctype Delete882(Mutexdef b_cacheLock;Mutexdef b_l;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	b_l.RLock!false;
	b_l.RUnlock!false;
	

	if
	:: true -> 
		goto stop_process
	:: true;
	fi;
	goto stop_process;
	stop_process: skip;
	child!0
}

 /* ================================================================================== */
 /* ================================================================================== */
 /* ================================================================================== */ 
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

