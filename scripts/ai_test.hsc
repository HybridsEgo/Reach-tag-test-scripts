;*********************************************************************;
;Main Script
;*********************************************************************;
(script startup ai_test	
	(print "ai_test go!")
	
	(ai_allegiance human player)
	(ai_allegiance player human)
)

(script command_script sleep_cs
	(sleep_forever)
)

; =================================================================================================
; SPARTANS SCRIPTS
; =================================================================================================
(script dormant spartans_start
	(print "spartans")
	(ai_place spartan_carter)
	(ai_place spartan_kat)
	(ai_place spartan_jorge)
	
	(ai_cannot_die gr_spartans TRUE)
	
	; Teleport
	(object_teleport_to_ai_point (player0)  ps_teleports/spartan_test)
)

(script static void spartans
	(wake spartans_start)
)

(script static void test_spartan_action
	(ai_place spartan_carter)
	(thespian_performance_setup_and_begin vig_spartan_look "" 0)
)

(script static void cov
	(print "cov")
	(ai_place spartan_test_cov)
)


; =================================================================================================
; autoturret SCRIPTS
; =================================================================================================
(script static void autoturret_start
	(print "autoturret")
	(object_create auto_turrent)
	(object_hide auto_turrent TRUE)
	(vehicle_auto_turret auto_turrent tv_all 0 0 0)
)


; =================================================================================================
; BFG SCRIPTS
; =================================================================================================
(script startup hide_mac
	(object_hide sc_hud_mac TRUE)
)

(script static void test_mac
	;(vehicle_load_magic v_mac "" player0)
	;(objects_attach v_mac "" sc_hud_mac "")
	(f_hud_flash_object_fov sc_hud_mac)
	(f_blip_title v_mac "WP_CALLOUT_M10_VISEGRAD")
)


; =================================================================================================
; BUG:vig loop
; =================================================================================================
(global boolean g_loop_test FALSE)
(script static void test_vig_loop
	(ai_place spartan_kat)
	(thespian_performance_setup_and_begin vig_loop "" 0)
	(sleep 30)
	(print "setting g_loop_test TRUE")
	(set g_loop_test TRUE)
	(sleep_forever)
)

; =================================================================================================
; BUG:FLY_TO_FACE SCRIPTS
; =================================================================================================
(script static void fork_test
	(ai_place fork_bug)
)

(script command_script cs_fork02
	(cs_enable_pathfinding_failsafe TRUE)
	(cs_fly_to ps_bugs/fork02_goto01)
	(cs_fly_to_and_face ps_bugs/fork02_goto01 ps_bugs/fork02_face01)
	(sleep_forever)
)

; =================================================================================================
; BUG:PERSISTANCE
; =================================================================================================
(script static void test_recycle
	(ai_place sq_wraith)
	(unit_kill (ai_vehicle_get_from_squad sq_wraith 0))
	(object_set_persistent (ai_vehicle_get_from_squad sq_wraith 0) TRUE)
	(sleep 30)
	(sleep_until
		(begin
			(add_recycling_volume tv_recyle_test 0 0)
			FALSE
		)
	)
	
)


; =================================================================================================
; BUG: object scale in
; =================================================================================================
(script dormant scale_in
	(ai_place banshee)
	(object_set_scale (ai_vehicle_get_from_squad banshee 0) .01 0)
	(sleep 10)
	(object_set_scale (ai_vehicle_get_from_squad banshee 0) 1 60)
)

(script static void test_scale_in
	(wake scale_in)
)

; =================================================================================================
; banshee: loadup
; =================================================================================================
(script static void test_banshee
	(object_create v_banshee)
	(ai_place sq_elite)
	(ai_vehicle_enter sq_elite v_banshee "banshee_d")
)


; =================================================================================================
; falcon: loadup
; =================================================================================================
(script static void test_m10_start
	(object_create v_falcon02)
	(ai_place spartan_carter)
	(sleep 1)
	(ai_vehicle_reserve_seat v_falcon02 "falcon_d" TRUE)
	(ai_vehicle_enter_immediate spartan_carter v_falcon02 "falcon_p_bench")
	(vehicle_load_magic v_falcon02 "falcon_p_l1" player0)
)


; =================================================================================================
; falcon: loadup
; =================================================================================================
(script static void test
	(object_create v_falcon03)
	(vehicle_set_player_interaction v_falcon03 "falcon_d" FALSE FALSE)
	(vehicle_set_player_interaction v_falcon03 "falcon_p_l1" FALSE FALSE)
	(vehicle_set_player_interaction v_falcon03 "falcon_p_r1" FALSE FALSE)
	(vehicle_set_player_interaction v_falcon03 "falcon_p_l2" FALSE FALSE)
	(vehicle_set_player_interaction v_falcon03 "falcon_p_r2" FALSE FALSE)
)

(script static void test_falcon
	(object_create v_falcon)
	(ai_vehicle_reserve_seat v_falcon "falcon_d" TRUE)
	
	(ai_place spartan_carter)
	(ai_place spartan_kat)
	(ai_place spartan_jorge)
	(sleep 1)
	(wake falcon_load)
	
	(sleep_until (= (f_vehicle_rider_number v_falcon) 1) 1)
	(print "1")
	
	(sleep_until (= (f_vehicle_rider_number v_falcon) 2) 1)
	(print "2")
	
	(sleep_until (= (f_vehicle_rider_number v_falcon) 3) 1)
	(print "3")
)

(script dormant falcon_load
	(sleep 30)
	(ai_vehicle_enter spartan_carter v_falcon "falcon_p_r1")
	(sleep 30)
	(ai_vehicle_enter spartan_kat v_falcon "falcon_p_r2")
	(sleep 30)
	(ai_vehicle_enter spartan_jorge v_falcon "falcon_p_l1")
)

(script static void test_dealthless_falcon
	(object_create v_falcon)
	(object_cannot_die v_falcon TRUE)
)


; =================================================================================================
; DEATH SCRIPTS
; =================================================================================================
(script dormant death_start
	(sleep_until (> (player_count) 0) 1)
	(print "death test")
	(wake death_hud)
	(player_disable_movement FALSE)
	(set cheat_deathless_player 1)
	(wake cov_death_start)
	;(wake death_hud)
	(sleep_until (<= (unit_get_health (player0)) .01) 1)
	(print "dead")
	(sleep_forever death_hud)
	(set g_pleayer_dead TRUE)
	;(fade_out 1 1 1 0)
	(death_anim_start)
)

(script static void death_test
	(wake death_start)
)

(global boolean g_pleayer_dead FALSE)
(global short g_hudtime 15)
(script dormant death_hud
	(sleep_until (<= (unit_get_health (player0)) .9) 1)
	(print "fade1")
	(fade_out 1 1 1 g_hudtime)
	(sleep g_hudtime)
	(if (not g_pleayer_dead)
		(fade_in 1 1 1 g_hudtime)
	)
	(sleep g_hudtime)
	
	(sleep_until (<= (unit_get_health (player0)) .7) 1)
	(print "fade2")
	(fade_out 1 1 1 g_hudtime)
	(sleep g_hudtime)
	(if (not g_pleayer_dead)
		(fade_in 1 1 1 g_hudtime)
	)
	(sleep g_hudtime)
)



(script dormant cov_death_start
	(sleep_until
		(begin
			(sleep_until (<= (ai_living_count death_cov) 9) 5)
			(ai_place death_cov)
			(ai_place death_cov02)
			;(>= (ai_living_count death_spartan) 1)
			FALSE
		)
	)
)

(script static void death_anim_start
	;(cinematic_enter "snap_to_white" FALSE)
	(sleep 60)
	;(cinematic_fade_to_white)
	;(cinematic_enter "snap_to_white" FALSE)
	(ai_place death_spartan)
	;(ai_disregard (ai_get_object death_spartan) TRUE)
	;(ai_place death_elites)
	;(ai_erase airstrike_cov)
	;(cs_run_command_script airstrike_cov cs_death_ai)
	(thespian_performance_setup_and_begin vig_death "" 0)
	
	(camera_set_field_of_view 60 0)
	(camera_set cam01 0)
	(fade_in 1 1 1 30)
	(sleep 300)
	;(cinematic_exit "snap_from_white" FALSE)
	(map_reset)
)

(script command_script cs_death_ai
	(cs_enable_moving TRUE)
	(cs_enable_moving TRUE)
	(sleep_forever)
)

; =================================================================================================
; BUG:phantom boost
; =================================================================================================
(script dormant phantom_boost_start
	(ai_place sq_phatom)
	;(sleep 1)
	(cs_run_command_script sq_phatom cs_phantom_boost)
)

(script command_script cs_phantom_boost
	;(cs_vehicle_boost TRUE) 
	(cs_fly_by ps_bugs/fork02_goto01)
	(cs_fly_by ps_bugs/fork02_face01)
	
)

; =================================================================================================
; BUG:deathless
; =================================================================================================
(script dormant deathless_start
	(f_ai_place_vehicle_deathless sq_falcon)
	;(object_cannot_take_damage (ai_vehicle_get_from_squad sq_falcon 0))
)

(script static void test_deathless
	(wake deathless_start)
)


; =================================================================================================
; BUG:banshee shoot
; =================================================================================================
(script dormant banshee_shoot_start
	(ai_place banshee)
	;(sleep 1)
	(cs_run_command_script banshee cs_banshee_bomb)
)

(script command_script cs_banshee_bomb
	(sleep 90)
	;(cs_enable_looking TRUE)
	(cs_shoot_secondary_trigger TRUE)
	(cs_shoot_point TRUE ps_bugs/shoot)
	;(cs_enable_moving TRUE)
	(sleep_forever)
)

(script static void test_banshee_shoot
	(wake banshee_shoot_start)
)

; =================================================================================================
; BUG:Queue cs SCRIPTS
; =================================================================================================
(script static void queue_test
	(ai_place grunt01)
)

(script command_script cs_grunt01
	(print "cs0")
	(sleep 30)
	(cs_queue_command_script ai_current_actor cs_grunt01_queue)
	(sleep 30)
	(print "cs1")
)

(script command_script cs_grunt01_queue
	(print "csq0")
  (sleep 60)
	(print "csq1")
)


; =================================================================================================
; Combat dialog
; =================================================================================================
(script dormant combat_dialog_start
	(ai_place spartan_carter)
	(ai_place spartan_kat)
	(ai_place spartan_jorge)
	
	(wake airstrike_start)
	
	; Teleport
	(object_teleport_to_ai_point (player0)  ps_teleports/combat_dialog)
)

(script static void test_combat_dialog
	(wake combat_dialog_start)
)

; =================================================================================================
; STORY object SCRIPTS
; =================================================================================================
(script dormant story_object_start
	(print "story object")

)


; =================================================================================================
; STORY object SCRIPTS
; =================================================================================================
(script dormant gauss_start
	(print "story object")
	(ai_place sq_gauss)
	(wake airstrike_start)
	(wake airstrike_wraiths_start)
	(wake airstrike_ghosts_start)
	(game_save_immediate)
	
)

(script static void test_gauss
	(wake gauss_start)
)


; =================================================================================================
; MISC SCRIPTS
; =================================================================================================
(script dormant ai_test02
	(print "go!")
	(wake ct_activate_nav)
	(wake cov_start)
	(wake aa_switch_start)
			
	(sleep_until g_aa_repaired)
	(print "AA repaired")
	(aa_turret_fire_go)
)

(script dormant cov_start
	(sleep_until
		(begin
			(ai_place sq_cov01)
			(sleep 100)
			(sleep_until (<= (ai_living_count obj_covenant) 2))
			g_aa_repaired))
)

(script dormant place_falcon
	(object_create sc_falcon)
	(sleep 120)
	(object_destroy sc_falcon)
)

(script command_script cs_fork
	(f_load_fork_cargo (ai_vehicle_get ai_current_actor) "small" ghost ghost02 none)
	(sleep 90)
	(f_unload_fork_cargo (ai_vehicle_get ai_current_actor) "small02")
)

; =================================================================================================
; WRAITH SCRIPTS
; =================================================================================================
(script static void test_wraith
	(ai_place airstrike_wraiths)
)

; =================================================================================================
; AIRSTRIKE SCRIPTS
; =================================================================================================
(script dormant test_airstrike
	(wake airstrike_start)
	(wake airstrike_wraiths_start)
	;(wake give_equipment_start)
)

(script dormant airstrike_start
	(sleep_until (> (player_count) 0) 1)
	(sleep_until
		(begin
			(sleep_until (<= (ai_living_count airstrike_cov) 5) 5)
			(ai_place airstrike_cov)
			FALSE
		)
	)
)

(script dormant airstrike_ghosts_start
	(sleep_until (> (player_count) 0) 1)
	(sleep_until
		(begin
			(sleep_until (<= (ai_living_count airstrike_ghosts) 1) 5)
			(ai_place airstrike_ghosts)
			FALSE
		)
	)
)

(script dormant airstrike_wraiths_start
	(sleep_until (> (player_count) 0) 1)
	(sleep_until
		(begin
			(sleep_until (<= (ai_living_count airstrike_wraiths) 0) 5)
			(sleep 60)
			(ai_place airstrike_wraiths)
			FALSE
		)
	)
)

(script dormant give_equipment_start
	(sleep_until
		(begin
			(sleep_until (> (player_count) 0) 1)
			(sleep_until (<= (unit_get_total_grenade_count (player0)) 0) 1)
			(print "airstrike used")
			(airstrike_effect_start)
			;(sleep (* 30 5))
			(unit_add_equipment (player0) add_grenade TRUE TRUE)
			(print "adding airstrike")
			FALSE
		)
	)
)

(script static void airstrike_effect_start
	(print "airstrike_called")
	(sleep (* 30 2))
	(sound_impulse_start sound\dialog\levels\m10\mission\robot\m10_0100_emi NONE 1)
	(sound_impulse_start sound\device_machines\040vc_longsword\start NONE 1)
	(sleep (* 30 3))
	(print "spawning longsword")
	(object_create dm_ls01)
	(f_ls_flyby dm_ls01)
	(print "airstrike_done")
	(sleep (* 30 2))
)

(script static void (f_ls_flyby (device d))
	(device_animate_position d 0 0.0 0.0 0.0 TRUE)
	(device_set_position_immediate d 0)
	(device_set_power d 0)
	(sleep 1)
	(device_set_position_track d device:position 0)
	(device_animate_position d 0.5 7.0 0.1 0.1 TRUE)
)


; =================================================================================================
; HUD TEST SCRIPTS
; =================================================================================================
(global short hud_flash_blip_total 5)
(global short hud_flash_blip_count 0)
(global short hud_flash_fast 2)
(global short hud_flash_slow 2)
(global short hud_flash_final 30)

(script static void (hud_flash_blip_single (object_name hud_object))
	(object_create hud_object)
	(set chud_debug_highlight_object hud_object)
	(sound_impulse_start sound\game_sfx\ui\transition_beeps NONE 1)
	(sleep hud_flash_fast)
	(object_destroy hud_object)
	(sleep hud_flash_slow)
)



(script static void (hud_flash_blip_object (object_name hud_object))
	(set chud_debug_highlight_object_color_red 1)
	(set chud_debug_highlight_object_color_green 1)
	(set chud_debug_highlight_object_color_blue 0)


	(sleep_until
		(begin
			(hud_flash_blip_single hud_object)
			(set hud_flash_blip_count (+ 1 hud_flash_blip_count))
			(>= hud_flash_blip_count hud_flash_blip_total)
		)
	1)
	
	(set hud_flash_blip_count 0)
)

(script static void test_hud
	(hud_flash_blip_object sc_hud_test)
	
	(sleep 30)
)

; =================================================================================================
; AA TURRET SCRIPTS
; =================================================================================================
(global boolean aa_kat_is_repairing FALSE)
(global short aa_repair_time_seconds 45)
(global short aa_repair_time_1st_complete 35)
(global short aa_repair_time_2nd_complete 20)
(script dormant aa_switch_countdown_start
	(sleep_until
		(begin
			(sleep_until aa_kat_is_repairing)
			(set aa_repair_time_seconds (- aa_repair_time_seconds 1))
			(<= aa_repair_time_seconds 0)
		))
	(print "setting aa_repaired")
	(set g_aa_repaired TRUE)
	(ct_objective_complete_go)
)

(script dormant aa_switch_start
	(sleep_until (>= (device_get_position control_aa_button) 1) 5)
	(wake aa_switch_countdown_start)
	(wake place_falcon)
	(ai_place spartan)
	(ai_cannot_die spartan TRUE)
	
	(sleep_until
		(begin
			(cs_run_command_script spartan cs_kat_repair)
			(sleep_until 
				(or
					g_aa_repaired
					(not (cs_command_script_running spartan cs_kat_repair))
				))
			
			(hud_unmark_object (ai_get_object spartan))
			(object_destroy fx_rapair01)
			(object_destroy fx_rapair02)
			(object_destroy fx_rapair03)
			(set aa_kat_is_repairing FALSE)
			(print "aa_repaired OR cs broken")
			
			(if (not g_aa_repaired)
				(begin
					(if (>= aa_repair_time_seconds aa_repair_time_1st_complete)
						(sleep_until (not (volume_test_objects tv_aa_perimeter01 (ai_actors sq_cov01))) 5))
						(begin
							(if (>= aa_repair_time_seconds aa_repair_time_2nd_complete)
								(sleep_until (not (volume_test_objects tv_aa_perimeter02 (ai_actors sq_cov01))) 5)
								(sleep_until (not (volume_test_objects tv_aa_perimeter03 (ai_actors sq_cov01))) 5)
							))
				))

			g_aa_repaired))

		
		(hud_unmark_object (ai_get_object spartan))
		(cs_run_command_script spartan cs_abort)
)
			
(global boolean g_aa_repaired FALSE)
(script command_script cs_kat_repair
	(cs_abort_on_damage TRUE)
	(cs_enable_pathfinding_failsafe TRUE)
	(print "repairing AA sir... cover me")
	(if (>= aa_repair_time_seconds aa_repair_time_1st_complete)
		(begin
			(cs_go_to_and_face ps_aa/kat_goto01 ps_aa/kat_face01)
			(set aa_kat_is_repairing TRUE)
			(object_create fx_rapair01)
			(cs_custom_animation_loop objects\characters\spartans\spartans "m20_spartan:repair" TRUE)
			(hud_mark_object_forever (ai_get_object ai_current_actor))
			(sleep_until (< aa_repair_time_seconds aa_repair_time_1st_complete))
			(print "we're making progress... keep me covered")
			(object_destroy fx_rapair01)
			(cs_run_command_script ai_current_actor cs_kat_repair)))
	
	(if (>= aa_repair_time_seconds aa_repair_time_2nd_complete)
		(begin
			(cs_go_to_and_face ps_aa/kat_goto02 ps_aa/kat_face02)
			(set aa_kat_is_repairing TRUE)
			(object_create fx_rapair02)
			(cs_custom_animation_loop objects\characters\spartans\spartans "m20_spartan:repair" TRUE)
			(hud_mark_object_forever (ai_get_object ai_current_actor))
			(sleep_until (< aa_repair_time_seconds aa_repair_time_2nd_complete))
			(print "ok almost there")
			(object_destroy fx_rapair02)
			(cs_run_command_script ai_current_actor cs_kat_repair)))
	
	(cs_go_to_and_face ps_aa/kat_goto03 ps_aa/kat_face03)
	(set aa_kat_is_repairing TRUE)
	(object_create fx_rapair03)
	(cs_custom_animation_loop objects\characters\spartans\spartans "m20_spartan:repair" TRUE)
	(hud_mark_object_forever (ai_get_object ai_current_actor))
	(sleep_until (< aa_repair_time_seconds 0))
	(object_destroy fx_rapair03)
)

(script dormant repairing_transmission_pulse
	(if aa_kat_is_repairing (cinematic_set_title ct_aa_repairing))
	(sleep 30)
)

(script static void aa_turret_fire_go
	(object_destroy sc_aa_gun)
	(ai_place aa_gun02)
	(ai_place aa_gun_driver)
	
	(object_cannot_take_damage (ai_vehicle_get_from_starting_location aa_gun02/driver01))
	(ai_cannot_die aa_gun_driver TRUE)
	(ai_vehicle_enter_immediate aa_gun_driver/driver01 (ai_vehicle_get_from_starting_location aa_gun02/driver01) "warthog_g")
	
	(ai_place banshee)
	(ai_place phantom)
	(ai_set_targeting_group banshee 1)
	(ai_set_targeting_group phantom 1)
	(ai_set_targeting_group aa_gun_driver 1)
)

(script command_script cs_turret
	(cs_shoot_point TRUE ps_aa/aa_shootat01)
	(sleep_forever)
)


; =================================================================================================
; AMBIENT HELPER SCRIPTS
; =================================================================================================
(script command_script cs_abort
	(sleep 1)
)

(global short objective_flash_time 15)
(script static void ct_objective_complete_go
	(sleep objective_flash_time)
	(sound_impulse_start sound\game_sfx\ui\transition_beeps NONE 1)
	(cinematic_set_title ct_objective_complete)
	(sleep objective_flash_time)
	(sound_impulse_start sound\game_sfx\ui\transition_beeps NONE 1)
	(cinematic_set_title ct_objective_complete)
	(sleep objective_flash_time)
	(sound_impulse_start sound\game_sfx\ui\transition_beeps NONE 1)
	(cinematic_set_title ct_objective_complete)
	(sleep objective_flash_time)
	(sound_impulse_start sound\game_sfx\ui\transition_beeps NONE 1)
	(cinematic_set_title ct_objective_complete)
)

(script dormant ct_activate_nav
	(sound_impulse_start sound\game_sfx\ui\powerup_invis NONE 1)
	(cinematic_set_title ct_activate_nav_beacon)
)


; BLIP STUPIDITY
(global boolean g_object_marking_active 0)
(global short g_current_mark_blip_count 0)
(global sound g_mark_sound "sound\game_sfx\ui\transition_beeps")

(script static void (hud_mark (object obj) (short final_delay))
	(sleep_until (not g_object_marking_active) 1)
	(set g_object_marking_active 1)

	(blip obj 2 2)
	(blip obj 2 2)
	(blip obj final_delay 2)
	
	(set g_object_marking_active 0)
)

(script static void (hud_mark_object_forever (object obj))
		(begin
			(blip obj 2 2)
			(blip obj 2 2)
			(chud_track_object obj 1)
			(sound_impulse_start g_mark_sound NONE 1)))
			
(script static void (hud_unmark_object (object obj))
	(chud_track_object obj 0))

(script static void (blip (object obj) (short icon_disappear_time) (short final_delay))
	(chud_track_object obj 1)
	(sound_impulse_start g_mark_sound NONE 1)
	(sleep icon_disappear_time)
	(chud_track_object obj 0)
	(sleep final_delay)
)


; =================================================================================================
; sapien HELPER SCRIPTS
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