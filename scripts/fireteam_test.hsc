;=====================================================================;
;=====globals=========================================================;
;=====================================================================;
(global short s_spawn 0)
(global short s_cleanup 0)
(global short s_weapon_type 0)
(global boolean b_evaluate 0)

;=====================================================================;
;=====main script=====================================================;
;=====================================================================;

(script startup fireteam_test
	(print "welcome to fireteam test")
	(ai_allegiance player human)
	
	(sleep 1)
	
	(wake sc_elite01)
	;(wake sc_elite02)
	(wake sc_spawner)
	(wake sc_help)
	
	(sleep 1)
	
	(wake sc_fireteam_initialize)
)

(script dormant sc_fireteam_initialize
	(sleep_until (> (player_count) 0) 1)
	
	(print "starting fireteam initialize")
	
	(ai_set_fireteam_absorber sq_marines 1)
	;(set debug_fire_teams 1)
	(ai_player_add_fireteam_squad (player0) sq_fireteam)
	(ai_player_set_fireteam_max (player0) 3)	
	(ai_player_set_fireteam_max_squad_absorb_distance (player0) 3.0)
)

(script dormant sc_spawner
	(sleep_until
		(begin
			(sleep_until 
				(and
					(<= (ai_task_count obj_fireteam/main_gate) 3) 
					(<= (ai_task_count obj_marine/main_gate) 1) 
				)	
			1)	
				(if (= s_spawn 1)
					(begin
						(cond
							((= s_weapon_type 0)
								(print "Marine assault")
								(ai_place sq_marines/marine_assault)											
								(cleanup)
							)																				
						)
						(cond
							((= s_weapon_type 1)
								(print "Marine concussion")
								(ai_place sq_marines/marine_concussion)											
								(cleanup)
							)																				
						)		
						(cond
							((= s_weapon_type 2)
								(print "Marine dmr")
								(ai_place sq_marines/marine_dmr)												
								(cleanup)
							)																				
						)		
						(cond
							((= s_weapon_type 3)
								(print "Marine flak")
								(ai_place sq_marines/marine_flak)										
								(cleanup)
							)																				
						)
						(cond
							((= s_weapon_type 4)
								(print "Marine focus")
								(ai_place sq_marines/marine_focus)										
								(cleanup)
							)																				
						)
						(cond
							((= s_weapon_type 5)
								(print "Marine grenade launcher")
								(ai_place sq_marines/marine_grenade_launcher)											
								(cleanup)
							)																				
						)
						(cond
							((= s_weapon_type 6)
								(print "Marine magnum")
								(ai_place sq_marines/marine_magnum)											
								(cleanup)
							)																				
						)
						(cond
							((= s_weapon_type 7)
								(print "Marine needle rifle")
								(ai_place sq_marines/marine_needle_rifle)										
								(cleanup)
							)																				
						)	
						(cond
							((= s_weapon_type 8)
								(print "Marine needler")
								(ai_place sq_marines/marine_needler)										
								(cleanup)
							)																				
						)
						(cond
							((= s_weapon_type 9)
								(print "Marine plasma launcher")
								(ai_place sq_marines/marine_plasma_launcher)										
								(cleanup)
							)																				
						)
						(cond
							((= s_weapon_type 10)
								(print "Marine plasma pistol")
								(ai_place sq_marines/marine_plasma_pistol)										
								(cleanup)
							)																				
						)		
						(cond
							((= s_weapon_type 11)
								(print "Marine plasma repeater")
								(ai_place sq_marines/marine_plasma_repeater)									
								(cleanup)
							)																				
						)
						(cond
							((= s_weapon_type 12)
								(print "Marine plasma rifle")
								(ai_place sq_marines/marine_plasma_rifle)									
								(cleanup)
							)																				
						)
						(cond
							((= s_weapon_type 13)
								(print "Marine rocket launcher")
								(ai_place sq_marines/marine_rocket)										
								(cleanup)
							)																				
						)
						(cond
							((= s_weapon_type 14)
								(print "Marine shotgun")
								(ai_place sq_marines/marine_shotgun)										
								(cleanup)
							)																				
						)
						(cond
							((= s_weapon_type 15)
								(print "Marine sniper rifle")
								(ai_place sq_marines/marine_sniper_rifle)									
								(cleanup)
							)																				
						)
						(cond
							((= s_weapon_type 16)
								(print "Marine spartan laser")
								(ai_place sq_marines/marine_spartan_laser)										
								(cleanup)
							)																				
						)
						(cond
							((= s_weapon_type 17)
								(print "Marine spike rifle")
								(ai_place sq_marines/marine_spike_rifle)										
								(cleanup)
							)																				
						)					
					)
				)	
				(if (= s_spawn 2)
					(begin
						(cond
							((= s_weapon_type 0)
								(print "Elite dual")
								(ai_place sq_marines/elite_dual)										
								(cleanup)
							)																				
						)
						(cond
							((= s_weapon_type 1)
								(print "Elite needle")
								(ai_place sq_marines/elite_needle)										
								(cleanup)
							)																				
						)		
						(cond
							((= s_weapon_type 2)
								(print "Elite plasma rifle")
								(ai_place sq_marines/elite_plasma)									
								(cleanup)
							)																				
						)			
						(cond
							((= s_weapon_type 3)
								(print "Elite rocket launcher")
								(ai_place sq_marines/elite_rocket)										
								(cleanup)
							)																				
						)					
						(cond
							((= s_weapon_type 4)
								(print "Elite energy sword")
								(ai_place sq_marines/elite_sword)									
								(cleanup)
							)																				
						)								
					)
				)	
				(if (= s_spawn 3)
					(begin
						(cond
							((= s_weapon_type 0)
								(begin
									(begin
										(print "Grunt Plasma Pistol")
										(ai_place sq_marines/grunt01)										
										(cleanup)
									)																			
								)
							)						
						)							
					)
				)										
		0)
	1)
)

(script dormant sc_elite01
	(ai_place sq_covenant01)
	
	(sleep 1)
	
	(sleep_until
		(begin
			(sleep_until (<= (ai_living_count sq_covenant01) 1) 1)
				(ai_place sq_covenant01)
				(sleep 300)
		0)
	1)
)

(script dormant sc_elite02
	(ai_place sq_covenant02)
	
	(sleep 1)
	
	(sleep_until
		(begin
			(sleep_until (<= (ai_living_count sq_covenant02) 1) 1)
				(ai_place sq_covenant02)
				(sleep 300)
		0)
	1)
)

(script dormant sc_help
	(sleep_until
		(begin
			(if (= s_spawn 0)
				(begin
					(print "================")
					(print "type the following into the console to spawn fireteam members")
					(print "1 for marines")
					(print "2 for elites")
					(print "3 for grunts")
					(sleep 240)
				)
			)
		0)
	1)
)

(script static void cleanup
	(garbage_collect_now)
	(set s_cleanup (+ s_cleanup 1))			
)

(script dormant sc_cleanup
	(sleep_until
		(begin
			(sleep_until (>= s_cleanup 5) 1)
				(sleep 60)
				(garbage_collect_unsafe)
				(set s_cleanup 0)
		0)
	)
)

(script static void 1
	(set s_spawn 1)
	(ai_erase sq_marines)
)

(script static void 2
	(set s_spawn 2)
	(ai_erase sq_marines)
)

(script static void 3
	(set s_spawn 3)
	(ai_erase sq_marines)
)

(script static void assault_rifle
	(if (<= s_spawn 1)
		(begin
			(set s_weapon_type 0)
			(print "assault rifle")
			(ai_erase sq_marines)
			(ai_erase sq_fireteam)
		)
	)
)

(script static void concussion_rifle
	(if (<= s_spawn 1)
		(begin
			(set s_weapon_type 1)
			(print "concussion rifle")
			(ai_erase sq_marines)
			(ai_erase sq_fireteam)
		)
	)
)

(script static void dmr
	(if (<= s_spawn 1)
		(begin
			(set s_weapon_type 2)
			(print "dmr")
			(ai_erase sq_marines)
			(ai_erase sq_fireteam)
		)
	)
)

(script static void flak_cannon
	(if (= s_spawn 1)
		(begin
			(set s_weapon_type 3)
			(print "flak cannon")
			(ai_erase sq_marines)
			(ai_erase sq_fireteam)
		)
	)
)

(script static void focus_rifle
	(if (= s_spawn 1)
		(begin
			(set s_weapon_type 4)
			(print "focus rifle")
			(ai_erase sq_marines)
			(ai_erase sq_fireteam)
		)
	)
)

(script static void grenade_launcher
	(if (= s_spawn 1)
		(begin
			(set s_weapon_type 5)
			(print "grenade")
			(ai_erase sq_marines)
			(ai_erase sq_fireteam)
		)
	)
)

(script static void magnum
	(if (<= s_spawn 1)
		(begin
			(set s_weapon_type 6)
			(print "magnum")
			(ai_erase sq_marines)
			(ai_erase sq_fireteam)
		)
	)
)

(script static void needle_rifle
	(if (<= s_spawn 1)
		(begin
			(set s_weapon_type 7)
			(print "needle rifle")
			(ai_erase sq_marines)
			(ai_erase sq_fireteam)
		)
	)
)

(script static void needler
	(if (<= s_spawn 1)
		(begin
			(set s_weapon_type 8)
			(print "needler")
			(ai_erase sq_marines)
			(ai_erase sq_fireteam)
		)
	)
)

(script static void plasma_launcher
	(if (<= s_spawn 1)
		(begin
			(set s_weapon_type 9)
			(print "plasma launcher")
			(ai_erase sq_marines)
			(ai_erase sq_fireteam)
		)
	)
)

(script static void plasma_pistol
	(if (<= s_spawn 1)
		(begin
			(set s_weapon_type 10)
			(print "plasma pistol")
			(ai_erase sq_marines)
			(ai_erase sq_fireteam)
		)
	)
)

(script static void plasma_repeater
	(if (<= s_spawn 1)
		(begin
			(set s_weapon_type 11)
			(print "plasma repeater")
			(ai_erase sq_marines)
			(ai_erase sq_fireteam)
		)
	)
)

(script static void plasma_rifle
	(if (<= s_spawn 1)
		(begin
			(set s_weapon_type 12)
			(print "plasma rifle")
			(ai_erase sq_marines)
			(ai_erase sq_fireteam)
		)
	)
)

(script static void rocket_launcher
	(if (<= s_spawn 1)
		(begin
			(set s_weapon_type 13)
			(print "rocket launcher")
			(ai_erase sq_marines)
			(ai_erase sq_fireteam)
		)
	)
)

(script static void shotgun
	(if (<= s_spawn 1)
		(begin
			(set s_weapon_type 14)
			(print "shotgun")
			(ai_erase sq_marines)
			(ai_erase sq_fireteam)
		)
	)
)

(script static void sniper_rifle
	(if (<= s_spawn 1)
		(begin
			(set s_weapon_type 15)
			(print "sniper rifle")
			(ai_erase sq_marines)
			(ai_erase sq_fireteam)
		)
	)
)

(script static void spartan_laser
	(if (<= s_spawn 1)
		(begin
			(set s_weapon_type 16)
			(print "spartan laser")
			(ai_erase sq_marines)
			(ai_erase sq_fireteam)
		)
	)
)

(script static void spike_rifle
	(if (<= s_spawn 1)
		(begin
			(set s_weapon_type 17)
			(print "spike rifle")
			(ai_erase sq_marines)
			(ai_erase sq_fireteam)
		)
	)
)

(script static void evaluate
	(if (= b_evaluate 0)
		(begin
			(set ai_render_evaluations 1)
			(set ai_render_evaluations_detailed 1)
			(set ai_render_evaluations_text 1)
			(set ai_render_firing_position_statistics 1)
			(set ai_render_decisions 1)
			(set ai_render_behavior_stack 1)
			(set b_evaluate 1)
		)
		(begin
			(set ai_render_evaluations 0)
			(set ai_render_evaluations_detailed 0)
			(set ai_render_evaluations_text 0)
			(set ai_render_firing_position_statistics 0)
			(set ai_render_decisions 0)
			(set ai_render_behavior_stack 0)
			(set b_evaluate 0)
		)		
	)
)

(script static void text
	(if (= ai_render_evaluations_text 0)
		(begin
			(set ai_render_evaluations_text 1)
		)
		(begin
			(set ai_render_evaluations_text 0)
		)		
	)
)

(script static void speed
	(if (= game_speed 0)
		(begin
			(set game_speed 1)
		)
		(begin
			(set game_speed 0)
		)		
	)
)

