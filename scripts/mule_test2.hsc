;=====================================================================;
;=====globals=========================================================;
;=====================================================================;


;=====================================================================;
;=====main script=====================================================;
;=====================================================================;

(script startup mule_test
	(print "hello")
	(ai_allegiance player human)
	
	(sleep 1)
	
	(wake sc_mule)
	
)


(script dormant sc_mule
	(ai_place sq_mule)
	
	(sleep_until
		(begin
			(sleep_until (= (ai_task_count obj_mule/mg_mule) 0) 1)
				(sleep 150)
				(garbage_collect_unsafe)
				(ai_place sq_mule)
		0)
	1)
)


