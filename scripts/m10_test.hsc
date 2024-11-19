;*********************************************************************;
;General
;*********************************************************************;
(global object obj_carter NONE)
(global object obj_kat NONE)
(global object obj_jorge NONE)
(global object obj_emile NONE)
(global object obj_jun NONE)

;*********************************************************************;
;Main Script
;*********************************************************************;
(script dormant m10_test
	(print "m10_test")
	
	(ai_allegiance human player)
	(ai_allegiance player human)
	
	(ai_place spartan_carter)
	(ai_place spartan_kat)
	(ai_place spartan_jorge)
	(ai_place spartan_emile)

	(set obj_carter (ai_get_unit spartan_carter/carter))
	(set obj_kat (ai_get_unit spartan_kat/kat))
	(set obj_jorge (ai_get_unit spartan_jorge/jorge))
	(set obj_emile (ai_get_unit spartan_emile/emile))
	
	(unit_set_stance spartan_carter alert)
	(unit_set_stance spartan_kat alert)
	(unit_set_stance spartan_emile alert)
	
	(print "vig:move out")	
	
	(sleep_until (volume_test_players tv_1stbowl_gas))
	;(bring_spartans_forward 8)
	(thespian_performance_kill_by_ai group_spartans)
	;*
	
	(print "vig:beacon")
	(thespian_performance_setup_and_begin vig_beacon "" 0)
	*;
)

(script static void (bring_spartans_forward (short dist))
	(ai_bring_forward obj_carter dist)
	(ai_bring_forward obj_kat dist)
	(ai_bring_forward obj_jorge dist)
	(ai_bring_forward obj_emile dist)	
)


; =================================================================================================
; DROPOFF SCRIPTS
; =================================================================================================
(global short g_1stbowl_obj_control 1)

(script static void test_1stbowl_spartans
	(print "placing Spartans")
	(ai_place spartan_carter)
	(ai_place spartan_kat)
	(ai_place spartan_emile)
	(ai_place spartan_jorge)
	(ai_place spartan_jun)
	(sleep 1)
	
	(set obj_carter (ai_get_unit spartan_carter/carter))
	(set obj_kat (ai_get_unit spartan_kat/kat))
	(set obj_emile (ai_get_unit spartan_emile/emile))
	(set obj_jorge (ai_get_unit spartan_jorge/jorge))
	(set obj_jun (ai_get_unit spartan_jun/jun))
	(sleep 1)

	(ai_cannot_die group_spartans TRUE)
	
	;(wake spartan_alert_start)		
	
	(wake intro_falcons_start)
	
	(sleep_until (not (any_players_in_vehicle)) 5)	
)

(script dormant intro_falcons_start
	(ai_allegiance human player)
	(ai_allegiance player human)
	
	(f_ai_place_vehicle_deathless intro_falcon_01)
	(f_ai_place_vehicle_deathless intro_falcon_02)	
		
	; This thespian performance is Carter's whole falcon ride and unload
	(thespian_performance_setup_and_begin carter_falcon_intro "" 0)
	
	; This thespian performance is Kat's whole falcon ride and unload
	(thespian_performance_setup_and_begin kat_falcon_intro "" 0)	
	
	; This thespian performance is Emile's whole falcon ride and unload
	(thespian_performance_setup_and_begin emile_falcon_intro "" 0)	
	
	; This thespian performance is Jun's whole falcon ride and unload
	(thespian_performance_setup_and_begin jun_falcon_intro "" 0)	
	
	; This thespian performance is Jorge's whole falcon ride and unload
	(thespian_performance_setup_and_begin jorge_falcon_intro "" 0)	
	
	(object_cannot_take_damage (ai_vehicle_get_from_squad intro_falcon_01 0))
	(object_cannot_take_damage (ai_vehicle_get_from_squad intro_falcon_02 0))
	(objects_attach dm_falcon01_start "" (ai_vehicle_get_from_squad intro_falcon_01 0) "")
	(objects_attach dm_falcon02_start "" (ai_vehicle_get_from_squad intro_falcon_02 0) "")
	
	(wake intro_falcon01_anim_start)
	(wake intro_falcon02_anim_start)		
	(wake load_and_setup_falcons)	
)

(script dormant load_and_setup_falcons
	(vehicle_load_magic (ai_vehicle_get_from_squad intro_falcon_01 0) "falcon_p_l1" player0)
	
	(unit_lower_weapon (player0) 0)
	(unit_lower_weapon (player1) 0)
	
	;*
	(vehicle_set_player_interaction (ai_vehicle_get_from_squad intro_falcon_01 0) "falcon_p_r1" TRUE FALSE)
	(vehicle_set_player_interaction (ai_vehicle_get_from_squad intro_falcon_01 0) "falcon_p_l1" TRUE FALSE)
	(vehicle_set_player_interaction (ai_vehicle_get_from_squad intro_falcon_01 0) "falcon_p_r2" TRUE FALSE)
	(vehicle_set_player_interaction (ai_vehicle_get_from_squad intro_falcon_01 0) "falcon_p_l2" TRUE FALSE)
	(vehicle_set_player_interaction (ai_vehicle_get_from_squad intro_falcon_01 0) "falcon_p_bench" TRUE FALSE)
	
	(vehicle_set_player_interaction (ai_vehicle_get_from_squad intro_falcon_02 1) "falcon_p_r1" TRUE FALSE)
	(vehicle_set_player_interaction (ai_vehicle_get_from_squad intro_falcon_02 0) "falcon_p_l1" TRUE FALSE)
	(vehicle_set_player_interaction (ai_vehicle_get_from_squad intro_falcon_02 0) "falcon_p_r2" TRUE FALSE)
	(vehicle_set_player_interaction (ai_vehicle_get_from_squad intro_falcon_02 0) "falcon_p_l2" TRUE FALSE)
	(vehicle_set_player_interaction (ai_vehicle_get_from_squad intro_falcon_02 0) "falcon_p_bench" TRUE FALSE)		
	*;
	
	;(ai_vehicle_enter_immediate group_kat (ai_vehicle_get_from_squad intro_falcon_02 0) "m10_falcon_p_bench")
	;(ai_vehicle_enter_immediate group_emile (ai_vehicle_get_from_squad intro_falcon_02 0) "falcon_p_r1")
	;(ai_vehicle_enter_immediate group_jorge (ai_vehicle_get_from_squad intro_falcon_02 0) "falcon_p_l1")
	
	;if coop
	(if (>= (game_coop_player_count) 2)
		(vehicle_load_magic (ai_vehicle_get_from_squad intro_falcon_01 0) "falcon_p_l2" player1)
	)
	
	(if (>= (game_coop_player_count) 3)
		(vehicle_load_magic (ai_vehicle_get_from_squad intro_falcon_02 0) "falcon_p_r2" player2)
	)
	
	(if (>= (game_coop_player_count) 4)
		(vehicle_load_magic (ai_vehicle_get_from_squad intro_falcon_02 0) "falcon_p_l2" player3)
	)		
)

(script dormant intro_falcon01_anim_start
	(intro_falcon01_dropoff_start)
)

(script dormant intro_falcon02_anim_start
	(intro_falcon02_dropoff_start)
)

(script static void intro_falcon01_dropoff_start
	(print "anim: falcon01_dropoff")
	(device_set_position_track dm_falcon01_start "m10_insert_dropoff_a_leomar" 0)
	(device_animate_position dm_falcon01_start 1 50.00 .1 .1 FALSE)		
	
	(sleep_until (>= (device_get_position dm_falcon01_start) .95) 1)
	
	(if (not (game_is_cooperative))
		;if single player, train player to exit
		(begin
			;(wake ct_training_exit_start)
			(vehicle_set_player_interaction (ai_vehicle_get_from_squad intro_falcon_01 0) "falcon_p_l1" FALSE TRUE)
		)
	)
	
	(intro_falcon01_exit_start)
	
	(if (not (game_is_cooperative))
		;if single player, wait for player to exit
		(begin
			(sleep_until (not (unit_in_vehicle (unit player0))) 1)
			(f_set_falcon_interaction_false (ai_vehicle_get_from_squad intro_falcon_01 0))
			(unit_raise_weapon player0 30)
		)
	)
	
	(sleep_until (>= (device_get_position dm_falcon01_start) 1) 1)
	(objects_detach dm_falcon01_start (ai_vehicle_get_from_squad intro_falcon_01 0))
	(object_set_velocity (ai_vehicle_get_from_squad intro_falcon_01 0) 0 0 .7)
	(cs_run_command_script (f_ai_get_vehicle_driver intro_falcon_01) cs_intro_falcons)
	
)

(script static void intro_falcon02_dropoff_start
	(print "anim: falcon02_dropoff")
	(device_set_position_track dm_falcon02_start "m10_insert_dropoff_b_leomar" 0)
	(device_animate_position dm_falcon02_start 1 57.00 .1 .1 FALSE)
	
	(sleep_until (>= (device_get_position dm_falcon02_start) .95) 1)
	(print "anim: falcon02_dropoff")
	(intro_falcon02_exit_start)
	
	(sleep_until (>= (device_get_position dm_falcon02_start) 1) 1)
	(objects_detach dm_falcon02_start (ai_vehicle_get_from_squad intro_falcon_02 0))
	(object_set_velocity (ai_vehicle_get_from_squad intro_falcon_02 0) 0 0 .7)
	(cs_run_command_script (f_ai_get_vehicle_driver intro_falcon_02) cs_intro_falcons_02)

)

(script command_script cs_intro_falcons
	(cs_fly_by pts_1stbowl/air_support00a)
	(sleep_forever)
)

(script command_script cs_intro_falcons_02
	(cs_fly_by pts_1stbowl/air_support01 3)
	(sleep_forever)
)

(script static void intro_falcon01_exit_start
	;jun
	;(ai_vehicle_reserve_seat (ai_vehicle_get_from_squad intro_falcon_01 0) "falcon_p_r1" TRUE)
	(ai_vehicle_reserve_seat (ai_vehicle_get_from_squad intro_falcon_01 0) "falcon_p_l1" TRUE)
	(ai_vehicle_reserve_seat (ai_vehicle_get_from_squad intro_falcon_01 0) "falcon_p_l2" TRUE)
	(ai_vehicle_reserve_seat (ai_vehicle_get_from_squad intro_falcon_01 0) "falcon_p_r1" TRUE)
	(ai_vehicle_reserve_seat (ai_vehicle_get_from_squad intro_falcon_01 0) "falcon_p_r2" TRUE)
	(ai_vehicle_reserve_seat (ai_vehicle_get_from_squad intro_falcon_01 0) "falcon_p_bench" TRUE)	
	;(ai_vehicle_reserve_seat (ai_vehicle_get_from_squad intro_falcon_01 0) "m10_falcon_p_bench" TRUE)
	
	(ai_vehicle_reserve_seat (ai_vehicle_get_from_squad intro_falcon_02 0) "falcon_p_l1" TRUE)
	(ai_vehicle_reserve_seat (ai_vehicle_get_from_squad intro_falcon_02 0) "falcon_p_l2" TRUE)
	(ai_vehicle_reserve_seat (ai_vehicle_get_from_squad intro_falcon_02 0) "falcon_p_r1" TRUE)
	(ai_vehicle_reserve_seat (ai_vehicle_get_from_squad intro_falcon_02 0) "falcon_p_r2" TRUE)
	(ai_vehicle_reserve_seat (ai_vehicle_get_from_squad intro_falcon_02 0) "falcon_p_bench" TRUE)	
	;(ai_vehicle_reserve_seat (ai_vehicle_get_from_squad intro_falcon_02 0) "m10_falcon_p_bench" TRUE)
	
	;jun
	;(vehicle_unload (ai_vehicle_get_from_squad intro_falcon_01 0) "falcon_p_r1")
	;(vehicle_unload (ai_vehicle_get_from_squad intro_falcon_01 0) "falcon_p_l2")
	(sleep 20)
	(vehicle_unload (ai_vehicle_get_from_squad intro_falcon_01 0) "falcon_p_bench_wpn")
	(sleep 95)
	
	;(cs_custom_animation spartan_carter/carter TRUE objects\characters\spartans_ai\spartans_ai "m10_drop:carter_commands" TRUE) 
	; player seats
	;(vehicle_unload (ai_vehicle_get_from_squad intro_falcon_01 0) "falcon_p_l1")
	;(vehicle_unload (ai_vehicle_get_from_squad intro_falcon_01 0) "falcon_p_r2")
	
	(if (game_is_cooperative)
		;if coop, kick player out
		(begin
			(f_set_falcon_interaction_false (ai_vehicle_get_from_squad intro_falcon_01 0))
			(unit_exit_vehicle player0)
			(unit_raise_weapon player0 30)
		)
	)
	(sleep 7)
	
	;(unit_exit_vehicle player0)
	;(unit_raise_weapon player0 30)
	(vehicle_set_player_interaction (ai_vehicle_get_from_squad intro_falcon_01 0) "falcon_p_l1" FALSE TRUE)
	
	(set g_1stbowl_obj_control 2)
)


(script static void intro_falcon02_exit_start
	;(ai_vehicle_reserve_seat (ai_vehicle_get_from_squad intro_falcon_02 0) "falcon_p_r1" TRUE)
	;jorge
	;(ai_vehicle_reserve_seat (ai_vehicle_get_from_squad intro_falcon_02 0) "falcon_p_l1" TRUE)
	;(ai_vehicle_reserve_seat (ai_vehicle_get_from_squad intro_falcon_02 0) "falcon_p_r2" TRUE)
	;(ai_vehicle_reserve_seat (ai_vehicle_get_from_squad intro_falcon_02 0) "falcon_p_l2" TRUE)
	;(ai_vehicle_reserve_seat (ai_vehicle_get_from_squad intro_falcon_02 0) "falcon_p_bench" TRUE)
	
	(f_set_falcon_interaction_false (ai_vehicle_get_from_squad intro_falcon_02 0))
	
	;(vehicle_unload (ai_vehicle_get_from_squad intro_falcon_02 0) "falcon_p_r1")
	;(sleep 7)
	;jorge
	;(vehicle_unload (ai_vehicle_get_from_squad intro_falcon_02 0) "falcon_p_l1")
	;(vehicle_unload (ai_vehicle_get_from_squad intro_falcon_02 0) "falcon_p_r2")
	;(vehicle_unload (ai_vehicle_get_from_squad intro_falcon_02 0) "falcon_p_l2")
	;(sleep 7)
	;(vehicle_unload (ai_vehicle_get_from_squad intro_falcon_02 0) "falcon_p_bench")
	
	(unit_exit_vehicle player2)
	(unit_raise_weapon player2 30)
	(sleep 7)
	(unit_exit_vehicle player3)
	(unit_raise_weapon player3 30)
	
	(set g_1stbowl_obj_control 2)	
)


(script static void (f_set_falcon_interaction_false (vehicle v))
	(vehicle_set_player_interaction v "falcon_d" FALSE FALSE)
	(vehicle_set_player_interaction v "falcon_p_r1" FALSE FALSE)
	(vehicle_set_player_interaction v "falcon_p_l1" FALSE FALSE)
	(vehicle_set_player_interaction v "falcon_p_r2" FALSE FALSE)
	(vehicle_set_player_interaction v "falcon_p_l2" FALSE FALSE)
	(vehicle_set_player_interaction v "falcon_p_bench" FALSE FALSE)
)


(script dormant spartan_alert_start
	(sleep_until (unit_in_vehicle spartan_carter))
	(print "setting stances")
	
	(unit_set_stance group_spartans alert)
	
	;(sleep 1200)
	
	(sleep_until
		(or
			(>= (ai_combat_status group_spartans) 4)
			(> (object_get_recent_shield_damage (ai_get_object spartan_carter)) 0)
			(> (object_get_recent_shield_damage (ai_get_object spartan_kat)) 0)
			(> (object_get_recent_shield_damage (ai_get_object spartan_emile)) 0)
			(> (object_get_recent_shield_damage (ai_get_object spartan_jorge)) 0)
			(> (object_get_recent_body_damage (ai_get_object spartan_carter)) 0)
			(> (object_get_recent_body_damage (ai_get_object spartan_kat)) 0)
			(> (object_get_recent_body_damage (ai_get_object spartan_emile)) 0)
			(> (object_get_recent_body_damage (ai_get_object spartan_jorge)) 0)
		)
	1)

	(unit_set_stance group_spartans "")
	
)

; =================================================================================================
; HOTKEY SCRIPTS
; =================================================================================================
(script static void 1
	(if ai_render_sector_bsps
		(set ai_render_sector_bsps 0)
		(set ai_render_sector_bsps 1)
	)
)

(script static void 2
	(if ai_render_objectives
		(set ai_render_objectives 0)
		(set ai_render_objectives 1)
	)
)

(script static void 3
	(if ai_render_decisions
		(set ai_render_decisions 0)
		(set ai_render_decisions 1)
	)
)

(script static void 4
	(if ai_render_command_scripts
		(set ai_render_command_scripts 0)
		(set ai_render_command_scripts 1)
	)
)

(script static void 5
	(if debug_performances
		(set debug_performances 0)
		(set debug_performances 1)
	)
)

(script static void 6
	(if debug_instanced_geometry_cookie_cutters
		(set debug_instanced_geometry_cookie_cutters 0)
		(set debug_instanced_geometry_cookie_cutters 1)
	)
)
