;=====================================================================;
;=====globals=========================================================;
;=====================================================================;
(global boolean b_cue 0)
(global boolean b_perception 0)
(global boolean b_mule 0)
(global boolean b_fireteam 0)
(global short s_cue_bit 0)

;=====================================================================;
;=====main script=====================================================;
;=====================================================================;

(script startup bungie_day_test
	(print "welcome to bungie day")
	(ai_allegiance player human)
	
	;(wake sc_fireteam_start)
	(wake sc_cue_start)
	(wake sc_cleanup)
	
	;(sleep_until (= b_cue 1) 1)
		;(wake sc_cue_start)
		
	(sleep_until (= b_perception 1) 1)
		(wake sc_perception_start)
	
	(sleep_until (= b_mule 1) 1)
		(wake sc_mule_start)
		
	(sleep_until (= b_fireteam 1) 1)
		(wake sc_fireteam_start)		
	
)


;=====================================================================;
;=====fireteam script=================================================;
;=====================================================================;

(script dormant sc_fireteam_start
	;(print "fireteam start")
	
	(object_teleport (player0) cf_teleport03)
	(sleep 1)
	
	(wake sc_marines)
	(wake sc_elites)
	
	(sleep 1)
	
	(wake sc_fireteam_initialize)
)


(script dormant sc_fireteam_initialize
	(ai_set_fireteam_absorber sq_marines 1)
	(ai_player_add_fireteam_squad (player0) sq_fireteam)
	(ai_player_set_fireteam_max (player0) 3)	
	(ai_player_set_fireteam_max_squad_absorb_distance (player0) 3.0)
)

(script dormant sc_marines
	(sleep_until
		(begin
			(sleep_until (< (ai_task_count obj_marine/mg_marines) 4) 1)
				(sleep 10)
				(ai_place sq_marines/01)
				(ai_place sq_marines/02)
				(sleep 1)
		0)
	1)
)

(script dormant sc_elites
	;(print "in new elite script")
	(sleep_until (volume_test_players tv_fireteam) 1)
	
	(sleep_until (< (ai_task_count obj_covenant/main_gate) 2) 1)
		;(print "first wave in")
		(ai_place sq_elite01)
		
	(sleep_until (< (ai_task_count obj_covenant/main_gate) 2) 1)
		;(print "second wave in")
		(ai_place sq_elite01)
)

;=====================================================================;
;=====cue script======================================================;
;=====================================================================;
(script dormant sc_cue_start
	;(print "cue start")
	
	(object_teleport (player0) cf_teleport01)
	(sleep 1)
	(ai_dialogue_updating_enable 1)
	(ai_place sq_marine_cue)
	(wake sc_cue_bit_flip)
	
	;(print "waiting for player to get close to marines")
	(sleep_until (volume_test_players tv_cue) 1)
		(ai_place sq_elite_cue)
	
)

(script dormant sc_cue_bit_flip
	(sleep_until
		(begin
			(sleep 90)
			(if (= s_cue_bit 5)
				(set s_cue_bit 0)
				(set s_cue_bit (+ s_cue_bit 1) )
			)
		0)
	1)
)

;=====================================================================;
;=====perception script===============================================;
;=====================================================================;
(global boolean debug TRUE)
(global boolean b_body_spotted FALSE)
(script dormant sc_perception_start
	;(print "perception start")
		
	(object_teleport (player0) cf_teleport02)
	
	(wake perception_cycle_search)
	(recycle_perception)
	
	(md_play 0 sound\dialog\multiplayer_en\misc\target_training)
	(countdown)	
	
	(sleep_until
		(begin
			; create our objects
			(object_create battery1)
			(object_create battery2)
			(object_create battery3)
			(object_create antenna1)
			(object_create spacecrate1)
			
			(set b_body_spotted FALSE)
			(ai_place gr_cov_perception)
			
			; wait until everyone's dead or a body is spotted
			(sleep_until (dead_or_combat_status_p 4) 1)
			(sleep 5)
			(if (= (ai_combat_status gr_cov_perception) 4)
				(begin
					(set b_body_spotted TRUE)
					(print "*** body has been found ***")
					(md_play 0 sound\dialog\multiplayer_en\general\sudden_death)))
			
			; wait until everyone's dead or the player is spotted
			(sleep_until (dead_or_combat_status_p 5) 1)
			(sleep 5)
			(if (>= (ai_combat_status gr_cov_perception) 5)
				; covenant have spotted the player
				(begin 
					(print "*** FAIL ***")
					(md_play 0 sound\dialog\multiplayer_en\misc\loser))
				
				; covenant have all died without spotting the player
				(begin
					(print "*** VICTORY ***")
					(md_play 0 sound\dialog\multiplayer_en\misc\victory)
					(md_play 0 sound\dialog\multiplayer_en\flavor\sharpshooter)
					
					; the covenant haven't even spotted a body!
					(if (= b_body_spotted FALSE)
						(begin 
							(print "*** PERFECTION ***")
							(md_play 0 sound\dialog\multiplayer_en\misc\perfection)))))

			;(sleep 60)
			
			(md_play 0 sound\dialog\multiplayer_en\misc\map_resetting)
			
			(ai_erase gr_cov_perception)
			(sleep 5)
			(recycle_perception)
			
			(object_teleport (player0) cf_teleport02)
			(ai_reset_objective obj_perception/gate_body_found)
			(ai_reset_objective obj_perception/combat)
			(countdown)	
		0)
	)
)

(global short s_search_group 1)
(global short s_search_cycle_min 11)
(global short s_search_cycle_max 20)

(script dormant perception_cycle_search
	(sleep_until
		(begin
			(set s_search_group 1)
			(sleep (random_range (* 30 s_search_cycle_min) (* 30 s_search_cycle_max)))	

			(set s_search_group 2)
			(sleep (random_range (* 30 s_search_cycle_min) (* 30 s_search_cycle_max)))	
			
			(set s_search_group 3)
			(sleep (random_range (* 30 s_search_cycle_min) (* 30 s_search_cycle_max)))	
		0)
	)
)

(script static void (md_play (short delay) (sound line))
	(sound_impulse_start line NONE 1)
	(sleep (sound_impulse_language_time line))
	(sleep delay))
	
(script static boolean (dead_or_combat_status_p (short combat_status))
	(or
		(>= (ai_combat_status gr_cov_perception) combat_status)
		(= (ai_living_count gr_cov_perception) 0)))

;(script command_script cs_perception_surprise
	;(cs_action perception_patrol/center ai_action_surprise_front))
	

(script command_script cs_perception_point
	(cs_action_at_player ai_action_point))


(script static void recycle_perception
	(add_recycling_volume tv_recycle_perception 0 0)
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


;=====================================================================;
;=====mule script=====================================================;
;=====================================================================;
(script dormant sc_mule_start
	;(print "mule start")
	
	(sleep 1)
	
	(wake sc_mule_covenant)
	
	(sleep 150)
	
	(wake sc_mule_spawn)
)

(script dormant sc_mule_spawn
	(ai_place sq_mule)
)

(script dormant sc_mule_covenant	
	(ai_place sq_mule_grunt01)
	(ai_place sq_mule_grunt02)
	
	(sleep 1)
	
	(ai_place sq_mule_grunt03)
	;(ai_place sq_mule_grunt04)
)

;=====================================================================;
;=====cleanup script==================================================;
;=====================================================================;
(script dormant sc_cleanup
	;(print "cleanup script started")
	
	;*(sleep_until (= b_cue 1) 1)
		(sleep_forever sc_fireteam_start)
		(sleep_forever sc_fireteam_initialize)
		(sleep_forever sc_marines)
		(sleep_forever sc_elites)
		(sleep 1)
		(ai_kill sq_marines)
		(ai_kill sq_fireteam)
		(ai_kill sq_elite01)
		(sleep 30)
		(garbage_collect_now)*;
		
	(sleep_until (= b_perception 1) 1)
		(ai_dialogue_updating_enable 0)
		(sleep_forever sc_cue_start)
		(sleep_forever sc_cue_bit_flip)
		(sleep 1)
		(ai_erase sq_marine_cue)
		(ai_erase sq_elite_cue)
		(sleep 30)
		(garbage_collect_now)
	
	(sleep_until (= b_mule 1) 1)
		(sleep_forever sc_perception_start)
		(sleep_forever perception_cycle_search)
		(ai_erase gr_cov_perception)	
		(sleep 30)
		(garbage_collect_now)
	
	(sleep_until (= b_fireteam 1) 1)
		(sleep_forever sc_mule_start)
		(ai_erase sq_mule)
		(ai_erase sq_mule_grunt01)
		(ai_erase sq_mule_grunt02)
		(ai_erase sq_mule_grunt03)
		(sleep 30)
		(garbage_collect_now)
				
	
)
