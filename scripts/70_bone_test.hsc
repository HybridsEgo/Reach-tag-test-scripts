;=====================================================================;
;=====globals=========================================================;
;=====================================================================;
(global short s_spawn 0)
(global boolean b_evaluate 0)


;=====================================================================;
;=====main script=====================================================;
;=====================================================================;

(script startup 70_bone_test
	(print "70 bone test")
	(ai_allegiance player human)
	
	(sleep 1)

	(wake sc_trooper_spawn01)
	(wake sc_trooper_spawn02)
	(sleep 1)
	(wake sc_trooper_spawn03)
	(wake sc_trooper_spawn04)
	(sleep 1)
	(wake sc_trooper_spawn05)
	(wake sc_trooper_spawn06)
	(sleep 1)
	(wake sc_trooper_spawn07)
	(sleep 1)
	(wake sc_covenant_spawn01)
	(wake sc_covenant_spawn02)
	(sleep 1)
	(wake sc_covenant_spawn03)
	(wake sc_covenant_spawn04)
	(sleep 1)
	(wake sc_covenant_spawn05)
	(wake sc_covenant_spawn06)
	(sleep 1)
	(wake sc_covenant_spawn07)
	(wake sc_covenant_spawn08)
	

)

(script dormant sc_trooper_spawn01
	(sleep_until
		(begin
			(sleep_until (<= (ai_task_count obj_unsc/mg_trooper01) 3) 1)
				(ai_place sq_trooper01)
				(sleep 30)
		0)
	1)
)

(script dormant sc_trooper_spawn02
	(sleep_until
		(begin
			(sleep_until (<= (ai_task_count obj_unsc/mg_trooper02) 3) 1)
				(if (>= s_spawn 1)
					(ai_place sq_trooper02)
				)
				(sleep 30)
		0)
	1)
)

(script dormant sc_trooper_spawn03
	(sleep_until
		(begin
			(sleep_until (<= (ai_task_count obj_unsc/mg_trooper03) 3) 1)
				(if (>= s_spawn 1)
					(ai_place sq_trooper03)
				)
				(sleep 30)
		0)
	1)
)

(script dormant sc_trooper_spawn04
	(sleep_until
		(begin
			(sleep_until (<= (ai_task_count obj_unsc/mg_trooper04) 3) 1)
				(if (>= s_spawn 2)
					(ai_place sq_trooper04)
				)
				(sleep 30)
		0)
	1)
)

(script dormant sc_trooper_spawn05
	(sleep_until
		(begin
			(sleep_until (<= (ai_task_count obj_unsc/mg_trooper05) 3) 1)
				(if (>= s_spawn 2)
					(ai_place sq_trooper05)
				)
				(sleep 30)
		0)
	1)
)

(script dormant sc_trooper_spawn06
	(sleep_until
		(begin
			(sleep_until (<= (ai_task_count obj_unsc/mg_trooper06) 3) 1)
				(if (>= s_spawn 2)
					(ai_place sq_trooper06)
				)
				(sleep 30)
		0)
	1)
)

(script dormant sc_trooper_spawn07
	(sleep_until
		(begin
			(sleep_until (<= (ai_task_count obj_unsc/mg_trooper07) 3) 1)
				(if (>= s_spawn 4)
					(ai_place sq_trooper07)
				)
				(sleep 30)
		0)
	1)
)

(script dormant sc_covenant_spawn01
	(sleep_until
		(begin
			(sleep_until (<= (ai_task_count obj_covenant/mg_covenant01) 3) 1)
				(ai_place sq_covenant01)
				(sleep 30)
		0)
	1)
)

(script dormant sc_covenant_spawn02
	(sleep_until
		(begin
			(sleep_until (<= (ai_task_count obj_covenant/mg_covenant02) 3) 1)
				(if (>= s_spawn 1)
					(ai_place sq_covenant02)
				)
				(sleep 30)
		0)
	1)
)

(script dormant sc_covenant_spawn03
	(sleep_until
		(begin
			(sleep_until (<= (ai_task_count obj_covenant/mg_covenant03) 3) 1)
				(if (>= s_spawn 2)
					(ai_place sq_covenant03)
				)
				(sleep 30)
		0)
	1)
)

(script dormant sc_covenant_spawn04
	(sleep_until
		(begin
			(sleep_until (<= (ai_task_count obj_covenant/mg_covenant04) 3) 1)
				(if (>= s_spawn 2)
					(ai_place sq_covenant04)
				)
				(sleep 30)
		0)
	1)
)

(script dormant sc_covenant_spawn05
	(sleep_until
		(begin
			(sleep_until (<= (ai_task_count obj_covenant/mg_covenant05) 3) 1)
				(if (>= s_spawn 2)
					(ai_place sq_covenant05)
				)
				(sleep 30)
		0)
	1)
)

(script dormant sc_covenant_spawn06
	(sleep_until
		(begin
			(sleep_until (<= (ai_task_count obj_covenant/mg_covenant06) 3) 1)
				(if (>= s_spawn 2)
					(ai_place sq_covenant06)
				)
				(sleep 30)
		0)
	1)
)

(script dormant sc_covenant_spawn07
	(sleep_until
		(begin
			(sleep_until (<= (ai_task_count obj_covenant/mg_covenant07) 3) 1)
				(if (>= s_spawn 3)
					(ai_place sq_covenant07)
				)
				(sleep 30)
		0)
	1)
)

(script dormant sc_covenant_spawn08
	(sleep_until
		(begin
			(sleep_until (<= (ai_task_count obj_covenant/mg_covenant08) 3) 1)
				(if (>= s_spawn 5)
					(ai_place sq_covenant08)
				)
				(sleep 30)
		0)
	1)
)

(script continuous sc_garbage_collect
	(sleep 300)
	(garbage_collect_now)
)

(script static void 8
	(print "spawning 8 dudes")
	(set s_spawn 0)
	(ai_kill sq_trooper02)
	(ai_kill sq_trooper03)
	(ai_kill sq_trooper04)
	(ai_kill sq_trooper05)
	(ai_kill sq_trooper06)
	(ai_kill sq_trooper07)
	(ai_kill sq_covenant02)
	(ai_kill sq_covenant03)
	(ai_kill sq_covenant04)
	(ai_kill sq_covenant05)
	(ai_kill sq_covenant06)
	(ai_kill sq_covenant07)
	(ai_kill sq_covenant08)		
)

(script static void 20
	(print "spawning 20 dudes")
	(set s_spawn 1)
	;(ai_kill sq_trooper03)
	(ai_kill sq_trooper04)
	(ai_kill sq_trooper05)
	(ai_kill sq_trooper06)
	(ai_kill sq_trooper07)
	(ai_kill sq_covenant03)
	(ai_kill sq_covenant04)
	(ai_kill sq_covenant05)
	(ai_kill sq_covenant06)
	(ai_kill sq_covenant07)
	(ai_kill sq_covenant08)
)

(script static void 48
	(print "spawning 48 dudes")
	(set s_spawn 2)
	(ai_kill sq_trooper07)
	(ai_kill sq_covenant07)
	(ai_kill sq_covenant08)
)

(script static void 52
	(print "spawning 52 dudes")
	(set s_spawn 3)
	(ai_kill sq_trooper07)
	(ai_kill sq_covenant08)
)

(script static void 56
	(print "spawning 56 dudes")
	(set s_spawn 4)
	(ai_kill sq_covenant08)
)

(script static void 60
	(print "spawning 60 dudes")
	(set s_spawn 5)
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
