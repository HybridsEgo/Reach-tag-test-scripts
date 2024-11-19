;----------------------------------------------------------------------------------------------------
; *** GLOBALS *** 
;----------------------------------------------------------------------------------------------------

; Debug Options
(global boolean debug 						TRUE)
(global boolean debug_objectives 	FALSE)
(global boolean editor 						FALSE)
(global boolean cinematics 				FALSE)
(global boolean dialogue 					FALSE)
(global boolean skip_intro				TRUE)

; Insertion
(global short g_insertion_index 0)

; Objective Controls
(global short objcon_trenchrun -1) ; trenchrun 1
(global short objcon_dirtroad -1) ; dirtroad 2
(global short objcon_scarabdrop -1) ; scarab drop 3
(global short objcon_blockade -1) ; blockade 4
(global short objcon_cave -1) ; cave 5
(global short objcon_boneyard -1) ; boneyard 6 
(global short objcon_smelter -1) ; smelter 7
(global short objcon_biggun -1) ; big gun 8

; Mission Specific
(global boolean g_mission_complete FALSE)

; Persistent Objects
(global object bp_emile NONE)
(global object v_mongoose1 NONE)

; global functions
(script command_script cs_abort  
	(sleep 1) 
)

; =================================================================================================
; PACKAGE STARTUP
; =================================================================================================
(script startup package
	(print_difficulty)
	(if debug (print "::: M70 - THE PACKAGE :::"))

	; Snap to black 
	(fade_out 0 0 0 0)
	
	; Allegiances
	(ai_allegiance human player)
	(ai_allegiance player human)

	; STARTING THE GAME
	; ============================================================================================
	(if	(and
			(not editor)
			(> (player_count) 0))
			
		; if true, start the game
		(start)
		
		; else just fade in, we're in edit mode
		(begin
			(if debug (print ":::  editor mode  :::"))
			(fade_in 0 0 0 0))
	)
	
	; ENCOUNTERS
	; ============================================================================================

		; TRENCH RUN
		; =======================================================================================
		(sleep_until	
			(or
				(volume_test_players tv_trenchrun_start)
				(>= g_insertion_index 1))
			1)
		
		(if (<= g_insertion_index 1) (wake trenchrun_objective_control))
		
		
		; DIRT ROAD
		; =======================================================================================
		(sleep_until	
			(or
				(volume_test_players tv_dirtroad_start)
				(>= g_insertion_index 2))
			1)
		
		(if (<= g_insertion_index 2) (wake dirtroad_objective_control))
		
		
		; SCARAB drop
		; =======================================================================================
		(sleep_until	
			(or
				(volume_test_players tv_scarabdrop_start)
				(>= g_insertion_index 3))
			1)
		
		(if (<= g_insertion_index 3) (wake scarabdrop_objective_control))
		
		
		; BLOCKADE
		; =======================================================================================
		(sleep_until	
			(or
				(volume_test_players tv_blockade_start)
				(>= g_insertion_index 4))
			1)
		
		(if (<= g_insertion_index 4) (wake blockade_objective_control))
		
		
		; CAVE
		; =======================================================================================
		(sleep_until	
			(or
				(volume_test_players tv_cave_start)
				(>= g_insertion_index 5))
			1)
		
		(if (<= g_insertion_index 5) (wake cave_objective_control))
		
		
		; BONEYARD
		; =======================================================================================
		(sleep_until	
			(or
				(volume_test_players tv_boneyard_start)
				(>= g_insertion_index 6))
			1)
		
		(if (<= g_insertion_index 6) (wake boneyard_objective_control))
		
		
		; SMELTER
		; =======================================================================================
		(sleep_until	
			(or
				(volume_test_players tv_smelt_start)
				(>= g_insertion_index 7))
			1)
		
		(if (<= g_insertion_index 7) (wake smelter_objective_control))


		; BIG GUN
		; =======================================================================================
		(sleep_until	
			(or
				(volume_test_players tv_biggun_start)
				(>= g_insertion_index 8))
			1)
		
		(if (<= g_insertion_index 8) (wake biggun_objective_control))


)


; =================================================================================================
; START
; =================================================================================================
(script static void start
	; Cut to black
	; (fade_out 0 0 0 0)

	; spawn player mongoose
	(ai_place sq_v_mongoose1_start)

	; Figure out what insertion point to use
	(cond
		;((= (game_insertion_point_get) 0) (ins_trenchrun))
		;((= (game_insertion_point_get) 1) (ins_cave))
		;((= (game_insertion_point_get) 2) (ins_boneyard))
		;((= (game_insertion_point_get) 3) (ins_smelter))
		;((= (game_insertion_point_get) 4) (ins_biggun))
	)
)


; =================================================================================================
; TRENCH RUN
; =================================================================================================
(script dormant trenchrun_objective_control
	(if debug (print "::: trench run encounter :::"))
	(game_save)

	(trenchrun_spawn_all)
	
	(sleep_until (volume_test_players tv_trenchrun_01) 1)
	(if debug (print "objective control : trenchrun.01"))
	(set objcon_trenchrun 1)

)

(script static void trenchrun_spawn_all
	(if debug (print "spawning all trenchrun squads"))

	(ai_place sq_trench_grunt_grenade1)
	(ai_grunt_kamikaze sq_trench_grunt_grenade1)	
	
)

(script static void trenchrun_despawn_all
	(sleep 0)
)

(script static void trenchrun_kill_scripts
	(sleep_forever trenchrun_objective_control)
)


; =================================================================================================
; DIRT ROAD
; =================================================================================================
(script dormant dirtroad_objective_control
	(if debug (print "::: dirtroad encounter :::"))
	
	; Wait until the zone is loaded
	;(sleep_until
		;(or
			;(= (current_zone_set_fully_active) 1)
			;(= (current_zone_set_fully_active) 2)))
	
	(game_save)
	
	(dirtroad_spawn_all)

	(sleep_until (volume_test_players tv_dirtroad_01) 1)
	(if debug (print "objective control : dirtroad.01"))
	(set objcon_dirtroad 1)
	(ai_place sq_dirt_banshee_cliff1)
	(ai_place sq_dirt_banshee_cliff2)
	(ai_place sq_dirt_banshee_cliff3)

)

(script static void dirtroad_spawn_all
	(if debug (print "::: spawning all dirtroad squads"))
	
)

(script static void dirtroad_despawn_all
	(sleep 0)
)

(script static void dirtroad_kill_scripts
	(sleep_forever dirtroad_objective_control))


; BANSHEE RUN
;============================================

(global vehicle v_dirt_banshee_cliff1 none)
(script command_script cs_dirt_banshee_cliff1

	(if debug (print "banshee_cliff1"))
	(set v_dirt_banshee_cliff1 (ai_vehicle_get_from_starting_location sq_dirt_banshee_cliff1/driver_01))

	; enter
	;--------------------------------------------
	(cs_vehicle_boost TRUE)
	(cs_fly_by ps_dirt_banshee_cliff1/approach_01)
	;(cs_vehicle_boost FALSE)
	(cs_fly_by ps_dirt_banshee_cliff1/approach_02)
	(cs_fly_by ps_dirt_banshee_cliff1/approach_03)
	(cs_fly_by ps_dirt_banshee_cliff1/approach_04)
	(cs_fly_by ps_dirt_banshee_cliff1/approach_05)
	
)

(global vehicle v_dirt_banshee_cliff2 none)
(script command_script cs_dirt_banshee_cliff2

	(if debug (print "banshee_cliff2"))
	(set v_dirt_banshee_cliff2 (ai_vehicle_get_from_starting_location sq_dirt_banshee_cliff2/driver_01))

	; enter
	;--------------------------------------------
	(cs_vehicle_boost TRUE)
	(cs_fly_by ps_dirt_banshee_cliff2/approach_01)
	;(cs_vehicle_boost FALSE)
	(cs_fly_by ps_dirt_banshee_cliff2/approach_02)
	(cs_fly_by ps_dirt_banshee_cliff2/approach_03)
	(cs_fly_by ps_dirt_banshee_cliff2/approach_04)
	(cs_fly_by ps_dirt_banshee_cliff2/approach_05)
	
)


(global vehicle v_dirt_banshee_cliff3 none)
(script command_script cs_dirt_banshee_cliff3

	(if debug (print "banshee_cliff3"))
	(set v_dirt_banshee_cliff3 (ai_vehicle_get_from_starting_location sq_dirt_banshee_cliff3/driver_01))

	; enter
	;--------------------------------------------
	(cs_vehicle_boost TRUE)
	(cs_fly_by ps_dirt_banshee_cliff3/approach_01)
	;(cs_vehicle_boost FALSE)
	(cs_fly_by ps_dirt_banshee_cliff3/approach_02)
	(cs_fly_by ps_dirt_banshee_cliff3/approach_03)
	(cs_fly_by ps_dirt_banshee_cliff3/approach_04)
	(cs_fly_by ps_dirt_banshee_cliff3/approach_05)
	
)


; =================================================================================================
; SCARAB DROP
; =================================================================================================
(script dormant scarabdrop_objective_control
	(if debug (print "::: scarab drop encounter :::"))
	
	; Wait until the zone is loaded
	;(sleep_until
		;(or
			;(= (current_zone_set_fully_active) 1)
			;(= (current_zone_set_fully_active) 2)))
	
	(game_save)
	
	(scarabdrop_spawn_all)
	
	(sleep_until (volume_test_players tv_scarabdrop_01) 1)
	(if debug (print "objective control : scarabdrop.01"))
	(set objcon_scarabdrop 1)

	(sleep_until (volume_test_players tv_scarabdrop_drop) 1)
	(scarabs_drop)

)

(script static void scarabdrop_spawn_all
	(if debug (print "::: spawning all scarabdrop squads"))
)

(script static void scarabdrop_despawn_all
	(sleep 0)
)

(script static void scarabdrop_kill_scripts
	(sleep_forever scarabdrop_objective_control))


(script static void scarabs_drop
	(wake scarab01_drop)
	(sleep (random_range 13 17))
	(wake scarab02_drop)
	(sleep (random_range 23 27))
	(wake scarab03_drop)
)

(script dormant scarab01_drop
	(ai_place sq_cov_scarab1_scarabdrop)
	(vs_custom_animation sq_cov_scarab1_scarabdrop/driver01 FALSE objects\giants\scarab\scarab "scarab_drop" FALSE)
	;(vs_custom_animation sq_cov_scarab1_scarabdrop/driver01 FALSE levels\test\100_citadel\cinematics\perspectives\100pb_scarab_orbital\100pb_scarab_orbital02 "100pb_cin_scarab_a_1" FALSE)
	(sleep_forever)
	(sleep (unit_get_custom_animation_time (ai_get_unit sq_cov_scarab1_scarabdrop/driver01)))
	(vs_stop_custom_animation sq_cov_scarab1_scarabdrop/driver01)
	(ai_force_active sq_cov_scarab1_scarabdrop/driver01 TRUE)
)

(script dormant scarab02_drop
	(ai_place sq_cov_scarab2_scarabdrop)
	(vs_custom_animation sq_cov_scarab2_scarabdrop/driver01 FALSE objects\giants\scarab\scarab "scarab_drop" FALSE)
	;(vs_custom_animation sq_cov_scarab2_scarabdrop/driver01 FALSE levels\test\100_citadel\cinematics\perspectives\100pb_scarab_orbital\100pb_scarab_orbital02 "100pb_cin_scarab_a_1" FALSE)
	(sleep_forever)
	(sleep (unit_get_custom_animation_time (ai_get_unit sq_cov_scarab2_scarabdrop/driver01)))
	(vs_stop_custom_animation sq_cov_scarab2_scarabdrop/driver01)
	(ai_force_active sq_cov_scarab2_scarabdrop/driver01 TRUE)
)

(script dormant scarab03_drop
	(ai_place sq_cov_scarab3_scarabdrop)
	(vs_custom_animation sq_cov_scarab3_scarabdrop/driver01 FALSE objects\giants\scarab\scarab "scarab_drop" FALSE)
	;(vs_custom_animation sq_cov_scarab3_scarabdrop/driver01 FALSE levels\test\100_citadel\cinematics\perspectives\100pb_scarab_orbital\100pb_scarab_orbital02 "100pb_cin_scarab_a_1" FALSE)
	(sleep_forever)
	(sleep (unit_get_custom_animation_time (ai_get_unit sq_cov_scarab3_scarabdrop/driver01)))
	(vs_stop_custom_animation sq_cov_scarab3_scarabdrop/driver01)
	(ai_force_active sq_cov_scarab3_scarabdrop/driver01 TRUE)
)


; =================================================================================================
; BLOCKADE
; =================================================================================================
(script dormant blockade_objective_control
	(if debug (print "::: blockade encounter :::"))
	
	; Wait until the zone is loaded
	;(sleep_until
		;(or
			;(= (current_zone_set_fully_active) 1)
			;(= (current_zone_set_fully_active) 2)))
	
	(game_save)
	
	(blockade_spawn_all)
	
	(sleep_until (volume_test_players tv_blockade_01) 1)
	(if debug (print "objective control : blockade.01"))
	(set objcon_blockade 1)
	
)

(script static void blockade_spawn_all
	(if debug (print "::: spawning all blockade squads"))
	(ai_place sq_cov_jackal1_blockade)
	(ai_place sq_cov_mule1_blockade)

)

(script static void blockade_despawn_all
	(sleep 0)
)

(script static void blockade_kill_scripts
	(sleep_forever blockade_objective_control))


; =================================================================================================
; CAVE
; =================================================================================================
(script dormant cave_objective_control
	(if debug (print "::: cave encounter :::"))
	
	; Wait until the zone is loaded
	;(sleep_until
		;(or
			;(= (current_zone_set_fully_active) 1)
			;(= (current_zone_set_fully_active) 2)))
	
	(game_save)
	
	(cave_spawn_all)
	
	(sleep_until (volume_test_players tv_cave_01) 1)
	(if debug (print "objective control : cave.01"))
	(set objcon_cave 1)
	
)

(script static void cave_spawn_all
	(if debug (print "::: spawning all cave squads"))
	(ai_place sq_cov_grunt1_cave)
)

(script static void cave_despawn_all
	(sleep 0)
)

(script static void cave_kill_scripts
	(sleep_forever cave_objective_control))


; =================================================================================================
; BONEYARD
; =================================================================================================
(script dormant boneyard_objective_control
	(if debug (print "::: boneyardyard encounter :::"))
	
	; Wait until the zone is loaded
	;(sleep_until
		;(or
			;(= (current_zone_set_fully_active) 1)
			;(= (current_zone_set_fully_active) 2)))
	
	(game_save)
	(boneyard_spawn_all)

	(sleep_until (volume_test_players tv_boneyard_01) 5)
	(if debug (print "objective control : boneyardyard.01"))
	(set objcon_boneyard 1)

	(sleep_until (volume_test_players tv_bone_01_hill) 5)
	(ai_place sq_bone_ghost)	
	
	(sleep_until (volume_test_players tv_boneyard_02) 5)
	(if debug (print "objective control : boneyardyard.02"))
	(set objcon_boneyard 2)
	
)


(script static void boneyard_spawn_all
	(if debug (print "::: spawning all boneyardyard squads"))

	(ai_place sq_bone_marine_val)
	(ai_place sq_bone_wraith) (wake s_bone_wraith) (wake s_bone_wraith_alert)
	(ai_place sq_bone_jackal_ship) (wake s_bone_ship_fallback_check)
	;(ai_place sq_bone_marine_ship)

)

(script static void boneyard_despawn_all
	(sleep 0)
)

(script static void boneyard_kill_scripts
	(sleep_forever boneyard_objective_control))


; SHIP JACKALS
;============================================

(global boolean b_ship_fallback_left FALSE)
(global boolean b_ship_fallback_right FALSE)
(script dormant s_bone_ship_fallback_check

	(sleep_until (<= (ai_task_count obj_cov_boneyard/gate_ship_snipers) 2))

	(if (volume_test_players tv_bone_ship_left)
		(begin
			(set b_ship_fallback_right TRUE)
			(print "fallback right")
		)
	)

	(if (volume_test_players tv_bone_ship_right)
		(begin
			(set b_ship_fallback_left TRUE)
			(print "fallback left")
		)
	)

	; set proximity triggers if squad depleted
	(wake s_tv_bone_ship_left_check)
	(wake s_tv_bone_ship_left_check)
	(sleep_until (<= (ai_task_count obj_cov_boneyard/gate_ship_snipers) 0))
	(sleep_forever s_tv_bone_ship_left_check)
	(sleep_forever s_tv_bone_ship_right_check)

)

(script dormant s_tv_bone_ship_left_check
	(sleep_until (volume_test_players tv_bone_ship_left))
	(sleep_forever s_tv_bone_ship_right_check)
)


(script dormant s_tv_bone_ship_right_check
	(sleep_until (volume_test_players tv_bone_ship_left))
	(sleep_forever s_tv_bone_ship_left_check)
)

(script static boolean s_bone_ship_fallback_right
	(= b_ship_fallback_right TRUE)
)

(script static boolean s_bone_ship_fallback_left
	(= b_ship_fallback_left TRUE)
)


; WRAITH
;============================================

(script dormant s_bone_wraith
	(cs_run_command_script sq_bone_wraith/wraith cs_bone_wraith_shoot)
	(sleep 1500)
)

(script command_script cs_bone_wraith_shoot
	(cs_abort_on_damage TRUE)
	(cs_shoot_point TRUE ps_bone_wraith_shoot/shoot_01)
	(sleep_forever)
)

(script dormant s_bone_wraith_alert
	(sleep_until (volume_test_players tv_bone_02_01) 5)
	(cs_run_command_script sq_bone_wraith/wraith cs_abort)
	(sleep_forever cs_bone_wraith_shoot)
)

	
; PELICAN
;============================================

(script dormant s_bone_pelican_val
	(sleep_until 
		(<= (ai_task_count obj_cov_boneyard/gate_wraith) 0)
	)
	(ai_place sq_bone_pelican_val)
)

(global vehicle v_bone_pelican_val none)
(script command_script cs_bone_pelican_val

	(if debug (print "pelican val"))
	(set v_bone_pelican_val (ai_vehicle_get_from_starting_location sq_bone_pelican_val/pelican))
	
	; spawning
	;--------------------------------------------
	;(ai_place sq_bone_pelican_val_warthog)
	(ai_place sq_bone_pelican_val_marine_01)
	(ai_force_active gr_bone_pelican_val TRUE)
	(sleep 5)
			
	; seating
	;--------------------------------------------	
	(vehicle_load_magic v_bone_pelican_val "pelican_p_r05" (list_get (ai_actors sq_bone_pelican_val_marine_01) 0)) (sleep 1)
	(vehicle_load_magic v_bone_pelican_val "pelican_p_l05" (list_get (ai_actors sq_bone_pelican_val_marine_01) 0)) (sleep 1)
	(vehicle_load_magic v_bone_pelican_val "pelican_p_r04" (list_get (ai_actors sq_bone_pelican_val_marine_01) 0)) (sleep 1)

	;(vehicle_load_magic v_bone_pelican_val "pelican_lc" (ai_vehicle_get_from_starting_location sq_bone_pelican_val_warthog/warthog))
	(sleep 1)

	; enter
	;--------------------------------------------
	(cs_vehicle_boost TRUE)
	(cs_fly_by ps_bone_pelican_val/approach_01)
	(cs_vehicle_boost FALSE)
	(cs_fly_by ps_bone_pelican_val/approach_02)
	(cs_fly_by ps_bone_pelican_val/approach_03)
	(cs_fly_by ps_bone_pelican_val/approach_04)

	; hover
	;--------------------------------------------
	(cs_fly_to_and_face ps_bone_pelican_val/hover_01 ps_bone_pelican_val/drop_face_01 1)
	(unit_open v_bone_pelican_val)
	(sleep 15)
	
	; lower
	;--------------------------------------------	
	(cs_vehicle_speed .8)
	(cs_fly_to_and_face ps_bone_pelican_val/drop_01 ps_bone_pelican_val/drop_face_01 1)
		
	; unload
	;--------------------------------------------
	(ai_set_objective gr_bone_pelican_val obj_hum_boneyard)
	;(vehicle_unload v_bone_pelican_val "pelican_lc")
	(vehicle_unload v_bone_pelican_val "pelican_p_r05") (sleep (random_range 5 15))
	(vehicle_unload v_bone_pelican_val "pelican_p_l05") (sleep (random_range 5 15))
	(vehicle_unload v_bone_pelican_val "pelican_p_r04") (sleep (random_range 5 15))
	(sleep 150)

	; rise ====================================================
	(cs_fly_to_and_face ps_bone_pelican_val/hover_01 ps_bone_pelican_val/hover_face_01 1)
	(unit_close v_bone_pelican_val)
	;(sleep_until (< (ai_task_count obj_pod_01_cov/gt_bone_pelican_val) 2) 1 (* 30 15))
		
	; == exit ====================================================
	(cs_vehicle_speed 1.0)
	(cs_fly_by ps_bone_pelican_val/exit_01)
	(cs_fly_by ps_bone_pelican_val/exit_02)
	(cs_vehicle_boost TRUE)
	(cs_fly_by ps_bone_pelican_val/erase)
	(ai_erase ai_current_squad)
	
)

; PHANTOM
;============================================

(script dormant s_bone_phantom_val
	(ai_place sq_bone_phantom_val)
)

(global vehicle v_bone_phantom_val none)
(script command_script cs_bone_phantom_val

	(if debug (print "phantom val"))
	(set v_bone_phantom_val (ai_vehicle_get_from_starting_location sq_bone_phantom_val/phantom))

	; spawning
	;--------------------------------------------
	(ai_place sq_bone_phantom_val_jackal_01)
	(ai_place sq_bone_phantom_val_grunt_01)
	(ai_force_active gr_bone_phantom_val TRUE)
	(sleep 5)
			
	; seating
	;--------------------------------------------	
	(ai_vehicle_enter_immediate sq_bone_phantom_val_jackal_01 v_bone_phantom_val "phantom_p_ml_f")
	(ai_vehicle_enter_immediate sq_bone_phantom_val_grunt_01 v_bone_phantom_val "phantom_p_ml_b")
	;(ai_vehicle_enter_immediate sq_bone_phantom_val_jackal_01 v_bone_phantom_val "phantom_p_rb")		
	;(ai_vehicle_enter_immediate sq_bone_phantom_val_XXX v_bone_phantom_val "phantom_p_lb")
	;(vehicle_load_magic v_bone_phantom_val "phantom_lc" (ai_vehicle_get_from_starting_location sq_bone_pelican_val_XXX/XXX))
	(sleep 1)

	; enter
	;--------------------------------------------
	(cs_vehicle_boost TRUE)
	(cs_fly_by ps_bone_phantom_val/approach_01)
	(cs_vehicle_boost FALSE)
	(cs_fly_by ps_bone_phantom_val/approach_02)
	(cs_fly_by ps_bone_phantom_val/approach_03)
	
	; hover
	;--------------------------------------------
	(cs_fly_to_and_face ps_bone_phantom_val/hover_01 ps_bone_phantom_val/face_01 1)
	(unit_open v_bone_phantom_val)
	(sleep 15)
	
	; lower
	;--------------------------------------------	
	(cs_vehicle_speed .5)
	(cs_fly_to_and_face ps_bone_phantom_val/drop_01 ps_bone_phantom_val/face_01 1)
		
	; unload
	;--------------------------------------------
	(ai_set_objective gr_bone_phantom_val obj_cov_boneyard)
	;(vehicle_unload (ai_vehicle_get ai_current_actor) "phantom_lc"))
	(vehicle_unload v_bone_phantom_val "phantom_p_ml_f")
	(vehicle_unload v_bone_phantom_val "phantom_p_ml_b")
	(sleep 150)

	; rise ====================================================
	(cs_fly_to_and_face ps_bone_phantom_val/hover_01 ps_bone_phantom_val/face_01 1)
	(unit_close v_bone_phantom_val)
	;(sleep_until (< (ai_task_count obj_pod_01_cov/gt_bone_phantom_val) 2) 1 (* 30 15))
		
	; == exit ====================================================
	(cs_vehicle_speed 1.0)
	(cs_fly_by ps_bone_phantom_val/exit_01)
	(cs_vehicle_boost TRUE)
	(cs_fly_by ps_bone_phantom_val/erase)
	(ai_erase ai_current_squad)
	
)





; =================================================================================================
; SMELTER
; =================================================================================================
(script dormant smelter_objective_control
	(if debug (print "::: smelterer encounter :::"))
	
	; Wait until the zone is loaded
	;(sleep_until
		;(or
			;(= (current_zone_set_fully_active) 1)
			;(= (current_zone_set_fully_active) 2)))
	
	(game_save)
	
	(smelter_spawn_all)
	
	(sleep_until (volume_test_players tv_smelt_01) 5)
	(if debug (print "objective control : smelter.01"))
	(set objcon_smelter 1)

	(sleep_until (volume_test_players tv_smelt_01_01) 5)
	(ai_place sq_smelt_brute_door)
	(ai_place sq_smelt_grunt_door)
	
	(sleep_until (volume_test_players tv_smelt_02) 5)
	(if debug (print "objective control : smelter.02"))
	(set objcon_smelter 2)

	(ai_place sq_smelt_elite_pass)
	(ai_place sq_smelt_phantom_yard)	

)

(script static void smelter_spawn_all
	(if debug (print "::: spawning all smelter squads"))

	(ai_place sq_smelt_skirmish_cat)
	(ai_place sq_smelt_grunt_entry_right)
	(ai_place sq_smelt_grunt_entry_left)
	(ai_place sq_smelt_elite_middle)

)

(script static void smelter_despawn_all
	(sleep 0)
)

(script static void smelter_kill_scripts
	(sleep_forever smelter_objective_control))


; PHANTOM
;============================================

(script dormant s_smelt_phantom_yard
	(ai_place sq_smelt_phantom_yard)
)

(global vehicle v_smelt_phantom_yard none)
(script command_script cs_smelt_phantom_yard

	(if debug (print "phantom smelt"))
	(set v_smelt_phantom_yard (ai_vehicle_get_from_starting_location sq_smelt_phantom_yard/driver_01))

	; spawning
	;--------------------------------------------
	(ai_place sq_smelt_phantom_yard_hunter)
	(ai_force_active gr_smelt_phantom_yard TRUE)
	(sleep 5)
			
	; seating
	;--------------------------------------------	
	(ai_vehicle_enter_immediate sq_smelt_phantom_yard_hunter v_smelt_phantom_yard "phantom_p_mr_f")
	(sleep 1)

	; enter
	;--------------------------------------------
	(cs_vehicle_boost TRUE)
	(cs_fly_by ps_smelt_phantom_yard/approach_01)
	(cs_vehicle_boost FALSE)
	(cs_fly_by ps_smelt_phantom_yard/approach_02)
	(cs_fly_by ps_smelt_phantom_yard/approach_03)
	
	; hover
	;--------------------------------------------
	(cs_fly_to_and_face ps_smelt_phantom_yard/hover_01 ps_smelt_phantom_yard/face_enter 1)
	(unit_open v_smelt_phantom_yard)
	(sleep 15)
	
	; lower
	;--------------------------------------------	
	(cs_vehicle_speed .5)
	(cs_fly_to_and_face ps_smelt_phantom_yard/drop_01 ps_smelt_phantom_yard/face_enter 1)
		
	; unload
	;--------------------------------------------
	(ai_set_objective gr_smelt_phantom_yard obj_cov_smelt)
	(vehicle_unload v_smelt_phantom_yard "phantom_p_mr_f")
	(ai_teleport sq_smelt_phantom_yard_hunter ps_smelt_phantom_yard_hunter/spawn)

	(sleep 150)

	; rise ====================================================
	(cs_fly_to_and_face ps_smelt_phantom_yard/hover_01 ps_smelt_phantom_yard/face_leave 1)
	(unit_close v_smelt_phantom_yard)
		
	; == exit ====================================================
	(cs_vehicle_speed 1.0)
	(cs_fly_by ps_smelt_phantom_yard/exit_01)
	(cs_vehicle_boost TRUE)
	(cs_fly_by ps_smelt_phantom_yard/erase)
	(ai_erase ai_current_squad)
	
)


; =================================================================================================
; BIG GUN
; =================================================================================================
(script dormant biggun_objective_control
	(if debug (print "::: big gun encounter :::"))
	
	; Wait until the zone is loaded
	;(sleep_until
		;(or
			;(= (current_zone_set_fully_active) 1)
			;(= (current_zone_set_fully_active) 2)))
	
	(game_save)
	
	(biggun_spawn_all)
	
	(sleep_until (volume_test_players tv_biggun_01) 1)
	(if debug (print "objective control : big biggun.01"))
	(set objcon_biggun 1)
	
)

(script static void biggun_spawn_all
	(if debug (print "::: spawning all big gun squads"))

	(ai_place sq_cov_brute1_biggun)
	(ai_place sq_cov_brute2_biggun)
	(ai_place sq_cov_banshee1_biggun)
	(ai_place sq_hum_marine1_biggun)

)

(script static void biggun_despawn_all
	(sleep 0)
)

(script static void biggun_kill_scripts
	(sleep_forever biggun_objective_control))


;----------------------------------------------------------------------------------------------------
; Shortcuts

; p - pause/unpause
(script static void p
	(if (!= game_speed 0)
		(set game_speed 0)
		(set game_speed 1)
	)
)

; 5 - half speed
(script static void 5
	(if (!= game_speed .5)
		(set game_speed .5)
		(set game_speed 1)
	)
)


; b - bsps
(script static void b
	(if ai_render_sector_bsps
		(set ai_render_sector_bsps 0)
		(set ai_render_sector_bsps 1)
	)
)

; o - objectives
(script static void o
	(if ai_render_objectives
		(set ai_render_objectives 0)
		(set ai_render_objectives 1)
	)
)

; d - decisions
(script static void d
	(if ai_render_decisions
		(set ai_render_decisions 0)
		(set ai_render_decisions 1)
	)
)

; c - command scripts
(script static void c
	(print "command scripts")
	(if ai_render_command_scripts
		(set ai_render_command_scripts 0)
		(set ai_render_command_scripts 1)
	)
)

;* COMMANDS
ai_render_tracked_props : shows scariness
ai_render_decisions : shows behaviors
ai_render_target : shows you the currently selected actor’s target
ai_render_sector_bsps : pathfinding debugging
ai_render_evaluations : shows you firing point evaluation results 
                ai_render_evaluations_text 
                ai_render_evaluations_detailed
                ai_render_evaluations_shading
                ai_render_evaluations_shading_none
                ai_render_evaluations_shading_#name of firing point evaluation tag#
ai_render_emotions : shows the danger level of an AI
ai_render_vehicle_turns : shows the trottle speed for an ai driving (must select the ai first)
ai_render_timeslices : shows how often an ai is checking for new firing points
ai_render_aiming_vectors : show the view lines the AI wants to look and and the ones he is looking at
ai_render_props : use this to show the objects in the world the AI can perceive (orphans and such)
ai_render_vision_cones : the visual representation of the perception cone model
*;