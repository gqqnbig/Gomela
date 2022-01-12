// num_comm_params=0
// num_mand_comm_params=0
// num_opt_comm_params=0

// git_link=https://github.com/gocolly/colly/blob//xmlelement_test.go#L66
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
	chan child_TestChildText660 = [1] of {int};
	run TestChildText66(child_TestChildText660);
	run receiver(child_TestChildText660)
stop_process:skip
}

proctype TestChildText66(chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	chan child_ChildText892 = [1] of {int};
	chan child_ChildText891 = [1] of {int};
	chan child_NewXMLElementFromHTMLNode430 = [1] of {int};
	Mutexdef xmlElem_Response_Request_collector_lock;
	Wgdef xmlElem_Response_Request_collector_wg;
	Mutexdef xmlElem_Response_Request_Ctx_lock;
	Mutexdef xmlElem_Response_Ctx_lock;
	Mutexdef xmlElem_Request_collector_lock;
	Wgdef xmlElem_Request_collector_wg;
	Mutexdef xmlElem_Request_collector_backend_lock;
	Mutexdef xmlElem_Request_Ctx_lock;
	Mutexdef resp_Request_collector_lock;
	Wgdef resp_Request_collector_wg;
	Mutexdef resp_Request_collector_backend_lock;
	Mutexdef resp_Request_Ctx_lock;
	Mutexdef resp_Ctx_lock;
	run mutexMonitor(resp_Ctx_lock);
	run mutexMonitor(resp_Request_Ctx_lock);
	run mutexMonitor(resp_Request_collector_backend_lock);
	run wgMonitor(resp_Request_collector_wg);
	run mutexMonitor(resp_Request_collector_lock);
	run mutexMonitor(xmlElem_Request_Ctx_lock);
	run mutexMonitor(xmlElem_Request_collector_backend_lock);
	run wgMonitor(xmlElem_Request_collector_wg);
	run mutexMonitor(xmlElem_Request_collector_lock);
	run mutexMonitor(xmlElem_Response_Ctx_lock);
	run mutexMonitor(xmlElem_Response_Request_Ctx_lock);
	run wgMonitor(xmlElem_Response_Request_collector_wg);
	run mutexMonitor(xmlElem_Response_Request_collector_lock);
	run NewXMLElementFromHTMLNode43(resp_Request_collector_wg,resp_Ctx_lock,resp_Request_Ctx_lock,resp_Request_collector_backend_lock,resp_Request_collector_lock,child_NewXMLElementFromHTMLNode430);
	child_NewXMLElementFromHTMLNode430?0;
	run ChildText89(xmlElem_Request_collector_wg,xmlElem_Response_Request_collector_wg,xmlElem_Request_Ctx_lock,xmlElem_Request_collector_backend_lock,xmlElem_Request_collector_lock,xmlElem_Response_Ctx_lock,xmlElem_Response_Request_Ctx_lock,xmlElem_Response_Request_collector_lock,child_ChildText891);
	child_ChildText891?0;
	run ChildText89(xmlElem_Request_collector_wg,xmlElem_Response_Request_collector_wg,xmlElem_Request_Ctx_lock,xmlElem_Request_collector_backend_lock,xmlElem_Request_collector_lock,xmlElem_Response_Ctx_lock,xmlElem_Response_Request_Ctx_lock,xmlElem_Response_Request_collector_lock,child_ChildText892);
	child_ChildText892?0;
	stop_process: skip;
	child!0
}
proctype NewXMLElementFromHTMLNode43(Wgdef resp_Request_collector_wg;Mutexdef resp_Ctx_lock;Mutexdef resp_Request_Ctx_lock;Mutexdef resp_Request_collector_backend_lock;Mutexdef resp_Request_collector_lock;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	goto stop_process;
	stop_process: skip;
	child!0
}
proctype ChildText89(Wgdef h_Request_collector_wg;Wgdef h_Response_Request_collector_wg;Mutexdef h_Request_Ctx_lock;Mutexdef h_Request_collector_backend_lock;Mutexdef h_Request_collector_lock;Mutexdef h_Response_Ctx_lock;Mutexdef h_Response_Request_Ctx_lock;Mutexdef h_Response_Request_collector_lock;chan child) {
	bool closed; 
	int i;
	bool state;
	int num_msgs;
	

	if
	:: true -> 
		

		if
		:: true -> 
			goto stop_process
		:: true;
		fi;
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

