;Gates Of Doom
;ccarney
;
;*********************************************************************;
;Main Script
;*********************************************************************;
(script startup drop_gates
	(print "starting")
	(sleep_until (<= (object_get_health unsc_station) 0))
	(device_set_position unsc_shield 1)
)

(script startup drop_gates_covy
	(print "starting covy")
	(device_set_position frigate 0)
	(sleep_until (<= (object_get_health covy_station) 0))
	(device_set_position frigate 1)
	(sleep 360)
	(effect_new "fx\scenery_fx\explosions\reach_test_explosion_large\reach_test_explosion_large.effect" fx_explosion_flyby_01)
	(sleep (random_range 5 10))
	(device_set_position covy_shield 1)
	(effect_new "fx\scenery_fx\explosions\reach_test_explosion_large\reach_test_explosion_large.effect" fx_explosion_flyby_02)
	(sleep (random_range 5 10))
	(effect_new "fx\scenery_fx\explosions\reach_test_explosion_large\reach_test_explosion_large.effect" fx_explosion_flyby_03)
	(sleep (random_range 5 10))
	(effect_new "fx\scenery_fx\explosions\reach_test_explosion_large\reach_test_explosion_large.effect" fx_explosion_flyby_04)
	(sleep (random_range 5 10))
	(effect_new "fx\scenery_fx\explosions\reach_test_explosion_large\reach_test_explosion_large.effect" fx_explosion_flyby_05)
)

(script continuous invicible_turrets_FTW
	(print "Jumanji")
	(sleep_until (<= (object_get_health rocky) 0))
	(sleep 600)
	(object_create_anew rocky)
)


