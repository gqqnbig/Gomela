// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/vitessio/vitess/blob//go/vt/vttablet/endtoend/reserve_test.go#L72
typedef Wgdef {
	chan update = [0] of {int};
	chan wait = [0] of {int};
	int Counter = 0;}
typedef Mutexdef {
	chan Lock = [0] of {bool};
	chan Unlock = [0] of {bool};
	chan RLock = [0] of {bool};
	chan RUnlock = [0] of {bool};
	int Counter = 0;}



init { 
	chan child_TestBeginReserveRelease720 = [1] of {int};
	run TestBeginReserveRelease72(child_TestBeginReserveRelease720);
	run receiver(child_TestBeginReserveRelease720)
stop_process:skip
}

proctype TestBeginReserveRelease72(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_Release3331 = [1] of {int};
	chan child_Release3335 = [1] of {int};
	chan child_TransactionID3444 = [1] of {int};
	chan child_ReservedID3493 = [1] of {int};
	chan child_ReserveExecute3032 = [1] of {int};
	chan child_BeginExecute1790 = [1] of {int};
	Mutexdef client_server_onlineDDLExecutor_ticks_mu;
	Mutexdef client_server_onlineDDLExecutor_ownedRunningMigrations_mu;
	Mutexdef client_server_onlineDDLExecutor_migrationMutex;
	Mutexdef client_server_onlineDDLExecutor_initMutex;
	Mutexdef client_server_onlineDDLExecutor_ts_mu;
	Mutexdef client_server_onlineDDLExecutor_pool_mu;
	Mutexdef client_server_sm_hcticks_mu;
	Mutexdef client_server_sm_hs_mu;
	Mutexdef client_server_sm_olapql_mu;
	Mutexdef client_server_sm_statefulql_mu;
	Mutexdef client_server_sm_statelessql_mu;
	Wgdef client_server_sm_requests;
	Mutexdef client_server_sm_mu;
	Mutexdef client_server_tableGC_purgeMutex;
	Mutexdef client_server_tableGC_initMutex;
	Mutexdef client_server_tableGC_ts_mu;
	Mutexdef client_server_tableGC_pool_mu;
	Mutexdef client_server_lagThrottler_throttledAppsMutex;
	Mutexdef client_server_lagThrottler_initMutex;
	Mutexdef client_server_lagThrottler_ts_mu;
	Mutexdef client_server_lagThrottler_pool_mu;
	Mutexdef client_server_hs_conns_mu;
	Mutexdef client_server_hs_ticks_mu;
	Mutexdef client_server_hs_history_mu;
	Mutexdef client_server_hs_mu;
	Mutexdef client_server_messager_se_notifierMu;
	Mutexdef client_server_messager_se_mu;
	Mutexdef client_server_messager_mu;
	Wgdef client_server_te_twoPCReady;
	Mutexdef client_server_te_preparedPool_mu;
	Mutexdef client_server_te_txPool_logMu;
	Mutexdef client_server_te_ticks_mu;
	Wgdef client_server_te_beginRequests;
	Mutexdef client_server_te_stateLock;
	Mutexdef client_server_txThrottler_state_throttleMu;
	Mutexdef client_server_qe_accessCheckerLogger_mu;
	Mutexdef client_server_qe_consolidatorMode_mu;
	Mutexdef client_server_qe_txSerializer_mu;
	Mutexdef client_server_qe_streamConsolidator_mu;
	Mutexdef client_server_qe_consolidator_mu;
	Mutexdef client_server_qe_streamConns_mu;
	Mutexdef client_server_qe_conns_mu;
	Mutexdef client_server_qe_queryRuleSources_mu;
	Mutexdef client_server_qe_mu;
	Mutexdef client_server_qe_se_notifierMu;
	Mutexdef client_server_qe_se_mu;
	Wgdef client_server_watcher_wg;
	Mutexdef client_server_tracker_engine_notifierMu;
	Mutexdef client_server_tracker_engine_mu;
	Wgdef client_server_tracker_wg;
	Mutexdef client_server_tracker_mu;
	Mutexdef client_server_vstreamer_watcherOnce_m;
	Mutexdef client_server_vstreamer_mu;
	Wgdef client_server_vstreamer_wg;
	Mutexdef client_server_vstreamer_se_notifierMu;
	Mutexdef client_server_vstreamer_se_mu;
	Mutexdef client_server_rt_poller_mu;
	Mutexdef client_server_rt_hr_lagMu;
	Mutexdef client_server_rt_hr_runMu;
	Mutexdef client_server_rt_hw_mu;
	Mutexdef client_server_rt_mu;
	Mutexdef client_server_se_ticks_mu;
	Mutexdef client_server_se_conns_mu;
	Mutexdef client_server_se_historian_mu;
	Mutexdef client_server_se_notifierMu;
	Mutexdef client_server_se_mu;
	Mutexdef client_server_olapql_mu;
	Mutexdef client_server_statefulql_mu;
	Mutexdef client_server_statelessql_mu;
	Mutexdef client_server_topoServer_mu;
	Mutexdef client_server_stats_QPSRates_mu;
	Mutexdef client_server_exporter_sp_mu;
	Mutexdef client_target_state_atomicMessageInfo_initMu;
	run mutexMonitor(client_target_state_atomicMessageInfo_initMu);
	run mutexMonitor(client_server_exporter_sp_mu);
	run mutexMonitor(client_server_stats_QPSRates_mu);
	run mutexMonitor(client_server_topoServer_mu);
	run mutexMonitor(client_server_statelessql_mu);
	run mutexMonitor(client_server_statefulql_mu);
	run mutexMonitor(client_server_olapql_mu);
	run mutexMonitor(client_server_se_mu);
	run mutexMonitor(client_server_se_notifierMu);
	run mutexMonitor(client_server_se_historian_mu);
	run mutexMonitor(client_server_se_conns_mu);
	run mutexMonitor(client_server_se_ticks_mu);
	run mutexMonitor(client_server_rt_mu);
	run mutexMonitor(client_server_rt_hw_mu);
	run mutexMonitor(client_server_rt_hr_runMu);
	run mutexMonitor(client_server_rt_hr_lagMu);
	run mutexMonitor(client_server_rt_poller_mu);
	run mutexMonitor(client_server_vstreamer_se_mu);
	run mutexMonitor(client_server_vstreamer_se_notifierMu);
	run wgMonitor(client_server_vstreamer_wg);
	run mutexMonitor(client_server_vstreamer_mu);
	run mutexMonitor(client_server_vstreamer_watcherOnce_m);
	run mutexMonitor(client_server_tracker_mu);
	run wgMonitor(client_server_tracker_wg);
	run mutexMonitor(client_server_tracker_engine_mu);
	run mutexMonitor(client_server_tracker_engine_notifierMu);
	run wgMonitor(client_server_watcher_wg);
	run mutexMonitor(client_server_qe_se_mu);
	run mutexMonitor(client_server_qe_se_notifierMu);
	run mutexMonitor(client_server_qe_mu);
	run mutexMonitor(client_server_qe_queryRuleSources_mu);
	run mutexMonitor(client_server_qe_conns_mu);
	run mutexMonitor(client_server_qe_streamConns_mu);
	run mutexMonitor(client_server_qe_consolidator_mu);
	run mutexMonitor(client_server_qe_streamConsolidator_mu);
	run mutexMonitor(client_server_qe_txSerializer_mu);
	run mutexMonitor(client_server_qe_consolidatorMode_mu);
	run mutexMonitor(client_server_qe_accessCheckerLogger_mu);
	run mutexMonitor(client_server_txThrottler_state_throttleMu);
	run mutexMonitor(client_server_te_stateLock);
	run wgMonitor(client_server_te_beginRequests);
	run mutexMonitor(client_server_te_ticks_mu);
	run mutexMonitor(client_server_te_txPool_logMu);
	run mutexMonitor(client_server_te_preparedPool_mu);
	run wgMonitor(client_server_te_twoPCReady);
	run mutexMonitor(client_server_messager_mu);
	run mutexMonitor(client_server_messager_se_mu);
	run mutexMonitor(client_server_messager_se_notifierMu);
	run mutexMonitor(client_server_hs_mu);
	run mutexMonitor(client_server_hs_history_mu);
	run mutexMonitor(client_server_hs_ticks_mu);
	run mutexMonitor(client_server_hs_conns_mu);
	run mutexMonitor(client_server_lagThrottler_pool_mu);
	run mutexMonitor(client_server_lagThrottler_ts_mu);
	run mutexMonitor(client_server_lagThrottler_initMutex);
	run mutexMonitor(client_server_lagThrottler_throttledAppsMutex);
	run mutexMonitor(client_server_tableGC_pool_mu);
	run mutexMonitor(client_server_tableGC_ts_mu);
	run mutexMonitor(client_server_tableGC_initMutex);
	run mutexMonitor(client_server_tableGC_purgeMutex);
	run mutexMonitor(client_server_sm_mu);
	run wgMonitor(client_server_sm_requests);
	run mutexMonitor(client_server_sm_statelessql_mu);
	run mutexMonitor(client_server_sm_statefulql_mu);
	run mutexMonitor(client_server_sm_olapql_mu);
	run mutexMonitor(client_server_sm_hs_mu);
	run mutexMonitor(client_server_sm_hcticks_mu);
	run mutexMonitor(client_server_onlineDDLExecutor_pool_mu);
	run mutexMonitor(client_server_onlineDDLExecutor_ts_mu);
	run mutexMonitor(client_server_onlineDDLExecutor_initMutex);
	run mutexMonitor(client_server_onlineDDLExecutor_migrationMutex);
	run mutexMonitor(client_server_onlineDDLExecutor_ownedRunningMigrations_mu);
	run mutexMonitor(client_server_onlineDDLExecutor_ticks_mu);
	run BeginExecute179(client_server_sm_requests,client_server_te_beginRequests,client_server_te_twoPCReady,client_server_tracker_wg,client_server_vstreamer_wg,client_server_watcher_wg,client_server_exporter_sp_mu,client_server_hs_conns_mu,client_server_hs_history_mu,client_server_hs_mu,client_server_hs_ticks_mu,client_server_lagThrottler_initMutex,client_server_lagThrottler_pool_mu,client_server_lagThrottler_throttledAppsMutex,client_server_lagThrottler_ts_mu,client_server_messager_mu,client_server_messager_se_mu,client_server_messager_se_notifierMu,client_server_olapql_mu,client_server_onlineDDLExecutor_initMutex,client_server_onlineDDLExecutor_migrationMutex,client_server_onlineDDLExecutor_ownedRunningMigrations_mu,client_server_onlineDDLExecutor_pool_mu,client_server_onlineDDLExecutor_ticks_mu,client_server_onlineDDLExecutor_ts_mu,client_server_qe_accessCheckerLogger_mu,client_server_qe_conns_mu,client_server_qe_consolidator_mu,client_server_qe_consolidatorMode_mu,client_server_qe_mu,client_server_qe_queryRuleSources_mu,client_server_qe_se_mu,client_server_qe_se_notifierMu,client_server_qe_streamConns_mu,client_server_qe_streamConsolidator_mu,client_server_qe_txSerializer_mu,client_server_rt_hr_lagMu,client_server_rt_hr_runMu,client_server_rt_hw_mu,client_server_rt_mu,client_server_rt_poller_mu,client_server_se_conns_mu,client_server_se_historian_mu,client_server_se_mu,client_server_se_notifierMu,client_server_se_ticks_mu,client_server_sm_hcticks_mu,client_server_sm_hs_mu,client_server_sm_mu,client_server_sm_olapql_mu,client_server_sm_statefulql_mu,client_server_sm_statelessql_mu,client_server_statefulql_mu,client_server_statelessql_mu,client_server_stats_QPSRates_mu,client_server_tableGC_initMutex,client_server_tableGC_pool_mu,client_server_tableGC_purgeMutex,client_server_tableGC_ts_mu,client_server_te_preparedPool_mu,client_server_te_stateLock,client_server_te_ticks_mu,client_server_te_txPool_logMu,client_server_topoServer_mu,client_server_tracker_engine_mu,client_server_tracker_engine_notifierMu,client_server_tracker_mu,client_server_txThrottler_state_throttleMu,client_server_vstreamer_mu,client_server_vstreamer_se_mu,client_server_vstreamer_se_notifierMu,client_server_vstreamer_watcherOnce_m,client_target_state_atomicMessageInfo_initMu,child_BeginExecute1790);
	child_BeginExecute1790?0;
	run ReserveExecute303(client_server_sm_requests,client_server_te_beginRequests,client_server_te_twoPCReady,client_server_tracker_wg,client_server_vstreamer_wg,client_server_watcher_wg,client_server_exporter_sp_mu,client_server_hs_conns_mu,client_server_hs_history_mu,client_server_hs_mu,client_server_hs_ticks_mu,client_server_lagThrottler_initMutex,client_server_lagThrottler_pool_mu,client_server_lagThrottler_throttledAppsMutex,client_server_lagThrottler_ts_mu,client_server_messager_mu,client_server_messager_se_mu,client_server_messager_se_notifierMu,client_server_olapql_mu,client_server_onlineDDLExecutor_initMutex,client_server_onlineDDLExecutor_migrationMutex,client_server_onlineDDLExecutor_ownedRunningMigrations_mu,client_server_onlineDDLExecutor_pool_mu,client_server_onlineDDLExecutor_ticks_mu,client_server_onlineDDLExecutor_ts_mu,client_server_qe_accessCheckerLogger_mu,client_server_qe_conns_mu,client_server_qe_consolidator_mu,client_server_qe_consolidatorMode_mu,client_server_qe_mu,client_server_qe_queryRuleSources_mu,client_server_qe_se_mu,client_server_qe_se_notifierMu,client_server_qe_streamConns_mu,client_server_qe_streamConsolidator_mu,client_server_qe_txSerializer_mu,client_server_rt_hr_lagMu,client_server_rt_hr_runMu,client_server_rt_hw_mu,client_server_rt_mu,client_server_rt_poller_mu,client_server_se_conns_mu,client_server_se_historian_mu,client_server_se_mu,client_server_se_notifierMu,client_server_se_ticks_mu,client_server_sm_hcticks_mu,client_server_sm_hs_mu,client_server_sm_mu,client_server_sm_olapql_mu,client_server_sm_statefulql_mu,client_server_sm_statelessql_mu,client_server_statefulql_mu,client_server_statelessql_mu,client_server_stats_QPSRates_mu,client_server_tableGC_initMutex,client_server_tableGC_pool_mu,client_server_tableGC_purgeMutex,client_server_tableGC_ts_mu,client_server_te_preparedPool_mu,client_server_te_stateLock,client_server_te_ticks_mu,client_server_te_txPool_logMu,client_server_topoServer_mu,client_server_tracker_engine_mu,client_server_tracker_engine_notifierMu,client_server_tracker_mu,client_server_txThrottler_state_throttleMu,client_server_vstreamer_mu,client_server_vstreamer_se_mu,client_server_vstreamer_se_notifierMu,client_server_vstreamer_watcherOnce_m,client_target_state_atomicMessageInfo_initMu,child_ReserveExecute3032);
	child_ReserveExecute3032?0;
	run ReservedID349(client_server_sm_requests,client_server_te_beginRequests,client_server_te_twoPCReady,client_server_tracker_wg,client_server_vstreamer_wg,client_server_watcher_wg,client_server_exporter_sp_mu,client_server_hs_conns_mu,client_server_hs_history_mu,client_server_hs_mu,client_server_hs_ticks_mu,client_server_lagThrottler_initMutex,client_server_lagThrottler_pool_mu,client_server_lagThrottler_throttledAppsMutex,client_server_lagThrottler_ts_mu,client_server_messager_mu,client_server_messager_se_mu,client_server_messager_se_notifierMu,client_server_olapql_mu,client_server_onlineDDLExecutor_initMutex,client_server_onlineDDLExecutor_migrationMutex,client_server_onlineDDLExecutor_ownedRunningMigrations_mu,client_server_onlineDDLExecutor_pool_mu,client_server_onlineDDLExecutor_ticks_mu,client_server_onlineDDLExecutor_ts_mu,client_server_qe_accessCheckerLogger_mu,client_server_qe_conns_mu,client_server_qe_consolidator_mu,client_server_qe_consolidatorMode_mu,client_server_qe_mu,client_server_qe_queryRuleSources_mu,client_server_qe_se_mu,client_server_qe_se_notifierMu,client_server_qe_streamConns_mu,client_server_qe_streamConsolidator_mu,client_server_qe_txSerializer_mu,client_server_rt_hr_lagMu,client_server_rt_hr_runMu,client_server_rt_hw_mu,client_server_rt_mu,client_server_rt_poller_mu,client_server_se_conns_mu,client_server_se_historian_mu,client_server_se_mu,client_server_se_notifierMu,client_server_se_ticks_mu,client_server_sm_hcticks_mu,client_server_sm_hs_mu,client_server_sm_mu,client_server_sm_olapql_mu,client_server_sm_statefulql_mu,client_server_sm_statelessql_mu,client_server_statefulql_mu,client_server_statelessql_mu,client_server_stats_QPSRates_mu,client_server_tableGC_initMutex,client_server_tableGC_pool_mu,client_server_tableGC_purgeMutex,client_server_tableGC_ts_mu,client_server_te_preparedPool_mu,client_server_te_stateLock,client_server_te_ticks_mu,client_server_te_txPool_logMu,client_server_topoServer_mu,client_server_tracker_engine_mu,client_server_tracker_engine_notifierMu,client_server_tracker_mu,client_server_txThrottler_state_throttleMu,client_server_vstreamer_mu,client_server_vstreamer_se_mu,client_server_vstreamer_se_notifierMu,client_server_vstreamer_watcherOnce_m,client_target_state_atomicMessageInfo_initMu,child_ReservedID3493);
	child_ReservedID3493?0;
	run TransactionID344(client_server_sm_requests,client_server_te_beginRequests,client_server_te_twoPCReady,client_server_tracker_wg,client_server_vstreamer_wg,client_server_watcher_wg,client_server_exporter_sp_mu,client_server_hs_conns_mu,client_server_hs_history_mu,client_server_hs_mu,client_server_hs_ticks_mu,client_server_lagThrottler_initMutex,client_server_lagThrottler_pool_mu,client_server_lagThrottler_throttledAppsMutex,client_server_lagThrottler_ts_mu,client_server_messager_mu,client_server_messager_se_mu,client_server_messager_se_notifierMu,client_server_olapql_mu,client_server_onlineDDLExecutor_initMutex,client_server_onlineDDLExecutor_migrationMutex,client_server_onlineDDLExecutor_ownedRunningMigrations_mu,client_server_onlineDDLExecutor_pool_mu,client_server_onlineDDLExecutor_ticks_mu,client_server_onlineDDLExecutor_ts_mu,client_server_qe_accessCheckerLogger_mu,client_server_qe_conns_mu,client_server_qe_consolidator_mu,client_server_qe_consolidatorMode_mu,client_server_qe_mu,client_server_qe_queryRuleSources_mu,client_server_qe_se_mu,client_server_qe_se_notifierMu,client_server_qe_streamConns_mu,client_server_qe_streamConsolidator_mu,client_server_qe_txSerializer_mu,client_server_rt_hr_lagMu,client_server_rt_hr_runMu,client_server_rt_hw_mu,client_server_rt_mu,client_server_rt_poller_mu,client_server_se_conns_mu,client_server_se_historian_mu,client_server_se_mu,client_server_se_notifierMu,client_server_se_ticks_mu,client_server_sm_hcticks_mu,client_server_sm_hs_mu,client_server_sm_mu,client_server_sm_olapql_mu,client_server_sm_statefulql_mu,client_server_sm_statelessql_mu,client_server_statefulql_mu,client_server_statelessql_mu,client_server_stats_QPSRates_mu,client_server_tableGC_initMutex,client_server_tableGC_pool_mu,client_server_tableGC_purgeMutex,client_server_tableGC_ts_mu,client_server_te_preparedPool_mu,client_server_te_stateLock,client_server_te_ticks_mu,client_server_te_txPool_logMu,client_server_topoServer_mu,client_server_tracker_engine_mu,client_server_tracker_engine_notifierMu,client_server_tracker_mu,client_server_txThrottler_state_throttleMu,client_server_vstreamer_mu,client_server_vstreamer_se_mu,client_server_vstreamer_se_notifierMu,client_server_vstreamer_watcherOnce_m,client_target_state_atomicMessageInfo_initMu,child_TransactionID3444);
	child_TransactionID3444?0;
	run Release333(client_server_sm_requests,client_server_te_beginRequests,client_server_te_twoPCReady,client_server_tracker_wg,client_server_vstreamer_wg,client_server_watcher_wg,client_server_exporter_sp_mu,client_server_hs_conns_mu,client_server_hs_history_mu,client_server_hs_mu,client_server_hs_ticks_mu,client_server_lagThrottler_initMutex,client_server_lagThrottler_pool_mu,client_server_lagThrottler_throttledAppsMutex,client_server_lagThrottler_ts_mu,client_server_messager_mu,client_server_messager_se_mu,client_server_messager_se_notifierMu,client_server_olapql_mu,client_server_onlineDDLExecutor_initMutex,client_server_onlineDDLExecutor_migrationMutex,client_server_onlineDDLExecutor_ownedRunningMigrations_mu,client_server_onlineDDLExecutor_pool_mu,client_server_onlineDDLExecutor_ticks_mu,client_server_onlineDDLExecutor_ts_mu,client_server_qe_accessCheckerLogger_mu,client_server_qe_conns_mu,client_server_qe_consolidator_mu,client_server_qe_consolidatorMode_mu,client_server_qe_mu,client_server_qe_queryRuleSources_mu,client_server_qe_se_mu,client_server_qe_se_notifierMu,client_server_qe_streamConns_mu,client_server_qe_streamConsolidator_mu,client_server_qe_txSerializer_mu,client_server_rt_hr_lagMu,client_server_rt_hr_runMu,client_server_rt_hw_mu,client_server_rt_mu,client_server_rt_poller_mu,client_server_se_conns_mu,client_server_se_historian_mu,client_server_se_mu,client_server_se_notifierMu,client_server_se_ticks_mu,client_server_sm_hcticks_mu,client_server_sm_hs_mu,client_server_sm_mu,client_server_sm_olapql_mu,client_server_sm_statefulql_mu,client_server_sm_statelessql_mu,client_server_statefulql_mu,client_server_statelessql_mu,client_server_stats_QPSRates_mu,client_server_tableGC_initMutex,client_server_tableGC_pool_mu,client_server_tableGC_purgeMutex,client_server_tableGC_ts_mu,client_server_te_preparedPool_mu,client_server_te_stateLock,client_server_te_ticks_mu,client_server_te_txPool_logMu,client_server_topoServer_mu,client_server_tracker_engine_mu,client_server_tracker_engine_notifierMu,client_server_tracker_mu,client_server_txThrottler_state_throttleMu,client_server_vstreamer_mu,client_server_vstreamer_se_mu,client_server_vstreamer_se_notifierMu,client_server_vstreamer_watcherOnce_m,client_target_state_atomicMessageInfo_initMu,child_Release3335);
	child_Release3335?0;
		defer1: skip;
	run Release333(client_server_sm_requests,client_server_te_beginRequests,client_server_te_twoPCReady,client_server_tracker_wg,client_server_vstreamer_wg,client_server_watcher_wg,client_server_exporter_sp_mu,client_server_hs_conns_mu,client_server_hs_history_mu,client_server_hs_mu,client_server_hs_ticks_mu,client_server_lagThrottler_initMutex,client_server_lagThrottler_pool_mu,client_server_lagThrottler_throttledAppsMutex,client_server_lagThrottler_ts_mu,client_server_messager_mu,client_server_messager_se_mu,client_server_messager_se_notifierMu,client_server_olapql_mu,client_server_onlineDDLExecutor_initMutex,client_server_onlineDDLExecutor_migrationMutex,client_server_onlineDDLExecutor_ownedRunningMigrations_mu,client_server_onlineDDLExecutor_pool_mu,client_server_onlineDDLExecutor_ticks_mu,client_server_onlineDDLExecutor_ts_mu,client_server_qe_accessCheckerLogger_mu,client_server_qe_conns_mu,client_server_qe_consolidator_mu,client_server_qe_consolidatorMode_mu,client_server_qe_mu,client_server_qe_queryRuleSources_mu,client_server_qe_se_mu,client_server_qe_se_notifierMu,client_server_qe_streamConns_mu,client_server_qe_streamConsolidator_mu,client_server_qe_txSerializer_mu,client_server_rt_hr_lagMu,client_server_rt_hr_runMu,client_server_rt_hw_mu,client_server_rt_mu,client_server_rt_poller_mu,client_server_se_conns_mu,client_server_se_historian_mu,client_server_se_mu,client_server_se_notifierMu,client_server_se_ticks_mu,client_server_sm_hcticks_mu,client_server_sm_hs_mu,client_server_sm_mu,client_server_sm_olapql_mu,client_server_sm_statefulql_mu,client_server_sm_statelessql_mu,client_server_statefulql_mu,client_server_statelessql_mu,client_server_stats_QPSRates_mu,client_server_tableGC_initMutex,client_server_tableGC_pool_mu,client_server_tableGC_purgeMutex,client_server_tableGC_ts_mu,client_server_te_preparedPool_mu,client_server_te_stateLock,client_server_te_ticks_mu,client_server_te_txPool_logMu,client_server_topoServer_mu,client_server_tracker_engine_mu,client_server_tracker_engine_notifierMu,client_server_tracker_mu,client_server_txThrottler_state_throttleMu,client_server_vstreamer_mu,client_server_vstreamer_se_mu,client_server_vstreamer_se_notifierMu,client_server_vstreamer_watcherOnce_m,client_target_state_atomicMessageInfo_initMu,child_Release3331);
	child_Release3331?0;
	stop_process: skip;
	child!0
}
proctype BeginExecute179(Wgdef client_server_sm_requests;Wgdef client_server_te_beginRequests;Wgdef client_server_te_twoPCReady;Wgdef client_server_tracker_wg;Wgdef client_server_vstreamer_wg;Wgdef client_server_watcher_wg;Mutexdef client_server_exporter_sp_mu;Mutexdef client_server_hs_conns_mu;Mutexdef client_server_hs_history_mu;Mutexdef client_server_hs_mu;Mutexdef client_server_hs_ticks_mu;Mutexdef client_server_lagThrottler_initMutex;Mutexdef client_server_lagThrottler_pool_mu;Mutexdef client_server_lagThrottler_throttledAppsMutex;Mutexdef client_server_lagThrottler_ts_mu;Mutexdef client_server_messager_mu;Mutexdef client_server_messager_se_mu;Mutexdef client_server_messager_se_notifierMu;Mutexdef client_server_olapql_mu;Mutexdef client_server_onlineDDLExecutor_initMutex;Mutexdef client_server_onlineDDLExecutor_migrationMutex;Mutexdef client_server_onlineDDLExecutor_ownedRunningMigrations_mu;Mutexdef client_server_onlineDDLExecutor_pool_mu;Mutexdef client_server_onlineDDLExecutor_ticks_mu;Mutexdef client_server_onlineDDLExecutor_ts_mu;Mutexdef client_server_qe_accessCheckerLogger_mu;Mutexdef client_server_qe_conns_mu;Mutexdef client_server_qe_consolidator_mu;Mutexdef client_server_qe_consolidatorMode_mu;Mutexdef client_server_qe_mu;Mutexdef client_server_qe_queryRuleSources_mu;Mutexdef client_server_qe_se_mu;Mutexdef client_server_qe_se_notifierMu;Mutexdef client_server_qe_streamConns_mu;Mutexdef client_server_qe_streamConsolidator_mu;Mutexdef client_server_qe_txSerializer_mu;Mutexdef client_server_rt_hr_lagMu;Mutexdef client_server_rt_hr_runMu;Mutexdef client_server_rt_hw_mu;Mutexdef client_server_rt_mu;Mutexdef client_server_rt_poller_mu;Mutexdef client_server_se_conns_mu;Mutexdef client_server_se_historian_mu;Mutexdef client_server_se_mu;Mutexdef client_server_se_notifierMu;Mutexdef client_server_se_ticks_mu;Mutexdef client_server_sm_hcticks_mu;Mutexdef client_server_sm_hs_mu;Mutexdef client_server_sm_mu;Mutexdef client_server_sm_olapql_mu;Mutexdef client_server_sm_statefulql_mu;Mutexdef client_server_sm_statelessql_mu;Mutexdef client_server_statefulql_mu;Mutexdef client_server_statelessql_mu;Mutexdef client_server_stats_QPSRates_mu;Mutexdef client_server_tableGC_initMutex;Mutexdef client_server_tableGC_pool_mu;Mutexdef client_server_tableGC_purgeMutex;Mutexdef client_server_tableGC_ts_mu;Mutexdef client_server_te_preparedPool_mu;Mutexdef client_server_te_stateLock;Mutexdef client_server_te_ticks_mu;Mutexdef client_server_te_txPool_logMu;Mutexdef client_server_topoServer_mu;Mutexdef client_server_tracker_engine_mu;Mutexdef client_server_tracker_engine_notifierMu;Mutexdef client_server_tracker_mu;Mutexdef client_server_txThrottler_state_throttleMu;Mutexdef client_server_vstreamer_mu;Mutexdef client_server_vstreamer_se_mu;Mutexdef client_server_vstreamer_se_notifierMu;Mutexdef client_server_vstreamer_watcherOnce_m;Mutexdef client_target_state_atomicMessageInfo_initMu;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	Mutexdef __state_atomicMessageInfo_initMu;
	

	if
	:: true -> 
		goto stop_process
	:: true;
	fi;
	run mutexMonitor(__state_atomicMessageInfo_initMu);
	

	if
	:: true -> 
		goto stop_process
	:: true;
	fi;
	goto stop_process;
	stop_process: skip;
	child!0
}
proctype Release333(Wgdef client_server_sm_requests;Wgdef client_server_te_beginRequests;Wgdef client_server_te_twoPCReady;Wgdef client_server_tracker_wg;Wgdef client_server_vstreamer_wg;Wgdef client_server_watcher_wg;Mutexdef client_server_exporter_sp_mu;Mutexdef client_server_hs_conns_mu;Mutexdef client_server_hs_history_mu;Mutexdef client_server_hs_mu;Mutexdef client_server_hs_ticks_mu;Mutexdef client_server_lagThrottler_initMutex;Mutexdef client_server_lagThrottler_pool_mu;Mutexdef client_server_lagThrottler_throttledAppsMutex;Mutexdef client_server_lagThrottler_ts_mu;Mutexdef client_server_messager_mu;Mutexdef client_server_messager_se_mu;Mutexdef client_server_messager_se_notifierMu;Mutexdef client_server_olapql_mu;Mutexdef client_server_onlineDDLExecutor_initMutex;Mutexdef client_server_onlineDDLExecutor_migrationMutex;Mutexdef client_server_onlineDDLExecutor_ownedRunningMigrations_mu;Mutexdef client_server_onlineDDLExecutor_pool_mu;Mutexdef client_server_onlineDDLExecutor_ticks_mu;Mutexdef client_server_onlineDDLExecutor_ts_mu;Mutexdef client_server_qe_accessCheckerLogger_mu;Mutexdef client_server_qe_conns_mu;Mutexdef client_server_qe_consolidator_mu;Mutexdef client_server_qe_consolidatorMode_mu;Mutexdef client_server_qe_mu;Mutexdef client_server_qe_queryRuleSources_mu;Mutexdef client_server_qe_se_mu;Mutexdef client_server_qe_se_notifierMu;Mutexdef client_server_qe_streamConns_mu;Mutexdef client_server_qe_streamConsolidator_mu;Mutexdef client_server_qe_txSerializer_mu;Mutexdef client_server_rt_hr_lagMu;Mutexdef client_server_rt_hr_runMu;Mutexdef client_server_rt_hw_mu;Mutexdef client_server_rt_mu;Mutexdef client_server_rt_poller_mu;Mutexdef client_server_se_conns_mu;Mutexdef client_server_se_historian_mu;Mutexdef client_server_se_mu;Mutexdef client_server_se_notifierMu;Mutexdef client_server_se_ticks_mu;Mutexdef client_server_sm_hcticks_mu;Mutexdef client_server_sm_hs_mu;Mutexdef client_server_sm_mu;Mutexdef client_server_sm_olapql_mu;Mutexdef client_server_sm_statefulql_mu;Mutexdef client_server_sm_statelessql_mu;Mutexdef client_server_statefulql_mu;Mutexdef client_server_statelessql_mu;Mutexdef client_server_stats_QPSRates_mu;Mutexdef client_server_tableGC_initMutex;Mutexdef client_server_tableGC_pool_mu;Mutexdef client_server_tableGC_purgeMutex;Mutexdef client_server_tableGC_ts_mu;Mutexdef client_server_te_preparedPool_mu;Mutexdef client_server_te_stateLock;Mutexdef client_server_te_ticks_mu;Mutexdef client_server_te_txPool_logMu;Mutexdef client_server_topoServer_mu;Mutexdef client_server_tracker_engine_mu;Mutexdef client_server_tracker_engine_notifierMu;Mutexdef client_server_tracker_mu;Mutexdef client_server_txThrottler_state_throttleMu;Mutexdef client_server_vstreamer_mu;Mutexdef client_server_vstreamer_se_mu;Mutexdef client_server_vstreamer_se_notifierMu;Mutexdef client_server_vstreamer_watcherOnce_m;Mutexdef client_target_state_atomicMessageInfo_initMu;chan child) {
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
proctype ReserveExecute303(Wgdef client_server_sm_requests;Wgdef client_server_te_beginRequests;Wgdef client_server_te_twoPCReady;Wgdef client_server_tracker_wg;Wgdef client_server_vstreamer_wg;Wgdef client_server_watcher_wg;Mutexdef client_server_exporter_sp_mu;Mutexdef client_server_hs_conns_mu;Mutexdef client_server_hs_history_mu;Mutexdef client_server_hs_mu;Mutexdef client_server_hs_ticks_mu;Mutexdef client_server_lagThrottler_initMutex;Mutexdef client_server_lagThrottler_pool_mu;Mutexdef client_server_lagThrottler_throttledAppsMutex;Mutexdef client_server_lagThrottler_ts_mu;Mutexdef client_server_messager_mu;Mutexdef client_server_messager_se_mu;Mutexdef client_server_messager_se_notifierMu;Mutexdef client_server_olapql_mu;Mutexdef client_server_onlineDDLExecutor_initMutex;Mutexdef client_server_onlineDDLExecutor_migrationMutex;Mutexdef client_server_onlineDDLExecutor_ownedRunningMigrations_mu;Mutexdef client_server_onlineDDLExecutor_pool_mu;Mutexdef client_server_onlineDDLExecutor_ticks_mu;Mutexdef client_server_onlineDDLExecutor_ts_mu;Mutexdef client_server_qe_accessCheckerLogger_mu;Mutexdef client_server_qe_conns_mu;Mutexdef client_server_qe_consolidator_mu;Mutexdef client_server_qe_consolidatorMode_mu;Mutexdef client_server_qe_mu;Mutexdef client_server_qe_queryRuleSources_mu;Mutexdef client_server_qe_se_mu;Mutexdef client_server_qe_se_notifierMu;Mutexdef client_server_qe_streamConns_mu;Mutexdef client_server_qe_streamConsolidator_mu;Mutexdef client_server_qe_txSerializer_mu;Mutexdef client_server_rt_hr_lagMu;Mutexdef client_server_rt_hr_runMu;Mutexdef client_server_rt_hw_mu;Mutexdef client_server_rt_mu;Mutexdef client_server_rt_poller_mu;Mutexdef client_server_se_conns_mu;Mutexdef client_server_se_historian_mu;Mutexdef client_server_se_mu;Mutexdef client_server_se_notifierMu;Mutexdef client_server_se_ticks_mu;Mutexdef client_server_sm_hcticks_mu;Mutexdef client_server_sm_hs_mu;Mutexdef client_server_sm_mu;Mutexdef client_server_sm_olapql_mu;Mutexdef client_server_sm_statefulql_mu;Mutexdef client_server_sm_statelessql_mu;Mutexdef client_server_statefulql_mu;Mutexdef client_server_statelessql_mu;Mutexdef client_server_stats_QPSRates_mu;Mutexdef client_server_tableGC_initMutex;Mutexdef client_server_tableGC_pool_mu;Mutexdef client_server_tableGC_purgeMutex;Mutexdef client_server_tableGC_ts_mu;Mutexdef client_server_te_preparedPool_mu;Mutexdef client_server_te_stateLock;Mutexdef client_server_te_ticks_mu;Mutexdef client_server_te_txPool_logMu;Mutexdef client_server_topoServer_mu;Mutexdef client_server_tracker_engine_mu;Mutexdef client_server_tracker_engine_notifierMu;Mutexdef client_server_tracker_mu;Mutexdef client_server_txThrottler_state_throttleMu;Mutexdef client_server_vstreamer_mu;Mutexdef client_server_vstreamer_se_mu;Mutexdef client_server_vstreamer_se_notifierMu;Mutexdef client_server_vstreamer_watcherOnce_m;Mutexdef client_target_state_atomicMessageInfo_initMu;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	Mutexdef __state_atomicMessageInfo_initMu;
	

	if
	:: true -> 
		goto stop_process
	:: true;
	fi;
	run mutexMonitor(__state_atomicMessageInfo_initMu);
	

	if
	:: true -> 
		goto stop_process
	:: true;
	fi;
	goto stop_process;
	stop_process: skip;
	child!0
}
proctype ReservedID349(Wgdef client_server_sm_requests;Wgdef client_server_te_beginRequests;Wgdef client_server_te_twoPCReady;Wgdef client_server_tracker_wg;Wgdef client_server_vstreamer_wg;Wgdef client_server_watcher_wg;Mutexdef client_server_exporter_sp_mu;Mutexdef client_server_hs_conns_mu;Mutexdef client_server_hs_history_mu;Mutexdef client_server_hs_mu;Mutexdef client_server_hs_ticks_mu;Mutexdef client_server_lagThrottler_initMutex;Mutexdef client_server_lagThrottler_pool_mu;Mutexdef client_server_lagThrottler_throttledAppsMutex;Mutexdef client_server_lagThrottler_ts_mu;Mutexdef client_server_messager_mu;Mutexdef client_server_messager_se_mu;Mutexdef client_server_messager_se_notifierMu;Mutexdef client_server_olapql_mu;Mutexdef client_server_onlineDDLExecutor_initMutex;Mutexdef client_server_onlineDDLExecutor_migrationMutex;Mutexdef client_server_onlineDDLExecutor_ownedRunningMigrations_mu;Mutexdef client_server_onlineDDLExecutor_pool_mu;Mutexdef client_server_onlineDDLExecutor_ticks_mu;Mutexdef client_server_onlineDDLExecutor_ts_mu;Mutexdef client_server_qe_accessCheckerLogger_mu;Mutexdef client_server_qe_conns_mu;Mutexdef client_server_qe_consolidator_mu;Mutexdef client_server_qe_consolidatorMode_mu;Mutexdef client_server_qe_mu;Mutexdef client_server_qe_queryRuleSources_mu;Mutexdef client_server_qe_se_mu;Mutexdef client_server_qe_se_notifierMu;Mutexdef client_server_qe_streamConns_mu;Mutexdef client_server_qe_streamConsolidator_mu;Mutexdef client_server_qe_txSerializer_mu;Mutexdef client_server_rt_hr_lagMu;Mutexdef client_server_rt_hr_runMu;Mutexdef client_server_rt_hw_mu;Mutexdef client_server_rt_mu;Mutexdef client_server_rt_poller_mu;Mutexdef client_server_se_conns_mu;Mutexdef client_server_se_historian_mu;Mutexdef client_server_se_mu;Mutexdef client_server_se_notifierMu;Mutexdef client_server_se_ticks_mu;Mutexdef client_server_sm_hcticks_mu;Mutexdef client_server_sm_hs_mu;Mutexdef client_server_sm_mu;Mutexdef client_server_sm_olapql_mu;Mutexdef client_server_sm_statefulql_mu;Mutexdef client_server_sm_statelessql_mu;Mutexdef client_server_statefulql_mu;Mutexdef client_server_statelessql_mu;Mutexdef client_server_stats_QPSRates_mu;Mutexdef client_server_tableGC_initMutex;Mutexdef client_server_tableGC_pool_mu;Mutexdef client_server_tableGC_purgeMutex;Mutexdef client_server_tableGC_ts_mu;Mutexdef client_server_te_preparedPool_mu;Mutexdef client_server_te_stateLock;Mutexdef client_server_te_ticks_mu;Mutexdef client_server_te_txPool_logMu;Mutexdef client_server_topoServer_mu;Mutexdef client_server_tracker_engine_mu;Mutexdef client_server_tracker_engine_notifierMu;Mutexdef client_server_tracker_mu;Mutexdef client_server_txThrottler_state_throttleMu;Mutexdef client_server_vstreamer_mu;Mutexdef client_server_vstreamer_se_mu;Mutexdef client_server_vstreamer_se_notifierMu;Mutexdef client_server_vstreamer_watcherOnce_m;Mutexdef client_target_state_atomicMessageInfo_initMu;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	goto stop_process;
	stop_process: skip;
	child!0
}
proctype TransactionID344(Wgdef client_server_sm_requests;Wgdef client_server_te_beginRequests;Wgdef client_server_te_twoPCReady;Wgdef client_server_tracker_wg;Wgdef client_server_vstreamer_wg;Wgdef client_server_watcher_wg;Mutexdef client_server_exporter_sp_mu;Mutexdef client_server_hs_conns_mu;Mutexdef client_server_hs_history_mu;Mutexdef client_server_hs_mu;Mutexdef client_server_hs_ticks_mu;Mutexdef client_server_lagThrottler_initMutex;Mutexdef client_server_lagThrottler_pool_mu;Mutexdef client_server_lagThrottler_throttledAppsMutex;Mutexdef client_server_lagThrottler_ts_mu;Mutexdef client_server_messager_mu;Mutexdef client_server_messager_se_mu;Mutexdef client_server_messager_se_notifierMu;Mutexdef client_server_olapql_mu;Mutexdef client_server_onlineDDLExecutor_initMutex;Mutexdef client_server_onlineDDLExecutor_migrationMutex;Mutexdef client_server_onlineDDLExecutor_ownedRunningMigrations_mu;Mutexdef client_server_onlineDDLExecutor_pool_mu;Mutexdef client_server_onlineDDLExecutor_ticks_mu;Mutexdef client_server_onlineDDLExecutor_ts_mu;Mutexdef client_server_qe_accessCheckerLogger_mu;Mutexdef client_server_qe_conns_mu;Mutexdef client_server_qe_consolidator_mu;Mutexdef client_server_qe_consolidatorMode_mu;Mutexdef client_server_qe_mu;Mutexdef client_server_qe_queryRuleSources_mu;Mutexdef client_server_qe_se_mu;Mutexdef client_server_qe_se_notifierMu;Mutexdef client_server_qe_streamConns_mu;Mutexdef client_server_qe_streamConsolidator_mu;Mutexdef client_server_qe_txSerializer_mu;Mutexdef client_server_rt_hr_lagMu;Mutexdef client_server_rt_hr_runMu;Mutexdef client_server_rt_hw_mu;Mutexdef client_server_rt_mu;Mutexdef client_server_rt_poller_mu;Mutexdef client_server_se_conns_mu;Mutexdef client_server_se_historian_mu;Mutexdef client_server_se_mu;Mutexdef client_server_se_notifierMu;Mutexdef client_server_se_ticks_mu;Mutexdef client_server_sm_hcticks_mu;Mutexdef client_server_sm_hs_mu;Mutexdef client_server_sm_mu;Mutexdef client_server_sm_olapql_mu;Mutexdef client_server_sm_statefulql_mu;Mutexdef client_server_sm_statelessql_mu;Mutexdef client_server_statefulql_mu;Mutexdef client_server_statelessql_mu;Mutexdef client_server_stats_QPSRates_mu;Mutexdef client_server_tableGC_initMutex;Mutexdef client_server_tableGC_pool_mu;Mutexdef client_server_tableGC_purgeMutex;Mutexdef client_server_tableGC_ts_mu;Mutexdef client_server_te_preparedPool_mu;Mutexdef client_server_te_stateLock;Mutexdef client_server_te_ticks_mu;Mutexdef client_server_te_txPool_logMu;Mutexdef client_server_topoServer_mu;Mutexdef client_server_tracker_engine_mu;Mutexdef client_server_tracker_engine_notifierMu;Mutexdef client_server_tracker_mu;Mutexdef client_server_txThrottler_state_throttleMu;Mutexdef client_server_vstreamer_mu;Mutexdef client_server_vstreamer_se_mu;Mutexdef client_server_vstreamer_se_notifierMu;Mutexdef client_server_vstreamer_watcherOnce_m;Mutexdef client_target_state_atomicMessageInfo_initMu;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	goto stop_process;
	stop_process: skip;
	child!0
}

 /* ================================================================================== */
 /* ================================================================================== */
 /* ================================================================================== */ 
proctype wgMonitor(Wgdef wg) {
int i;
do
	:: wg.update?i ->
		wg.Counter = wg.Counter + i;
		assert(wg.Counter >= 0)
	:: wg.Counter == 0 ->
end: if
		:: wg.update?i ->
			wg.Counter = wg.Counter + i;
			assert(wg.Counter >= 0)
		:: wg.wait!0;
	fi
od
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

