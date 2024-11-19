(script continuous intro_intra_outro_continuous
	(switch_zone_set "intro_intra_outro")
	
	(ai_place squads_0)
	
	(ai_allegiance human player)
	(ai_allegiance player human)
	
	(sound_looping_start sound\music\temp_music_reach\action\14full\14full none 1)
	
	(f_start_mission cinematic_transition_test_intro)
	(cinematic_fade_to_gameplay cinematic_transition_test_intro)
	
	(sleep_until (<= (ai_living_count squads_0) 0))
	(f_play_cinematic cinematic_transition_test_intra "intro_intra_outro")
	(cinematic_fade_to_gameplay cinematic_transition_test_intra)
		
	(sleep_until (volume_test_players tv_exit))
	(f_end_mission cinematic_transition_test_outro "intro_intra_outro")
	
	(sound_looping_stop sound\music\temp_music_reach\action\14full\14full)
)

(script startup intro_intra_outro
	(wake intro_intra_outro_continuous)
)