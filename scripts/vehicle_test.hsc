;=====================================================================;
;=====globals=========================================================;
;=====================================================================;
(global boolean b_test 0)
(global boolean b_evaluate 0)
(global short s_cleanup 0)

;=====================================================================;
;=====main script=====================================================;
;=====================================================================;

(script startup spartan_test
	(print "welcome to vehicle test")
	(ai_allegiance player human)
	
	(sleep 1)

	(wake sc_warthog_spawn)
	(wake sc_covenant_spawn)

	
)

(script dormant sc_covenant_spawn
	(sleep_until
		(begin
			(sleep_until (<= (ai_task_count obj_covenant/main_gate) 1) 1)
				(ai_place sq_covenant01)
				(sleep 60)
				(set s_cleanup (+ s_cleanup 1) )
				(if (>= s_cleanup 3)
					(garbage_collect_unsafe)
					(garbage_collect_now)
				)
		0)
	)
)

(script dormant sc_warthog_spawn
	(sleep_until
		(begin
			(sleep_until (<= (ai_task_count obj_warthog/main_gate) 1) 1)
				(ai_place sq_warthog01)
				(sleep 60)
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
			(set b_evaluate 1)
		)
		(begin
			(set ai_render_evaluations 0)
			(set ai_render_evaluations_detailed 0)
			(set ai_render_evaluations_text 0)
			(set ai_render_firing_position_statistics 0)
			(set ai_render_decisions 0)
			(set ai_render_behavior_stack 0)
			(set b_evaluate 0)
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
			(set game_speed 1)
		)
		(begin
			(set game_speed 0)
		)		
	)
)

