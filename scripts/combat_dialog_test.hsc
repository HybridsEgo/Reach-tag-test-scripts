;=====================================================================;
;=====globals=========================================================;
;=====================================================================;

(global short s_dialogue_type 0)
(global short s_garbage_collect 0)
(global short s_stance 0)
(global boolean b_evaluate 0)
(global boolean b_marine_spawn 0)
(global boolean b_covenant_spawn 0)
(global boolean b_phantom 0)
(global boolean b_spawn 0)
(global short s_cov_move 0)
(global short s_post_combat 0)
(global short s_bunker_distance 1)


;=====================================================================;
;=====main script=====================================================;
;=====================================================================;

(script startup combat_dialog_test
	(print "hello world")
	(ai_allegiance player human)
	
	(sleep 1)
	
	(wake sc_input)
	
	(sleep 1)
	
	(wake sc_marine_spawn)
	(wake sc_covenant_spawn)
	
	(sleep 10)
	
	(wake sc_garbage_collection)
)

(script dormant sc_input
	(sleep_until
		(begin
			(if  (= b_spawn 0)
				(begin
					(print " ************* ")
					(print "waiting for input")
					(print "hit 1 for order test")
					(print "or 2 for combat test")
					(print "or 3 for encounter test")
					(print "or 4 for bunker test")
				)
			)
			(sleep 200)
		0)
	1)
)

(script static void 1
	(print "order test!")
	(set b_spawn 1)
	(order_test)
	(stealthy)
)

(script static void 2
	(print "combat test!")
	(set b_spawn 1)
	(combat_test)
)

(script static void 3
	(print "encounter test!")
	(set b_spawn 1)
	(encounter_test)
)

(script static void 4
	(print "bunker test!")
	(set b_spawn 1)
	(bunker_test)
	(sv_bunker_input)
)

(script static void sv_bunker_input
	(print " ************* ")
	(print "waiting for input")
	(print "veryfar :: has no overlap")
	(print "far :: has overlapping search")
	(print "close :: has search overlapping into normal areas ")
	(print "veryclose :: has normal areas overlapping")
)

(script static void veryfar
	(print "bunker test is set to veryfar")
	(set s_bunker_distance 0)
)

(script static void far
	(print "bunker test is set to far")
	(set s_bunker_distance 1)
)

(script static void close
	(print "bunker test is set to close")
	(set s_bunker_distance 2)
)

(script static void veryclose
	(print "bunker test is set to veryclose")
	(set s_bunker_distance 3)
)


(script dormant sc_marine_spawn
	(sleep_until
		(begin
			(sleep_until (= b_marine_spawn 1) 1)
			(sleep_until (= (ai_task_count obj_bottom/mg_trooper_gate) 0) 1)
				(if (= b_marine_spawn 1)
					(begin
						(ai_place sq_marine01/carter)
						;(ai_place sq_marine01/kat)
						;(ai_place sq_marine01/jorge)
						;(ai_place sq_marine01/jun)
						;(ai_place sq_marine01/emile)
						(sleep 1)
						(ai_cannot_die sq_marine01 TRUE)
						(print "spawning marines")
						(set s_garbage_collect (+ s_garbage_collect 1))
						(garbage_collect_now)
					)
				)
		0)
	1)
)

(script dormant sc_covenant_spawn
	(sleep_until
		(begin
			(sleep_until (= b_covenant_spawn 1) 1)
			(sleep_until (<= (ai_task_count obj_bottom/mg_covenant_gate) 1) 1)
				(if (= b_covenant_spawn 1)
					(begin
						(ai_place sq_covenant01)
						(print "spawning covenant")
						(set s_garbage_collect (+ s_garbage_collect 1))
						(garbage_collect_now)
					)
				)
		0)
	1)
)

(script dormant sc_task_transition
	(sleep_until
		(begin
			(sleep 60)
			(task_transition)
		0)
	)
)

(script static void task_transition
	(if 
		(or
			(and
				(>= s_dialogue_type 14)
				(<= s_stance 1)
			)
			(and
				(>= s_dialogue_type 7)
				(>= s_stance 2)
			)
		)
		(begin
			(set s_dialogue_type 0)
			(print "setting to 0")
			(ai_reset_objective obj_order_test)
		)
		(begin
			(set s_dialogue_type (+ s_dialogue_type 1) )
			(print "upping by 1")
		)
		
	)
	(if (<= s_stance 1)
		(begin
			(cond
				((= s_dialogue_type 0)	
					(print "foeordr_advance")
				)	
				((= s_dialogue_type 1)	
					(print "foeordr_charge")
				)
				((= s_dialogue_type 2)	
					(print "foeordr_fallback")
				)
				((= s_dialogue_type 3)	
					(print "newordr_advance")
				)		
				((= s_dialogue_type 4)	
					(print "newordr_charge")
				)		
				((= s_dialogue_type 5)	
					(print "newordr_fallback")
				)		
				((= s_dialogue_type 6)	
					(print "newordr_moveon")
				)		
				((= s_dialogue_type 7)	
					(print "newordr_fllwplr")
				)		
				((= s_dialogue_type 8)	
					(print "newordr_arrival")
				)		
				((= s_dialogue_type 9)	
					(print "endcmbt")
				)		
				((= s_dialogue_type 10)	
					(print "ordr_invsgt")
				)		
				((= s_dialogue_type 11)	
					(print "ordr_spread")
				)				
				((= s_dialogue_type 12)	
					(print "ordr_hold")
				)		
				((= s_dialogue_type 13)	
					(print "ordr_find_cvr")
				)		
				((= s_dialogue_type 14)	
					(print "covering fire")
				)					
			)
		)
		(begin
			(cond
				((= s_dialogue_type 0)	
					(print "move on")
				)		
				((= s_dialogue_type 1)	
					(print "follow player")
				)		
				((= s_dialogue_type 2)	
					(print "arriving")
				)		
				((= s_dialogue_type 3)	
					(print "end combat")
				)		
				((= s_dialogue_type 4)	
					(print "investigate")
				)		
				((= s_dialogue_type 5)	
					(print "spread out")
				)				
				((= s_dialogue_type 6)	
					(print "hold position")
				)		
				((= s_dialogue_type 7)	
					(print "find cover")
				)		
			)				
		)
	)
)

(script dormant sc_garbage_collection
	(sleep_until
		(begin
			(sleep_until (>= s_garbage_collect 6) 1)
				(garbage_collect_unsafe)
				(set s_garbage_collect 0)
		0)
	1)
)

(script static void speed
	(if (= game_speed 0)
		(begin
			(print "speed set to 1")
			(set game_speed 1)
		)
		(begin
			(print "speed set to 0")
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

(script static void bunkering
	(if (= ai_render_firing_position_bunkering 0)
		(begin
			(set ai_render_firing_position_bunkering 1)
			(set ai_render_firing_position_info 1)
		)
		(begin
			(set ai_render_firing_position_bunkering 0)
			(set ai_render_firing_position_info 0)
		)		
	)
)

(script static void order_test
	(print "order test starting")
	(ai_reset_objective obj_order_test)
	(set b_covenant_spawn 0)
	(set b_marine_spawn 0)
	(sleep 1)
	(ai_kill sq_marine01)
	(ai_kill sq_covenant01)
	(sleep 1)
	(ai_place sq_marine01)
	(set s_stance 0)
	(sleep 1)
	(ai_set_objective sq_marine01 obj_order_test)
	(sleep 1)
	(wake sc_task_transition)
	(print "enemy advancing")
)

(script static void combat_test
	(print "combat test starting")
	(ai_reset_objective obj_bottom)
	(ai_kill sq_marine01)
	(ai_kill sq_covenant01)
	(sleep 1)	
	(set b_covenant_spawn 1)
	(set b_marine_spawn 1)
	(sleep 1)
	(ai_set_objective sq_marine01 obj_bottom)
)

(script static void bunker_test
	(print "bunker test starting")
	(ai_reset_objective obj_bunker)
	(sleep_forever sc_marine_spawn)
	(sleep_forever sc_covenant_spawn)
	(ai_kill sq_bunker_trooper01)
	(ai_kill sq_bunker_covenant01)
	(sleep 1)	
	(wake sc_bunker_trooper_spawn)
	(wake sc_bunker_covenant_spawn)
	;(ai_place sq_bunker_trooper01)
	;(ai_place sq_bunker_trooper02)
	;(ai_place sq_bunker_trooper03)
	;(ai_place sq_bunker_trooper04)
	;(ai_place sq_bunker_covenant01)
	;(ai_place sq_bunker_covenant02)
	;(ai_place sq_bunker_covenant03)
	;(ai_place sq_bunker_covenant04)
	;(ai_cannot_die sq_bunker_trooper01 TRUE)
	;(ai_cannot_die sq_bunker_trooper02 TRUE)
	;(ai_cannot_die sq_bunker_trooper03 TRUE)
	;(ai_cannot_die sq_bunker_trooper04 TRUE)
	;(ai_cannot_die sq_bunker_covenant01 TRUE)
	;(ai_cannot_die sq_bunker_covenant02 TRUE)
	;(ai_cannot_die sq_bunker_covenant03 TRUE)
	;(ai_cannot_die sq_bunker_covenant04 TRUE)
)

(script static void die_off
	(ai_cannot_die sq_bunker_trooper01 FALSE)
	(ai_cannot_die sq_bunker_trooper02 FALSE)
	(ai_cannot_die sq_bunker_trooper03 FALSE)
	(ai_cannot_die sq_bunker_trooper04 FALSE)
	(ai_cannot_die sq_bunker_covenant01 FALSE)
	(ai_cannot_die sq_bunker_covenant02 FALSE)
	(ai_cannot_die sq_bunker_covenant03 FALSE)
	(ai_cannot_die sq_bunker_covenant04 FALSE)
)

(script static void die_on
	(ai_cannot_die sq_bunker_trooper01 TRUE)
	(ai_cannot_die sq_bunker_trooper02 TRUE)
	(ai_cannot_die sq_bunker_trooper03 TRUE)
	(ai_cannot_die sq_bunker_trooper04 TRUE)
	(ai_cannot_die sq_bunker_covenant01 TRUE)
	(ai_cannot_die sq_bunker_covenant02 TRUE)
	(ai_cannot_die sq_bunker_covenant03 TRUE)
	(ai_cannot_die sq_bunker_covenant04 TRUE)
)

(script dormant sc_bunker_trooper_spawn
	(sleep_until
		(begin
			(sleep_until (<= (ai_task_count obj_bunker/mg_trooper_gate) 1) 1)
				(begin
					(ai_place sq_bunker_trooper01)
					;(ai_place sq_bunker_trooper01)
					;(ai_place sq_bunker_trooper02)
					;(ai_place sq_bunker_trooper03)
					;(ai_place sq_bunker_trooper04)
					;(ai_place sq_bunker_trooper05)
					(print "spawning troopers")
					(set s_garbage_collect (+ s_garbage_collect 1))
					;(garbage_collect_now)
					(sleep 1)
				)
		0)
	1)
)

(script dormant sc_bunker_covenant_spawn
	(sleep_until
		(begin
			(sleep_until (<= (ai_task_count obj_bunker/mg_covenant_gate) 1) 1)
				(begin
					(ai_place sq_bunker_covenant01)
					;(ai_place sq_bunker_covenant02)
					;(ai_place sq_bunker_covenant03)
					;(ai_place sq_bunker_covenant04)
					;(ai_place sq_bunker_covenant05)
					(print "spawning covenant")
					(set s_garbage_collect (+ s_garbage_collect 1))
					;game(garbage_collect_now)
					(sleep 1)
				)
		0)
	1)
)

(script static void encounter_test
	(print "encounter test starting")
	(ai_reset_objective obj_encounter_test)
	(ai_kill sq_marine01)
	(ai_kill sq_covenant01)
	;(wake sc_trooper_dialog)
	
	(sleep 1)	
	
	(set b_covenant_spawn 0)
	(set b_marine_spawn 0)
	(ai_place sq_initial_cov01)
	
	(sleep 1)
	
	(ai_place sq_marine01)
	
	(sleep 20)
	
	(ai_set_objective sq_marine01 obj_encounter_test)	
	
	(sleep_until (= (ai_task_count obj_encounter_test/mg_covenant_gate) 0) 1)
		(ai_place sq_phantom01)
		(sleep 90)
		(ai_play_vocalization_on_team warn_phantom_gunship human)
		(print "warn_vcl_phntm")
		;(wake sc_covenant_movement)
		
		(sleep 200)
		
	(sleep_until (= (ai_task_count obj_encounter_test/mg_covenant_gate) 0) 1)
		(set s_post_combat 1)
		
		(sleep 150)
		
		(set s_post_combat 2)
		
)
;*
(script dormant sc_covenant_movement
	(sleep_until 
		(or
			(<= (ai_task_count obj_encounter_test/mg_trooper_gate) 3)
			(>= (ai_body_count obj_encounter_test/cg_combat_gate) 4)
		)
	1)
	(if (>= (ai_body_count obj_encounter_test/cg_combat_gate) 4)
		(set s_cov_move 2)
		(set s_cov_move 1)
	)	
)

(script dormant sc_trooper_dialog
	(sleep_until (>= (ai_task_count obj_encounter_test/tg_initial_stealth) 1) 1)
		(print "order_find_cvr")
		
	(sleep_until (>= (ai_task_count obj_encounter_test/tg_initial_combat) 1) 1)
		(print "foeordr_advance")
		
	(sleep_until (>= (ai_task_count obj_encounter_test/tg_initial_hold_position) 1) 1)
		(print "order_hold")		
		
	(sleep_until (>= (ai_task_count obj_encounter_test/tg_combat_start) 1) 1)
		(print "forordr_charge")	
		
	(sleep_until (>= s_cov_move 1) 1)				
		(if (= s_cov_move 1)
			(print "newordr_fallback")		
			(print "newordr_advance")		
		)
		
	(sleep_until (>= (ai_task_count obj_encounter_test/tg_postcombat_endcombat) 1) 1)
		(print "endcmbt")			

	(sleep_until (>= (ai_task_count obj_encounter_test/tg_postcombat_investigate) 1) 1)
		(print "ordr_invsgt")		
)
*;

(script command_script cs_phantom01
	(cs_fly_to ps_phantom01/p0)
	(f_load_phantom (ai_vehicle_get_from_starting_location sq_phantom01/pilot) "right" sq_combat01 NONE NONE sq_combat02)
	(cs_fly_to ps_phantom01/p1)
	(cs_fly_to ps_phantom01/p2)
	(cs_fly_to_and_face ps_phantom01/p3 ps_phantom01/p4)
	(f_unload_phantom (ai_vehicle_get_from_starting_location sq_phantom01/pilot) "right")
	(set b_phantom 1)
	(sleep 90)
	(cs_fly_to ps_phantom01/p2)
	(cs_fly_to ps_phantom01/p1)
	(cs_fly_to ps_phantom01/p0)
	(cs_fly_to ps_phantom01/p5)
	(ai_erase ai_current_squad)
	
)

(script static void turret
	(ai_place sq_turret01)
)

(script static void ghost
	(ai_place sq_ghost01)
)

(script static void wraith
	(ai_place sq_wraith01)
)

(script static void revenant
	(ai_place sq_revenant01)
)

(script static void banshee
	(ai_place sq_banshee01)
)

(script static void warthog
	(ai_place sq_warthog01)
)

(script static void normal
	(print "enemy advancing")
	(set s_dialogue_type 0)
	(set s_stance 0)
)

(script static void pressure
	(print "enemy advancing")
	(set s_dialogue_type 0)
	(set s_stance 1)
)

(script static void stealthy
	(print "move on")
	(set s_dialogue_type 0)
	(set s_stance 2)
)

