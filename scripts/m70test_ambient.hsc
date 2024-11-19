; =================================================================================================
; MUSIC
; =================================================================================================
;(global looping_sound		m_m10						"sound\music\numbers\10m\10m")
;(global sound						m_spot_stinger	"sound\music\stingers\orch3")


; Encounters
;(global looping_sound	m_firstkiva		m_m10)


; First Kiva Encounter
;(script static void mus_firstkiva_start 	(sound_looping_start m_firstkiva NONE 1))
;(script static void mus_firstkiva_alt 		(sound_looping_set_alternate m_firstkiva TRUE))
;(script static void mus_firstkiva_stop 	(sound_looping_stop m_firstkiva))

;(script static void mus_stop_all
	;(sound_looping_stop m_firstkiva)
;)

;(script static void mus_stop_all_immediate
	;(sound_looping_stop_immediately m_firstkiva)
;)


; =================================================================================================
; SCRIPTED EVENTS
; =================================================================================================


; =================================================================================================
; CINEMATICS
; =================================================================================================
;(script static void cin_intro
	;(cinematic_snap_to_black)
	;(XXX)
	;(cinematic_fade_to_gameplay)
;)


; =================================================================================================
; AI(x) CONTROL
; =================================================================================================


; AI(x) MOVEMENT
; =================================================================================================


; =================================================================================================
; M30 NAV POINTS
; =================================================================================================

;(script dormant nav_fk_exit_on
	;(hud_activate_team_nav_point_flag player nav_fk_exit 0)
;)

;(script dormant nav_fk_exit_off
	;(hud_deactivate_team_nav_point_flag player nav_fk_exit)
;)


; =================================================================================================
; M30 OBJECTIVES
; =================================================================================================
;(script dormant ct_recon
	;(sleep 150)
	;(cinematic_set_title ct_objective_1)
;)


; =================================================================================================
; PULSES
; =================================================================================================

;(global boolean g_pulse_kat_transmission 0)
;(script continuous kat_transmission_pulse
	;(if (= g_pulse_kat_transmission 1) (cinematic_set_title ct_incoming_message_kat))
	;(sleep 30)	
;)


; =================================================================================================
; MISSION DIALOGUE: MAIN SCRIPTS
; =================================================================================================
(script static void (md_play_debug (short delay) (string line))
	(if dialogue (print line))
	(sleep delay))

(script static void (md_print (string line))
	(if dialogue (print line)))

(script static void (md_play (short delay) (sound line))
	(sound_impulse_start line NONE 1)
	(sleep (sound_impulse_language_time line))
	(sleep delay))


; =================================================================================================
; MISSION DIALOGUE: INSERTION
; =================================================================================================


; =================================================================================================
; =================================================================================================
; AI(x) CONTROL SCRIPT
; =================================================================================================
;(script dormant jun_control_insertion
	;(ai_set_objective unsc.jun obj_fk_unsc)
;)


; INSERTION
; =================================================================================================


; TEST SCRIPTS
; =================================================================================================