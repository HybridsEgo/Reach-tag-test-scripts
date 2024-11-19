; =================================================================================================
; GLOBALS
; =================================================================================================

; Debug Options
(global boolean debug 				TRUE)
(global boolean debug_objectives 	TRUE)
(global boolean editor 				FALSE)
(global boolean cinematics 			false)
(global boolean dialogue 			TRUE)
(global boolean skip_intro			FALSE)
(global object g_location 		NONE)

; Objective Controls
(global short objcon_atrium		-1)	

; =================================================================================================
; ATRIUM STARTUP
; =================================================================================================
(script startup atrium
	(print_difficulty)
	(if debug (print "::: ATRIUM :::"))
		
	; Allegiances
	(ai_allegiance human player)
	(ai_allegiance player human)

	
; ENCOUNTERS
	; ============================================================================================
	
		; ATRIUM
		; =======================================================================================
		(sleep_until (volume_test_players tv_atrium_start) 1)
		(wake atrium_objective_control)
)		

; =================================================================================================
; ATRIUM OBJECTIVE CONTROL
; =================================================================================================
(global boolean b_atrium_counterattack_started false)
(global boolean b_atrium_complete false)
; -------------------------------------------------------------------------------------------------

(script dormant atrium_objective_control
	(if debug (print "encounter start: atrium"))
	(game_save)
	(set objcon_atrium 0)
	
	; SCRIPTS
	(wake atrium_combat_progression)
  (wake vignette_marine_bunker_00)
	; SPAWN
	(ai_place gr_cov_atrium_initial)
	(ai_place atrium_cov_inf7)
	
	(ai_place atrium_unsc_inf0)
	(ai_place atrium_unsc_inf1)

	; MISSION DIALOGUE
	(wake md_atrium_marine_intro)
	
	; OBJECTIVE CONTROL
	(sleep_until (volume_test_players tv_atrium_interior_01) 1)
		(if debug (print "objective control: atrium 01"))
		(set objcon_atrium 1)		
		
	(sleep_until (volume_test_players tv_atrium_interior_02) 1)
		(if debug (print "objective control: atrium 02"))
		(set objcon_atrium 2)				
		
	(sleep_until (volume_test_players tv_atrium_interior_03) 1)
		(if debug (print "objective control: atrium 03"))
		(set objcon_atrium 3)		
		
	(sleep_until (volume_test_players tv_atrium_interior_04) 1)
		(if debug (print "objective control: atrium 04"))
		(set objcon_atrium 4)			
		
	(sleep_until (volume_test_players tv_atrium_interior_05) 1)
		(if debug (print "objective control: atrium 05"))
		(set objcon_atrium 5)			
)

; -------------------------------------------------------------------------------------------------
(script dormant vignette_marine_bunker_00
		(sleep_until (>= objcon_atrium 1) 5)
		(thespian_performance_setup_and_begin th_marine_bunker_00 "" 0)
)

(script dormant atrium_combat_progression

	(sleep_until
			(or 
				(f_initial_cov_is_defeated gr_cov_atrium_initial)
				(and (<= (ai_living_count obj_atrium_covenant) 2) (>= objcon_atrium 5))
			)
		1)

	(set b_atrium_counterattack_started true)
	(game_save)
	
	(ai_place atrium_cov_inf8)
	(device_set_position atrium_elevator_door_1 1)

		
	(wake md_atrium_hunters)
	(wake md_atrium_complete)
	
  (sleep_until (f_initial_cov_is_defeated gr_cov_atrium_counter))
	(set b_atrium_complete TRUE)
	
)

(script static boolean (f_initial_cov_is_defeated (ai actors))
	(and
		(> (ai_spawn_count actors) 0)
		(<= (ai_living_count actors) 0)
	)
)

(script dormant md_atrium_marine_intro
	(sleep_until (>= objcon_atrium 1) 1)
		
	;When the player enters the atrium:
	(md_print "TROOPER 1: Assad!  How do we get to the tower?")
	(f_md_play 0 sound\dialog\levels\m50\mission\robot\m50_0240_tr1.sound)
	
	(md_print "TROOPER 2: Elevator in the atrium!  Goes down to the bridge; bridge goes to the tower!")
	(f_md_play 0 sound\dialog\levels\m50\mission\robot\m50_0250_tr2.sound)
	
	(md_print "TROOPER 1: Okay, let's move in and find that elevator!")
	(f_md_play 0 sound\dialog\levels\m50\mission\robot\m50_0270_tr1.sound)
	
	(sleep_until (>= objcon_atrium 2) 1)

	(sleep 500)	
	(wake md_info_booth)
	(wake md_atrium_ai_response)
	(wake md_atrium_elevator)

;*
	;If the player goes out and re-enters the atrium (these alternate if the player does that multiple times):
	(md_print "ATRIUM A.I.: Welcome -- to Traxus Technologies.  Traxus: The sky's no limit.")
	(md_play 0 sound\dialog\levels\m50\mission\robot\m50_0350_aai.sound)

*;
	
)

(global short md_atruim_ai		0)	
(global short md_atruim_ai_delay		500)	

(script static void md_play_info_booth
	;Whenever the player nears one of the Information screens:
  (sleep_until (not b_is_dialogue_playing) 1)
	(md_print "ATRIUM A.I.Traxus directory.  Wherever you're going, Traxus takes you there.")
	(f_md_play_location 0 sound\dialog\levels\m50\mission\robot\m50_0380_aai.sound)
	(set md_atruim_ai (+ md_atruim_ai 1))
)	

(script dormant md_atrium_ai_response
	(sleep_until (and 
								(not b_atrium_counterattack_started)
								(>= md_atruim_ai 3) ) 5)

	;IF a trooper is still alive and present after the third time this plays:
	(sleep_until (not b_is_dialogue_playing) 1)
	(md_print "TROOPER 1: Somebody shut that goddamn thing off!")
	(f_md_play 0 sound\dialog\levels\m50\mission\robot\m50_0370_tr1.sound)	
	(set md_atruim_ai_delay (+ md_atruim_ai_delay 500))
)

(script dormant md_atrium_elevator
	(sleep_until 
		(begin
			(if (volume_test_players tv_atrium_elevator)
				(begin
					;Whenever the player enters the elevator:
					(sleep 30)
					(sleep_until (not b_is_dialogue_playing) 1)
					(md_print "ATRIUM A.I.: Elevator.  This way to the bridge skyway and Traxus Tower.")
					(f_md_play 0 sound\dialog\levels\m50\mission\robot\m50_0390_aai.sound)
					(sleep 400)
				)
			)
		FALSE
		)
	)		
)

(script dormant md_atrium_hunters
	(sleep_until b_atrium_counterattack_started)
		(begin
			;When the Hunters come out, IF a trooper is still alive and present
			(sleep 60)
			(sleep_until (not b_is_dialogue_playing) 1)
			(md_print "TROOPER 1: Crap!  We're gonna need bigger guns!")
			(f_md_play 0 sound\dialog\levels\m50\mission\robot\m50_0400_tr1.sound)
		)
)

(script dormant md_atrium_complete
	(sleep_until b_atrium_complete)
		(begin
			;When the Hunters have been killed, IF a trooper is still alive and present:
			(sleep 60)
			(sleep_until (not b_is_dialogue_playing) 1)
			(md_print "TROOPER 1: I HATE those things... All right, Ell-Tee, let's hop that elevator and get to the tower.")
			(f_md_play 0 sound\dialog\levels\m50\mission\robot\m50_0410_tr1.sound)
			(sleep 30)
			(f_blip_object atrium_elevator 4)
	
		)
)

(script dormant md_info_booth
		(sleep_until 
			(begin					
					(cond
					; -------------------------------------------------------------------------------------------------
						; -------------------------------------------------------------------------------------------------
						; condition #1 when the player is in this trigger and the associated object is not destroyed 
						(
							(and 
								(volume_test_players tv_info_screen_02) 
								(>= (object_get_health #_info_booth_a_02) 1) 
							)

							; play this dialogue
							(begin
								(set g_location #_info_booth_a_02)
								(md_play_info_booth)
								(sleep md_atruim_ai_delay)
							)
						)
						
						; -------------------------------------------------------------------------------------------------
						; condition #2 when the player is in this trigger and the associated object is not destroyed 
						(
							(and 
								(volume_test_players tv_info_screen_03) 
								(>= (object_get_health #_info_booth_a_03) 1) 
							)

							; play this dialogue
							(begin
								(set g_location #_info_booth_a_03)
								(md_play_info_booth)
								(sleep md_atruim_ai_delay)
							)
						)
						
						; -------------------------------------------------------------------------------------------------
						; condition #3 when the player is in this trigger and the associated object is not destroyed 
						(
							(and 
								(volume_test_players tv_info_screen_04) 
								(>= (object_get_health #_info_booth_a_04) 1) 
							)

							; play this dialogue
							(begin
								(set g_location #_info_booth_a_04)
								(md_play_info_booth)
								(sleep md_atruim_ai_delay)
							)
						)
						
						; -------------------------------------------------------------------------------------------------
						; condition #4 when the player is in this trigger and the associated object is not destroyed 
						(
							(and 
								(volume_test_players tv_info_screen_05) 
								(>= (object_get_health #_info_booth_a_05) 1) 
							)

							; play this dialogue
							(begin
								(set g_location #_info_booth_a_05)
								(md_play_info_booth)
								(sleep md_atruim_ai_delay)
							)
						)
						
						; -------------------------------------------------------------------------------------------------
						; condition #5 when the player is in this trigger and the associated object is not destroyed 
						(
							(and 
								(volume_test_players tv_info_screen_06) 
								(>= (object_get_health #_info_booth_a_06) 1) 
							)

							; play this dialogue
							(begin
								(set g_location #_info_booth_a_06)
								(md_play_info_booth)
								(sleep md_atruim_ai_delay)
							)
						)
						
						; -------------------------------------------------------------------------------------------------
						; condition #6 when the player is in this trigger and the associated object is not destroyed 
						(
							(and 
								(volume_test_players tv_info_screen_07) 
								(>= (object_get_health #_info_booth_a_07) 1) 
							)

							; play this dialogue
							(begin
								(set g_location #_info_booth_a_07)
								(md_play_info_booth)
								(sleep md_atruim_ai_delay)
							)
						)
						; -------------------------------------------------------------------------------------------------
						; condition #7 when the player is not in any trigger
						(
							(not b_atrium_complete)
							
							; play this dialogue
							(begin
								(if (<= md_atruim_ai 0)
									(begin
										;When the player enters the atrium:
										(sleep_until (not b_is_dialogue_playing) 1)
										(md_print "ATRIUM A.I.: Welcome -- to Traxus Technologies.  Traxus: Getting you there is half the battle.")
										(f_md_play 0 sound\dialog\levels\m50\mission\robot\m50_0340_aai.sound)
										(set md_atruim_ai (+ md_atruim_ai 1))
										(sleep md_atruim_ai_delay)
									)
									
									(begin
										;Periodically recurring while the player is in the atrium (preceded by an alarm, perhaps?):		
										(sleep_until (not b_is_dialogue_playing) 1)
										(md_print "ATRIUM A.I.: Evacuation in process.  Please move to the nearest exit.  A Traxus representative is waiting there to assist you.  Thanks for your cooperation.")
										(f_md_play 0 sound\dialog\levels\m50\mission\robot\m50_0360_aai.sound)
										(set md_atruim_ai (+ md_atruim_ai 1))
										(sleep md_atruim_ai_delay)	
									)
								
							)
						)
					)	
				)
			b_atrium_counterattack_started
		)
	)
)



;*-------------------------------------------------------------------------------------------------

(script static void banshee_attack_refresh
	(sleep (random_range (* 30 15) (* 30 45)))
	
	(ai_reset_objective obj_air/follow_player)
	(print "RESETTING FOLLOW")
)
-------------------------------------------------------------------------------------------------*;

; -------------------------------------------------------------------------------------------------
; MISSION DIALOGUE: MAIN SCRIPTS
; -------------------------------------------------------------------------------------------------
(script static void (f_md_play_location (short delay) (sound line))
	(set b_is_dialogue_playing true)
	(sound_impulse_start line g_location 1)
	(sleep (sound_impulse_language_time line))
	(sleep delay)
	(set b_is_dialogue_playing false))

(script static void (md_play_debug (short delay) (string line))
	(if dialogue (print line))
	(sleep delay))

(script static void (md_print (string line))
	(if dialogue (print line)))

;(script static void (md_play (short delay) (sound line))
;	(sound_impulse_start line NONE 1)
;	 sound_impulse_start <sound> <object> <real>
;	(sleep (sound_impulse_language_time line))
;	(sleep delay))
	
(global sound snd_transmission "sound\game_sfx\ui\pda_transition")
(script static void play_transmission_sound 
	(sound_impulse_start snd_transmission NONE 1)
	(sleep (sound_impulse_language_time snd_transmission)))


; -------------------------------------------------------------------------------------------------
;	DEBUG SHORTCUTS
; -------------------------------------------------------------------------------------------------

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