;*********************************************************************;
;Main Script
;*********************************************************************;
(script startup bigbattle_distance
	(print "hello world")
	(wake fx_battle)
;	(wake fx_battle_ii)
;	(wake va_crashing_longsword)
;	(wake fx_battle_side)
;	(wake cov_phantom_fly)
;	(wake cov_phantom_fly_ii)
;	(wake cov_phantom_fly_iii)
;	(wake cov_wraith)
;	(wake cov_banshee_run)
;	(wake destroy_buildings)
;	(wake cov_scarab_drop_01)
;	(wake cov_scarab_drop_02)
	(wake hum_pelican_flyby_i)
	(wake hum_pelican_flyby_ii)
;	(wake hum_warthog_run_a)
)

;*(script dormant destroy_buildings
	(sleep (random_range 60 600))
	(begin_random
		(begin
			(device_set_position destroyed_building_01 1)
			(sleep (random_range 60 (* 30 10)))
		)
		(begin
			(device_set_position destroyed_building_02 1)
			(sleep (random_range 60 (* 30 10)))
		)
		(begin
			(device_set_position destroyed_building_03 1)
			(sleep (random_range 60 (* 30 10)))
		)
		(begin
			(device_set_position destroyed_building_04 1)
			(sleep (random_range 60 (* 30 10)))
		)
		(begin
			(device_set_position destroyed_building_05 1)
			(sleep (random_range 60 (* 30 10)))
		)
		(begin
			(device_set_position destroyed_building_06 1)
			(sleep (random_range 60 (* 30 10)))
		)
		(sleep (random_range 1 (* 30 4)))
		(sleep (random_range 1 (* 30 5)))
		(sleep (random_range 1 (* 30 6)))
		(sleep (random_range 1 (* 30 7)))
		(sleep (random_range 1 (* 30 8)))
		(sleep (random_range 1 (* 30 9)))
		(sleep (random_range 1 (* 30 10)))
		(sleep (random_range 1 (* 30 11)))
		(sleep (random_range 1 (* 30 12)))
		(sleep (random_range 1 (* 30 13)))
		(sleep (random_range 1 (* 30 14)))
		(sleep (random_range 1 (* 30 15)))
	)
	(sleep 600)
	(object_destroy destroyed_building_01)
	(object_destroy destroyed_building_02)
	(object_destroy destroyed_building_03)
	(object_destroy destroyed_building_04)
	(object_destroy destroyed_building_05)
	(object_destroy destroyed_building_06)
)

(script static void fx_test
	(print "fx_test")
	;(effect_new "\objects\levels\shared\bfg\fx\firing_fx\firing.effect" fx_smoke_billow_01)
	(effect_new "fx\scenery_fx\smoke\smoke_thick_large\smoke_thick_large.effect" fx_smoke_billow_01)
)
*;

(script dormant fx_battle
	(sleep_until
		(begin
			(begin_random
				(begin
					(effect_new "fx\scenery_fx\explosions\reach_test_explosion_large\reach_test_explosion_large.effect" fx_explosion_01)
					(sleep (random_range 0 (* 15 1)))
				)
				(begin
					(effect_new "fx\scenery_fx\explosions\reach_test_explosion_large\reach_test_explosion_large.effect" fx_explosion_02)
					(sleep (random_range 0 (* 15 1)))
				)
				(begin
					(effect_new "fx\scenery_fx\explosions\reach_test_explosion_large\reach_test_explosion_large.effect" fx_explosion_03)
					(sleep (random_range 0 (* 15 1)))
				)
				(begin
					(effect_new "fx\scenery_fx\explosions\reach_test_explosion_large\reach_test_explosion_large.effect" fx_explosion_04)
					(sleep (random_range 0 (* 15 1)))
				)
				(begin
					(effect_new "fx\scenery_fx\explosions\reach_test_explosion_large\reach_test_explosion_large.effect" fx_explosion_05)
					(sleep (random_range 0 (* 15 1)))
				)
				(begin
					(effect_new "fx\scenery_fx\explosions\reach_test_explosion_large\reach_test_explosion_large.effect" fx_explosion_06)
					(sleep (random_range 0 (* 15 1)))
				)
				(begin
					(effect_new "fx\scenery_fx\explosions\reach_test_explosion_large\reach_test_explosion_large.effect" fx_explosion_07)
					(sleep (random_range 0 (* 15 1)))
				)
				(begin
					(effect_new "fx\scenery_fx\explosions\reach_test_explosion_large\reach_test_explosion_large.effect" fx_explosion_08)
					(sleep (random_range 0 (* 15 1)))
				)
				(begin
					(effect_new "fx\scenery_fx\explosions\reach_test_explosion_large\reach_test_explosion_large.effect" fx_explosion_09)
					(sleep (random_range 0 (* 15 1)))
				)
				(begin
					(effect_new "fx\scenery_fx\explosions\reach_test_explosion_large\reach_test_explosion_large.effect" fx_explosion_10)
					(sleep (random_range 0 (* 15 1)))
				)
				(begin
					(effect_new "fx\scenery_fx\explosions\reach_test_explosion_large\reach_test_explosion_large.effect" fx_explosion_11)
					(sleep (random_range 0 (* 15 1)))
				)
				(begin
					(effect_new "fx\scenery_fx\explosions\reach_test_explosion_large\reach_test_explosion_large.effect" fx_explosion_12)
					(sleep (random_range 0 (* 15 1)))
				)
				(begin
					(effect_new "fx\scenery_fx\explosions\reach_test_explosion_large\reach_test_explosion_large.effect" fx_explosion_13)
					(sleep (random_range 0 (* 15 1)))
				)
				(begin
					(effect_new "fx\scenery_fx\explosions\reach_test_explosion_large\reach_test_explosion_large.effect" fx_explosion_14)
					(sleep (random_range 0 (* 15 1)))
				)
				(begin
					(effect_new "fx\scenery_fx\explosions\reach_test_explosion_large\reach_test_explosion_large.effect" fx_explosion_15)
					(sleep (random_range 0 (* 15 1)))
				)
				(begin
					(effect_new "fx\scenery_fx\explosions\reach_test_explosion_large\reach_test_explosion_large.effect" fx_explosion_16)
					(sleep (random_range 0 (* 15 1)))
				)
								(begin
					(effect_new "fx\scenery_fx\explosions\reach_test_explosion_large\reach_test_explosion_large.effect" fx_explosion_17)
					(sleep (random_range 0 (* 15 1)))
				)
				(begin
					(effect_new "fx\scenery_fx\explosions\reach_test_explosion_large\reach_test_explosion_large.effect" fx_explosion_18)
					(sleep (random_range 0 (* 15 1)))
				)
				(begin
					(effect_new "fx\scenery_fx\explosions\reach_test_explosion_large\reach_test_explosion_large.effect" fx_explosion_19)
					(sleep (random_range 0 (* 15 1)))
				)
				(begin
					(effect_new "fx\scenery_fx\explosions\reach_test_explosion_large\reach_test_explosion_large.effect" fx_explosion_20)
					(sleep (random_range 0 (* 15 1)))
				)
				(begin
					(effect_new "fx\scenery_fx\explosions\reach_test_explosion_large\reach_test_explosion_large.effect" fx_explosion_21)
					(sleep (random_range 0 (* 15 1)))
				)
				(begin
					(effect_new "fx\scenery_fx\explosions\reach_test_explosion_large\reach_test_explosion_large.effect" fx_explosion_22)
					(sleep (random_range 0 (* 15 1)))
				)
				(begin
					(effect_new "fx\scenery_fx\explosions\reach_test_explosion_large\reach_test_explosion_large.effect" fx_explosion_23)
					(sleep (random_range 0 (* 15 1)))
				)
				(sleep (random_range 1 (* 30 4)))
				(sleep (random_range 1 (* 28 4)))
				(sleep (random_range 1 (* 27 4)))
				(sleep (random_range 1 (* 26 4)))
			)
			FALSE
		)
	)
)

;*
(script dormant fx_battle_ii
	(sleep_until
		(begin
			(begin_random
				(begin
					(effect_new "fx\scenery_fx\explosions\reach_test_explosion_large\reach_test_explosion_large.effect" fx_explosion_09)
					(sleep (random_range 0 (* 30 1)))
				)
				(begin
					(effect_new "fx\scenery_fx\explosions\reach_test_explosion_large\reach_test_explosion_large.effect" fx_explosion_10)
					(sleep (random_range 0 (* 30 1)))
				)
				(begin
					(effect_new "fx\scenery_fx\explosions\reach_test_explosion_large\reach_test_explosion_large.effect" fx_explosion_12)
					(sleep (random_range 0 (* 30 1)))
				)
				(begin
					(effect_new "fx\scenery_fx\explosions\reach_test_explosion_large\reach_test_explosion_large.effect" fx_explosion_13)
					(sleep (random_range 0 (* 30 1)))
				)
				(begin
					(effect_new "fx\scenery_fx\explosions\reach_test_explosion_large\reach_test_explosion_large.effect" fx_explosion_14)
					(sleep (random_range 0 (* 30 1)))
				)
				(begin
					(effect_new "fx\scenery_fx\explosions\reach_test_explosion_large\reach_test_explosion_large.effect" fx_explosion_15)
					(sleep (random_range 0 (* 30 1)))
				)
				(begin
					(effect_new "fx\scenery_fx\explosions\reach_test_explosion_large\reach_test_explosion_large.effect" fx_explosion_16)
					(sleep (random_range 0 (* 30 1)))
				)
				(sleep (random_range 1 (* 30 4)))
				(sleep (random_range 1 (* 28 4)))
				(sleep (random_range 1 (* 27 4)))
				(sleep (random_range 1 (* 26 4)))
			)
			FALSE
		)
	)
)

(script dormant fx_battle_side
	(sleep_until
		(begin
		(sleep 600)
		(fx_battle_side_static)
		FALSE)
	)
)

(script static void fx_battle_side_static
	(begin
		(sleep 117)
		(effect_new "fx\scenery_fx\explosions\reach_test_explosion_large\reach_test_explosion_large.effect" fx_explosion_side_01)
		(sleep 4)
		(effect_new "fx\scenery_fx\explosions\reach_test_explosion_large\reach_test_explosion_large.effect" fx_explosion_side_02)
		(sleep 6)
		(effect_new "fx\scenery_fx\explosions\reach_test_explosion_large\reach_test_explosion_large.effect" fx_explosion_side_03)
		(sleep 2)
		(effect_new "fx\scenery_fx\explosions\reach_test_explosion_large\reach_test_explosion_large.effect" fx_explosion_side_04)
		(sleep 3)
		(effect_new "fx\scenery_fx\explosions\reach_test_explosion_large\reach_test_explosion_large.effect" fx_explosion_side_05)
		(sleep 5)
		(effect_new "fx\scenery_fx\explosions\reach_test_explosion_large\reach_test_explosion_large.effect" fx_explosion_side_06)
		(sleep 47)
	)
	
)


(script dormant va_crashing_longsword
	(sleep_until
		(begin
		(sleep 600)
		(va_crashing_longsword_static)
		FALSE)
	)
)

(script static void va_crashing_longsword_static
	(print "vignette:ex:va_crashing_longsword")
	
	;(sound_impulse_start "sound\levels\070_waste\070_longsword_crash\longsword_lead_in.sound" ex_longsword_intro_sound 1)
	;(sleep 15)
	
	(object_create cin_longsword)
	(scenery_animation_start_relative cin_longsword objects\vehicles\longsword\cinematics\vignettes\070vc_crashing_longsword\070vc_crashing_longsword "070vc_crashing_longsword" va_anchor)
	(sleep 70)
	(effect_new "fx\scenery_fx\explosions\reach_test_explosion_large\reach_test_explosion_large.effect" fx_explosion_flyby_01)
	(sleep 5)
	(effect_new "fx\scenery_fx\explosions\reach_test_explosion_large\reach_test_explosion_large.effect" fx_explosion_flyby_02)
	(sleep 7)
	(effect_new "fx\scenery_fx\explosions\reach_test_explosion_large\reach_test_explosion_large.effect" fx_explosion_flyby_03)
	(sleep 3)
	(effect_new "fx\scenery_fx\explosions\reach_test_explosion_large\reach_test_explosion_large.effect" fx_explosion_flyby_04)
	(sleep 4)
	(effect_new "fx\scenery_fx\explosions\reach_test_explosion_large\reach_test_explosion_large.effect" fx_explosion_flyby_05)
	(sleep 6)
	(effect_new "fx\scenery_fx\explosions\reach_test_explosion_large\reach_test_explosion_large.effect" fx_explosion_flyby_06)
	(sleep 7)
	(effect_new "fx\scenery_fx\explosions\reach_test_explosion_large\reach_test_explosion_large.effect" fx_explosion_flyby_07)
	(sleep 5)
	(effect_new "fx\scenery_fx\explosions\reach_test_explosion_large\reach_test_explosion_large.effect" fx_explosion_flyby_08)
	(sleep 7)
	(effect_new "fx\scenery_fx\explosions\reach_test_explosion_large\reach_test_explosion_large.effect" fx_explosion_flyby_09)
	(sleep 3)
	(effect_new "fx\scenery_fx\explosions\reach_test_explosion_large\reach_test_explosion_large.effect" fx_explosion_flyby_10)
	(sleep 4)
	(effect_new "fx\scenery_fx\explosions\reach_test_explosion_large\reach_test_explosion_large.effect" fx_explosion_flyby_11)
	(sleep 6)
	(effect_new "fx\scenery_fx\explosions\reach_test_explosion_large\reach_test_explosion_large.effect" fx_explosion_flyby_12)
	(sleep 7)
	(effect_new "fx\scenery_fx\explosions\reach_test_explosion_large\reach_test_explosion_large.effect" fx_explosion_flyby_13)
	(sleep 30)
	(object_destroy cin_longsword)
	
	(player_effect_set_max_rotation 0 0.5 0.5)
	(player_effect_set_max_rumble 1 1)
	(player_effect_start 0.50 0.05)
	(sleep 20)
	(player_effect_stop 0.5)
)

(script dormant cov_wraith
	(ai_place cov_wraith_lod)
	(cs_run_command_script cov_wraith_lod cs_wraith_ai)
)

(script command_script cs_wraith_ai
	(sleep_until
		(begin
			(begin_random
				(begin
					(sleep (random_range 30 150))
					(cs_shoot_point true cov_wraith_targets/p0)
				)
				(begin
					(sleep (random_range 30 150))
					(cs_shoot_point true cov_wraith_targets/p1)
				)
				(begin
					(sleep (random_range 30 150))
					(cs_shoot_point true cov_wraith_targets/p2)
				)
				(begin
					(sleep (random_range 30 150))
					(cs_shoot_point true cov_wraith_targets/p3)
				)
				(begin
					(sleep (random_range 30 150))
					(cs_shoot_point true cov_wraith_targets/p4)
				)
				(begin
					(sleep (random_range 30 150))
					(cs_shoot_point true cov_wraith_targets/p5)
				)
				(begin
					(sleep (random_range 30 150))
					(cs_shoot_point true cov_wraith_targets/p6)
				)
				(begin
					(sleep (random_range 30 150))
					(cs_shoot_point true cov_wraith_targets/p7)
				)
				(begin
					(sleep (random_range 30 150))
					(cs_shoot_point true cov_wraith_targets/p8)
				)
			)
			FALSE
		)
	)
)

(script dormant cov_phantom_fly
	(sleep_until
		(begin
			(sleep_until (= (device_get_position destroyed_building_02) 1))
			(ai_place cov_phantom)
			(cs_run_command_script cov_phantom cs_phantom_flyby)
			(sleep_until (<= (ai_living_count cov_phantom) 0))
			(sleep (random_range 300 2400))
			FALSE
		)
	)
)

(script command_script cs_phantom_flyby
;	(cs_shoot false)
;	(ai_set_blind ai_current_actor true)
	(cs_enable_pathfinding_failsafe true)
	(cs_enable_targeting true)
	(cs_enable_looking true)
	(cs_fly_to cov_phantom_targets/p0)
	(cs_fly_to cov_phantom_targets/p1)
	(cs_fly_to cov_phantom_targets/p2)
	(cs_fly_to cov_phantom_targets/p3)
;	(cs_fly_to_and_face pts_bb_front_phantom/drop pts_bb_front_phantom/face)
;	(sleep 60)
;	(vehicle_unload (ai_vehicle_get_from_starting_location cov_bb_front_phantom/pilot) "phantom_lc")
;	(sleep 60)
;	(set b_bb_wraith_dropped 1)
;	(cs_vehicle_speed 0.7)
;	(cs_face_player true)
;	(cs_fly_to pts_bb_front_phantom/p8)
;	(sleep_until (>= s_bb_progression 40))
;	(ai_set_blind ai_current_actor false)
	(ai_erase cov_phantom) 
)

(script dormant cov_phantom_fly_ii
	(sleep_until
		(begin
			(ai_place cov_phantom_ii)
			(cs_run_command_script cov_phantom_ii cs_phantom_flyby_ii)
			(sleep_until (<= (ai_living_count cov_phantom_ii) 0))
			(sleep (random_range 300 1800))
			FALSE
		)
	)
)

(script command_script cs_phantom_flyby_ii
	(cs_enable_pathfinding_failsafe true)
	(cs_enable_targeting true)
	(cs_enable_looking true)
	(cs_fly_to cov_phantom_targets_ii/p0)
	(cs_fly_to cov_phantom_targets_ii/p1)
	(cs_fly_to cov_phantom_targets_ii/p2)
	(cs_fly_to cov_phantom_targets_ii/p3)
	(ai_erase cov_phantom_ii) 
)

(script dormant cov_phantom_fly_iii
	(sleep_until
		(begin
			(sleep_until (= (device_get_position destroyed_building_06) 1))
			(sleep (random_range 600 3600))
			(ai_place cov_phantom_iii)
			(cs_run_command_script cov_phantom_iii cs_phantom_flyby_iii)
			(sleep_until (<= (ai_living_count cov_phantom_iii) 0))
			FALSE
		)
	)
)

(script command_script cs_phantom_flyby_iii
	(cs_enable_pathfinding_failsafe true)
	(cs_enable_targeting true)
	(cs_enable_looking true)
	(cs_fly_to cov_phantom_targets_iii/p0)
	(cs_fly_to cov_phantom_targets_iii/p1)
	(cs_fly_to cov_phantom_targets_iii/p2)
	(cs_fly_to cov_phantom_targets_iii/p3)
	(object_damage_damage_section (ai_vehicle_get_from_starting_location cov_phantom_iii/pilot) "death" 4000)
	(cs_fly_to cov_phantom_targets_iii/p4)
	(ai_erase cov_phantom_iii)
	(sleep 240)
	(add_recycling_volume garbage01 1 1)

)
*;

(script dormant hum_pelican_flyby_i
	(print "pelican_test")
	(sleep_until
		(begin
;			(sleep (random_range 600 3600))
			(ai_place hum_pelican_i)
			(cs_run_command_script hum_pelican_i cs_pelican_flyby_i)
			(sleep_until (<= (ai_living_count hum_pelican_i) 0))
			FALSE
		)
	)
)

(script command_script cs_pelican_flyby_i
	(cs_enable_pathfinding_failsafe true)
	(cs_enable_targeting true)
	(cs_enable_looking true)
	(cs_fly_to hum_pelican_targets_i/p0)
	(cs_fly_to hum_pelican_targets_i/p1)
	(cs_fly_to hum_pelican_targets_i/p2)
	(cs_fly_to hum_pelican_targets_i/p3)
	(ai_erase hum_pelican_i)
	(sleep 240)
	(add_recycling_volume garbage01 1 1)

)

(script dormant hum_pelican_flyby_ii
	(print "pelican_test_ii")
	(sleep_until
		(begin
;			(sleep (random_range 600 3600))
			(ai_place hum_pelican_ii)
			(cs_run_command_script hum_pelican_ii cs_pelican_flyby_ii)
			(sleep_until (<= (ai_living_count hum_pelican_ii) 0))
			FALSE
		)
	)
)

(script command_script cs_pelican_flyby_ii
	(cs_enable_pathfinding_failsafe true)
	(cs_enable_targeting true)
	(cs_enable_looking true)
	(cs_fly_to hum_pelican_targets_ii/p0)
	(cs_fly_to hum_pelican_targets_ii/p1)
	(cs_fly_to hum_pelican_targets_ii/p2)
	(cs_fly_to hum_pelican_targets_ii/p3)
	(ai_erase hum_pelican_ii)
	(sleep 240)
	(add_recycling_volume garbage01 1 1)
)

;*
(script dormant hum_warthog_run_a
	(print "warthog_test_run_a")
	(sleep_until
		(begin
;			(sleep (random_range 600 3600))
			(ai_place hum_warthog_a)
			(cs_run_command_script hum_warthog_a cs_warthog_run_a)
			(sleep_until (<= (ai_living_count hum_warthog_a) 0))
			FALSE
		)
	)
)

(script command_script cs_warthog_run_a
	(cs_enable_pathfinding_failsafe true)
	(cs_enable_targeting true)
	(cs_enable_looking true)
	(cs_fly_to hum_warthog_targets_a/p0)
	(cs_fly_to hum_warthog_targets_a/p1)
	(cs_fly_to hum_warthog_targets_a/p2)
	(cs_fly_to hum_warthog_targets_a/p3)
	(ai_erase hum_warthog_a)
	(sleep 240)
	(add_recycling_volume garbage01 1 1)
)

(script dormant cov_banshee_run
	(sleep_until
		(begin
			(ai_place banshees)
			(cs_run_command_script banshees cs_banshee_flyby)
			(sleep (random_range 300 1800))
			FALSE
		)
	)
)


(script command_script cs_banshee_flyby
	(cs_vehicle_boost true)
	(sleep 400)
	(ai_erase ai_current_actor)
)

(script dormant cov_scarab_drop_01
	(sleep 400)
	(ai_place cov_scarab)
	(vs_custom_animation cov_scarab/driver01 FALSE objects\giants\scarab\cinematics\perspectives\100pb_scarab_orbital\100pb_scarab_orbital "100pb_cin_scarab_b_1" FALSE)
	(sleep (unit_get_custom_animation_time (ai_get_unit cov_scarab/driver01)))
	(vs_stop_custom_animation cov_scarab/driver01)
	(ai_force_active cov_scarab/driver01 TRUE)
)

(script dormant cov_scarab_drop_02
	(sleep 1200)
	(ai_place cov_scarab_ii)
	(vs_custom_animation cov_scarab_ii/driver01 FALSE objects\giants\scarab\cinematics\perspectives\100pb_scarab_orbital\100pb_scarab_orbital "100pb_cin_scarab_b_1" FALSE)
	(sleep (unit_get_custom_animation_time (ai_get_unit cov_scarab_ii/driver01)))
	(vs_stop_custom_animation cov_scarab_ii/driver01)
	(ai_force_active cov_scarab_ii/driver01 TRUE)
)

;"fx\scenery_fx\explosions\reach_test_explosion_large\reach_test_explosion_large.effect"
;"fx\scenery_fx\explosions\human_explosion_large\human_explosion_large.effect"
*;
