(global boolean debug TRUE)
(global boolean g_play_cinematics TRUE)

(script startup ai_test
	(print "*** ai ***")
	
	; allegiances
	(ai_allegiance human player)

	
	;(ai_allegiance player human)
	
	;(ai_allegiance brute covenant)
	;(ai_allegiance covenant brute)
	
	;(ai_allegiance covenant mule)
	;(ai_allegiance mule covenant)
	
	;(ai_allegiance mule brute)
	
	;(ai_allegiance brute player)
	;(ai_allegiance player brute)
	(sleep 1)
	
	;(wake sc_bugger_swarm)
)

(script static void elite_single
	; Nothing
	(print "elite single")
)

; PERCEPTION TEST
; =================================================================================================
;*
(script static void perception_solo
	(print "::: BEGIN PERCEPTION TEST")
	(sleep_until
		(begin
			(ai_place perception.elite)
			(sleep_until 
				(or
					(>= (ai_combat_status perception.elite) 5)
					(= (ai_living_count perception.elite) 0)))
					
			(if (>= (ai_combat_status perception.elite) 2)
				(print "*** FAIL ***"))

			(sleep 60)
			(ai_erase perception.elite)
			(recycle_all)
			(countdown)	
		0)
	)
)
*;

(global ai mule_ai mule_acid)
(global ai mule_escort_ai rockfield.squad.e1g3)
(global ai mule_handlers_ai mule_handlers)

(script static void test_mule_handlers
	(print "starting mule handler scenario...")
	(ai_allegiance brute player)
	;(ai_allegiance brute mule)
	
	(ai_place mule_ai)
	(ai_place mule_handlers_ai)
	;(ai_place mule_escort_ai)
	(sleep 1)
	
	;(ai_set_targeting_group mule_ai 1 true)
	;(ai_set_targeting_group mule_escort_ai 2 true)
	;(ai_set_targeting_group mule_handlers 1 false)
)

(script static void test_mule_acid
	(print "starting mule acid variant scenario...")
	(sleep_until
		(begin
			(ai_place mule_acid)
			(ai_place mule_escort_ai)
			
			(sleep 1)
			(sleep_until (<= (object_get_health (object_at_marker (ai_get_object mule_acid/mule) "implant_attach_top")) 0) 1)
			(print "mule is angry at the world!")
			
			(cs_run_command_script mule_acid/mule cs_mule_change_side)
			(sleep 80)
			(sound_impulse_start sound\device_machines\scarab\scarab_roar NONE 1)
			(cam_shake 0.2 0.3 1.75)
			(ai_set_team mule_acid mule)
			(ai_disregard (players) TRUE)
			(sleep 150)
			(ai_disregard (players) FALSE)
			
			(sleep_until 
				(and 
					(<= (ai_living_count mule_acid/mule) 0) 
					(<= (ai_living_count mule_escort_ai) 0)))
			
			(sleep 60)
			(recycle_all)
			(ai_set_team mule_acid covenant)
			(countdown)	
		0)	
	)
	
)

(script static void test_mule_rock
	(print "starting mule rock variant scenario...")
	(countdown)
)

(script static void test_mule_melee
	(print "starting mule melee variant scenario...")
	(countdown)
)



; MULE
; =================================================================================================
(script static void mule_watch
	(sleep_until
		(begin
			(ai_place mule_ai)
			(ai_place mule_escort_ai)
			
			(sleep 1)
			(sleep_until (<= (object_get_health (object_at_marker (ai_get_object mule_ai/mule) "implant_attach_top")) 0) 1)
			(print "mule is angry at the world!")
			
			(cs_run_command_script mule_ai/mule cs_mule_change_side)
			(sleep 80)
			(sound_impulse_start sound\device_machines\scarab\scarab_roar NONE 1)
			(cam_shake 0.2 0.3 1.75)
			(ai_set_team mule_ai mule)
			(ai_disregard (players) TRUE)
			(sleep 150)
			(ai_disregard (players) FALSE)
			
			(sleep_until 
				(and 
					(<= (ai_living_count mule_ai/mule) 0) 
					(<= (ai_living_count mule_escort_ai) 0)))
			
			(sleep 60)
			(recycle_all)
			(ai_set_team mule_ai covenant)
			(countdown)	
		0)	
	)
)

(script command_script cs_mule_handler
	(print "handler ready...")
	;(cs_shoot true (ai_get_object mule_acid/mule))
	;(sleep_forever)
)

(script command_script cs_mule_change_side
	(cs_custom_animation objects\characters\mule\mule "combat:any:h_ping:back:gut:var1" TRUE)

)	

(script static void evaluate
                (if (= ai_render_evaluations 0)
                                (begin
                                                (set ai_render_evaluations 1)
                                                (set ai_render_evaluations_detailed 1)
                                                (set ai_render_evaluations_text 1)
                                                (set ai_render_firing_position_statistics 1)
                                )
                                (begin
                                                (set ai_render_evaluations 0)
                                                (set ai_render_evaluations_detailed 0)
                                                (set ai_render_evaluations_text 0)
                                                (set ai_render_firing_position_statistics 0)
                                )                              
                )
)


(script static void (cam_shake (real attack) (real intensity) (real decay))
	(player_effect_set_max_rotation 2 2 2)
	(player_effect_start intensity attack)
	(player_effect_stop decay))


; PERCEPTION TEST
; =================================================================================================
(global boolean b_body_spotted FALSE)

(script static void perception_squad
	(print "::: BEGIN PERCEPTION TEST")
	
	(object_teleport (player0) perception_teleport)
	(md_play 0 sound\dialog\multiplayer_en\misc\target_training)
	(countdown)	
	
	(sleep_until
		(begin
			(set b_body_spotted FALSE)
			(ai_place gr_cov_perception)
			
			; wait until everyone's dead or a body is spotted
			(sleep_until (dead_or_combat_status_p 4))
			(if (= (ai_combat_status gr_cov_perception) 4)
				(begin
					(set b_body_spotted TRUE)
					(print "*** body has been found ***")
					(md_play 0 sound\dialog\multiplayer_en\general\sudden_death)))
			
			; wait until everyone's dead or the player is spotted
			(sleep_until (sleep_until (dead_or_combat_status_p 5)))	
			(if (>= (ai_combat_status gr_cov_perception) 5)
				; covenant have spotted the player
				(begin 
					(print "*** FAIL ***")
					(md_play 0 sound\dialog\multiplayer_en\misc\loser))
				
				; covenant have all died without spotting the player
				(begin
					(print "*** VICTORY ***")
					(md_play 30 sound\dialog\multiplayer_en\misc\victory)
					(md_play 30 sound\dialog\multiplayer_en\flavor\sharpshooter)
					
					; the covenant haven't even spotted a body!
					(if (= b_body_spotted FALSE)
						(begin 
							(print "*** PERFECTION ***")
							(md_play 0 sound\dialog\multiplayer_en\misc\perfection)))))

			(sleep 300)
			
			(md_play 0 sound\dialog\multiplayer_en\misc\map_resetting)
			
			(ai_erase gr_cov_perception)
			(recycle_all)
			
			(object_teleport (player0) perception_teleport)
			(ai_reset_objective obj_perception/gate_alert)
			(countdown)	
		0)
	)
)

(script static boolean (dead_or_combat_status_p (short combat_status))
	(or
		(>= (ai_combat_status gr_cov_perception) combat_status)
		(= (ai_living_count gr_cov_perception) 0)))

;(script command_script cs_perception_surprise
	;(cs_action perception_patrol/center ai_action_surprise_front))
	

(script command_script cs_perception_point
	(cs_action_at_player ai_action_point))
	
(script static void body_check
	(sleep_until 
		(or
			(>= (ai_combat_status gr_cov_perception) 4)
			(= (ai_living_count gr_cov_perception) 0)))
			
	(if (>= (ai_combat_status gr_cov_perception) 4)
		(set b_body_spotted TRUE))
)


; SNIPER TEST
; =================================================================================================
(script static void (snipertest (short snipercount))
	(print "Starting sniper test")
	(sleep_until
		(begin
			(object_teleport (player0) teleport_snipertest)
			(ai_place sniper.test.high snipercount)
			(ai_place sniper.test.low)
			(sleep_until (= (ai_living_count sniper.test.low) 0))
			(sleep_until (= (ai_living_count sniper.test.high) 0) 30 (* 15 30))
			(ai_erase_all)
			(sleep 90)
			(recycle_all)
			(countdown)
		0)
	)
)

(script static void (md_play (short delay) (sound line))
	(sound_impulse_start line NONE 1)
	(sleep (sound_impulse_language_time line))
	(sleep delay))


; EVACUATION TEST
; =================================================================================================
(global unit u_evac_pelican NONE)
(global short s_civilians_spawned 0)
(global short s_civilians_max 6)
(global short s_seats_occupied 0)
(script static void run_evac
	; setup
	(set s_civilians_spawned 0)
	(set s_seats_occupied 0)
	
	; place the pelican and setup
	(ai_place evac_pelican)
	(sleep 1)
	(set u_evac_pelican (ai_vehicle_get_from_starting_location evac_pelican/pilot))
	
	; place and board the marines
	(ai_place evac_marines/marine1)
	(ai_place evac_marines/marine2)
	(ai_place evac_marines/marine3)
	(ai_vehicle_enter_immediate evac_marines/marine1 u_evac_pelican "pelican_p_l01")
	(ai_vehicle_enter_immediate evac_marines/marine2 u_evac_pelican "pelican_p_l02")
	(ai_vehicle_enter_immediate evac_marines/marine3 u_evac_pelican "pelican_p_l03")
)


(script command_script cs_evac_pelican
	(cs_enable_pathfinding_failsafe TRUE)
	(cs_vehicle_speed 1.0)
	(cs_vehicle_boost TRUE)
	
	(cs_fly_by evac_pelican/entry0)
	
	(cs_vehicle_speed 0.5)
	(cs_vehicle_boost FALSE)
	
	(cs_fly_to_and_face evac_pelican/hover evac_pelican/land_facing 0.25)
	(unit_open u_evac_pelican)
	
	(sleep 120)
	
	(vehicle_unload u_evac_pelican "pelican_p_l01")
	(cs_run_command_script evac_marines/marine1 cs_evac_marine_left)	
	(sleep 40)
	(vehicle_unload u_evac_pelican "pelican_p_l02")
	(cs_run_command_script evac_marines/marine2 cs_evac_marine_right)
	(sleep 40)
	(vehicle_unload u_evac_pelican "pelican_p_l03")
	(cs_run_command_script evac_marines/marine3 cs_evac_marine_door)
	;(sleep 300)
	
	(sleep_until (= (list_count (vehicle_riders u_evac_pelican)) (+ s_civilians_max 4)))
	(unit_close u_evac_pelican)
	
	(cs_vehicle_speed 0.9)
	(cs_vehicle_boost FALSE)
	(cs_fly_by evac_pelican/erase)
	(object_destroy (ai_vehicle_get ai_current_actor))
)

(script command_script cs_evac_marine_left
	(cs_enable_pathfinding_failsafe TRUE)
	(cs_draw)
	(cs_go_to evac_pelican/marine_left)
	(cs_crouch TRUE)
	(sleep_until (>= (evac_count_riders u_evac_pelican) (+ s_civilians_max 2)))
	(ai_vehicle_enter ai_current_actor u_evac_pelican "pelican_p")
)

(script command_script cs_evac_marine_right
	(cs_enable_pathfinding_failsafe TRUE)
	(cs_draw)
	(cs_go_to evac_pelican/marine_right)
	(cs_crouch TRUE)
	(sleep_until (>= (evac_count_riders u_evac_pelican) (+ s_civilians_max 2)))
	(ai_vehicle_enter ai_current_actor u_evac_pelican "pelican_p")
)

(script command_script cs_evac_marine_door
	(cs_enable_pathfinding_failsafe TRUE)
	(cs_draw)
	(cs_go_to evac_pelican/marine_door)
	(evac_spawn_all_civilians)
	(sleep 60)
	;(sleep_until (evac_all_civilians_boarded_p))
	(ai_vehicle_enter ai_current_actor u_evac_pelican "pelican_p")
)

(script static void evac_spawn_all_civilians
	(sleep_until
		(begin
			(evac_spawn_civilian)
		(>= s_civilians_spawned s_civilians_max)) 1)
)

(script static boolean evac_all_civilians_boarded_p
	(and
		(= s_civilians_spawned s_civilians_max)
		(= (list_count (vehicle_riders u_evac_pelican)) s_civilians_max))
)

(script static short (evac_count_riders (unit pelican))
	(list_count (vehicle_riders pelican)))

(script static void evac_spawn_civilian
	(ai_place evac_civilian)
	(set s_civilians_spawned (+ s_civilians_spawned 1))
	(sleep (random_range 15 45))
)

(script command_script cs_evac_civilian_board
	(cs_enable_pathfinding_failsafe TRUE)
	(ai_vehicle_enter ai_current_actor u_evac_pelican "pelican_p")
	(set s_seats_occupied (+ s_seats_occupied 1))
)

; AIRSTRIKE TEST
; =================================================================================================
(script static void bombing_run
	(ls_flyby ls1)
	(sound_impulse_start "sound\levels\070_waste\070_longsword_crash\070_longsword.sound" NONE 1)
	(flyby_bomb bombs 5 30)
)

(global short s_current_bomb 0)
(script static void (flyby_bomb (point_reference p) (short count) (short delay))
	(set s_current_bomb 0)
	(sleep_until
		(begin
			(print "boom")
			;(effect_new_at_point_set_point "fx\fx_library\explosions\reach_test_explosion_large\reach_test_explosion_large" p s_current_bomb)
			(effect_new_at_ai_point "fx\fx_library\explosions\reach_test_explosion_large\reach_test_explosion_large" bombs/p0)
			(set s_current_bomb (+ s_current_bomb 1))
			(sleep delay)
		(>= s_current_bomb count)) 1)	
)

(script static void (ls_flyby (device d))
	(device_set_position_track d device:position 0)
	(device_animate_position d 0 0.0 0.0 0.0 TRUE)
	(device_set_position_immediate d 0)
	(device_set_power d 0)
	(sleep 1)
	(device_animate_position d 0.5 7.0 0.1 0.1 TRUE))

; DROPSHIP TRACKING
; =================================================================================================
(script static void phantom_spotlight_test
	(ai_place phantom.tracker)
	(object_teleport (player0) tracker_flag))
	
(script command_script cs_phantom_tracker
	(cs_run_command_script (ai_get_turret_ai phantom.tracker 0) cs_phantom_tracker_gunner)
	(cs_enable_pathfinding_failsafe TRUE)
	(cs_vehicle_speed 0.4)
	(cs_vehicle_boost TRUE)
	
	;(sleep_until
	;	(begin 
	;		(cs_fly_to_and_face phantom_tracker/hover1 phantom_tracker/facing)
	;		(sleep 120)
			(cs_fly_to_and_face phantom_tracker/hover2 phantom_tracker/facing)
	;		(sleep 120)
	;	0)
	;)
	(sleep_forever)
)

(script command_script cs_phantom_tracker_gunner
	(if debug (print "::: phantom is aiming at the player"))
	(cs_aim_player TRUE)
	(sleep_forever)
	(if debug (print "::: phantom is no longer aiming at the player"))
)


; CYCLE
; =================================================================================================
(script static void (cycle (ai squad) (short count))
	(print "Spawning AI")
	(sleep_until
		(begin
			(ai_place squad count)
			(sleep 1)
			(sleep_until (= (ai_living_count squad) 0))
			(sleep 90)
			(recycle_all)
			(countdown)
		0)
	)
)

; RECYCLE
; =================================================================================================
(script static void recycle_all
	(add_recycling_volume tv_recycle 0 0)
)

(script static void countdown
	(sound_impulse_start "sound\game_sfx\multiplayer\player_timer_beep"	NONE 1)
	(if debug (print "::: 3 :::"))
	(sleep 30)
	(sound_impulse_start "sound\game_sfx\multiplayer\player_timer_beep"	NONE 1)
	(if debug (print "::: 2 :::"))
	(sleep 30)
	(sound_impulse_start "sound\game_sfx\multiplayer\player_timer_beep"	NONE 1)
	(if debug (print "::: 1 :::"))
	(sleep 30)
	(sound_impulse_start "sound\game_sfx\multiplayer\countdown_timer"	NONE 1)
	(if debug (print "::: 0 :::"))
)


(script static void you_lose
	(print "*** YOU LOSE ***")
	(ai_erase_all))
	
	
	
; =================================================================================================
; HUD SOUNDS
(global looping_sound	snd_jitter					sound\device_machines\jittery_holo\jittery_holo)
(global looping_sound	snd_error					sound\device_machines\terminals\error_loop\error_loop)
(global looping_sound	snd_alarm					sound\game_sfx\ui\shield_low_dervish\shield_low_dervish)

; =================================================================================================
; SOUND HELPERS
(script static void (snd_loop (looping_sound s))
	(sound_looping_start s NONE 1))

(script static void (snd_stop (looping_sound s))
	(sound_looping_stop s))
	
(script static void (snd_stop_now (looping_sound s))
	(sound_looping_stop_immediately s))

(script static void (snd_play (sound s))
	(sound_impulse_start s (player0) 1))

(script static void (snd_play_all (sound s))
	(sound_impulse_start s NONE 1)
	(sleep (sound_impulse_language_time s)))
	
	
; =================================================================================================
(script static void hud_malfunction_loop
	(sleep_until
		(begin
			
		0)
	)
)


(script static void hud_crosshair_shutdown
	(chud_show_crosshair 0)
)

(script static void hud_grenades_shutdown
	(chud_show_grenades 0)
)

(script static void hud_motionsensor_shutdown
	(chud_show_motion_sensor 0)
)

(script static void hud_shield_shutdown
	(chud_show_shield 0)
)

(script static void hud_shield_static
	(sleep_until
		(begin
			(chud_show_shield 1)
			(snd_loop snd_jitter)
			(sleep (random_range 3 20))
			(snd_stop_now snd_jitter)
			(chud_show_shield 0)
			(sleep (random_range 5 8))			
		0)
	1)
)

(script static void hud_weapons_shutdown
	(chud_show_weapon_stats 0)
)


(global object blip_object NONE)

(script static void hud_shutdown
	(chud_show_crosshair 0)
	(chud_show_grenades 0)
	(chud_show_motion_sensor 0)
	(chud_show_shield 0)
	(chud_show_weapon_stats 0))

(script static void hud_reboot
	(if debug (print "test"))
)

(script static void recycle
	(recycle_all))

(script static void baldwin
	(ai_place blip_guy)
	(set blip_object (ai_get_object blip_guy))
	
	(sleep 10)
	(blip_on)
)

(script static void blip_on
	(chud_track_object blip_object 1))

(script static void blip_off
	(chud_track_object blip_object 0))

(global ai pathfinding_ai odst_jetpack)
(script static void pathfinding_test
	(sleep_until
		(begin
			(print "spawning pathfinding ai")
			;(sleep (random_range 0 90))
			(ai_place pathfinding_ai)
			(cs_run_command_script pathfinding_ai cs_pathfinding_platform)
			(sleep_until (<= (ai_living_count pathfinding_ai) 0) 30 (* 30 20))
			(ai_erase pathfinding_ai)
			(sleep 1)
		0)
	1)
)

(script command_script cs_pathfinding_platform
	(cs_enable_pathfinding_failsafe true)
	(cs_go_to pts_pathfinding/platform_right)
	(cs_go_to pts_pathfinding/platform_left)
	(cs_go_to pts_pathfinding/ground)
	(ai_erase ai_current_actor)
)

(script static void steve
	(ai_place mule_effects/field)
	(cs_run_command_script mule_effects cs_pathfinding_fields)
)

(script static void steve_attack
	(ai_place mule_effects/field)
)

(script command_script cs_pathfinding_fields
	(cs_enable_pathfinding_failsafe true)
	(sleep_until
		(begin
			(cs_go_to pts_pathfinding/field0)
			(cs_go_to pts_pathfinding/field1)
			(cs_go_to pts_pathfinding/field2)		
		0)
	)

	(ai_erase ai_current_actor)
)

(script static void steve_jump
	(sleep_until
		(begin
			(ai_place mule_effects/jump)
			(cs_run_command_script mule_effects cs_pathfinding_jumps)
			(sleep_until (<= (ai_living_count mule_effects) 0))
		0)
	1)
)

(script command_script cs_pathfinding_jumps
	(cs_enable_pathfinding_failsafe true)
	(cs_go_to pts_pathfinding/mule_jump)	
	(sleep 60)
	(ai_erase ai_current_actor)	
)
;(script static void mus_test_start 	(sound_looping_start "sound\music\numbers\9m_full\9m_full" NONE 1))
;(script static void mus_test_alt 	(sound_looping_set_alternate 	"sound\music\numbers\9m_full\9m_full"  TRUE))