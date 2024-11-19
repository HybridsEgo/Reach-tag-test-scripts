; jtsai_design.hsc
; Designer Boot Camp scripting training


; === Global Variables ===
(global short s_test_obj_control 0)


; === Startup Script ===
(script startup jtsai_design
;	(print "I am Mister Funny!")
	(wake sc_test_objective_control)
	(wake sc_test_ai_placement)
)

; === Main Block ===

; Sets s_test_obj_control value to correspond with whichever
; trigger volume the player is currently standing.
(script dormant sc_test_objective_control
	(sleep_until (volume_test_players tv_test_oc1) 1)
		(set s_test_obj_control 1)
		(inspect s_test_obj_control)
	(sleep_until (volume_test_players tv_test_oc2) 1)
		(set s_test_obj_control 2)
		(inspect s_test_obj_control)
		(game_save)
	(sleep_until (volume_test_players tv_test_oc3) 1)
		(set s_test_obj_control 3)
		(inspect s_test_obj_control)
	(sleep_until (volume_test_players tv_test_oc4) 1)
		(set s_test_obj_control 4)
		(inspect s_test_obj_control)
)

; Spawns the squads of grunts.
(script dormant sc_test_ai_placement
	(sleep_until (>= s_test_obj_control 1))
		(ai_place sq_test_grunt01)
	(sleep_until (>= s_test_obj_control 3))
		(ai_place sq_test_grunt02)
	(sleep_until (>= s_test_obj_control 4))
		(ai_place sq_test_grunt03)
)