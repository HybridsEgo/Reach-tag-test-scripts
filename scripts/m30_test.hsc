;=====================================================================;
;=====globals=========================================================;
;=====================================================================;
(global boolean b_evaluate 0)


;=====================================================================;
;=====main script=====================================================;
;=====================================================================;

(script startup m30_test
	(print "welcome to m30 test")
	(ai_allegiance player human)
	
	(sleep 1)

	(wake sc_trooper_spawn)
	(wake sc_covenant_spawn)

)

(script dormant sc_trooper_spawn
	(sleep_until
		(begin
			(sleep_until (= (ai_task_count obj_trooper/main_gate) 0) 1)
				(ai_place sq_trooper01)
				(ai_place sq_trooper02)
		0)
	)
)

(script dormant sc_covenant_spawn
	(sleep_until
		(begin
			(sleep_until (= (ai_task_count obj_covenant/main_gate) 0) 1)
				(ai_place sq_covenant01)
				(ai_place sq_covenant02)
		0)
	)
)

(script static void evaluate
	(if (= b_evaluate 0)
		(begin
			(set ai_render_evaluations 1)
			(set ai_render_evaluations_detailed 1)
			(set ai_render_evaluations_text 1)
			(set ai_render_firing_position_statistics 1)
			(set ai_render_decisions 1)
			(set ai_render_behavior_stack 1)
			(set ai_render_aiming_vectors 1)
			(set b_evaluate 1)
		)
		(begin
			(set ai_render_evaluations 0)
			(set ai_render_evaluations_detailed 0)
			(set ai_render_evaluations_text 0)
			(set ai_render_firing_position_statistics 0)
			(set ai_render_decisions 0)
			(set ai_render_behavior_stack 0)
			(set ai_render_aiming_vectors 0)
			(set b_evaluate 0)
		)		
	)
)

(script static void shooting
	(if (= ai_render_shooting 0)
		(begin
			(print "shooting set to 1")
			(set ai_render_shooting 1)
		)
		(begin
			(print "shooting set to 0")
			(set ai_render_shooting 0)
		)		
	)
)

(script static void text
	(if (= ai_render_evaluations_text 0)
		(begin
			(set ai_render_evaluations_text 1)
		)
		(begin
			(set ai_render_evaluations_text 0)
		)		
	)
)

(script static void speed
	(if (= game_speed 0)
		(begin
			(print "game speed set to 1")
			(set game_speed 1)
		)
		(begin
			(print "game speed set to 0")
			(set game_speed 0)
		)		
	)
)
