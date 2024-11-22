;*********************************************************************;
;General
;*********************************************************************;
(global object obj_carter NONE)
(global object obj_kat NONE)
(global object obj_jorge NONE)
(global object obj_emile NONE)
(global object obj_jun NONE)
(global short s_bowl_objcon 0)
(global boolean b_evaluate 0)
(global boolean b_post_kiva 0)

;*********************************************************************;
;Main Script
;*********************************************************************;
(script startup m10_test
	(print "m10_test")
	
	(ai_allegiance human player)
	(ai_allegiance player human)
	
	(wake sc_bowl_objective_control)
)

(script static void start
	(wake sc_bowl_start)
)

(script dormant sc_bowl_start	
	;(ai_place spartan_carter)
	;(ai_place spartan_kat)
	;(ai_place spartan_jorge)
	;(ai_place spartan_emile)

	;(set obj_carter (ai_get_unit spartan_carter/carter))
	;(set obj_kat (ai_get_unit spartan_kat/kat))
	;(set obj_jorge (ai_get_unit spartan_jorge/jorge))
	;(set obj_emile (ai_get_unit spartan_emile/emile))
	
	;(unit_set_stance spartan_carter alert)
	;(unit_set_stance spartan_kat alert)
	;(unit_set_stance spartan_emile alert)
	
	(print "vig:move out")
	
	;(bring_spartans_forward 8)
	;(thespian_performance_kill_by_ai group_spartans)
	;*
	
	(print "vig:beacon")
	(thespian_performance_setup_and_begin vig_beacon "" 0)
	*;
)

(script static void sv_pickup
	(print "pickup")
)

(script static void (bring_spartans_forward (short dist))
	(ai_bring_forward obj_carter dist)
	(ai_bring_forward obj_kat dist)
	(ai_bring_forward obj_jorge dist)
	(ai_bring_forward obj_emile dist)
)

(script dormant sc_bowl_objective_control

	(sleep_until (volume_test_players tv_bowl005) 1)
		(print "set bowl objcon 05")
		(set s_bowl_objcon 05)
		
			(wake sc_spawn_spartans)	
			(sleep 1)
			(sv_spartan_waypoints)
	
	(sleep_until (volume_test_players tv_bowl010) 1)
		(print "set bowl objcon 10")
		(set s_bowl_objcon 10)
	
	(sleep_until (volume_test_players tv_bowl014) 1)
		(print "set bowl objcon 14")
		(set s_bowl_objcon 14)	
		
	(sleep_until (volume_test_players tv_bowl020) 1)
		(print "set bowl objcon 20")
		(set s_bowl_objcon 20)				
		
	(sleep_until	
		(or
			(volume_test_players tv_bowl022)
			(volume_test_players tv_bowl030)
		)
	1)
		(print "set bowl objcon 22")
		(set s_bowl_objcon 22)	

	(sleep_until	
		(or
			(volume_test_players tv_bowl024)
			(volume_test_players tv_bowl030)
		)
	1)
		(print "set bowl objcon 24")
		(set s_bowl_objcon 24)
		
	(sleep_until	
		(or
			(volume_test_players tv_bowl026)
			(volume_test_players tv_bowl030)
		)
	1)
		(print "set bowl objcon 26")
		(set s_bowl_objcon 26)		
		
	(sleep_until (volume_test_players tv_bowl030) 1)
		(print "set bowl objcon 30")
		(set s_bowl_objcon 30)	
			
			(ai_bring_forward (object_get_ai sq_emile_initial) 10)	

	(sleep_until (volume_test_players tv_bowl040) 1)
		(print "set bowl objcon 40")
		(set s_bowl_objcon 40)	
	
	(sleep_until (volume_test_players tv_bowl050) 1)
		(print "set bowl objcon 50")
		(set s_bowl_objcon 50)	
		
			(ai_bring_forward (object_get_ai sq_carter_initial) 10)
			(ai_bring_forward (object_get_ai sq_kat_initial) 10)
			(ai_bring_forward (object_get_ai sq_jorge_initial) 10)		

			(wake sc_kiva_timer)

	(sleep_until (volume_test_players tv_bowl055) 1)
		(print "set bowl objcon 55")
		(set s_bowl_objcon 55)	
	
	(sleep_until (volume_test_players tv_bowl060) 1)
		(print "set bowl objcon 60")
		(set s_bowl_objcon 60)	
				
			(ai_bring_forward (object_get_ai sq_carter_initial) 10)
			(ai_bring_forward (object_get_ai sq_kat_initial) 10)
			(ai_bring_forward (object_get_ai sq_jorge_initial) 10)		
			(ai_bring_forward (object_get_ai sq_emile_initial) 10)		
					
			(thespian_performance_kill_by_ai sq_carter_initial)
			(thespian_performance_kill_by_ai sq_kat_initial)

	(sleep_until (volume_test_players tv_bowl062) 1)
		(print "set bowl objcon 62")
		(set s_bowl_objcon 62)	
	
	(sleep_until (volume_test_players tv_bowl064) 1)
		(print "set bowl objcon 64")
		(set s_bowl_objcon 64)		

	(sleep_until (volume_test_players tv_bowl066) 1)
		(print "set bowl objcon 66")
		(set s_bowl_objcon 66)	

	(sleep_until (volume_test_players tv_bowl068) 1)
		(print "set bowl objcon 68")
		(set s_bowl_objcon 68)	
		
	(sleep_until (volume_test_players tv_bowl070) 1)
		(print "set bowl objcon 70")
		(set s_bowl_objcon 70)			
		
	(sleep_until (volume_test_players tv_bowl080) 1)
		(print "set bowl objcon 80")
		(set s_bowl_objcon 80)			
		
			(ai_place sq_civilians)		

	(sleep_until (volume_test_players tv_bowl090) 1)
		(print "set bowl objcon 90")
		(set s_bowl_objcon 90)		
		
			(ai_bring_forward (object_get_ai sq_carter_initial) 10)
			(ai_bring_forward (object_get_ai sq_kat_initial) 10)
			(ai_bring_forward (object_get_ai sq_jorge_initial) 10)		
			(ai_bring_forward (object_get_ai sq_emile_initial) 10)	
			
			(thespian_performance_kill_by_ai sq_carter_initial)
			(thespian_performance_kill_by_ai sq_kat_initial)
	
	(sleep_until (volume_test_players tv_bowl100) 1)
		(print "set bowl objcon 100")
		(set s_bowl_objcon 100)			

	(sleep_until (volume_test_players tv_bowl110) 1)
		(print "set bowl objcon 110")
		(set s_bowl_objcon 110)		

)

(script static void witness
	(ai_place sq_witness_test)
	(ai_place sq_civilians)
	(sv_kiva_door_open)
	(sleep 1)
	(set s_bowl_objcon 90)
)

(script dormant sc_spawn_spartans
	(ai_place sq_carter_initial)
	(ai_place sq_kat_initial)
	(ai_place sq_emile_initial)
	(ai_place sq_jorge_initial)
	
	(sleep 1)
	
	(wake sc_carter_alert)
	(wake sc_kat_alert)
	(wake sc_emile_alert)
	(wake sc_jorge_alert)
	
	(sleep 1)
	
	(ai_cannot_die sq_carter_initial 1)
	(ai_cannot_die sq_kat_initial 1)
	(ai_cannot_die sq_jorge_initial 1)
	(ai_cannot_die sq_emile_initial 1)
	
)

(script dormant sc_kiva_timer
	(print "timer starting")
	(sleep 450)	
	(print "15 seconds in")
	
	(sleep 450)	
	(print "30 seconds in")
	
	(set b_post_kiva 1)
)

(script dormant sc_carter_alert
	(sleep_until
		(begin		
			(sleep 10)
		
			(sleep_until (<= (ai_combat_status sq_carter_initial) 3) 1)
				(print "Carter set to alert")
				(unit_set_stance sq_carter_initial alert)
				
			(sleep_until
				(or
					(>= (ai_combat_status sq_carter_initial) 5)
					(> (object_get_recent_shield_damage (ai_get_object sq_carter_initial)) 0)
					(> (object_get_recent_body_damage (ai_get_object sq_carter_initial)) 0)
				)
			1)
				(print "Carter set to combat")
				(unit_set_stance sq_carter_initial "")
				
			(sleep 600)
		0)
	1)	
)

(script dormant sc_kat_alert
	(sleep_until
		(begin
			(sleep 10)
		
			(sleep_until (<= (ai_combat_status sq_kat_initial) 3) 1)
				(print "Kat set to alert")
				(unit_set_stance sq_kat_initial alert)
				
			(sleep_until
				(or
					(>= (ai_combat_status sq_kat_initial) 5)
					(> (object_get_recent_shield_damage (ai_get_object sq_kat_initial)) 0)
					(> (object_get_recent_body_damage (ai_get_object sq_kat_initial)) 0)
				)
			1)
				(print "Kat set to combat")
				(unit_set_stance sq_kat_initial "")
				
			(sleep 600)
		0)
	1)	
)

(script dormant sc_emile_alert
	(sleep_until
		(begin
			(sleep 10)
		
			(sleep_until (<= (ai_combat_status sq_emile_initial) 3) 1)
				(print "Emile set to alert")
				(unit_set_stance sq_emile_initial alert)
				
			(sleep_until
				(or
					(>= (ai_combat_status sq_emile_initial) 5)
					(> (object_get_recent_shield_damage (ai_get_object sq_emile_initial)) 0)
					(> (object_get_recent_body_damage (ai_get_object sq_emile_initial)) 0)
				)
			1)
				(print "Emile set to combat")
				(unit_set_stance sq_emile_initial "")
				
			(sleep 600)
		0)
	1)	
)

(script dormant sc_jorge_alert
	(sleep_until
		(begin
			(sleep 10)
		
			(sleep_until (<= (ai_combat_status sq_jorge_initial) 3) 1)
				(print "Jorge set to alert")
				(unit_set_stance sq_jorge_initial alert)
				
			(sleep_until
				(or
					(>= (ai_combat_status sq_jorge_initial) 5)
					(> (object_get_recent_shield_damage (ai_get_object sq_jorge_initial)) 0)
					(> (object_get_recent_body_damage (ai_get_object sq_jorge_initial)) 0)
				)
			1)
				(print "Jorge set to combat")
				(unit_set_stance sq_jorge_initial "")
				
			(sleep 600)
		0)
	1)	
)

(script static void sv_kiva_door_open
	(device_set_position dm_kiva01_door 0.42)
)

(script static void sv_spartan_waypoints
	;(chud_track_object_with_priority sq_carter_initial 22 carter_name)
	;(chud_track_object_with_priority sq_jorge_initial 22 jorge_name)
	;(chud_track_object_with_priority sq_kat_initial 22 kat_name)
	;(chud_track_object_with_priority sq_emile_initial 22 emile_name)	
	(wake sc_carter_waypoint)
	(wake sc_kat_waypoint)
	(wake sc_emile_waypoint)
	(wake sc_jorge_waypoint)
	
	;(f_blip_ai sq_carter_initial 5)
	;(f_blip_ai sq_jorge_initial 5)
	;(f_blip_ai sq_kat_initial 5)
	;(f_blip_ai sq_emile_initial 5)
)

(script dormant sc_carter_waypoint
	(sleep_until
		(begin
			(if	
				(or
					(objects_can_see_object (player0) (ai_get_object sq_carter_initial) 10)
					(< (objects_distance_to_object (ai_get_object sq_carter_initial) (player0)) 3)
				)
					(begin
						;(print "carter name")
						(chud_track_object_with_priority sq_carter_initial 22 carter_name)
						(sleep 90)
					)
					(begin
						;(print "waypoint")
						(chud_track_object_with_priority sq_carter_initial 5 "")
						(sleep 30)
					)
			)			
		0)
	1)
)

(script dormant sc_kat_waypoint
	(sleep_until
		(begin
			(if	
				(or
					(objects_can_see_object (player0) (ai_get_object sq_kat_initial) 10)
					(< (objects_distance_to_object (ai_get_object sq_kat_initial) (player0)) 3)
				)
					(begin
						;(print "kat name")
						(chud_track_object_with_priority sq_kat_initial 22 kat_name)
						(sleep 90)
					)
					(begin
						;(print "waypoint")
						(chud_track_object_with_priority sq_kat_initial 5 "")
						(sleep 30)
					)
			)			
		0)
	1)
)

(script dormant sc_emile_waypoint
	(sleep_until
		(begin
			(if	
				(or
					(objects_can_see_object (player0) (ai_get_object sq_emile_initial) 10)
					(< (objects_distance_to_object (ai_get_object sq_emile_initial) (player0)) 3)
				)
					(begin
						;(print "emile name")
						(chud_track_object_with_priority sq_emile_initial 22 emile_name)
						(sleep 90)
					)
					(begin
						;(print "waypoint")
						(chud_track_object_with_priority sq_emile_initial 5 "")
						(sleep 30)
					)
			)			
		0)
	1)
)

(script dormant sc_jorge_waypoint
	(sleep_until
		(begin
			(if	
				(or
					(objects_can_see_object (player0) (ai_get_object sq_jorge_initial) 10)
					(< (objects_distance_to_object (ai_get_object sq_jorge_initial) (player0)) 3)
				)
					(begin
						;(print "jorge name")
						(chud_track_object_with_priority sq_jorge_initial 22 jorge_name)
						(sleep 90)
					)
					(begin
						;(print "waypoint")
						(chud_track_object_with_priority sq_jorge_initial 5 "")
						(sleep 30)
					)
			)			
		0)
	1)
)

(script static boolean (branch_spartan (ai my_actor)) 
	(or
		(>= (ai_combat_status my_actor) 4)
		(> (object_get_recent_shield_damage (ai_get_object my_actor)) 0)
		(> (object_get_recent_body_damage (ai_get_object my_actor)) 0)
	)
)

(script static void empty_branch
	(print "empty branch")
)

(script static void empty_branch2
	(print "empty branch")
)

(script static void empty_branch3
	(print "empty branch")
)

(script static void empty_branch4
	(print "empty branch")
)

; =================================================================================================
; HOTKEY SCRIPTS
; =================================================================================================
(script static void speed
	(if (= game_speed 0)
		(begin
			(print "game speed set to 1")
			(set game_speed 1)
		)
		(begin
			(print "game speed set to 0")
			(set game_speed 0)
		)		
	)
)

(script static void thespian
	(if (= debug_performances 0)
		(begin
			(print "debug_performance is on")
			(set debug_performances 1)
			(set debug_trigger_volumes 1)
		)
		(begin
			(print "debug_performance is off")
			(set debug_performances 0)
			(set debug_trigger_volumes 0)
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
			(set ai_render_aiming_vectors 1)
			(set b_evaluate 1)
		)
		(begin
			(set ai_render_evaluations 0)
			(set ai_render_evaluations_detailed 0)
			(set ai_render_evaluations_text 0)
			(set ai_render_firing_position_statistics 0)
			(set ai_render_decisions 0)
			(set ai_render_behavior_stack 0)
			(set ai_render_aiming_vectors 0)
			(set b_evaluate 0)
		)		
	)
)
