;=====================================================================;
;=====globals=========================================================;
;=====================================================================;
(global boolean b_evaluate 0)


;=====================================================================;
;=====main script=====================================================;
;=====================================================================;

(script startup pumphouse_test
	(print "welcome to pumphouse test")
	(ai_allegiance player human)
	
	(sleep 1)

	(wake sc_spawn)

)

(script dormant sc_spawn
	(ai_place sq_covenant01)
	(ai_place sq_covenant02)
	(ai_place sq_trooper01)
	
	(sleep 1)
	
	(ai_place sq_trooper02)
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
