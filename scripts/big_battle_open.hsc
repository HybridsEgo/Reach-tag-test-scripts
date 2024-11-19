;*********************************************************************;
;General
;*********************************************************************;
(script startup big_battle_open
	(fade_out 0 0 0 0)
	(wake fx_bfg_go)
	(wake fx_frigate_exp_go)
	(wake fx_fire_exp_go)
	(wake fx_wraith_mortar01_go)
	(wake fx_wraith_mortar02_go)
	(wake BFG01_go)
	(wake BFG02_go)
	(wake BFG03_go)
	(sleep 30)
	(cinematic_fade_to_gameplay)
	
	;(ai_place marines_hornets01)
	(ai_place cov_banshees01)
	;(object_set_scale (ai_vehicle_get_from_starting_location marines_hornets01/driver01) .01 0)
	;(sleep 30)
	;(object_set_scale (ai_vehicle_get_from_starting_location marines_hornets01/driver01) 1 (* 30 5))
	(vehicle_load_magic (ai_vehicle_get_from_starting_location marines_player_hog/driver01) "warthog_d" (player0))
	
	(wake encounter01)
	(wake encounter02)
)

(script dormant encounter01
	(wake fx_wraith_mortar01_player)
	(sleep_until (volume_test_players vol_encounter01_start) 5)
	(sleep_forever fx_wraith_mortar01_player)
	(sleep_forever fx_wraith_mortar01_go)
	(flock_delete "flock_hogs01")
	(flock_delete "flock_tanks01")
	(sleep 1)
	(ai_place cov_wraith01)
	(ai_place cov_ghosts01)
	(sleep 1)
	(ai_place marines_hogs01)
	(ai_place marines_tank01)
)

(script dormant encounter02
	(sleep_until 
		(or
			(volume_test_players vol_encounter02_start)
			(<= (ai_living_count cov01_obj) 0)
		)
	5)
	;(sleep_forever fx_wraith_mortar02_go)
	(wake fx_wraith_mortar02_player)
)

;*********************************************************************;
;FX
;*********************************************************************;
(script dormant fx_bfg_go
	(sleep_until
		(begin
			(sleep (random_range 30 120))
			(effect_new "\objects\levels\shared\bfg\fx\firing_fx\firing.effect" fx_bfg01)
			(sleep (random_range 30 120))
			(effect_new "\objects\levels\shared\bfg\fx\firing_fx\firing.effect" fx_bfg02)
			(sleep (random_range 30 120))
			(effect_new "\objects\levels\shared\bfg\fx\firing_fx\firing.effect" fx_bfg03)
			FALSE
		)
	)
)

(script dormant fx_frigate_exp_go
	(sleep_until
		(begin
			(effect_new "\objects\vehicles\wraith\fx\weapon\anti_air\detonation.effect" fx_frigate_exp01)
			(sleep (random_range 10 40))
			(effect_new "\objects\vehicles\wraith\fx\weapon\anti_air\detonation.effect" fx_frigate_exp02)
			(sleep (random_range 10 40))
			(effect_new "\objects\vehicles\wraith\fx\weapon\anti_air\detonation.effect" fx_frigate_exp03)
			(sleep (random_range 10 40))
			(effect_new "\objects\vehicles\wraith\fx\weapon\anti_air\detonation.effect" fx_frigate_exp04)
			(sleep (random_range 10 40))
			(effect_new "\objects\vehicles\wraith\fx\weapon\anti_air\detonation.effect" fx_frigate_exp05)
			(sleep (random_range 10 40))
			FALSE
		)
	)
)

(script dormant fx_fire_exp_go
	(sleep_until
		(begin
			(effect_new "fx\scenery_fx\explosions\human_explosion_huge\human_explosion_huge.effect" fx_fire_exp01)
			(sleep (random_range 10 40))
			(effect_new "fx\scenery_fx\explosions\human_explosion_huge\human_explosion_huge.effect" fx_fire_exp02)
			(sleep (random_range 10 40))
			(effect_new "fx\scenery_fx\explosions\human_explosion_huge\human_explosion_huge.effect" fx_fire_exp03)
			(sleep (random_range 10 40))
			(effect_new "fx\scenery_fx\explosions\human_explosion_huge\human_explosion_huge.effect" fx_fire_exp04)
			(sleep (random_range 10 40))
			FALSE
		)
	)
)

(script dormant fx_wraith_mortar01_player
	(sleep 50)
	(sleep_until
		(begin
			(sleep (random_range 60 90))
			(print "fire")
			(effect_new_random "\fx\test\wraith_mortar.effect" fx_wraith_mortar01_player)
			FALSE
		)
	)
)

(script dormant fx_wraith_mortar02_player
	(sleep_until
		(begin
			(sleep (random_range 60 90))
			(print "fire")
			(effect_new_random "\fx\test\wraith_mortar.effect" fx_wraith_mortar02_player)
			FALSE
		)
	)
)

(script dormant fx_wraith_mortar01_go
	(sleep_until
		(begin
			(sleep (random_range 5 80))
			(print "fire")
			(effect_new_random "\fx\test\wraith_mortar.effect" fx_wraith_mortar01)
			FALSE
		)
	)
)

(script dormant fx_wraith_mortar02_go
	(sleep_until
		(begin
			(sleep (random_range 5 80))
			(print "fire")
			(effect_new_random "\fx\test\wraith_mortar.effect" fx_wraith_mortar02)
			FALSE
		)
	)
)

(script static void fx
	(effect_new "\fx\test\wraith_mortar.effect" fx_test)
	;(sleep 30)
	;(effect_new "\objects\vehicles\wraith\fx\weapon\anti_infantry\projectile.effect" fx_test)
	;(sleep 30)
	;(effect_new "\objects\vehicles\wraith\fx\weapon\mortar\impact.effect" fx_test)
)

;*********************************************************************;
;BFGs
;*********************************************************************;
(script dormant BFG01_go
	(objects_attach bfg01_base "turret" bfg01_turret "")
	(BFG_setup bfg01_turret bfg01_base)
	(sleep_until
		(begin
			(begin
				(sleep (random_range 50 110))
				(BFG_fire bfg01_turret bfg01_base)
				;(BFG01_fire)
			)
			FALSE
		)
	)
)

(script dormant BFG02_go
	(objects_attach bfg02_base "turret" bfg02_turret "")
	(BFG_setup bfg02_turret bfg02_base)
	(sleep_until
		(begin
			(begin
				(sleep (random_range 50 110))
				(BFG_fire bfg02_turret bfg02_base)
				;(BFG01_fire)
			)
			FALSE
		)
	)
)

(script dormant BFG03_go
	(objects_attach bfg03_base "turret" bfg03_turret "")
	(BFG_setup bfg03_turret bfg03_base)
	(sleep_until
		(begin
			(begin
				(sleep (random_range 50 110))
				(BFG_fire bfg03_turret bfg03_base)
				;(BFG01_fire)
			)
			FALSE
		)
	)
)

(script static void (BFG_setup (device turret) (device base))
	(device_set_position_track base position 0)
	(device_set_overlay_track base power)
	(device_set_position_track turret position 0)
	(device_set_overlay_track turret power)
	(device_animate_overlay base .4 0 0 0)
	(device_animate_overlay turret 0 0 0 0)
)

(script static void (BFG_fire (device turret) (device base))
	(print "BFG fire")
	(effect_new_on_object_marker "objects\levels\shared\bfg\fx\firing_fx\bfg_foot_dust.effect" base "fx_foot")
	
	(device_animate_overlay turret 1 3 0 0)
	(sleep 60)
	
	(device_animate_position base 1 .35 0.2 .5 TRUE)
	(sleep (random_range 20 40))
	;look around to keep it moving:
	(device_animate_overlay base (real_random_range .4 .43) (random_range 2 5) .5 .5)
	;call effects
	(sleep 140)
	(if (> (object_get_health base) 0)
		(device_animate_position base 0 1.2 0.25 1 true)
	)
	
	(print "vent done")
	(device_animate_overlay turret 0 0 0 0)
)