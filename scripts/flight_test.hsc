; -------------------------------------------------------------------------------------------------
; GLOBALS
; -------------------------------------------------------------------------------------------------
(global boolean demo_mode false)
; -------------------------------------------------------------------------------------------------

(script startup flight_test
	(print "::: welcome to flight_test :::")
	
	(ai_allegiance player human)	
	(player_disable_movement false)
	(if demo_mode 
		(begin
			(fade_out 0 0 0 0)
			(countdown)
			(demo)
		)
	)
	
)

(script static void dogfight
	(print "starting dogfight")
)

(script static void aa
	(print "spawning aa")
	(ai_erase wafer_aa)
	(ai_place wafer_aa)
)

(script static void seraph
	(print "spawning single seraph")
	(ai_place sq_seraph)
)

(script static void banshee
	(print "spawning single space banshee")
	(ai_place sq_banshee)
)

(script static void seraphs
	(print "spawning seraph squadron")
	(ai_place sq_seraphs)
)

(script static void sabre
	(print "spawning single sabre")
	(ai_place sq_sabre)
)

(script static void sabres
	(print "spawning sabre squadron")
	(ai_place sq_sabres)
)

(script static void fly
	(object_destroy player_sabre)
	(object_create player_sabre)
	(vehicle_load_magic player_sabre "warthog_d" (player0))
)

(script static void fly_seraph
	(object_destroy player_seraph)
	(object_create player_seraph)
	(vehicle_load_magic player_seraph "" (player0))
)

(script static void fly_banshee
	(object_destroy player_banshee)
	(object_create player_banshee)
	(vehicle_load_magic player_banshee "" (player0))
)

(script static void fly_demo
	(object_destroy demo_sabre)
	(object_create demo_sabre)
	(vehicle_load_magic demo_sabre "warthog_d" (player0))
)

; -------------------------------------------------------------------------------------------------
(global short s_pod_time 			450)
(global short s_pod_count 			10)
(global short s_pod_drop_interval	10)
; -------------------------------------------------------------------------------------------------
(script static void fx_pod_test
	(sleep_until
		(begin
			(object_create_folder pods)
			(sleep 1)
			
			(device_set_position_track dm_pod_00 "m45_pod_drop" 0)
			(sleep s_pod_drop_interval)
			(device_set_position_track dm_pod_01 "m45_pod_drop" 0)
			(sleep s_pod_drop_interval)
			(device_set_position_track dm_pod_02 "m45_pod_drop" 0)
			(sleep s_pod_drop_interval)
			(device_set_position_track dm_pod_03 "m45_pod_drop" 0)
			(sleep s_pod_drop_interval)
			(device_set_position_track dm_pod_04 "m45_pod_drop" 0)
			(sleep s_pod_drop_interval)
			(device_set_position_track dm_pod_05 "m45_pod_drop" 0)
			(sleep s_pod_drop_interval)
			(device_set_position_track dm_pod_06 "m45_pod_drop" 0)
			(sleep s_pod_drop_interval)
			(device_set_position_track dm_pod_07 "m45_pod_drop" 0)
			(sleep s_pod_drop_interval)
			(device_set_position_track dm_pod_08 "m45_pod_drop" 0)
			(sleep s_pod_drop_interval)
			(device_set_position_track dm_pod_09 "m45_pod_drop" 0)
			(sleep s_pod_drop_interval)
			
			
			(sleep (+ (- s_pod_time (* s_pod_drop_interval s_pod_count)) -1))
			
			(object_destroy dm_pod_00)
			(sleep s_pod_drop_interval)
			(object_destroy dm_pod_01)
			(sleep s_pod_drop_interval)
			(object_destroy dm_pod_02)
			(sleep s_pod_drop_interval)
			(object_destroy dm_pod_03)
			(sleep s_pod_drop_interval)
			(object_destroy dm_pod_04)
			(sleep s_pod_drop_interval)
			(object_destroy dm_pod_05)
			(sleep s_pod_drop_interval)
			(object_destroy dm_pod_06)
			(sleep s_pod_drop_interval)
			(object_destroy dm_pod_07)
			(sleep s_pod_drop_interval)
			(object_destroy dm_pod_08)
			(sleep s_pod_drop_interval)
			(object_destroy dm_pod_09)			
		0)
	1)
)

(script static void fx_debris
	(print "spawning space debris...")
	(object_create sc_debris_00)
	(sleep (random_range 90 180))
	(object_create sc_debris_01)
	(sleep (random_range 60 180))
	(object_create sc_debris_02)
	(sleep (random_range 60 180))
	(object_create sc_debris_03)
	(sleep (random_range 60 180))
	(object_create sc_debris_04)
	(sleep (random_range 60 180))
	(object_create sc_debris_05)
	(sleep (random_range 60 180))
)

(script static void fx_warp_seraph
	(print "looping fx for seraph...")
	(sleep_until
		(begin
			(warp_in_fx sq_fx_seraph/seraph0 ps_seraph_warp/warp0 objects\vehicles\covenant\seraph\fx\warp\warp.effect)
			(sleep 90)
			(ai_erase sq_fx_seraph)
		0)
	1)
)


; -------------------------------------------------------------------------------------------------
; UNIT TESTS
; -------------------------------------------------------------------------------------------------
(script static void command_script_test
	(sleep_until
		(begin
			(print "placing seraph on a command script...")
			(ai_place sq_seraph_cs_test/detailed)
			(sleep 1)
			(sleep_until (<= (ai_living_count sq_seraph_cs_test) 0) 1)
		false)
	)	
)

(script static void command_script_test_fast
	(sleep_until
		(begin
			(print "placing seraph on a command script...")
			(ai_place sq_seraph_cs_test/fast)
			(sleep 1)
			(sleep_until (<= (ai_living_count sq_seraph_cs_test) 0) 1)
		false)
	)	
)

(script command_script cs_command_script_test
	(cs_enable_pathfinding_failsafe true)
	
	(cs_vehicle_speed 0.5)
	(cs_fly_by ps_cs_test/p0)
	
	(cs_vehicle_speed 1)
	(cs_fly_by ps_cs_test/p1)
	
	(cs_vehicle_speed 0.3)
	(cs_fly_by ps_cs_test/p2)
	
	(cs_vehicle_speed 1)
	(cs_fly_by ps_cs_test/p3)
	
	(cs_vehicle_speed 0.5)
	(cs_fly_by ps_cs_test/p0)
	
	(object_destroy (ai_vehicle_get ai_current_actor))
)

(script command_script cs_command_script_test_fast
	(cs_enable_pathfinding_failsafe true)
	
	(cs_vehicle_speed 0.5)
	(cs_fly_by ps_cs_test/p0)
	
	(cs_vehicle_speed 1)
	(cs_fly_by ps_cs_test/p1)
	
	(object_destroy (ai_vehicle_get ai_current_actor))
)

; -------------------------------------------------------------------------------------------------
(global boolean b_warp_in_progress false)
; -------------------------------------------------------------------------------------------------
; BOMBERS
; -------------------------------------------------------------------------------------------------
(global short s_bomber_release_time (* 30 17))
(global short s_bomber_warpout_time (* 30 7))

(script dormant dogfight_bombers
	(sleep (random_range (* 30 10) (* 30 15)))
	(sleep_until
		(begin
			(sleep_until (not b_warp_in_progress))
			(set b_warp_in_progress true)
			(f_blip_flag fl_bomber_signature blip_recon)
			(snd_play sfx_blip_radar)
			(cinematic_set_title ct_bombers)
			(sleep (random_range (* 30 4) (* 30 6)))
			(ai_place sq_bombers)
			(f_unblip_flag fl_bomber_signature)
			(set b_warp_in_progress false)
			(sleep (random_range (* 30 40) (* 30 120)))
		false)
	1)
)

(script command_script cs_bomber0
	(object_set_velocity (ai_vehicle_get ai_current_actor) 1000)
	(effect_new_on_object_marker fx\test\chad\plasma_fireball_test (ai_vehicle_get ai_current_actor) "driver")
	(sound_impulse_start sound\levels\030_outskirts\sound_scenery\cap_ship_flyover (ai_vehicle_get ai_current_actor) 1.0)
	(cs_enable_looking 0)
	(cs_enable_targeting 0)
	
	(sleep s_bomber_release_time)
	(sleep (random_range 0 20))
	(cs_shoot_point true ps_bombers/target0)
	(sleep 30)
	(cs_shoot_point false ps_bombers/target0)
	;(cs_fly_by ps_bombers/warpout0)
	(sleep s_bomber_warpout_time)
	(sleep (random_range 0 60))
	(effect_new_on_object_marker fx\test\chad\plasma_fireball_test (ai_vehicle_get ai_current_actor) "driver")
	(object_set_velocity (ai_vehicle_get ai_current_actor) 1000)
	(sleep 15)
	(object_destroy (ai_vehicle_get ai_current_actor))
	;(cs_fly_by ps_bombers/align0)
	;(cs_fly_by ps_bombers/firing_position0)
)

(script command_script cs_bomber1

	(object_set_velocity (ai_vehicle_get ai_current_actor) 1000)
	(effect_new_on_object_marker fx\test\chad\plasma_fireball_test (ai_vehicle_get ai_current_actor) "driver")
	(sound_impulse_start sound\levels\030_outskirts\sound_scenery\cap_ship_flyover (ai_vehicle_get ai_current_actor) 1.0)
	(cs_enable_looking 0)
	(cs_enable_targeting 0)
	
	(sleep s_bomber_release_time)
	(sleep (random_range 0 20))
	(cs_shoot_point true ps_bombers/target1)
	(sleep 30)
	(cs_shoot_point false ps_bombers/target1)
	;(cs_fly_by ps_bombers/warpout1)
	(sleep s_bomber_warpout_time)
	(sleep (random_range 0 60))
	(effect_new_on_object_marker fx\test\chad\plasma_fireball_test (ai_vehicle_get ai_current_actor) "driver")
	(object_set_velocity (ai_vehicle_get ai_current_actor) 1000)
	(sleep 15)
	(object_destroy (ai_vehicle_get ai_current_actor))
	;(cs_fly_by ps_bombers/align0)
	;(cs_fly_by ps_bombers/firing_position0)
)

(script command_script cs_bomber2
	(object_set_velocity (ai_vehicle_get ai_current_actor) 1000)
	(effect_new_on_object_marker fx\test\chad\plasma_fireball_test (ai_vehicle_get ai_current_actor) "driver")
	(sound_impulse_start sound\levels\030_outskirts\sound_scenery\cap_ship_flyover (ai_vehicle_get ai_current_actor) 1.0)
	(cs_enable_looking 0)
	(cs_enable_targeting 0)
	
	(sleep s_bomber_release_time)
	(sleep (random_range 0 20))
	(cs_shoot_point true ps_bombers/target2)
	(sleep 30)
	(cs_shoot_point false ps_bombers/target2)
	;(cs_fly_to ps_bombers/warpout2)
	(sleep s_bomber_warpout_time)
	(sleep (random_range 0 60))
	(effect_new_on_object_marker fx\test\chad\plasma_fireball_test (ai_vehicle_get ai_current_actor) "driver")
	(object_set_velocity (ai_vehicle_get ai_current_actor) 1000)
	(sleep 15)
	;(effect_new fx\test\chad\plasma_fireball_test p)
	(object_destroy (ai_vehicle_get ai_current_actor))
	;(cs_fly_by ps_bombers/align0)
	;(cs_fly_by ps_bombers/firing_position0)
)

; -------------------------------------------------------------------------------------------------

(script static void music
	(sound_looping_start sound\music\temp_music_reach\heroic\new1b_hi\new1b_hi.sound_looping NONE 1)
)

(script static void stop_music
	(sound_looping_stop sound\music\temp_music_reach\heroic\new1b_hi\new1b_hi.sound_looping)
)

(global effect fx_warp_flash objects\vehicles\covenant\seraph\fx\warp\warp.effect)
(script static void (warp_in_fx (ai enemy) (point_reference p) (effect fx))
	(effect_new_on_object_marker fx_warp_flash (ai_vehicle_get enemy) "ai_antenna_center")
	(ai_place enemy)
	(object_set_velocity (ai_vehicle_get enemy) 1000)
	;(sound_impulse_start sound\levels\030_outskirts\sound_scenery\cap_ship_flyover (ai_vehicle_get enemy) 1.0)

)

(script static void (warp_in (ai enemy) (point_reference p))
	(effect_new_on_object_marker fx_warp_flash (ai_vehicle_get enemy) "ai_antenna_center")
	(ai_place enemy)
	(object_set_velocity (ai_vehicle_get enemy) 1000)
	;(sleep 1)
	;(sound_impulse_start sound\levels\030_outskirts\sound_scenery\cap_ship_flyover (ai_vehicle_get enemy) 1.0)
)

(script static void (warp_in_phantom (ai enemy) (point_reference p))
	(effect_new_on_object_marker fx_warp_flash (ai_vehicle_get enemy) "ai_antenna_center")
	(ai_place enemy)
	(object_set_velocity (ai_vehicle_get enemy) 50)
	;(sleep 1)
	;(sound_impulse_start sound\levels\030_outskirts\sound_scenery\cap_ship_flyover (ai_vehicle_get enemy) 1.0)
)

(script static void warp_demo_seraphs
	(begin_random
		(begin
			(warp_in sq_demo_seraphs/seraph0 ps_seraph_warp/warp0)
			(sleep (random_range 5 12))
		)
		
		(begin
			(warp_in sq_demo_seraphs/seraph1 ps_seraph_warp/warp1)
			(sleep (random_range 5 12))
		)
		
		(begin
			(warp_in sq_demo_seraphs/seraph2 ps_seraph_warp/warp2)
			(sleep (random_range 5 12))
		)
		
		(begin
			(warp_in sq_demo_seraphs/seraph3 ps_seraph_warp/warp3)
			(sleep (random_range 5 12))
		)
	)
)

(script static void warp_demo_banshees
	(begin_random
		(begin
			(warp_in sq_demo_banshees/banshee0 ps_seraph_warp/warp0)
			(sleep (random_range 5 12))
		)
		
		(begin
			(warp_in sq_demo_banshees/banshee1 ps_seraph_warp/warp1)
			(sleep (random_range 5 12))
		)
		
		(begin
			(warp_in sq_demo_banshees/banshee2 ps_seraph_warp/warp2)
			(sleep (random_range 5 12))
		)
		
		(begin
			(warp_in sq_demo_banshees/banshee3 ps_seraph_warp/warp3)
			(sleep (random_range 5 12))
		)
	)
)

(script static void warp_demo_phantoms
	(warp_in_phantom sq_demo_phantom0/pilot ps_phantom_warp/warp0)
	(sleep (random_range 0 10))
	(warp_in_phantom sq_demo_phantom1/pilot ps_phantom_warp/warp1)
	(sleep (random_range 0 10))
	(warp_in_phantom sq_demo_phantom2/pilot ps_phantom_warp/warp2)
	(sleep (random_range 0 10))
)

(script static void test_kung_fu
	(print "testing kungfu: only one fighter should attack the player...")
	(ai_place sq_wafer_banshee_04)
	(ai_place sq_wafer_banshee_04)
	(ai_place sq_wafer_banshee_04)
	(ai_place sq_wafer_banshee_04)
)

(global short s_min_phantoms 0)
(script dormant dogfight_phantoms
	(sleep_until
		(begin
			;(sleep_until (not b_warp_in_progress))
			;(set b_warp_in_progress true)
			(sleep_until (<= (ai_living_count gr_phantoms) s_min_phantoms))
			
			; play victory chatter
			(set b_can_play_victory_chatter true)
			
			(f_blip_flag fl_phantom_signature blip_recon)
			(snd_play sfx_blip_radar)
			(cinematic_set_title ct_sublight)
			(sleep (random_range (* 30 4) (* 30 6)))
			
			(warp_demo_phantoms)
			(wake md_opening_up)
			(f_unblip_flag fl_phantom_signature)
			(sleep (random_range 60	120))
			(sleep 1)
		false)
	1)
)

(global short s_min_fighters 4)
(global boolean b_banshees false)
(script dormant dogfight_squadron
	(set b_banshees true)
	(sleep_until
		(begin
			(sleep_until (not b_warp_in_progress))
			(set b_warp_in_progress true)
			(sleep_until (<= (ai_living_count gr_fighters) s_min_fighters))
			
			; play victory chatter
			(set b_can_play_victory_chatter true)
			
			(f_blip_flag fl_warp_signature blip_recon)
			(snd_play sfx_blip_radar)
			(cinematic_set_title ct_sublight)
			(sleep (random_range (* 30 4) (* 30 6)))
			
			(if b_banshees
				(warp_demo_banshees)
				(warp_demo_seraphs))
				
			(wake md_opening_up)
			(f_unblip_flag fl_warp_signature)
			(sleep (random_range 60	120))
			(set b_warp_in_progress false)
			(set b_banshees false)
			(sleep 1)
		false)
	1)
)

(script dormant md_opening_up
	(print "opening up...")
	
	(aa)
	(sleep (random_range 30 60))
	(md_play 20 sfx_hostiles_engaging)
	(md_play 0 sfx_on_me)
	
	(sleep 90)
	
	(wake victory_chatter)
)
; -------------------------------------------------------------------------------------------------
; SOUNDS
; -------------------------------------------------------------------------------------------------
(global sound sfx_confirmed 			sound\prototype\control_tower_dialog\mission\010ma_120_car)
(global sound sfx_hostiles_engaging 	sound\prototype\control_tower_dialog\mission\010ma_130_car)
(global sound sfx_targets_down			sound\prototype\control_tower_dialog\mission\010ma_140_car)
(global sound sfx_roger					sound\prototype\control_tower_dialog\mission\010ma_150_car)
(global sound sfx_say_again				sound\prototype\control_tower_dialog\mission\010ma_160_car)
(global sound sfx_confirm				sound\prototype\control_tower_dialog\mission\010ma_170_car)
(global sound sfx_roger_echo			sound\prototype\control_tower_dialog\mission\010ma_180_car)
(global sound sfx_copy					sound\prototype\control_tower_dialog\mission\010ma_190_car)
(global sound sfx_copy_that_echo		sound\prototype\control_tower_dialog\mission\010ma_200_car)
(global sound sfx_copy_that				sound\prototype\control_tower_dialog\mission\010ma_210_car)
(global sound sfx_infrared_hostiles		sound\prototype\control_tower_dialog\mission\010ma_250_419)
(global sound sfx_lane					sound\prototype\control_tower_dialog\mission\010ma_270_419)
(global sound sfx_blip_radar			sound\game_sfx\fireteam\issue_directive)
(global sound sfx_perimeter_clear		sound\prototype\spartans\mission\200ma_170_car)
(global sound sfx_direction				sound\prototype\spartans\mission\200ma_220_car)
(global sound sfx_lets_move				sound\prototype\spartans\mission\200ma_030_car)
(global sound sfx_roger_actual			sound\prototype\spartans\mission\200ma_050_jun)
(global sound sfx_i_see_it				sound\prototype\spartans\mission\200ma_120_car)
(global sound sfx_on_me					sound\prototype\spartans\mission\200ma_070_car)
(global sound sfx_green_line			sound\prototype\spartans\mission\200ma_025_jun)
(global looping_sound sfx_chatter		sound\prototype\radio_chatter\radio_chatter_loop\radio_chatter_loop)

; -------------------------------------------------------------------------------------------------

(script static void demo
	(fade_out 0 0 0 0)
	(wake demo_wave_control)
	(music)
	(sleep (* 30 1))
	(snd_looping_play sfx_chatter)
	(sleep (* 30 5))
	(fly_demo)
	(ai_place sq_demo_sabres)
	(sleep 25)
	(fade_in 0 0 0 150)
	(cinematic_set_title ct_intro01)
	(cinematic_set_title ct_intro02)
)

; -------------------------------------------------------------------------------------------------
(global short s_pre_wave_radio_time 0)
(global short s_phase_1_seconds 90)
(global short s_phase_2_seconds 100)
; -------------------------------------------------------------------------------------------------
(script dormant demo_wave_control
	(sleep (- 666 307))
	(md_play 0 sfx_infrared_hostiles)
	(print "spawning waves")
	
	(wake dogfight_squadron)
	;(wake dogfight_bombers)
	
	(md_play 0 sfx_direction)
	(set b_move_to_engage true)
	(md_play 0 sfx_roger_actual)
	
	(sleep (* 30 s_phase_1_seconds))
	
	; phase 2
	

	(print "phase 2 -- phantoms and banshees")
	(set s_min_fighters 0)
	(wake dogfight_phantoms)
	(sleep (* 30 5))
	(snd_play sfx_lane)
	
	(set s_min_fighters 2)
	(set b_banshees true)
	(sleep (* 30 s_phase_2_seconds))
	(print "phase 3 -- outro")
	(stop_music)
	(set s_min_fighters 4)
	(set b_banshees false)
	(sleep (* 30 44))
	(fade_out 1 1 1 90)
	(sleep 90)
	(vehicle_unload demo_sabre "")
	(sleep 1)
	(object_teleport (player0) safety)
	(player_disable_movement true)
	(ai_erase_all)
	(sleep_forever dogfight_phantoms)
	(sleep_forever dogfight_squadron)
	
)

(global boolean b_move_to_engage false)
(script command_script cs_demo_sabre
	(cs_vehicle_speed 0.5)
	(sleep_until b_move_to_engage 1)
	(print "moving to engage")
	(sleep (random_range 0 30))
	(cs_vehicle_speed 1.0)
	(cs_fly_by ps_demo_sabres/engage 350.0)
	(print "sabres weapons free")
)

(global boolean b_can_play_victory_chatter false)
(script dormant victory_chatter
	(sleep_until
		(begin
			(begin_random
				(begin
					(sleep_until b_can_play_victory_chatter)
					(md_play 0 sfx_targets_down)
					(set b_can_play_victory_chatter false))
				
				(begin
					(sleep_until b_can_play_victory_chatter)
					(md_play 0 sfx_perimeter_clear)
					(md_play 0 sfx_copy_that)
					(set b_can_play_victory_chatter false))
				
				(begin
					(sleep_until b_can_play_victory_chatter)
					(md_play 0 sfx_green_line)
					(md_play 0 sfx_i_see_it)
					(set b_can_play_victory_chatter false))
					
				(begin
					(sleep_until b_can_play_victory_chatter)
					(sleep 10)
					(set b_can_play_victory_chatter false))
					
				(begin
					(sleep_until b_can_play_victory_chatter)
					(sleep 10)
					(set b_can_play_victory_chatter false))
			)
		false)
	)
)

; -------------------------------------------------------------------------------------------------
(script command_script cs_phantom
	(cs_run_command_script (ai_get_turret_ai ai_current_squad 0) cs_phantom_turret)
)

(script command_script cs_phantom_turret
	(sleep_until
		(begin
			(begin_random
				(begin
					(cs_shoot_point TRUE ps_phantom_targets/p0)
					(sleep (random_range 90 150)))	
				
				(begin
					(cs_shoot_point TRUE ps_phantom_targets/p1)
					(sleep (random_range 90 150)))	
					
				(begin
					(cs_shoot_point TRUE ps_phantom_targets/p2)
					(sleep (random_range 90 150)))	
					
				(begin
					(cs_shoot_point TRUE ps_phantom_targets/p3)
					(sleep (random_range 90 150)))	
					
				(begin
					(cs_shoot_point TRUE ps_phantom_targets/p4)
					(sleep (random_range 90 150)))	
					
				(begin
					(cs_shoot_point TRUE ps_phantom_targets/p5)
					(sleep (random_range 90 150)))	
					
				(begin
					(cs_shoot_point TRUE ps_phantom_targets/p6)
					(sleep (random_range 90 150)))	
					
				(begin
					(cs_shoot_point TRUE ps_phantom_targets/p7)
					(sleep (random_range 90 150)))	
					
				(begin
					(cs_shoot_point TRUE ps_phantom_targets/p8)
					(sleep (random_range 90 150)))	
					
				(begin
					(cs_shoot_point TRUE ps_phantom_targets/p9)
					(sleep (random_range 90 150)))	
			)
		false)
	)
)


; -------------------------------------------------------------------------------------------------
(script static void (md_play (short delay) (sound line))
	(sound_impulse_start line NONE 1)
	(sleep (sound_impulse_language_time line))
	(sleep delay))
	
(script static void (snd_play (sound s))
	(sound_impulse_start s NONE 1))
	
(script static void (snd_looping_play (looping_sound s))
	(sound_looping_start s NONE 1))
	
(script static void countdown
	(sound_impulse_start "sound\game_sfx\multiplayer\player_timer_beep"	NONE 1)
	(print "::: 3 :::")
	(sleep 30)
	(sound_impulse_start "sound\game_sfx\multiplayer\player_timer_beep"	NONE 1)
	(print "::: 2 :::")
	(sleep 30)
	(sound_impulse_start "sound\game_sfx\multiplayer\player_timer_beep"	NONE 1)
	(print "::: 1 :::")
	(sleep 30)
	(sound_impulse_start "sound\game_sfx\multiplayer\countdown_timer"	NONE 1)
	(print "::: 0 :::"))