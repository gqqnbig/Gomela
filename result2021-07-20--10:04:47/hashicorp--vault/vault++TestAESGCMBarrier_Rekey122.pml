// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/hashicorp/vault/blob/f8f289712a3d37115090591602a2b92503fb3a13/vault/barrier_aes_gcm_test.go#L122
typedef Mutexdef {
	chan Lock = [0] of {bool};
	chan Unlock = [0] of {bool};
	chan RLock = [0] of {bool};
	chan RUnlock = [0] of {bool};
	int Counter = 0;}



init { 
	chan child_TestAESGCMBarrier_Rekey1220 = [1] of {int};
	run TestAESGCMBarrier_Rekey122(child_TestAESGCMBarrier_Rekey1220);
	run receiver(child_TestAESGCMBarrier_Rekey1220)
stop_process:skip
}

proctype TestAESGCMBarrier_Rekey122(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_testBarrier_Rekey3580 = [1] of {int};
	Mutexdef b_cacheLock;
	Mutexdef b_l;
	run mutexMonitor(b_l);
	run mutexMonitor(b_cacheLock);
	run testBarrier_Rekey358(b_cacheLock,b_l,child_testBarrier_Rekey3580);
	child_testBarrier_Rekey3580?0;
	stop_process: skip;
	child!0
}
proctype testBarrier_Rekey358(Mutexdef b_cacheLock;Mutexdef b_l;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_ReloadKeyring31214 = [1] of {int};
	chan child_Get81213 = [1] of {int};
	chan child_Unseal42212 = [1] of {int};
	chan child_Unseal42211 = [1] of {int};
	chan child_Seal53410 = [1] of {int};
	chan child_Get8129 = [1] of {int};
	chan child_VerifyMaster2978 = [1] of {int};
	chan child_VerifyMaster2977 = [1] of {int};
	chan child_Rekey7246 = [1] of {int};
	chan child_GenerateKey2745 = [1] of {int};
	chan child_VerifyMaster2974 = [1] of {int};
	chan child_Put7803 = [1] of {int};
	chan child_Unseal4222 = [1] of {int};
	chan child_Initialize1531 = [1] of {int};
	chan child_GenerateKey2740 = [1] of {int};
	run GenerateKey274(b_cacheLock,b_l,child_GenerateKey2740);
	child_GenerateKey2740?0;
	run Initialize153(b_cacheLock,b_l,child_Initialize1531);
	child_Initialize1531?0;
	run Unseal422(b_cacheLock,b_l,child_Unseal4222);
	child_Unseal4222?0;
	run Put780(b_cacheLock,b_l,child_Put7803);
	child_Put7803?0;
	run VerifyMaster297(b_cacheLock,b_l,child_VerifyMaster2974);
	child_VerifyMaster2974?0;
	run GenerateKey274(b_cacheLock,b_l,child_GenerateKey2745);
	child_GenerateKey2745?0;
	run Rekey724(b_cacheLock,b_l,child_Rekey7246);
	child_Rekey7246?0;
	run VerifyMaster297(b_cacheLock,b_l,child_VerifyMaster2977);
	child_VerifyMaster2977?0;
	run VerifyMaster297(b_cacheLock,b_l,child_VerifyMaster2978);
	child_VerifyMaster2978?0;
	run Get812(b_cacheLock,b_l,child_Get8129);
	child_Get8129?0;
	run Seal534(b_cacheLock,b_l,child_Seal53410);
	child_Seal53410?0;
	run Unseal422(b_cacheLock,b_l,child_Unseal42211);
	child_Unseal42211?0;
	run Unseal422(b_cacheLock,b_l,child_Unseal42212);
	child_Unseal42212?0;
	run Get812(b_cacheLock,b_l,child_Get81213);
	child_Get81213?0;
	run ReloadKeyring312(b_cacheLock,b_l,child_ReloadKeyring31214);
	child_ReloadKeyring31214?0;
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
proctype Put780(Mutexdef b_cacheLock;Mutexdef b_l;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_putInternal7984 = [1] of {int};
	chan child_aeadForTerm9093 = [1] of {int};
	b_l.RLock!false;
	

	if
	:: true -> 
		b_l.RUnlock!false;
		goto stop_process
	:: true;
	fi;
	run aeadForTerm909(b_cacheLock,b_l,child_aeadForTerm9093);
	child_aeadForTerm9093?0;
	b_l.RUnlock!false;
	

	if
	:: true -> 
		goto stop_process
	:: true;
	fi;
	run putInternal798(b_cacheLock,b_l,child_putInternal7984);
	child_putInternal7984?0;
	goto stop_process;
	stop_process: skip;
	child!0
}
proctype aeadForTerm909(Mutexdef b_cacheLock;Mutexdef b_l;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_aeadFromKey9443 = [1] of {int};
	

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
	run aeadFromKey944(b_cacheLock,b_l,child_aeadFromKey9443);
	child_aeadFromKey9443?0;
	

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
proctype VerifyMaster297(Mutexdef b_cacheLock;Mutexdef b_l;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	b_l.RLock!false;
	

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
	b_l.RUnlock!false;
	stop_process: skip;
	child!0
}
proctype Rekey724(Mutexdef b_cacheLock;Mutexdef b_l;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_persistKeyring2107 = [1] of {int};
	chan child_updateMasterKeyCommon7656 = [1] of {int};
	b_l.Lock!false;
	run updateMasterKeyCommon765(b_cacheLock,b_l,child_updateMasterKeyCommon7656);
	child_updateMasterKeyCommon7656?0;
	

	if
	:: true -> 
		goto defer1
	:: true;
	fi;
	run persistKeyring210(b_cacheLock,b_l,child_persistKeyring2107);
	child_persistKeyring2107?0;
	

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
proctype updateMasterKeyCommon765(Mutexdef b_cacheLock;Mutexdef b_l;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_KeyLength2836 = [1] of {int};
	

	if
	:: true -> 
		goto stop_process
	:: true;
	fi;
	run KeyLength283(b_cacheLock,b_l,child_KeyLength2836);
	child_KeyLength2836?0;
	

	if
	:: true -> 
		goto stop_process
	:: true;
	fi;
	goto stop_process;
	stop_process: skip;
	child!0
}
proctype Get812(Mutexdef b_cacheLock;Mutexdef b_l;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_lockSwitchedGet8169 = [1] of {int};
	run lockSwitchedGet816(b_cacheLock,b_l,child_lockSwitchedGet8169);
	child_lockSwitchedGet8169?0;
	goto stop_process;
	stop_process: skip;
	child!0
}
proctype lockSwitchedGet816(Mutexdef b_cacheLock;Mutexdef b_l;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_decrypt101310 = [1] of {int};
	chan child_aeadForTerm9099 = [1] of {int};
	

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
	run aeadForTerm909(b_cacheLock,b_l,child_aeadForTerm9099);
	child_aeadForTerm9099?0;
	

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
	run decrypt1013(b_cacheLock,b_l,child_decrypt101310);
	child_decrypt101310?0;
	

	if
	:: true -> 
		goto stop_process
	:: true;
	fi;
	goto stop_process;
	stop_process: skip;
	child!0
}
proctype Seal534(Mutexdef b_cacheLock;Mutexdef b_l;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	b_l.Lock!false;
	goto defer1;
		defer1: skip;
	b_l.Unlock!false;
	stop_process: skip;
	child!0
}
proctype ReloadKeyring312(Mutexdef b_cacheLock;Mutexdef b_l;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_recoverKeyring35916 = [1] of {int};
	chan child_decrypt101315 = [1] of {int};
	chan child_aeadFromKey94414 = [1] of {int};
	b_l.Lock!false;
	run aeadFromKey944(b_cacheLock,b_l,child_aeadFromKey94414);
	child_aeadFromKey94414?0;
	

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
	run decrypt1013(b_cacheLock,b_l,child_decrypt101315);
	child_decrypt101315?0;
	

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
	run recoverKeyring359(b_cacheLock,b_l,child_recoverKeyring35916);
	child_recoverKeyring35916?0;
	goto defer1;
		defer1: skip;
	b_l.Unlock!false;
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

