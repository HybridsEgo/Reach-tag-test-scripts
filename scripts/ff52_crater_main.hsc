

(script startup ff52_main

	; Loadout hack. Needs to be called before players spawn, so before any of the festivities below.
	; TODO remove this
	(loadout_team_set_respawn_loadout player loadout_infantryman)
	(loadout_team_set_respawn_loadout covenant_player loadout_combatant)

	; Snap to black 
	(if (> (player_count) 0) (cinematic_snap_to_black))
	(sleep 5)
	
	; switch to the proper zone set 
	(switch_zone_set set_firefight)

	; Setting up squad groups
	(set ai_sur_wave_spawns gr_survival_waves)
	(set ai_sur_remaining ff_remaining)
	(set s_sur_wave_squad_count 5)
	
	; Fireteam squads
	(set ai_sur_fireteam_squad0 ff_elite_fireteam0)
	(set ai_sur_fireteam_squad1 ff_elite_fireteam1)
	(set ai_sur_fireteam_squad2 ff_elite_fireteam2)
	(set ai_sur_fireteam_squad3 ff_elite_fireteam3)
	(set ai_sur_fireteam_squad4 ff_elite_fireteam4)
	
	; Wave objective
	(set ai_obj_survival ff_objective)
	
	; Phantom squads
	(set ai_sur_phantom_01 ff_phantom0)
	(set ai_sur_phantom_02 ff_phantom0)
	(set ai_sur_phantom_03 ff_phantom0)
	(set ai_sur_phantom_04 ff_phantom0)

	; Phantom load and usage parameters 
	(set k_phantom_spawn_limit 1)
	(set b_sur_phantoms_semi_random true)
	(set s_sur_dropship_type 0)
	(set s_sur_drop_side_01 "dual")
	(set s_sur_drop_side_02 "dual")
	(set s_sur_drop_side_03 "dual")
	(set s_sur_drop_side_04 "dual")
	(set b_sur_dropship_r1_initial false)
	(set b_sur_dropship_r2_initial false)
	(set b_sur_dropship_r3_initial false)
	(set b_sur_dropship_r1_primary false)
	(set b_sur_dropship_r2_primary false)
	(set b_sur_dropship_r3_primary false)
	(set b_sur_dropship_r1_boss false)
	(set b_sur_dropship_r2_boss false)
	(set b_sur_dropship_r3_boss false)
		
	; How many generators are active. 3 max, 0 disables generator defense
	(set s_sur_generator_count 0)
	
	; Game over if ANY generators die if true
	(set b_sur_generator_defend_all true)
	
	; Randomly selects the generators if true
	(set b_sur_generator_order_random false)
	
	; Set these three to named objects in your scenario
	; Recommend using tags/objects/temp/tysongr/unsc_shield_generator_anvil
	(set obj_sur_generator0 generator0)
	(set obj_sur_generator1 generator1)
	(set obj_sur_generator2 generator2)
		
	; phantom / ground parameters 
	(set b_sur_bonus_phantom TRUE)
	(set b_sur_bonus_ground FALSE)	

	; Wake the survival mode global scirpt 
	(wake survival_mode)
)


;- Objective Scripts -------------------------------------------------------------------------------------------------------

(script static void survival_refresh_follow
	(survival_refresh_sleep)
	(ai_reset_objective ff_objective/main_follow)
)

(script static void survival_hero_refresh_follow
	(survival_refresh_sleep)
	(survival_refresh_sleep)
	(ai_reset_objective ff_objective/hero_follow)
)


;- Phantom Scripts ---------------------------------------------------------------------------------------------------------

(script continuous phantom_unloader0
	(sleep_forever)
	(sleep 120)
	(f_unload_phantom v_sur_phantom_01 "dual")
)

(script continuous phantom_unloader1
	(sleep_forever)
	(sleep 210)
	(f_unload_phantom v_sur_phantom_02 "dual")
)

(script command_script cs_ff_phantom0
	(set v_sur_phantom_01 (ai_vehicle_get ai_current_actor))
	(cs_enable_pathfinding_failsafe TRUE)		

	; Move into station
	(cs_face true ps_phantom0/p1)
	(cs_fly_by ps_phantom0/p0 2)
	(cs_fly_by ps_phantom0/p1)
	(cs_face true ps_phantom0/p2_face)
	(cs_vehicle_speed 0.6)
	(cs_fly_by ps_phantom0/p2)
	
	; Move into drop position
	(cs_vehicle_speed 0.3)
	(cs_fly_to ps_phantom0/p3 0.5)

	; Unload
	(wake phantom_unloader0)
	(sleep 60)

	; Sweep back across the room
	(cs_vehicle_speed 0.1)
	(cs_fly_to ps_phantom0/p4 0.5)
	(sleep 60)
	
	; Fly out
	(cs_vehicle_speed 0.3)
	(cs_fly_by ps_phantom0/p8)
	(cs_face false ps_phantom0/p2_face)
	(cs_vehicle_speed 0.6)
	(cs_fly_by ps_phantom0/p5 2)
	(cs_vehicle_speed 1.0)
	(cs_fly_by ps_phantom0/p6)
	(cs_vehicle_boost true)
	(cs_fly_by ps_phantom0/p7)
	(ai_erase ai_current_squad)

	
;*	; Wait for it to clear
	(sleep 45)
	(sleep_until 
		(or
			(= g_hangar_phantom none) 
			(<= (object_get_health g_hangar_phantom) 0)
		)
		5
	)
	
	; Flag the hangar as occupied
	(set g_hangar_phantom v_sur_phantom_01)
	
	; Begin the unloader
	(wake phantom_unloader0)
	
	; Move in real slow like
	(cs_vehicle_speed 0.3)
	(cs_fly_by ps_phantom0/p3 1)

	; Unflag the hangar
	(set g_hangar_phantom none)

	; Continue through
	(cs_fly_by ps_phantom0/p4)

	; Move out
	(cs_vehicle_speed 1.0)
	(cs_fly_by ps_phantom0/p5)
	(cs_fly_by ps_phantom0/p6)

	; Get lost
	(ai_erase ai_current_squad)
*;
)


;*(script command_script cs_ff_phantom1
	(set v_sur_phantom_02 (ai_vehicle_get ai_current_actor))
	(cs_enable_pathfinding_failsafe TRUE)		

	; Move into station
	(cs_fly_by ps_phantom1/p0)
	(cs_fly_by ps_phantom1/p1)
	(cs_fly_to_and_face ps_phantom1/p2 ps_phantom1/p2_face 1)
	
	; Wait for it to clear
	(sleep 45)
	(sleep_until 
		(or
			(= g_hangar_phantom none) 
			(<= (object_get_health g_hangar_phantom) 0)
		)
		5
	)
	
	; Flag the hangar as occupied
	(set g_hangar_phantom v_sur_phantom_02)
	
	; Begin the unloader
	(wake phantom_unloader1)
	
	; Move in real slow like
	(cs_vehicle_speed 0.3)
	(cs_fly_by ps_phantom1/p3 1)

	; Unflag the hangar
	(set g_hangar_phantom none)

	; Continue through
	(cs_fly_by ps_phantom1/p4)

	; Move out
	(cs_vehicle_speed 1.0)
	(cs_fly_by ps_phantom1/p5)
	(cs_fly_by ps_phantom1/p6)

	; Get lost
	(ai_erase ai_current_squad)
)


(script command_script cs_ff_phantom2
	(set v_sur_phantom_03 (ai_vehicle_get ai_current_actor))
	(cs_enable_pathfinding_failsafe TRUE)		

	; Move into station
	(cs_fly_by ps_phantom2/p0)
	(cs_fly_by ps_phantom2/p1)
	(cs_fly_to_and_face ps_phantom2/p2 ps_phantom2/p2_face 1)
	
	; Wait for it to clear
	(sleep 45)
	(sleep_until 
		(or
			(= g_hangar_phantom none) 
			(<= (object_get_health g_hangar_phantom) 0)
		)
		5
	)
	
	; Flag the hangar as occupied
	(set g_hangar_phantom v_sur_phantom_03)
	
	; Begin the unloader
	(wake phantom_unloader0)
	
	; Move in real slow like
	(cs_vehicle_speed 0.3)
	(cs_fly_by ps_phantom2/p3 1)

	; Unflag the hangar
	(set g_hangar_phantom none)

	; Continue through
	(cs_fly_by ps_phantom2/p4)

	; Move out
	(cs_vehicle_speed 1.0)
	(cs_fly_by ps_phantom2/p5)
	(cs_fly_by ps_phantom2/p6)

	; Get lost
	(ai_erase ai_current_squad)
)


(script command_script cs_ff_phantom3
	(set v_sur_phantom_04 (ai_vehicle_get ai_current_actor))
	(cs_enable_pathfinding_failsafe TRUE)		

	; Move into station
	(cs_fly_by ps_phantom3/p0)
	(cs_fly_by ps_phantom3/p1)
	(cs_fly_to_and_face ps_phantom3/p2 ps_phantom3/p2_face 1)
	
	; Wait for it to clear
	(sleep 45)
	(sleep_until 
		(or
			(= g_hangar_phantom none) 
			(<= (object_get_health g_hangar_phantom) 0)
		)
		5
	)
	
	; Flag the hangar as occupied
	(set g_hangar_phantom v_sur_phantom_04)
	
	; Begin the unloader
	(wake phantom_unloader1)
	
	; Move in real slow like
	(cs_vehicle_speed 0.3)
	(cs_fly_by ps_phantom3/p3 1)

	; Unflag the hangar
	(set g_hangar_phantom none)

	; Continue through
	(cs_fly_by ps_phantom3/p4)

	; Move out
	(cs_vehicle_speed 1.0)
	(cs_fly_by ps_phantom3/p5)
	(cs_fly_by ps_phantom3/p6)

	; Get lost
	(ai_erase ai_current_squad)
)
*;