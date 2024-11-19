;=====================================================================;
;=====globals=========================================================;
;=====================================================================;


;=====================================================================;
;=====main script=====================================================;
;=====================================================================;

(script startup big_battle
	(print "welcome to the big battle")
	(ai_allegiance player human)
	
	(sleep 1)
	
	(wake sc_music_start)
)

(script dormant sc_effect_test
	;(effect_new "fx\fx_library\_placeholder\placeholder_explosion.effect" cf_test)
	(sleep_until
		(begin
			(sleep (random_range 0 60) )
			(effect_new_random "fx\fx_library\_placeholder\placeholder_explosion.effect" ps_wraith_fxs01)																				
		0)
	1)
)

(script static void sv_longsword_test
	(sv_longsword01)
	(sleep 60)
	(sv_bombrun01)
)

(script static void sv_longsword01
	(object_create_anew longsword01)
	(device_animate_position longsword01 0 0.0 0.0 0.0 TRUE)
	(device_set_position_immediate longsword01 0)
	(device_set_power longsword01 0)
	(sleep 1)
	(device_set_position_track longsword01 device:position 0)
	(device_animate_position longsword01 0.5 7.0 0.1 0.1 TRUE)
)

(script static void sv_longsword02
	(object_create_anew longsword02)
	(device_animate_position longsword02 0 0.0 0.0 0.0 TRUE)
	(device_set_position_immediate longsword02 0)
	(device_set_power longsword02 0)
	(sleep 1)
	(device_set_position_track longsword02 device:position 0)
	(device_animate_position longsword02 0.5 7.0 0.1 0.1 TRUE)
)

(script static void sv_bombrun01
	(print "start bomb run")
	(effect_new_at_point_set_point  "fx\fx_library\_placeholder\placeholder_explosion.effect" ps_longsword_fxs01 0)
	(sleep 30)
	(effect_new_at_point_set_point  "fx\fx_library\_placeholder\placeholder_explosion.effect" ps_longsword_fxs01 1)
	(sleep 20)	
	(effect_new_at_point_set_point  "fx\fx_library\_placeholder\placeholder_explosion.effect" ps_longsword_fxs01 2)
	(sleep 10)
	(effect_new_at_point_set_point  "fx\fx_library\_placeholder\placeholder_explosion.effect" ps_longsword_fxs01 3)
	(sleep 10)
	(effect_new_at_point_set_point  "fx\fx_library\_placeholder\placeholder_explosion.effect" ps_longsword_fxs01 4)
	(sleep 5)
	(effect_new_at_point_set_point  "fx\fx_library\_placeholder\placeholder_explosion.effect" ps_longsword_fxs01 5)
	(sleep 5)
	(effect_new_at_point_set_point  "fx\fx_library\_placeholder\placeholder_explosion.effect" ps_longsword_fxs01 6)
	(sleep 5)
	(object_destroy dm_scarab02)
	(damage_object dm_scarab02 "" 1000)
	(effect_new_at_point_set_point  "fx\fx_library\_placeholder\placeholder_explosion.effect" ps_longsword_fxs01 7)
	(sleep 10)
)

(script static void sv_scarab_spawn
	(object_create_anew dm_scarab01)
	(object_create_anew dm_scarab02)
	(object_create_anew dm_scarab03)
)

(script static void sv_scarab_destroy
	(object_destroy dm_scarab01)
	(object_destroy dm_scarab02)
	(object_destroy dm_scarab03)	
)

(script static void sv_scarab_drop01
	(object_create_anew dm_scarab01)
	(device_set_position_track dm_scarab01 "device:scarab_drop" 0)
	(device_animate_position dm_scarab01  1.0 9.53 1.0 1.0 FALSE)
)

(script static void sv_scarab_shuffle01
	(object_create_anew dm_scarab01)
	(sleep_until 
		(begin
			(device_set_position_track dm_scarab01 "device:idle_shuffle" 0)	
			(device_animate_position dm_scarab01 1.0 45 1.0 1.0 FALSE)
		0)
	1)
)

(script static void sv_scarab_death01
	(object_create_anew dm_scarab01)
	(device_set_position_track dm_scarab01 "device:scarab_death" 0)
	(device_animate_position dm_scarab01  1.0 9.53 1.0 1.0 FALSE)
)

(script static void sv_flock_start
	(flock_start bb_scorpion01)
	(flock_start bb_wraith01)
	(flock_start bb_warthog01)
	(flock_start bb_ghost01)
	(flock_start bb_falcon01)
)

(script dormant sc_music_start
	(sleep 600)
	(sound_looping_start "sound\prototype\for_copdahl\for_copdahl.sound_looping" none 0.75)
)

(script static void test_scarab
	(object_create dm_scarab01_lod)
	(wake sky_scarab01_start)
)

(script dormant sky_scarab01_start
	(sky_scarab_anim dm_scarab01_lod)
)

(script static void (sky_scarab_anim (device_name scarab))
	(sleep_until
		(begin
			(device_set_position_track scarab stationary_march 0)
			(device_animate_position scarab 1.0 (random_range 7 10) 1.0 1.0 TRUE)
			(sleep_until (>= (device_get_position scarab) 1) 1)
			;(effect_new_on_object_marker "objects\giants\scarab\fx\weapon\main_turret\projectile.effect" scarab <string_id>)
			(sleep (random_range 0 40))
		0)
	)
)
