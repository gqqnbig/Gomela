// num_comm_params=1
// num_mand_comm_params=0
// num_opt_comm_params=1

// git_link=https://github.com/kubernetes/kubernetes/blob/0277cff2682d5a0d3c6fa2109f7f82e8db3f2ed8/pkg/kubelet/kuberuntime/kuberuntime_manager_test.go#L530
#define not_found_555  -2 // opt templates line 184
typedef Mutexdef {
	chan Lock = [0] of {bool};
	chan Unlock = [0] of {bool};
	chan RLock = [0] of {bool};
	chan RUnlock = [0] of {bool};
	int Counter = 0;}



init { 
	chan child_TestPruneInitContainers5300 = [1] of {int};
	run TestPruneInitContainers530(child_TestPruneInitContainers5300);
	run receiver(child_TestPruneInitContainers5300)
stop_process:skip
}

proctype TestPruneInitContainers530(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_pruneInitContainersBeforeStart7632 = [1] of {int};
	chan child_GetPodStatus9671 = [1] of {int};
	chan child_makeFakeContainers1840 = [1] of {int};
	Mutexdef m_logReduction_errorMapLock;
	run mutexMonitor(m_logReduction_errorMapLock);
	run makeFakeContainers184(m_logReduction_errorMapLock,not_found_555,child_makeFakeContainers1840);
	child_makeFakeContainers1840?0;
	run GetPodStatus967(m_logReduction_errorMapLock,child_GetPodStatus9671);
	child_GetPodStatus9671?0;
	run pruneInitContainersBeforeStart763(m_logReduction_errorMapLock,child_pruneInitContainersBeforeStart7632);
	child_pruneInitContainersBeforeStart7632?0;
	stop_process: skip;
	child!0
}
proctype makeFakeContainers184(Mutexdef m_logReduction_errorMapLock;int templates;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_makeFakeContainer1560 = [1] of {int};
	chan child_makeFakeContainer1561 = [1] of {int};
	

	if
	:: var_templates-1 != -3 -> 
				for(i : 0.. var_templates-1) {
			for10: skip;
			run makeFakeContainer156(m_logReduction_errorMapLock,child_makeFakeContainer1560);
			child_makeFakeContainer1560?0;
			for10_end: skip
		};
		for10_exit: skip
	:: else -> 
		do
		:: true -> 
			for113: skip;
			run makeFakeContainer156(m_logReduction_errorMapLock,child_makeFakeContainer1561);
			child_makeFakeContainer1561?0;
			for113_end: skip
		:: true -> 
			break
		od;
		for113_exit: skip
	fi;
	goto stop_process;
	stop_process: skip;
	child!0
}
proctype makeFakeContainer156(Mutexdef m_logReduction_errorMapLock;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_generateContainerConfig2951 = [1] of {int};
	chan child_generatePodSandboxConfig760 = [1] of {int};
	run generatePodSandboxConfig76(m_logReduction_errorMapLock,child_generatePodSandboxConfig760);
	child_generatePodSandboxConfig760?0;
	run generateContainerConfig295(m_logReduction_errorMapLock,child_generateContainerConfig2951);
	child_generateContainerConfig2951?0;
	goto stop_process;
	stop_process: skip;
	child!0
}
proctype generatePodSandboxConfig76(Mutexdef m_logReduction_errorMapLock;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_generatePodSandboxLinuxConfig1480 = [1] of {int};
	int var_containerPortMappingscontainerPortMappings = -2; // opt var_containerPortMappingscontainerPortMappings
	int var_pod_Spec_Containerspod_Spec_Containers = -2; // opt var_pod_Spec_Containerspod_Spec_Containers
	

	if
	:: true -> 
		goto stop_process
	:: true;
	fi;
	

	if
	:: true -> 
		

		if
		:: true -> 
			goto stop_process
		:: true;
		fi;
		

		if
		:: true -> 
			goto stop_process
		:: true;
		fi
	:: true;
	fi;
	run generatePodSandboxLinuxConfig148(m_logReduction_errorMapLock,child_generatePodSandboxLinuxConfig1480);
	child_generatePodSandboxLinuxConfig1480?0;
	

	if
	:: true -> 
		goto stop_process
	:: true;
	fi;
	goto stop_process;
	stop_process: skip;
	child!0
}
proctype generatePodSandboxLinuxConfig148(Mutexdef m_logReduction_errorMapLock;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	int var_sc_SupplementalGroupssc_SupplementalGroups = -2; // opt var_sc_SupplementalGroupssc_SupplementalGroups
	int var_pod_Spec_SecurityContext_Sysctlspod_Spec_SecurityContext_Sysctls = -2; // opt var_pod_Spec_SecurityContext_Sysctlspod_Spec_SecurityContext_Sysctls
	goto stop_process;
	stop_process: skip;
	child!0
}
proctype generateContainerConfig295(Mutexdef m_logReduction_errorMapLock;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_applyPlatformSpecificContainerConfig282 = [1] of {int};
	chan child_getImageUser1221 = [1] of {int};
	int var_opts_Envsopts_Envs = -2; // opt var_opts_Envsopts_Envs
	

	if
	:: true -> 
		goto stop_process
	:: true;
	fi;
	run getImageUser122(m_logReduction_errorMapLock,child_getImageUser1221);
	child_getImageUser1221?0;
	

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
	run applyPlatformSpecificContainerConfig28(m_logReduction_errorMapLock,child_applyPlatformSpecificContainerConfig282);
	child_applyPlatformSpecificContainerConfig282?0;
	

	if
	:: true -> 
		goto stop_process
	:: true;
	fi;
	goto stop_process;
	stop_process: skip;
	child!0
}
proctype getImageUser122(Mutexdef m_logReduction_errorMapLock;chan child) {
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
		

		if
		:: true -> 
			goto stop_process
		:: true;
		fi;
		

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
proctype applyPlatformSpecificContainerConfig28(Mutexdef m_logReduction_errorMapLock;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	goto stop_process;
	stop_process: skip;
	child!0
}
proctype GetPodStatus967(Mutexdef m_logReduction_errorMapLock;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_getPodContainerStatuses4934 = [1] of {int};
	chan child_determinePodSandboxIPs2312 = [1] of {int};
	chan child_determinePodSandboxIPs2313 = [1] of {int};
	chan child_getSandboxIDByPodUID2641 = [1] of {int};
	int var_podSandboxIDspodSandboxIDs = -2; // opt var_podSandboxIDspodSandboxIDs
	run getSandboxIDByPodUID264(m_logReduction_errorMapLock,child_getSandboxIDByPodUID2641);
	child_getSandboxIDByPodUID2641?0;
	

	if
	:: true -> 
		goto stop_process
	:: true;
	fi;
	

	if
	:: var_podSandboxIDs-1 != -3 -> 
				for(i : 0.. var_podSandboxIDs-1) {
			for30: skip;
			

			if
			:: true -> 
				goto stop_process
			:: true;
			fi;
			

			if
			:: true -> 
				run determinePodSandboxIPs231(m_logReduction_errorMapLock,child_determinePodSandboxIPs2312);
				child_determinePodSandboxIPs2312?0
			:: true;
			fi;
			for30_end: skip
		};
		for30_exit: skip
	:: else -> 
		do
		:: true -> 
			for33: skip;
			

			if
			:: true -> 
				goto stop_process
			:: true;
			fi;
			

			if
			:: true -> 
				run determinePodSandboxIPs231(m_logReduction_errorMapLock,child_determinePodSandboxIPs2313);
				child_determinePodSandboxIPs2313?0
			:: true;
			fi;
			for33_end: skip
		:: true -> 
			break
		od;
		for33_exit: skip
	fi;
	run getPodContainerStatuses493(m_logReduction_errorMapLock,child_getPodContainerStatuses4934);
	child_getPodContainerStatuses4934?0;
	

	if
	:: true -> 
		goto stop_process
	:: true;
	fi;
	goto stop_process;
	stop_process: skip;
	child!0
}
proctype getSandboxIDByPodUID264(Mutexdef m_logReduction_errorMapLock;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	int var_sandboxessandboxes = -2; // opt var_sandboxessandboxes
	

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
proctype determinePodSandboxIPs231(Mutexdef m_logReduction_errorMapLock;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	int var_podSandbox_Network_AdditionalIpspodSandbox_Network_AdditionalIps = -2; // opt var_podSandbox_Network_AdditionalIpspodSandbox_Network_AdditionalIps
	

	if
	:: true -> 
		goto stop_process
	:: true;
	fi;
	

	if
	:: true -> 
		

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
proctype getPodContainerStatuses493(Mutexdef m_logReduction_errorMapLock;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_readLastStringFromContainerLogs4834 = [1] of {int};
	chan child_readLastStringFromContainerLogs4835 = [1] of {int};
	int var_containerscontainers = -2; // opt var_containerscontainers
	

	if
	:: true -> 
		goto stop_process
	:: true;
	fi;
	

	if
	:: var_containers-1 != -3 -> 
				for(i : 0.. var_containers-1) {
			for40: skip;
			

			if
			:: true -> 
				goto stop_process
			:: true;
			fi;
			

			if
			:: true -> 
				

				if
				:: true -> 
					

					if
					:: true -> 
						run readLastStringFromContainerLogs483(m_logReduction_errorMapLock,child_readLastStringFromContainerLogs4834);
						child_readLastStringFromContainerLogs4834?0
					fi
				:: true;
				fi
			:: true;
			fi;
			for40_end: skip
		};
		for40_exit: skip
	:: else -> 
		do
		:: true -> 
			for41: skip;
			

			if
			:: true -> 
				goto stop_process
			:: true;
			fi;
			

			if
			:: true -> 
				

				if
				:: true -> 
					

					if
					:: true -> 
						run readLastStringFromContainerLogs483(m_logReduction_errorMapLock,child_readLastStringFromContainerLogs4835);
						child_readLastStringFromContainerLogs4835?0
					fi
				:: true;
				fi
			:: true;
			fi;
			for41_end: skip
		:: true -> 
			break
		od;
		for41_exit: skip
	fi;
	goto stop_process;
	stop_process: skip;
	child!0
}
proctype readLastStringFromContainerLogs483(Mutexdef m_logReduction_errorMapLock;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_ReadLogs314 = [1] of {int};
	run ReadLogs31(m_logReduction_errorMapLock,child_ReadLogs314);
	child_ReadLogs314?0;
	

	if
	:: true -> 
		goto stop_process
	:: true;
	fi;
	goto stop_process;
	stop_process: skip;
	child!0
}
proctype ReadLogs31(Mutexdef m_logReduction_errorMapLock;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	goto stop_process;
	stop_process: skip;
	child!0
}
proctype pruneInitContainersBeforeStart763(Mutexdef m_logReduction_errorMapLock;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_removeContainer9372 = [1] of {int};
	chan child_removeContainer9373 = [1] of {int};
	chan child_removeContainer9374 = [1] of {int};
	chan child_removeContainer9375 = [1] of {int};
	int var_podStatus_ContainerStatusespodStatus_ContainerStatuses = -2; // opt var_podStatus_ContainerStatusespodStatus_ContainerStatuses
	int var_initContainerNamesinitContainerNames = -2; // opt var_initContainerNamesinitContainerNames
	int var_pod_Spec_InitContainerspod_Spec_InitContainers = -2; // opt var_pod_Spec_InitContainerspod_Spec_InitContainers
	

	if
	:: var_initContainerNames-1 != -3 -> 
				for(i : 0.. var_initContainerNames-1) {
			for60: skip;
			

			if
			:: var_podStatus_ContainerStatuses-1 != -3 -> 
								for(i : 0.. var_podStatus_ContainerStatuses-1) {
					for61: skip;
					

					if
					:: true -> 
						goto for61_end
					:: true;
					fi;
					

					if
					:: true -> 
						goto for61_end
					:: true;
					fi;
					run removeContainer937(m_logReduction_errorMapLock,child_removeContainer9372);
					child_removeContainer9372?0;
					

					if
					:: true -> 
						goto for61_end
					:: true;
					fi;
					for61_end: skip
				};
				for61_exit: skip
			:: else -> 
				do
				:: true -> 
					for62: skip;
					

					if
					:: true -> 
						goto for62_end
					:: true;
					fi;
					

					if
					:: true -> 
						goto for62_end
					:: true;
					fi;
					run removeContainer937(m_logReduction_errorMapLock,child_removeContainer9373);
					child_removeContainer9373?0;
					

					if
					:: true -> 
						goto for62_end
					:: true;
					fi;
					for62_end: skip
				:: true -> 
					break
				od;
				for62_exit: skip
			fi;
			for60_end: skip
		};
		for60_exit: skip
	:: else -> 
		do
		:: true -> 
			for63: skip;
			

			if
			:: var_podStatus_ContainerStatuses-1 != -3 -> 
								for(i : 0.. var_podStatus_ContainerStatuses-1) {
					for64: skip;
					

					if
					:: true -> 
						goto for64_end
					:: true;
					fi;
					

					if
					:: true -> 
						goto for64_end
					:: true;
					fi;
					run removeContainer937(m_logReduction_errorMapLock,child_removeContainer9374);
					child_removeContainer9374?0;
					

					if
					:: true -> 
						goto for64_end
					:: true;
					fi;
					for64_end: skip
				};
				for64_exit: skip
			:: else -> 
				do
				:: true -> 
					for65: skip;
					

					if
					:: true -> 
						goto for65_end
					:: true;
					fi;
					

					if
					:: true -> 
						goto for65_end
					:: true;
					fi;
					run removeContainer937(m_logReduction_errorMapLock,child_removeContainer9375);
					child_removeContainer9375?0;
					

					if
					:: true -> 
						goto for65_end
					:: true;
					fi;
					for65_end: skip
				:: true -> 
					break
				od;
				for65_exit: skip
			fi;
			for63_end: skip
		:: true -> 
			break
		od;
		for63_exit: skip
	fi;
	stop_process: skip;
	child!0
}
proctype removeContainer937(Mutexdef m_logReduction_errorMapLock;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_removeContainerLog9542 = [1] of {int};
	

	if
	:: true -> 
		goto stop_process
	:: true;
	fi;
	run removeContainerLog954(m_logReduction_errorMapLock,child_removeContainerLog9542);
	child_removeContainerLog9542?0;
	

	if
	:: true -> 
		goto stop_process
	:: true;
	fi;
	goto stop_process;
	stop_process: skip;
	child!0
}
proctype removeContainerLog954(Mutexdef m_logReduction_errorMapLock;chan child) {
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

