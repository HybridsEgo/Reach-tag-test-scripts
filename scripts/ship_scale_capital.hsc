;*********************************************************************;
;Main Script
;*********************************************************************;
(script startup ship_scale_capital
	(fade_out 0 0 0 0)
	(fade_in 0 0 0 30)
	(vehicle_load_magic banshee_space_player "banshee_d" (player0))
	(player_control_fade_out_all_input .1)
	;(player_enable_input FALSE)
	(wake cov_ship_scale01)
	(wake effects_go)
	(wake reset)
)

(script dormant reset
	(game_save_immediate)
	(sleep 60)
	(sound_looping_start \sound\music\misc\perilous_full\perilous_full NONE 1)
	;(sound_looping_start \sound\music\misc\leo\leo NONE 1)
	(sleep (* 30 120))
	(sound_class_set_gain "" 0 30)
	(fade_out 0 0 0 30)
	(sleep 30)
	(game_revert)
)

(script command_script cov_turrets_cs
	(sleep_until
		(begin
			(sleep_until (objects_can_see_object (players) ai_current_actor 30))
			(sleep (random_range 0 40))
			(cs_shoot TRUE (player0))
			(sleep_until (not (objects_can_see_object (players) ai_current_actor 30)))
			(cs_shoot FALSE (player0))
			FALSE
		)
	)
)

(script dormant cov_ship_scale01
	(object_create anim_corvette)
	(device_set_position anim_corvette 1)
	(device_set_position anim_knife .5)
	(sleep 30)
	(object_set_scale anim_corvette 1.4 (* 30 17))
	(object_set_scale anim_knife .8 (* 30 20))
	
	(sleep (* 30 7))
	(player_control_fade_in_all_input 5)
	(object_create left_frigate)
	(object_create right_frigate)
	;(object_create middle_frigate)
	(ai_place cov_turrets)
	(cs_run_command_script cov_turrets cov_turrets_cs)
	(wake banshee_spawn)
	;(ai_place unsc_jets)
	(sleep (* 30 10))
	(object_set_scale anim_knife .9 (* 30 120))
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
			(sleep (random_range 90 200))
			(fx_ship_right_go)
			(sleep (random_range 90 200))
			(fx_ship_left_go)
			FALSE
		)
	)
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
				(sleep (random_range 30 (* 30 10)))
				(sleep (random_range 30 (* 30 10)))
				(sleep (random_range 30 (* 30 10)))
				(sleep (random_range 30 (* 30 10)))
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
				(sleep (random_range 30 (* 30 10)))
				(sleep (random_range 30 (* 30 10)))
				(sleep (random_range 30 (* 30 10)))
				(sleep (random_range 30 (* 30 10)))
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