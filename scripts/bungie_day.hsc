;=====================================================================;
;=====globals=========================================================;
;=====================================================================;
(global boolean b_elite 0)

;=====================================================================;
;=====main script=====================================================;
;=====================================================================;

(script startup fireteam_test
	(print "welcome to fireteam test")
	(ai_allegiance player human)
	
	(sleep 1)
	
	(wake sc_elites)
	(wake sc_marines)
	
	(sleep 1)
	
	(wake sc_fireteam_initialize)
)

(script dormant sc_fireteam_initialize
	(ai_set_fireteam_absorber sq_marines 1)
	;(set debug_fire_teams 1)
	(ai_player_add_fireteam_squad (player0) sq_fireteam)
	(ai_player_set_fireteam_max (player0) 3)	
	(ai_player_set_fireteam_max_squad_absorb_distance (player0) 6.0)
)

(script dormant sc_marines
	(sleep_until
		(begin
			(sleep_until (< (ai_task_count obj_marine/main_gate) 4) 1)
				(sleep 10)
				(if (= b_elite 0)
					(ai_place sq_marines/01)
					(ai_place sq_marines/02)
				)
				(sleep 1)
		0)
	1)
)

(script dormant sc_elites
	(ai_place sq_covenant01)
	(ai_place sq_covenant02)
	
	(sleep 1)
	
	(ai_place sq_shade01)
	
	;*(sleep_until
		(begin
			(sleep_until (= (ai_task_count obj_covenant/main_gate) 0) 1)
				(sleep 300)
				(ai_place sq_covenant01)
				(ai_place sq_covenant02)
				(sleep 60)
		0)
	1)*;
)

(script static void 1
	(ai_erase sq_marines)
	(ai_erase sq_fireteam)
	(ai_erase sq_elites)
	
	(if (= b_elite 0)
		(set b_elite 1)
		(set b_elite 0)
	)		

)
