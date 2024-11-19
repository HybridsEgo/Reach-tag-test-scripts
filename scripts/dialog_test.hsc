;=====================================================================;
;=====globals=========================================================;
;=====================================================================;

(global short s_cycle 0)

;=====================================================================;
;=====main script=====================================================;
;=====================================================================;

(script startup dialog_test
	(print "dialog_test")
	(ai_allegiance player human)
	
	(sleep 1)	
	
	(wake sc_spawn)
	;(wake sc_cycle)
	(wake sc_help)

)

(script dormant sc_spawn
	(wake sc_spawn_elite)
	
	(wake sc_spawn_marine)
		
)

(script dormant sc_spawn_elite
	(sleep_until
		(begin
			(sleep_until (= (ai_task_count obj_covenant/main_gate) 0) 1)
				(ai_place sq_elite01)
		0)
	1)
)

(script dormant sc_spawn_marine
	(sleep_until
		(begin
			(sleep_until (= (ai_task_count obj_unsc/main_gate) 0) 1)
				(ai_place sq_marine01)
		0)
	1)
)

(script dormant sc_cycle
	(sleep_until
		(begin
			(sleep 300)
			(if (<= s_cycle 1)
				(set s_cycle (+ s_cycle 1)) 
				(set s_cycle 0)
			)
			(print "changed")
		0)
	1)
)

(script static void 0
	(set s_cycle 0)
	(print "normal")
)

(script static void 1
	(set s_cycle 1)
	(print "aggressive")
)

(script static void 2
	(set s_cycle 2)
	(print "under pressure")
)

(script dormant sc_help
	(sleep_until
		(begin
			(print " ************* ")
			(print "waiting for input")
			(print "hit 0 for normal state combat dialog")
			(print "hit 1 for aggressive state combat dialog")
			(print "hit 2 for under pressure state combat dialog")
			(print " ************* ")
			(print " ************* ")
			(if (= s_cycle 0)
				(print "currently set to NORMAL")
			)
			(if (= s_cycle 1)
				(print "currently set to AGGRESSIVE")
			)
			(if (= s_cycle 2)
				(print "currently set to UNDER PRESSURE")
			)	
			(print " ************* ")					
			(sleep 210)
		0)
	1)
)