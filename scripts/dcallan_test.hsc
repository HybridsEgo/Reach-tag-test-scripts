;======================================
;          STARTUP SCRIPT              
;======================================

(script startup ai_test
	(wake init_vol)
	(sleep 60)
	(ai_place squad_human)
	(ai_place squad_cov)
	(print "LEZZDODISS")
)

;======================================
;     DORMANT TEST SCRIPTS             
;======================================

(script dormant init_vol
	(sleep_until (volume_test_players vol_entrance) 1)
	(wake dead_msg)
)

(script dormant dead_msg
	(sleep_until (ai_living_count squad_cov) 0)
	(sleep 90)
	(print "THEY DEED")
	(sleep 300)
	(print "dropship inc")
	(sleep 30)
	(wake script_phantom_drop)
)
	;Phantom Drop Test;
	
(script dormant script_phantom_drop
	(print "phantommmmm")
	(ai_place phantom_drop)
	(ai_place phantom_squad)
	(vehicle_load_magic (ai_vehicle_get_from_spawn_point phantom_drop/pilot) "phantom_p_lf_main" (ai_actors phantom_squad/phan1))
	(vehicle_load_magic (ai_vehicle_get_from_spawn_point phantom_drop/pilot) "phantom_p_rf_main" (ai_actors phantom_squad/phan2))
	(vehicle_load_magic (ai_vehicle_get_from_spawn_point phantom_drop/pilot) "phantom_p_lb_main" (ai_actors phantom_squad/phan3))
	(vehicle_load_magic (ai_vehicle_get_from_spawn_point phantom_drop/pilot) "phantom_p_rb_main" (ai_actors phantom_squad/phan4))
)

	;Phantom Drop;
	
(script dormant phantom_char_drop
	(object_set_phantom_power (ai_vehicle_get_from_spawn_point phantom_drop/pilot) 1)
	(sleep 15)
	(vehicle_unload (ai_vehicle_get_from_spawn_point phantom_drop/pilot) "phantom_p_lf_main")
	(sleep 15)
	(vehicle_unload (ai_vehicle_get_from_spawn_point phantom_drop/pilot) "phantom_p_rf_main")
	(sleep 15)
	(vehicle_unload (ai_vehicle_get_from_spawn_point phantom_drop/pilot) "phantom_p_lb_main")
	(sleep 15)
	(vehicle_unload (ai_vehicle_get_from_spawn_point phantom_drop/pilot) "phantom_p_rb_main")
)

	;After Phantom;
	
(script dormant after_phantom
	(sleep 100)
	(sleep_until ( < (ai_living_count phantom_squad) 1))
	(print "Phantom Squad's Dead")
	(ai_set_objective squad_human door)
	(sleep 500)
	(effect_new fx\fx_library\explosions\covenant_explosion_large\covenant_explosion_large flag1)
	(effect_new fx\fx_library\explosions\covenant_explosion_large\covenant_explosion_large flag2)
	(effect_new fx\fx_library\explosions\covenant_explosion_large\covenant_explosion_large flag3)
	(effect_new fx\fx_library\explosions\covenant_explosion_large\covenant_explosion_large flag4)
	(object_destroy_folder rocks)
	(ai_place wh_ghosts)
	(ai_place wh_squad)
	(sleep_until ( < (ai_living_count wh_squad) 1))
	(garbage_collect_now)
)


;==========================================
;           COMMAND SCRIPTS                
;==========================================

	;Phantom Command Script;
	
	(script command_script phantom_arrival
		 (cs_enable_pathfinding_failsafe TRUE)
           (cs_vehicle_speed .5)
           (cs_vehicle_boost TRUE)
           (print "headed to 0")
           (cs_fly_by phantom_path/p0)
           (print "headed to 1")
           (cs_fly_by phantom_path/p1)
           (cs_vehicle_speed .2)
           (print "headed to 2")
           (cs_fly_by phantom_path/p2)
           (print "headed to 3")
           (cs_fly_to phantom_path/p3)
           (sleep 30)
           (wake phantom_char_drop)
           (sleep_until ( < (ai_living_count phantom_drop) 2) 30 150)
           (sleep 15)
           (cs_fly_to phantom_path/p4)
           (sleep 30)
           (wake after_phantom) 
           (ai_erase phantom_drop)
                             
	)
	
	;Ghost Intro Command Scripts;
	
	(script command_script ghost_intro_1
		(cs_enable_pathfinding_failsafe TRUE)
		(cs_vehicle_boost 1)
		(cs_go_to ghost_1/p0)
	)
	
	(script command_script ghost_intro_2
		(cs_enable_pathfinding_failsafe TRUE)
		(cs_vehicle_boost 1)
		(cs_go_to ghost_2/p0)
	)
