(script static void (vig_spartan_look)
	(performance_play_line "aimat01")
	(performance_play_line "lookat02")
)

(script static void (vig_spartan_anim)
	(performance_play_line "goto")
	(performance_play_line "animate")
)

(script static void (thespian_2)
	(performance_play_line "goto")
	(performance_play_line "anim")
)

(script static void (thespian_3)
	(performance_play_line "sync_enter")
)

(script static void (vig_death)
	(performance_play_line "teleport")
	(performance_play_line "anim")
)

(script static void (vig_loop)
	(performance_play_line "anim")
	(sleep_until g_loop_test)
	(performance_play_line "sleep_until")
	(performance_play_line "anim02")
	(performance_play_line "goto")
)

