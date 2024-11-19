

(global boolean g_music01 FALSE)
(global boolean g_music02 FALSE)
(global boolean g_music03 FALSE)
(global boolean g_music04 FALSE)
(global boolean g_music05 FALSE)

(global boolean g_dialog FALSE)

(script static void reset_music_var_go
	(set g_music01 FALSE)
	(set g_music02 FALSE)
	(set g_music03 FALSE)
	(set g_music04 FALSE)
	(set g_music05 FALSE)
)

(script startup cannon

	(wake f_cannon_objective_control)

)

; =================================================================================================
; =================================================================================================
; CANNON
; =================================================================================================
; =================================================================================================

(global short objcon_cannon -1)
(global boolean b_debug TRUE)
(global boolean b_cruiser_kill FALSE)
(global boolean b_cruiser_vulnerable FALSE)
(global boolean b_cruiser_dead FALSE)

(script dormant f_cannon_objective_control
	(dprint "::: cannon encounter :::")

	(wake f_cannon_cruiser)
	(wake f_cannon_music_control)
	(wake f_cannon_md_control)
	(wake f_cannon_load_player)

	(dprint "objective control : cannon.1")
	(set objcon_cannon 1)
	(game_save)

	(sleep_until (volume_test_players tv_cannon_10) 1)
	(dprint "objective control : cannon.10")
	(set objcon_cannon 10)

	(sleep_until b_cruiser_vulnerable 1)
	(dprint "objective control : cannon.20")
	(set objcon_cannon 20)

	(sleep_until b_cruiser_dead 1)
	(dprint "objective control : cannon.30")
	(set objcon_cannon 30)

)


(script dormant f_cannon_md_control

	(sleep 150)

	(dprint "KEYES: That cruiser's forward weapon is arming and we're almost in its kill range.  If that gun isn't making some noise soon, the Autumn's sitting in her grave!")
	(md_play 0 m70_1410)
	;(ai_play_line_on_object NONE m70_1410)

	(sleep_until (>= objcon_cannon 10) 1 240)
	(if (not (>= objcon_cannon 10))
		(begin
			(sleep_until (not g_dialog))
			(set g_dialog TRUE)
			(dprint "KEYES: We need you on that gun, Noble!  We can't take off without AA defense!")
			(md_play 0 m70_1430)
			(set g_dialog FALSE)
		)
	)

	(sleep_until (>= objcon_cannon 10) 1 240)
	(if (not (>= objcon_cannon 10))
		(begin
			(sleep_until (not g_dialog))
			(set g_dialog TRUE)
			(dprint "KEYES: Noble Six, you're going to have to take down that cruiser!")
			(md_play 0 m70_1420)
			(set g_dialog FALSE)
		)
	)

	(sleep_until (>= objcon_cannon 10) 1)
	(sleep_until (not g_dialog))
	(set g_dialog TRUE)
	(dprint "KEYES: They're about to open up their glassing beam, Lieutenant!  There isn't much time!")
	(md_play 0 m70_1450)
	(set g_dialog FALSE)

	(sleep_until (>= objcon_cannon 20) 1 240)
	(if (not (>= objcon_cannon 20))
		(begin
			(sleep_until (not g_dialog))
			(set g_dialog TRUE)
			(dprint "KEYES: Noble, heat up that gun! The cruiser is closing fast!")
			(md_play 0 m70_1455)
			(set g_dialog FALSE)
		)
	)

	(sleep_until (>= objcon_cannon 20) 1)

	(sleep_until (not g_dialog))
	(set g_dialog TRUE)
	(dprint "KEYES: Glassing port open! Her shields are down. She's vulnerable, Noble Six!")
	(md_play 0 m70_1460)
	(set g_dialog FALSE)

	(sleep_until (>= objcon_cannon 30) 1 240)
	(if (not (>= objcon_cannon 30))
		(begin
			(sleep_until (not g_dialog))
			(set g_dialog TRUE)
			(dprint "KEYES: Fire now, Lieutenant! Hit her in the gut!")
			(md_play 0 m70_1470)
			(set g_dialog FALSE)
		)
	)

	(sleep_until (>= objcon_cannon 30) 1 240)
	(if (not (>= objcon_cannon 30))
		(begin
			(sleep_until (not g_dialog))
			(set g_dialog TRUE)
			(dprint "KEYES: You've got to fire now, Spartan! We won't survive another attack!")
			(md_play 0 m70_1480)
			(set g_dialog FALSE)
		)
	)

	(sleep_until (>= objcon_cannon 30) 1)

	(sleep_until (not g_dialog))
	(set g_dialog TRUE)
	(dprint "KEYES: Cruiser hit! She's going down!")
	(md_play 0 m70_1490)
	(set g_dialog FALSE)

)

(script dormant f_cannon_music_control

	(wake f_music_cannon)

	(sleep_until (>= objcon_cannon 1))
	(set g_music01 TRUE)

)

(script dormant f_music_cannon

	(reset_music_var_go)

	(sleep_until g_music01 5)
	(dprint "music cannon")
	(sound_looping_start sound\music\temp_music_reach\heroic\bia_brass\bia_brass.sound_looping NONE 1)
	
	(sleep_until g_music02 5)
	(dprint "music stop")
	(sound_looping_stop sound\music\temp_music_reach\heroic\bia_brass\bia_brass.sound_looping)

)

(script dormant f_cannon_load_player

	(sleep_until (>= objcon_cannon 10))
	(vehicle_load_magic v_cannon_mac "" (player0))

)

(script dormant f_cannon_cruiser

	(object_cannot_take_damage dm_cannon_cruiser)
	(device_set_position_immediate dm_cannon_cruiser .5)

	(sleep_until (>= objcon_cannon 10))
	(wake f_cannon_cruiser_move)
	(wake f_cannon_cruiser_kill)
	(wake f_cannon_cruiser_vulnerable)
	(wake f_cannon_cruiser_die)

)

(script dormant f_cannon_cruiser_move

	(device_set_position_track dm_cannon_cruiser "device:position" 0)
	(device_animate_position dm_cannon_cruiser .5 0.0 1 1 TRUE)
	(device_animate_position dm_cannon_cruiser 1 30 1 1 TRUE)

)

(script dormant f_cannon_cruiser_vulnerable

	(sleep_until (>= (device_get_position dm_cannon_cruiser) .8) 1)
	(object_can_take_damage dm_cannon_cruiser)
	(object_set_shield dm_cannon_cruiser 1)
	(effect_new_on_object_marker objects\vehicles\covenant\cruiser\fx\glassing_init dm_cannon_cruiser fx_glass_hole)
	(f_blip_object sc_cannon_cruiser_target 16)
	(set b_cruiser_vulnerable TRUE)

)

(script dormant f_cannon_cruiser_die

	(branch
		b_cruiser_kill
		(f_abort)
	)

	(sleep_until b_cruiser_vulnerable)
	(sleep_until (< (object_get_shield dm_cannon_cruiser) 1) 1)

	(set b_cruiser_dead TRUE)
	(wake f_cannon_cruiser_cin)

)

(script dormant f_cannon_cruiser_kill

	(branch
		b_cruiser_dead
		(f_abort)
	)
	
	(sleep_until (>= (device_get_position dm_cannon_cruiser) 1) 1)
	(sleep 300)
	(set b_cruiser_kill TRUE)
	(effect_new_on_object_marker objects\vehicles\covenant\cruiser\fx\glassing_main dm_cannon_cruiser fx_glass_hole)

	(sleep_until (>= objcon_cannon 10))
	
	(sleep_until (not g_dialog))
	(set g_dialog TRUE)
	(dprint "KEYES: No!  Glassing beam open!  Do you copy, Noble?  DO YOU COPY...?")
	(md_play 0 m70_1500)
	(set g_dialog FALSE)

	(sleep 45)
	(fade_out 1 1 1 0)

)

(script dormant f_cannon_cruiser_cin

	(cinematic_preparation)
	(device_set_position_immediate dm_cannon_cruiser .9)
	(camera_set_field_of_view 80 0)
	(camera_set outro_cam_1 0)
	(camera_set outro_cam_2 60)
	(sleep 60)
	(camera_set outro_cam_3 60)
	(sleep 60)
	(camera_set outro_cam_4 0)

	(sleep 60)
	(fade_out 1 1 1 4)

	(sleep_until (not g_dialog))
	(set g_dialog TRUE)
	(dprint "KEYES: That was one hell of a shot, Spartan.  Our launch window is open... Thank you, Noble.  We owe you our lives -- all of us.")
	(md_play 0 m70_1510)
	(set g_dialog FALSE)



)


;----------------------------------------------------------------------------------------------------
; Utility

(script static void (md_play (short delay)(ai_line line))

	(sleep (ai_play_line_on_object NONE line))
	(sleep delay))

(script static void (dprint (string s) )
	(if b_debug (print s))
)

(script static void f_abort
	(sleep 0)	
)