; ================================================================================================================
; ====== FF35 FACILITY FIREFIGHT SCIRPTS =========================================================================
; ================================================================================================================
(global short s_round -1)
(global boolean g_timer_var FALSE)

(script startup ff35_facility

		;HACK TO GET PROPER SPAWNING WEAPONS
			(loadout_team_set_respawn_loadout player loadout_infantryman)
		(loadout_team_set_respawn_loadout covenant_player loadout_warrior)
		
		(game_force_survival_immediate)
		
		; set allegiances 
		(ai_allegiance human player)
		(ai_allegiance player human)
;		(ai_allegiance covenant prophet)
;		(ai_allegiance prophet covenant)
		
	
		; snap to black 
		(if (> (player_count) 0) (cinematic_snap_to_black))
		(sleep 5)
		
		; switch to the proper zone set 
		(switch_zone_set set_firefight)

		(wake sur_kill_vol_disable)
		
		
	;FIRETEAM SETUP
	(set ai_sur_fireteam_squad0 sur_fireteam_01)
	(set ai_sur_fireteam_squad1 sur_fireteam_02)
	(set ai_sur_fireteam_squad2 sur_fireteam_03)
	(set ai_sur_fireteam_squad3 sur_fireteam_04)
	(set ai_sur_fireteam_squad4 sur_fireteam_05)
	
	; ===================================================================
	; wave parameters ===================================================
	; ===================================================================

	; define survival objective name 
	(set ai_obj_survival obj_survival)
	

	;turning on sandbox objects for cover
	;(object_create_folder cr_sandbox_items)
	
	; ===================================================================
	; phantom parameters ================================================
	; ===================================================================
	
	
		; assign phantom squads to global ai variables 
			(set ai_sur_phantom_01 sq_sur_phantom_01)
			(set ai_sur_phantom_02 sq_sur_phantom_02)
			(set ai_sur_phantom_03 sq_sur_phantom_03)
			(set ai_sur_phantom_04 sq_sur_phantom_04)
	
			; set phantom load parameters 
				(set s_sur_drop_side_01 "right")
				(set s_sur_drop_side_02 "left")
				(set s_sur_drop_side_03 "dual")
				(set s_sur_drop_side_04 "dual")
				(set b_sur_dropship_r1_initial true)
				(set b_sur_dropship_r2_initial true)
				(set b_sur_dropship_r3_initial true)
				(set b_sur_dropship_r1_primary true)
				(set b_sur_dropship_r2_primary true)
				(set b_sur_dropship_r3_primary true)
				(set b_sur_dropship_r1_boss true)
				(set b_sur_dropship_r2_boss true)
				(set b_sur_dropship_r3_boss true)

	;setting wave spawn group
	(set ai_sur_wave_spawns gr_survival_waves)
	
	;controls how many squads are spawned
	(set s_sur_wave_squad_count 8)
	
	; How many generators are active. 3 max, 0 disables generator defense
	(set s_sur_generator_count 0)

	; Game over if ANY generators die if true
	(set b_sur_generator_defend_all true)

	; Randomly selects the generators if true
	(set b_sur_generator_order_random false)

	; Set these three to named objects in your scenario
	; Recommend using tags/objects/temp/tysongr/unsc_shield_generator_anvil
	(set obj_sur_generator0 generator0)
	(set obj_sur_generator1 generator1)
	(set obj_sur_generator2 generator2)


	
	(set ai_sur_remaining sq_sur_remaining)

	; ==============================================================
	; bonus round parameters =======================================
	; ==============================================================
		
		; turn on the bonus round 
		;(set b_sur_bonus_round TRUE)
		
		; phantom / ground parameters 
		;(set b_sur_bonus_phantom TRUE)
		;(set b_sur_bonus_ground FALSE)
		
		(set ai_sur_bonus_phantom sq_sur_bonus_phantom)
			

	; begin survival mode  ============================================

	; wake the survival mode global scirpt 
	(wake survival_banshee_spawn)
	(wake survival_mode)
	(wake survival_recycle)
	;(wake survival_kill_player)
	(sleep 5)		
		
)

; ==============================================================================================================
; ====== SECONDARY SCRIPTS =====================================================================================
; ==============================================================================================================
(script static void survival_refresh_follow
	(survival_refresh_sleep)
	(ai_reset_objective obj_survival/main_follow)
)

(script static void survival_hero_refresh_follow
	(survival_refresh_sleep)
	(survival_refresh_sleep)
	(ai_reset_objective obj_survival/hero_follow)
)


; ==============================================================================================================
; ====== PHANTOM COMMAND SCRIPTS ===============================================================================
; ==============================================================================================================

(script command_script cs_sur_phantom_01
	(set v_sur_phantom_01 (ai_vehicle_get_from_starting_location sq_sur_phantom_01/phantom))
		(sleep 1)
	(cs_enable_pathfinding_failsafe TRUE)		
	(object_set_shadowless sq_sur_phantom_01/phantom TRUE)

	(cs_fly_by ps_sur_phantom_01/p0)
	(cs_fly_by ps_sur_phantom_01/p1)
	(cs_vehicle_speed 0.50)
	(cs_fly_by ps_sur_phantom_01/p2)
			; ========= DRIVE-BY DROPOFF =============================

				(cs_fly_by ps_sur_phantom_01/p3 4)
					(cs_vehicle_speed 0.15)
				(cs_fly_by ps_sur_phantom_01/p4 4)
					(vehicle_unload v_sur_phantom_01 "phantom_p_rf")
					(sleep_until (= (vehicle_test_seat v_sur_phantom_01 "phantom_p_rf") 0))
					(vehicle_unload v_sur_phantom_01 "phantom_p_rb")
					(sleep_until (= (vehicle_test_seat v_sur_phantom_01 "phantom_p_rb") 0))
				(cs_fly_by ps_sur_phantom_01/p5 4)
					(vehicle_unload v_sur_phantom_01 "phantom_p_mr_f")
					(sleep_until (= (vehicle_test_seat v_sur_phantom_01 "phantom_p_mr_f") 0))
				(cs_fly_by ps_sur_phantom_01/p6 4)
					(vehicle_unload v_sur_phantom_01 "phantom_p_mr_b")
					(sleep_until (= (vehicle_test_seat v_sur_phantom_01 "phantom_p_mr_b") 0))
			; ========= DRIVE-BY DROPOFF =============================

		(sleep 15)
		(cs_vehicle_speed 0.50)
	(cs_fly_by ps_sur_phantom_01/p7)
		(cs_vehicle_speed 1.00)
	(cs_fly_by ps_sur_phantom_01/p8)
	(cs_fly_by ps_sur_phantom_01/p9)
	(cs_fly_by ps_sur_phantom_01/erase 10)
	; erase squad 
	(ai_erase ai_current_squad)
)


; ============================================================================================================================
(script command_script cs_sur_phantom_02
	(set v_sur_phantom_02 (ai_vehicle_get_from_starting_location sq_sur_phantom_02/phantom))
		(sleep 1)
	(cs_enable_pathfinding_failsafe TRUE)
	(object_set_shadowless sq_sur_phantom_02/phantom TRUE)
	

	(cs_fly_by ps_sur_phantom_02/p0)
	(cs_fly_by ps_sur_phantom_02/p1)
	(cs_vehicle_speed 0.50)
	(cs_fly_by ps_sur_phantom_02/p2)
	(cs_fly_by ps_sur_phantom_02/p3)
			; ========= DRIVE-BY DROPOFF =============================

				(cs_fly_by ps_sur_phantom_02/p4 3)
					(cs_vehicle_speed 0.15)
					(object_set_phantom_power v_sur_phantom_02 TRUE)
					(vehicle_unload v_sur_phantom_02 "phantom_p_lf")
					(sleep_until (= (vehicle_test_seat v_sur_phantom_02 "phantom_p_lf") 0))
				(cs_fly_by ps_sur_phantom_02/p5 3)
					(vehicle_unload v_sur_phantom_02 "phantom_p_lb")
					(sleep_until (= (vehicle_test_seat v_sur_phantom_02 "phantom_p_lb") 0))
				(cs_fly_by ps_sur_phantom_02/p6 3)
					(vehicle_unload v_sur_phantom_02 "phantom_p_ml_f")
					(sleep_until (= (vehicle_test_seat v_sur_phantom_02 "phantom_p_ml_f") 0))
				(cs_fly_by ps_sur_phantom_02/p7 3)
					(vehicle_unload v_sur_phantom_02 "phantom_p_ml_b")
					(sleep_until (= (vehicle_test_seat v_sur_phantom_02 "phantom_p_ml_b") 0))
			; ========= DRIVE-BY DROPOFF =============================


		(sleep 15)
		(cs_vehicle_speed 1.0)
	(cs_fly_by ps_sur_phantom_02/p8)
	(cs_fly_by ps_sur_phantom_02/p9)
	(cs_fly_by ps_sur_phantom_02/p10)
	(cs_fly_by ps_sur_phantom_02/erase 10)
	; erase squad 
	(ai_erase ai_current_squad)
	;(ai_erase sq_sur_phantom_02)

)



; ==========================================================================================================================
(script command_script cs_sur_phantom_03
	(set v_sur_phantom_03 (ai_vehicle_get_from_starting_location sq_sur_phantom_03/phantom))
		(sleep 1)
	(cs_enable_pathfinding_failsafe TRUE)		
		
			;* ======== LOAD WRAITH  ==================
			(if 	
				(and 
					(= (random_range 0 5) 0)
					(<= (object_get_health (ai_vehicle_get_from_spawn_point sq_sur_wraith_01/driver)) 0)
				)
				(f_load_phantom_cargo
									v_sur_phantom_03
									"single"
									sq_sur_wraith_01
									none
				)
			)
			; ======== LOAD WRAITH  ==================
*;
	(cs_fly_by ps_sur_phantom_03/p0)
	(cs_fly_by ps_sur_phantom_03/p1)
	(cs_vehicle_speed 0.50)
	(cs_fly_by ps_sur_phantom_03/p2)
		(sleep 15)

			; ========= DRIVE-BY DROPOFF =============================

				(cs_fly_by ps_sur_phantom_03/p3 4)
					(cs_vehicle_speed 0.15)
					(vehicle_unload v_sur_phantom_03 "phantom_p_rf")
					(sleep_until (= (vehicle_test_seat v_sur_phantom_03 "phantom_p_rf") 0))
					(vehicle_unload v_sur_phantom_03 "phantom_p_rb")
					(sleep_until (= (vehicle_test_seat v_sur_phantom_03 "phantom_p_rb") 0))
				(cs_fly_by ps_sur_phantom_03/p4 4)
					(vehicle_unload v_sur_phantom_03 "phantom_p_mr_f")
					(sleep_until (= (vehicle_test_seat v_sur_phantom_03 "phantom_p_mr_f") 0))
					(vehicle_unload v_sur_phantom_03 "phantom_p_mr_b")
					(sleep_until (= (vehicle_test_seat v_sur_phantom_03 "phantom_p_mr_b") 0))
			; ========= DRIVE-BY DROPOFF =============================

		(sleep 15)
		(cs_vehicle_speed 0.50)
	(cs_fly_by ps_sur_phantom_03/p5)
		(cs_vehicle_speed 1.00)
	(cs_fly_by ps_sur_phantom_03/p6)
	(cs_fly_by ps_sur_phantom_03/p7)
	(cs_fly_by ps_sur_phantom_03/erase 10)
	; erase squad 
	(ai_erase ai_current_squad)
)

;*
(global vehicle v_sq_sur_wraith_01 NONE)

(script static void sur_wraith01_reserve
	(set v_sq_sur_wraith_01 (ai_vehicle_get_from_starting_location sq_sur_wraith_01/driver))
	
	(if (> (players_elite_living_count) 0)
		(begin
			(print "Elites playing, so don't blow up wraiths!!!")
		)
		
		(begin
			(print "Wraiths will blow up when driver is killed.")
			(sleep_until (!= (ai_living_count sq_sur_wraith_01) 2) 1)
			
			(if (= (ai_living_count sq_sur_wraith_01/driver) 0)
				(begin
					(print "DRIVER DEAD")
					(vehicle_unload v_sq_sur_wraith_01 "")
					(print "waiting for player to exit vehicle...")
					(sleep_until (not (vehicle_test_seat_unit_list v_sq_sur_wraith_01 "" (players))) 1)
					(print "killing wraith...")
					(unit_kill v_sq_sur_wraith_01)
					
				)
				(begin
					(print "GUNNER DEAD")
					(ai_vehicle_reserve_seat (ai_vehicle_get_from_starting_location sq_sur_wraith_01/gunner) "wraith_g" TRUE)
				)
			)
					
			(sleep_until (< (ai_living_count sq_sur_wraith_01) 1) 1)
			(if (= (ai_living_count sq_sur_wraith_01/driver) 0)
				(begin
					(print "DRIVER DEAD")
					(vehicle_unload v_sq_sur_wraith_01 "")
					(print "waiting for player to exit vehicle...")
					(sleep_until (not (vehicle_test_seat_unit_list v_sq_sur_wraith_01 "" (players))) 1)
					(print "killing wraith...")
					(unit_kill v_sq_sur_wraith_01)
					
				)
				(begin
					(print "GUNNER DEAD")
					(ai_vehicle_reserve_seat (ai_vehicle_get_from_starting_location sq_sur_wraith_01/gunner) "wraith_g" TRUE)
				)
			)
		)
	)
)
*;
; ================================================================================================================================
(script command_script cs_sur_phantom_04
	(set v_sur_phantom_04 (ai_vehicle_get_from_starting_location sq_sur_phantom_04/phantom))
		(sleep 1)
	(cs_enable_pathfinding_failsafe TRUE)		
		
			;* ======== LOAD WRAITH  ==================			
			(if 
				(and 
					(= (random_range 0 5) 0)
					(<= (object_get_health (ai_vehicle_get_from_spawn_point sq_sur_wraith_02/driver)) 0)
				)
				(f_load_phantom_cargo
									v_sur_phantom_04
									"single"
									sq_sur_wraith_02
									none
				)
			)	
			; ======== LOAD WRAITH  ==================
*;
	(cs_fly_by ps_sur_phantom_04/p0)
	(cs_fly_by ps_sur_phantom_04/p1)
	(cs_vehicle_speed 0.50)
	(cs_fly_by ps_sur_phantom_04/p2)
	(cs_vehicle_speed 0.35)
			; ========= DRIVE-BY DROPOFF =============================

				(cs_fly_by ps_sur_phantom_04/p3 4)
					(cs_vehicle_speed 0.15)
					(cs_fly_by ps_sur_phantom_04/p4 4)
					(vehicle_unload v_sur_phantom_04 "phantom_p_lf")
					(sleep_until (= (vehicle_test_seat v_sur_phantom_04 "phantom_p_lf") 0))
					(vehicle_unload v_sur_phantom_04 "phantom_p_lb")
					(sleep_until (= (vehicle_test_seat v_sur_phantom_04 "phantom_p_lb") 0))
				(cs_fly_by ps_sur_phantom_04/p5 4)
					(vehicle_unload v_sur_phantom_04 "phantom_p_ml_f")
					(sleep_until (= (vehicle_test_seat v_sur_phantom_04 "phantom_p_ml_f") 0))
					(vehicle_unload v_sur_phantom_04 "phantom_p_ml_b")
					(sleep_until (= (vehicle_test_seat v_sur_phantom_04 "phantom_p_ml_b") 0))
			; ========= DRIVE-BY DROPOFF =============================

		(sleep 15)
		(cs_vehicle_speed 0.50)
	(cs_fly_by ps_sur_phantom_04/p5)
		(cs_vehicle_speed 1.00)
	(cs_fly_by ps_sur_phantom_04/p6)
	(cs_fly_by ps_sur_phantom_04/p7)
	(cs_fly_by ps_sur_phantom_04/erase 10)
	; erase squad 
	(ai_erase ai_current_squad)
)

;*

(global vehicle v_sq_sur_wraith_02 NONE)

(script static void sur_wraith02_reserve
	(set v_sq_sur_wraith_02 (ai_vehicle_get_from_starting_location sq_sur_wraith_02/driver))
	
	(if (> (players_elite_living_count) 0)
	
		(begin
			(print "Elites playing, so don't blow up wraiths!!!")
		)
	
		(begin
			(print "Wraiths will blow up when driver is killed.")
			(sleep_until (!= (ai_living_count sq_sur_wraith_02) 2) 1)
			
			(if (= (ai_living_count sq_sur_wraith_02/driver) 0)
				(begin
					(print "DRIVER DEAD")
					(vehicle_unload v_sq_sur_wraith_02 "")
					(print "waiting for player to exit vehicle...")
					(sleep_until (not (vehicle_test_seat_unit_list v_sq_sur_wraith_02 "" (players))) 1)
					(print "killing wraith...")
					(unit_kill v_sq_sur_wraith_02)
					
				)
				(begin
					(print "GUNNER DEAD")
					(ai_vehicle_reserve_seat (ai_vehicle_get_from_starting_location sq_sur_wraith_02/gunner) "wraith_g" TRUE)
				)
			)
					
			(sleep_until (< (ai_living_count sq_sur_wraith_02) 1) 1)
			(if (= (ai_living_count sq_sur_wraith_02/driver) 0)
				(begin
					(print "DRIVER DEAD")
					(vehicle_unload v_sq_sur_wraith_02 "")
					(print "waiting for player to exit vehicle...")
					(sleep_until (not (vehicle_test_seat_unit_list v_sq_sur_wraith_02 "" (players))) 1)
					(print "killing wraith...")
					(unit_kill v_sq_sur_wraith_02)
					
				)
				(begin
					(print "GUNNER DEAD")
					(ai_vehicle_reserve_seat (ai_vehicle_get_from_starting_location sq_sur_wraith_02/gunner) "wraith_g" TRUE)
				)
			)
		)
	)
)
*;
; ==============================================================================================================
; ====== BANSHEE SCIRPTS =======================================================================================
; ==============================================================================================================
(script dormant survival_banshee_spawn
	(sleep_until
		(begin
			(sleep (* 30 (random_range 90 240)))
			(if (< (ai_living_count gr_survival_banshee) 1)
				(cond 
					((= (ai_living_count sq_sur_banshee01) 0)
						(ai_place sq_sur_banshee01))
					((= (ai_living_count sq_sur_banshee02) 0)
						(ai_place sq_sur_banshee02))
				)			
			)
		FALSE)
	)
)
;====================================================================================================================================

(global boolean b_load_in_phantom FALSE)

(script command_script cs_sur_bonus_phantom
	(set v_sur_bonus_phantom (ai_vehicle_get_from_spawn_point sq_sur_bonus_phantom/phantom))
	(set b_load_in_phantom TRUE)
		(sleep 1)
	(object_set_shadowless v_sur_bonus_phantom TRUE)
	(cs_enable_pathfinding_failsafe TRUE)	
	(cs_fly_by ps_sur_bonus_phantom/p0)
	(cs_fly_by ps_sur_bonus_phantom/p1)
	(cs_fly_by ps_sur_bonus_phantom/p2)
	;(cs_vehicle_speed 0.35)
	(cs_fly_to_and_face ps_sur_bonus_phantom/drop ps_sur_bonus_phantom/face 1)
		(sleep 15)
		(unit_open v_sur_bonus_phantom)	

		; ======== DROP DUDES HERE ======================
			(set b_load_in_phantom FALSE)
			
			(set b_sur_bonus_phantom_ready TRUE)

			(f_unload_bonus_phantom
							v_sur_bonus_phantom
			)
		; ======== DROP DUDES HERE ======================
			(sleep 150)
			(unit_close v_sur_bonus_phantom)
		; sleep until BONUS ROUND is over 
		(sleep_until b_sur_bonus_end)
			(sleep 45)
		
	; fly away 
		(sleep 15)
		;(cs_vehicle_speed 0.75)
	(cs_fly_by ps_sur_bonus_phantom/p2)
		;(cs_vehicle_speed 1.00)
	(cs_fly_by ps_sur_bonus_phantom/p1)
	(cs_fly_by ps_sur_bonus_phantom/p0)
	(cs_fly_by ps_sur_bonus_phantom/erase 10)
	; erase squad 
	(ai_erase ai_current_squad)
)



(script dormant survival_recycle
	(sleep_until
		(begin
			(add_recycling_volume tv_sur_garbage_all 60 60)
			(sleep 1500)
		FALSE)
	1)
)

(script dormant sur_kill_vol_disable
;	(kill_volume_disable kill_sur_room_01)
;	(kill_volume_disable kill_sur_room_02)
;	(kill_volume_disable kill_sur_room_03)
;	(kill_volume_disable kill_sur_room_04)
;	(kill_volume_disable kill_sur_room_05)
;	(kill_volume_disable kill_sur_room_06)
;	(kill_volume_disable kill_sur_room_07)
;	(kill_volume_disable kill_sur_room_08)
	
	(print "disabling kill_volumes")
)