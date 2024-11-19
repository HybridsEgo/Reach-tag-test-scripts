;====================================================================================================
; START
;====================================================================================================
(script startup scr_first

	(print "Script Loaded")
	
	(sleep_until (volume_test_players trg_foyer_start) 5)
	(wake scr_foyer_start)

	(sleep_until (volume_test_players trg_tunnel01_start) 5)
	(wake scr_tunnel01_start)

	(sleep_until (volume_test_players trg_catwalk_start) 5)
	(wake scr_catwalk_start)

	(sleep_until (volume_test_players trg_tunnel02_start) 5)
	(wake scr_tunnel02_start)
	
	(sleep_until (volume_test_players trg_spiral_start) 5)
	(wake scr_spiral_start)	
	
	(sleep_until (volume_test_players trg_tunnel03_start) 5)
	(wake scr_tunnel03_start)
	
	(sleep_until (volume_test_players trg_cavern_start) 5)
	(wake scr_cavern_start)	
	
	(sleep_until (volume_test_players trg_steps_start) 5)
	(wake scr_steps_start)	
	
)

;====================================================================================================
; FOYER
;====================================================================================================

(script dormant scr_foyer_start
(print "foyer_start")

	(ai_place squad_foyer_marines01)
	(ai_place squad_foyer_grunts01)
	(ai_place squad_foyer_elites01)
	(ai_place squad_foyer_jackals01)
	
	(sleep_until (volume_test_players trg_foyer_rear) 5)
	;(print "rear spawns")
	(ai_place squad_foyer_grunts02a)
	(ai_place squad_foyer_grunts02b)	
	(ai_place squad_tunnel01_marines01)
	
)

;====================================================================================================
; TUNNEL 01
;====================================================================================================

(script dormant scr_tunnel01_start
(print "tunnel01_start")

	;pull cov and hum forward
	(ai_set_objective obj_foyer_cov1 obj_tunnel01_cov1)	
	(ai_set_objective obj_foyer_marines1 obj_tunnel01_marines1)

	(ai_place squad_tunnel01_elites01)

)	

(script static void scr_test_tunnel01

	(ai_place squad_tunnel01_marines01)
	(object_teleport (player0) flag_teleport_tunnel01)
	(sleep_until (volume_test_players trg_tunnel01_start) 5)
	(wake scr_tunnel01_start)

)

;====================================================================================================
; CATWALK
;====================================================================================================

(script dormant scr_catwalk_start
(print "catwalk_start")

	;pull cov and hum forward
	(ai_set_objective obj_tunnel01_cov1 obj_catwalk_cov1)	
	(ai_set_objective obj_tunnel01_marines1 obj_catwalk_marines1)

	(ai_place squad_catwalk_jackals01)
	(ai_place squad_catwalk_grunts01)
	(ai_place squad_catwalk_grunts02)
	(ai_place squad_catwalk_marines01)
	(wake scr_catwalk_elitebackup01)
	(wake scr_catwalk_elitebackup02)	
	
	(ai_set_objective obj_tunnel01_marines1 obj_catwalk_marines1)
	
	;command script - catwalk jackals
	;(cs_run_command_script squads_catwalk_jackals_01 cscr_catwalk_jackals)

)	


(script command_script cscr_catwalk_jackals

	(cs_enable_pathfinding_failsafe TRUE)
	(cs_abort_on_damage TRUE)
	(cs_go_to pts_catwalk/goto_01)

)	


(script dormant scr_catwalk_elitebackup01
;(print "elitebackup01 waiting")

	(sleep_until 
		(or
			(volume_test_players trg_catwalk_floor_entry1)
			(volume_test_players trg_catwalk_floor_entry2)
			(volume_test_players trg_catwalk_floor_entry3)
			(<= (ai_task_count obj_catwalk_cov1/catwalk_ramp_gate) 0)
		)
	)

	(print "elite backup")
	(ai_place squad_catwalk_elites01)
	
)


(script dormant scr_catwalk_elitebackup02
;(print "elitebackup02 waiting")

	(sleep_until 
		(or
			(volume_test_players trg_catwalk_level2_entry)
			(<= (ai_task_count obj_catwalk_cov1/catwalk_lowerlevels_gate) 0)
		)
	)
	(ai_place squad_catwalk_grunts03)
	(ai_place squad_catwalk_elites02)
		
)

(script static void scr_test_catwalk

	(object_teleport (player0) flag_teleport_catwalk)
	(sleep_until (volume_test_players trg_catwalk_start) 5)
	(wake scr_catwalk_start)

)


;====================================================================================================
; TUNNEL 02
;====================================================================================================

(script dormant scr_tunnel02_start
(print "tunnel02_start")

	;pull cov and hum forward
	(ai_set_objective obj_catwalk_cov1 obj_tunnel02_cov1)

	(ai_place squad_tunnel02_skirmish01)

	(sleep_until (volume_test_players trg_tunnel02_adv_room1rear) 5)
	(ai_place squad_tunnel02_grunts01)

	(sleep_until (volume_test_players trg_tunnel02_adv_room2rear) 5)
	(ai_set_objective obj_tunnel02_cov1 obj_spiral_cov1)
	
)	

(script static void scr_test_tunnel02

	(object_teleport (player0) flag_teleport_tunnel02)
	(sleep_until (volume_test_players trg_tunnel02_start) 5)
	(wake scr_tunnel02_start)

)


;====================================================================================================
; SPIRAL
;====================================================================================================

(script dormant scr_spiral_start
(print "spiral_start")

	;pull cov and hum forward
	(ai_set_objective obj_tunnel02_cov1 obj_spiral_cov1)

	(ai_place cov_spiral_ledge_e1)
	(ai_place cov_spiral_ledge_g1)
	
	; set up non-linear triggers
	; (wake scr_trg_spiral_hall01)
	; (wake scr_trg_spiral_platform)

	(sleep_until (volume_test_players trg_spiral_floor) 5)
	(ai_place cov_spiral_floor_j1)
	(ai_place cov_spiral_floor_g1)
	
)

(script dormant scr_trg_spiral_hall01
(print "trg_spiral_hall01")

	(sleep_until (volume_test_players trg_spiral_hall01) 5)

)


(script dormant scr_trg_spiral_platform
(print "trg_spiral_platform")

	(sleep_until (volume_test_players trg_spiral_platform) 5)

)

(script static void scr_test_spiral

	(object_teleport (player0) flag_teleport_spiral)
	(sleep_until (volume_test_players trg_spiral_start) 5)
	(wake scr_spiral_start)

)


;====================================================================================================
; TUNNEL 03
;====================================================================================================

(script dormant scr_tunnel03_start
(print "tunnel03_start")

	;pull cov and hum forward
	(ai_set_objective obj_spiral_cov1 obj_tunnel03_cov1)

	(ai_place cov_tunnel03_jak1)
	(ai_place mar_tunnel03_odst1)

)	

(script static void scr_test_tunnel03
(print "tunnel03_test")

	(object_teleport (player0) flag_teleport_tunnel03)
	(sleep_until (volume_test_players trg_tunnel03_start) 5)
	(wake scr_tunnel03_start)

)


;====================================================================================================
; CAVERN
;====================================================================================================

(script dormant scr_cavern_start
(print "cavern_start")

	;pull cov and hum forward
	(ai_set_objective obj_tunnel03_cov1 obj_cavern_cov1)

	(ai_place cov_cavern_floor_e1)
	(ai_place cov_cavern_floor_g1)
	(ai_place cov_cavern_floor_j1)
	
	(sleep_until (volume_test_players trg_cavern_level1_enter) 5)
	(ai_place cov_cavern_level1_e1)

	(sleep_until (volume_test_players trg_cavern_level2_enter) 5)
	(ai_place cov_cavern_level2_g1)
	(ai_place cov_cavern_level2_j1)

	(sleep_until (volume_test_players trg_cavern_level2_middle) 5)
	(ai_place cov_cavern_level2_e1)

)


(script static void scr_test_cavern

	(object_teleport (player0) flag_teleport_cavern)
	(sleep_until (volume_test_players trg_cavern_start) 5)
	(wake scr_cavern_start)

)


;====================================================================================================
; STEPS
;====================================================================================================

(script dormant scr_steps_start
(print "steps_start")

	;pull cov and hum forward
	(ai_set_objective obj_cavern_cov1 obj_steps_cov1)

	(ai_place hum_steps_floor_m1)

	(sleep_until (volume_test_players trg_steps_start1) 5)
	(ai_place cov_steps_floor_b1)
	(ai_place cov_steps_floor_g1)

	(sleep_until (volume_test_players trg_steps_level1_start) 5)
	(ai_place cov_steps_level1_g1)

	(sleep_until (volume_test_players trg_steps_level1_hall1) 5)
	(ai_place cov_steps_level1_e1)

	(sleep_until (volume_test_players trg_steps_level1_hall2) 5)
	(ai_place cov_steps_level1_g2)

	(sleep_until (volume_test_players trg_steps_level2_start) 5)
	(ai_place cov_steps_level2_s1)

)


(script static void scr_test_steps

	(object_teleport (player0) flag_teleport_steps)
	(sleep_until (volume_test_players trg_steps_start) 5)
	(wake scr_steps_start)

)