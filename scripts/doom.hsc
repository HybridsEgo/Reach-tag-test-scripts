;Bridge of Doom - BSP Swap Test
;ccarney
;
;*********************************************************************;
;Main Script
;*********************************************************************;
(script startup missle_trigger
	(switch_zone_set before)
	(print "rolling")
	(wake laser_test)
	;(sleep_until (volume_test_players blow_me))
)

(script dormant laser_test
	(ai_place wraith)
	(ai_place cov_ground)
	(allow_object_to_be_lased (ai_vehicle_get_from_starting_location wraith/driver01) TRUE)
	(sleep 30)
	(wake laser_chud)
)

(script dormant laser_chud
	(print "chud")
	(set chud_debug_highlight_object (ai_vehicle_get_from_starting_location wraith/driver01))
	(set chud_debug_highlight_object_color_red 10)
	(set chud_debug_highlight_object_color_green 60)
	(set chud_debug_highlight_object_color_blue 60)
	
	(sleep_until (is_object_being_lased (ai_vehicle_get_from_starting_location wraith/driver01)) 1)
	(wake longswords)
	
	(set chud_debug_highlight_object_color_red 60)
	(set chud_debug_highlight_object_color_green 0)
	(set chud_debug_highlight_object_color_blue 0)
	
	(sleep 5)
	(set chud_debug_highlight_object_color_red 0)
	(sleep 5)
	(set chud_debug_highlight_object_color_red 60)
	(sleep 5)
	(set chud_debug_highlight_object_color_red 0)
	(sleep 5)
	(set chud_debug_highlight_object_color_red 60)
	(sleep 5)
	(set chud_debug_highlight_object_color_red 0)
	(sleep 5)
	(set chud_debug_highlight_object_color_red 60)
	(sleep 5)
	(set chud_debug_highlight_object_color_red 0)
	(sleep 5)
	(set chud_debug_highlight_object_color_red 60)

	(sleep_until (<= (object_get_health (ai_vehicle_get_from_starting_location wraith/driver01)) 0) 1)
	(print "chud done")
	(set chud_debug_highlight_object NONE)
)

(script dormant longsword01_go
	(object_create longsword01)
	(object_set_scale longsword01 .01 0)
	(sleep 1)
	(device_set_position longsword01 1)
	(object_set_scale longsword01 .4 (* 30 2))
	(sleep_until (>= (device_get_position longsword01) 1) 1)
	(object_destroy longsword01)
)

(script dormant longsword02_go
	(object_create longsword02)
	(object_set_scale longsword02 .01 0)
	(sleep 1)
	(device_set_position longsword02 1)
	(object_set_scale longsword02 .4 (* 30 2))
	(sleep_until (>= (device_get_position longsword02) 1) 1)
	(object_destroy longsword02)
)

(script dormant longsword03_go
	(object_create longsword03)
	(object_set_scale longsword03 .01 0)
	(sleep 1)
	(device_set_position longsword03 1)
	(object_set_scale longsword03 .4 (* 30 2))
	(sleep_until (>= (device_get_position longsword03) 1) 1)
	(object_destroy longsword03)
)

(script dormant longswords_all
	(wake longsword01_go)
	(sleep (random_range 5 20))
	(wake longsword02_go)
	(sleep (random_range 5 20))
	(wake longsword03_go)
)

(script dormant longswords
	(print "bombing_run")
	(sleep (random_range 20 40))
	(print "pilot: roger")
	(sound_impulse_start \sound\prototype\control_tower_dialog\mission\010ma_220_419 NONE 1)
	(sleep (random_range 60 80))
	(wake longswords_all)
	(sleep 50)
	(effect_new "fx\scenery_fx\explosions\reach_test_explosion_large\reach_test_explosion_large.effect" fx_explosion_flyby_01)
	(sleep (random_range 5 10))
	(effect_new "fx\scenery_fx\explosions\reach_test_explosion_large\reach_test_explosion_large.effect" fx_explosion_flyby_02)
	(sleep (random_range 5 10))
	(effect_new "fx\scenery_fx\explosions\reach_test_explosion_large\reach_test_explosion_large.effect" fx_explosion_flyby_03)
	(sleep (random_range 5 10))
	(effect_new "fx\scenery_fx\explosions\reach_test_explosion_large\reach_test_explosion_large.effect" fx_explosion_flyby_04)
	(sleep (random_range 5 10))
	(effect_new "fx\scenery_fx\explosions\reach_test_explosion_large\reach_test_explosion_large.effect" fx_explosion_flyby_05)
	(sleep (random_range 5 10))
	(effect_new "fx\scenery_fx\explosions\reach_test_explosion_large\reach_test_explosion_large.effect" fx_explosion_flyby_06)
	;(effect_new "objects\giants\scarab\fx\weapon\head_turret\impact.effect" fx_explosion_flyby_06)
	(unit_kill (ai_vehicle_get_from_starting_location wraith/driver01))
	;(switch_zone_set after)
	(sleep (random_range 5 10))
	(effect_new "fx\scenery_fx\explosions\reach_test_explosion_large\reach_test_explosion_large.effect" fx_explosion_flyby_07)
	(sleep (random_range 5 10))
	(effect_new "fx\scenery_fx\explosions\reach_test_explosion_large\reach_test_explosion_large.effect" fx_explosion_flyby_08)
	;(sleep 10)
	(print "blinding")
	(effect_new "levels\temp\bridge_of_doom\fx\bridge_explosion\bridge_explosion.effect" blind_me)
)

;*
chud_debug_highlight_object <object name> 
chud_debug_highlight_object_color_red <0.0-1.0>
chud_debug_highlight_object_color_green <0.0-1.0>
chud_debug_highlight_object_color_blue <0.0-1.0>
chud_debug_highlight_object_color_alpha <0.0-1.0>
*;