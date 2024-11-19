;*********************************************************************;
;Main Script
;*********************************************************************;
(script startup ship_scale
	(wake banshee_spawn)
	(ai_place unsc_jets)
	(wake effects_go)
	(wake manage_frigate_0)
	
	(sleep_until (<= (ai_living_count turret) 0) 10)
	
	(ai_place phantoms)
)

(script static void hog01
	(vehicle_load_magic hog_player "warthog_d" (player0))
	(object_teleport hog_player flag_hog01)
)

(script static void hog02
	(vehicle_load_magic hog_player "warthog_d" (player0))
	(object_teleport hog_player flag_hog02)
)

(script dormant banshee_spawn
	(sleep_until
		(begin
			(if (<= (ai_living_count cov_banshees_right) 2)
				(banshee_right_launch)
			)
			(if (<= (ai_living_count cov_banshees_left) 2)
				(banshee_left_launch)
			)
			(sleep 150)
			FALSE
		)
	)
)

(script dormant effects_go
	;(wake fx_plasma_random)
	;(wake fx_explosion_random)
	(sleep_until
		(begin
			(sleep (random_range 30 90))
			(fx_ship_right_go)
			(sleep (random_range 30 90))
			(fx_ship_left_go)
			FALSE
		)
	)
)

(script command_script cs_stay_in_turret_mid
	(cs_shoot true)
	(cs_enable_targeting true)
	(cs_enable_looking true)
	
	(sleep_until
		(begin
			(sleep_until (volume_test_players vol_mid_frigate))
			(cs_shoot true (player0))
			(sleep_until (not (volume_test_players vol_mid_frigate)))
			(cs_shoot false (player0))
		0)
	)
)

(script dormant manage_frigate_0
	(ai_place turret)
	(object_set_scale turret 5 1)
	(object_set_scale (ai_vehicle_get_from_starting_location turret/0) 5 1)
	(object_set_scale (ai_vehicle_get_from_starting_location turret/1) 5 1)
	(object_set_scale (ai_vehicle_get_from_starting_location turret/2) 5 1)
	(object_set_scale (ai_vehicle_get_from_starting_location turret/3) 5 1)
	(ai_magically_see_object turret (player0))
	
	(sleep_until (<= (ai_living_count turret) 0) 10)
	(mid_frigate_explosion)
	(object_destroy middle_frigate)
	(ai_erase turret)
)

(script static void mid_frigate_explosion
	(effect_new "fx\scenery_fx\explosions\reach_test_explosion_large\reach_test_explosion_large.effect" fx_mid_frigate_explosion_0)
	(sleep 5)
	(effect_new "fx\scenery_fx\explosions\reach_test_explosion_large\reach_test_explosion_large.effect" fx_mid_frigate_explosion_1)
	(sleep 6)
	(effect_new "fx\scenery_fx\explosions\reach_test_explosion_large\reach_test_explosion_large.effect" fx_mid_frigate_explosion_2)
	(sleep 4)
	(effect_new "fx\scenery_fx\explosions\reach_test_explosion_large\reach_test_explosion_large.effect" fx_mid_frigate_explosion_3)
	(sleep 5)
	(effect_new "fx\scenery_fx\explosions\reach_test_explosion_large\reach_test_explosion_large.effect" fx_mid_frigate_explosion_4)
)

(script static void fx_ship_right_go
	(effect_new "\objects\levels\shared\bfg\fx\firing_fx\firing.effect" fx_ship_right01)
	(sleep (random_range 1 (* 30 2)))
	(effect_new "\objects\levels\shared\bfg\fx\firing_fx\firing.effect" fx_ship_right02)
	(sleep (random_range 1 (* 30 2)))
	(effect_new "\objects\levels\shared\bfg\fx\firing_fx\firing.effect" fx_ship_right03)
)

(script static void fx_ship_left_go
	(effect_new "\objects\levels\shared\bfg\fx\firing_fx\firing.effect" fx_ship_left01)
	(sleep (random_range 1 (* 30 2)))
	(effect_new "\objects\levels\shared\bfg\fx\firing_fx\firing.effect" fx_ship_left02)
	(sleep (random_range 1 (* 30 2)))
	(effect_new "\objects\levels\shared\bfg\fx\firing_fx\firing.effect" fx_ship_left03)
	;(effect_new "\objects\levels\shared\bfg\fx\firing_fx\firing_fizzle.effect" fx_ship_left01)
	;(effect_new "\objects\levels\shared\bfg\fx\firing_fx\firing.effect" fx_ship_left01)
)

(script static void fx
	(effect_new "\objects\levels\shared\bfg\fx\firing_fx\firing.effect" fx_test)
)

(script dormant fx_explosion_random
	(sleep_until
		(begin
			(begin_random
				(effect_new "fx\scenery_fx\explosions\reach_test_explosion_large\reach_test_explosion_large.effect" fx_plasma_exp01)
				(effect_new "fx\scenery_fx\explosions\reach_test_explosion_large\reach_test_explosion_large.effect" fx_plasma_exp02)
				(effect_new "fx\scenery_fx\explosions\reach_test_explosion_large\reach_test_explosion_large.effect" fx_plasma_exp03)
				(effect_new "fx\scenery_fx\explosions\reach_test_explosion_large\reach_test_explosion_large.effect" fx_plasma_exp04)
				(effect_new "fx\scenery_fx\explosions\reach_test_explosion_large\reach_test_explosion_large.effect" fx_plasma_exp05)
				(effect_new "fx\scenery_fx\explosions\reach_test_explosion_large\reach_test_explosion_large.effect" fx_plasma_exp06)
				(effect_new "fx\scenery_fx\explosions\reach_test_explosion_large\reach_test_explosion_large.effect" fx_plasma_exp07)
				(effect_new "fx\scenery_fx\explosions\reach_test_explosion_large\reach_test_explosion_large.effect" fx_plasma_exp08)
				(sleep (random_range 1 (* 30 2)))
				(sleep (random_range 1 (* 30 2)))
				(sleep (random_range 1 (* 30 2)))
				(sleep (random_range 1 (* 30 2)))
				(sleep (random_range 1 (* 30 2)))
				(sleep (random_range 1 (* 30 2)))
				(sleep (random_range 1 (* 30 2)))
				(sleep (random_range 1 (* 30 2)))
			)
			FALSE
		)
	)
)

(script dormant fx_plasma_random
	(sleep_until
		(begin
			(begin_random
				(begin
					(effect_new "\objects\vehicles\wraith\fx\weapon\anti_air\detonation.effect" fx_plasma_exp01)
					(sleep (random_range 1 (* 30 1)))
				)
				(begin
					(effect_new "\objects\vehicles\wraith\fx\weapon\anti_air\detonation.effect" fx_plasma_exp02)
					(sleep (random_range 1 (* 30 1)))
				)
				(begin
					(effect_new "\objects\vehicles\wraith\fx\weapon\anti_air\detonation.effect" fx_plasma_exp03)
					(sleep (random_range 1 (* 30 1)))
				)
				(begin
					(effect_new "\objects\vehicles\wraith\fx\weapon\anti_air\detonation.effect" fx_plasma_exp04)
					(sleep (random_range 1 (* 30 1)))
				)
				(begin
					(effect_new "\objects\vehicles\wraith\fx\weapon\anti_air\detonation.effect" fx_plasma_exp05)
					(sleep (random_range 1 (* 30 1)))
				)
				(begin
					(effect_new "\objects\vehicles\wraith\fx\weapon\anti_air\detonation.effect" fx_plasma_exp06)
					(sleep (random_range 1 (* 30 1)))
				)
				(begin
					(effect_new "\objects\vehicles\wraith\fx\weapon\anti_air\detonation.effect" fx_plasma_exp07)
					(sleep (random_range 1 (* 30 1)))
				)
				(begin
					(effect_new "\objects\vehicles\wraith\fx\weapon\anti_air\detonation.effect" fx_plasma_exp08)
					(sleep (random_range 1 (* 30 1)))
				)
			)
			FALSE
		)
	)
)

(script static void banshee_right_launch
	(ai_place cov_banshees_right)
	(cs_run_command_script cov_banshees_right banshee_right_launch_cs)
)

(script static void banshee_left_launch
	(ai_place cov_banshees_left)
	(cs_run_command_script cov_banshees_left banshee_left_launch_cs)
)

(script command_script banshee_right_launch_cs
	(cs_vehicle_boost TRUE)
	(sleep (random_range 10 60))
	(cs_run_command_script ai_current_actor banshee_right_fly_cs)
)

(script command_script banshee_left_launch_cs
	(cs_vehicle_boost TRUE)
	(sleep (random_range 10 60))
	(cs_run_command_script ai_current_actor banshee_left_fly_cs)
)

(script command_script banshee_right_fly_cs
	(cs_enable_pathfinding_failsafe TRUE)
	(cs_enable_moving TRUE)
	(cs_enable_looking TRUE)
	(cs_enable_targeting TRUE)
	(sleep_until
		(begin
			(begin_random
				(cs_fly_to cov_points/right01 20)
				(cs_fly_to cov_points/right02 20)
				(cs_fly_to cov_points/right03 20)
				(cs_fly_to cov_points/right04 20)
				(sleep (* 30 10))
				(sleep (* 30 10))
				(sleep (* 30 10))
				(sleep (* 30 10))
			)
			FALSE
		)
	)
)

(script command_script banshee_left_fly_cs
	(cs_enable_pathfinding_failsafe TRUE)
	(cs_enable_moving TRUE)
	(cs_enable_looking TRUE)
	(cs_enable_targeting TRUE)
	(sleep_until
		(begin
			(begin_random
				(cs_fly_to cov_points/left01 20)
				(cs_fly_to cov_points/left02 20)
				(cs_fly_to cov_points/left03 20)
				(cs_fly_to cov_points/left04 20)
				(sleep (* 30 10))
				(sleep (* 30 10))
				(sleep (* 30 10))
				(sleep (* 30 10))
			)
			FALSE
		)
	)
)

(script static void nuke_strike01
	(effect_new "fx\scenery_fx\explosions\reach_test_explosion_large\reach_test_explosion_large.effect" nuke_hit01)
	(sleep 5)
	(effect_new "fx\scenery_fx\explosions\reach_test_explosion_large\reach_test_explosion_large.effect" nuke_hit02)
	(sleep 6)
	(effect_new "fx\scenery_fx\explosions\reach_test_explosion_large\reach_test_explosion_large.effect" nuke_hit03)
	(sleep 4)
	(effect_new "fx\scenery_fx\explosions\reach_test_explosion_large\reach_test_explosion_large.effect" nuke_hit04)
	(sleep 5)
	(effect_new "fx\scenery_fx\explosions\reach_test_explosion_large\reach_test_explosion_large.effect" nuke_hit05)
)

(script static void detail
	(object_create ship_detail01)
	(object_create ship_detail02)
	(object_create ship_detail03)
)