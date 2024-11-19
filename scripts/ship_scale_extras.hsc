;*********************************************************************;
;Main Script
;*********************************************************************;
(script startup ship_scale_extras
	;(sleep 1)
	(cinematic_fade_to_gameplay)
	(set game_speed 0)
)

(script static void fly
	(set game_speed 1)
	(vehicle_load_magic banshee_space_player "banshee_d" (player0))
)

(script static void capital_ship
	(object_destroy bsp_medium_ship)
	(object_destroy right_frigate)
	(object_destroy middle_frigate)
	(object_destroy left_frigate)
	(object_create bsp_large_ship)
	(set game_speed 1)
	(vehicle_load_magic banshee_space_player "banshee_d" (player0))
	(sleep_forever banshee_spawn)
	(sleep_forever effects_go)
)