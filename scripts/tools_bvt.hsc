; Test result tracking
(global real leader_test 0.0)
(global real type_test 0.0)
(global real team_test 0.0)
(global real vehicle_test 0.0)
(global real grenade_test 0.0)
(global real sight_test 0.0)
(global real combat_test 0.0)
(global real greater_test 0.0)

; Filter ai count tracking
(global short sight_number 0)
(global short greater_number 0)

; obstacle_course count varaiables
(global short circle_count 0)
(global short pat_count 0)
(global short jump_count 0)

(global boolean inf_bsp false)
(global boolean veh_bsp false)

;-------------------------------------------------------------------------------------------------------
; STARTUP SCRIPTS
;-------------------------------------------------------------------------------------------------------

(global short obj_state 0)

(script startup ai_test_startup
     (print "Startup script - v09.04.09a")
     (print "Type ot_go to run objective tests")
     (print "Type oc_go to run obstacle course tests")
	 (ai_allegiance player covenant)
	 (ai_allegiance player human)	 
)
   
;-------------------------------------------------------------------------------------------------------
; COMMAND SCRIPTS
;-------------------------------------------------------------------------------------------------------

(script command_script sight_increment
	(set sight_number (+ sight_number 1))
	(print "sight")
)

(script command_script greater_increment
	(set greater_number (+ greater_number 1))
	(print "greater")
)

(script command_script circle_increment
	(set circle_count (+ circle_count 1))
	(print "circle")
)

(script command_script jump_increment
	(set jump_count (+ jump_count 1))
	(print "jump")
)

;-------------------------------------------------------------------------------------------------------
; DORMANT SCRIPTS
;-------------------------------------------------------------------------------------------------------

;///////////////////////OBJECTIVES TEST///////////////////////////
(script dormant leader_wait
	(sleep_until
		(AND
			(volume_test_object leader_tv sq_leader)
			(volume_test_object non_leader_tv sq_not_leader)
		)
		30 300
	)

	(if 
		(AND
			(volume_test_object leader_tv sq_leader)
			(volume_test_object non_leader_tv sq_not_leader)
		)
		(object_set_function_variable leader_globe set_globe 1.0 3.0)
		(object_set_function_variable leader_globe set_globe 0.5 3.0)
		;(set leader_test 1.0)
		;(set leader_test 0.5)
	)
)

(script dormant type_wait
	(sleep_until
		(AND
			(volume_test_object grunt_tv sq_grunt_filter)
			(volume_test_object elite_tv sq_elite_filter)
			(volume_test_object marine_tv sq_marine_filter)
		)
		30 300
	)

	(if 
		(AND
			(volume_test_object grunt_tv sq_grunt_filter)
			(volume_test_object elite_tv sq_elite_filter)
			(volume_test_object marine_tv sq_marine_filter)
		)
		(object_set_function_variable type_globe set_globe 1.0 3.0)
		(object_set_function_variable type_globe set_globe 0.5 3.0)
		;(set type_test 1.0)
		;(set type_test 0.5)
	)
)
		
(script dormant team_wait
	(sleep_until
		(AND
			(volume_test_object human_tv sq_human)
			(volume_test_object covenant_tv sq_covenant)
		)
		30 300
	)

	(if 
		(AND
			(volume_test_object human_tv sq_human)
			(volume_test_object covenant_tv sq_covenant)
		)
		(object_set_function_variable team_globe set_globe 1.0 3.0)
		(object_set_function_variable team_globe set_globe 0.5 3.0)
		;(set team_test 1.0)
		;(set team_test 0.5)
	)
)

(script dormant vehicle_wait
	(sleep_until
		(AND
			(volume_test_object vehicle_tv sq_warthog_in)
			(volume_test_object infantry_tv sq_warthog_out)
		)
		30 300
	)

	(if 
		(AND
			(volume_test_object vehicle_tv sq_warthog_in)
			(volume_test_object infantry_tv sq_warthog_out)
		)
		(object_set_function_variable vehicle_globe set_globe 1.0 3.0)
		(object_set_function_variable vehicle_globe set_globe 0.5 3.0)
		;(set vehicle_test 1.0)
		;(set vehicle_test 0.5)
	)
)
		
(script dormant sight_wait
	(set sight_number 0)
	(sleep_until
		(= sight_number 4)
		30 330
	)
	(if (= sight_number 4)
		(object_set_function_variable sight_globe set_globe 1.0 3.0)
		(object_set_function_variable sight_globe set_globe 0.5 3.0)
		;(set sight_test 1.0)
		;(set sight_test 0.5)
	)
)

(script dormant grenade_wait
	(sleep_until
		(OR
			(< (ai_living_count sq_cov_grenade_sup) 10)
			(< (ai_living_count sq_hu_grenade_sup) 5)
		)
		30 330
	)
	(if
		(OR
			(< (ai_living_count sq_cov_grenade_sup) 10)
			(< (ai_living_count sq_hu_grenade_sup) 5)
		)
		(object_set_function_variable grenade_globe set_globe 0.5 3.0)
		(object_set_function_variable grenade_globe set_globe 1.0 3.0)
		;(set grenade_test 0.5)
		;(set grenade_test 1.0)
	)
)

(script dormant combat_wait
	
	;(print "combat")
	(sleep_until
		(OR
			(< (ai_living_count sq_spartan_combat_sup) 2)
			(< (ai_living_count sq_elite_combat_sup) 2)
		)
		30 300
	)
	(if
		(OR
			(< (ai_living_count sq_spartan_combat_sup) 2)
			(< (ai_living_count sq_elite_combat_sup) 2)
		)
		(object_set_function_variable combat_globe set_globe 0.5 3.0)
		(object_set_function_variable combat_globe set_globe 1.0 3.0)
		;(set combat_test 0.5)
		;(set combat_test 1.0)
	)
)

(script dormant greater_wait
	(object_set_shield sq_greater_than 0.0)
	(object_set_shield_stun sq_greater_than 600.0)
	(object_set_shield sq_lesser_than 0.0)
	(object_set_shield_stun sq_lesser_than 600.0)
	
	(set greater_number 0)
	(sleep_until
		(>= greater_number 3)
		1	900
	)
	
	(if (>= greater_number 3)
		(object_set_function_variable greater_globe set_globe 1.0 3.0)
		(object_set_function_variable greater_globe set_globe 0.5 3.0)
		;(set greater_test 1.0)
		;(set greater_test 0.5)
	)
)




;///////////////////////OBSTACLE COURSE///////////////////////////

(script dormant jump_wait

	;*
	(sleep_until
		(AND
			(volume_test_object jump07 sq_jump_test/sp_0)
			(volume_test_object jump07 sq_jump_test/sp_1)
		)
		15 1200
	)
	
	(if 
		(AND
			(volume_test_object jump07 sq_jump_test/sp_0)
			(volume_test_object jump07 sq_jump_test/sp_1)
		)
		(object_set_function_variable jump_test_globe set_globe 1.0 3.0)
		(object_set_function_variable jump_test_globe set_globe 0.5 3.0)
	)
	*;

	;CODE THAT DOESN'T WORK YET

	;uses increment code
	
	(sleep_until
		(> jump_count 12)
		15 1200
	)
	
	(if (> jump_count 6)
		(object_set_function_variable jump_test_globe set_globe 1.0 3.0)
		(object_set_function_variable jump_test_globe set_globe 0.5 3.0)
	)
	
)

(script dormant circle_wait

	(set circle_count 0)
	
	(sleep_until
		(= circle_count 3)
		30 900
	)
	
	(if (> circle_count 2)
		(object_set_function_variable vehicle_circle_globe set_globe 1.0 3.0)
		(object_set_function_variable vehicle_circle_globe set_globe 0.5 3.0)
	)
)

(script dormant pat_wait

	(set pat_count 0)
	
	(sleep_until
		(begin
			(if (volume_test_object pat_tv01 sq_marine_pat)
				(set pat_count (+ pat_count 1))
			)
			(if (volume_test_object pat_tv02 sq_marine_pat)
				(set pat_count (+ pat_count 1))
			)
			(if (volume_test_object pat_tv03 sq_marine_pat)
				(set pat_count (+ pat_count 1))
			)
			(if (volume_test_object pat_tv04 sq_marine_pat)
				(set pat_count (+ pat_count 1))
			)
			(if (volume_test_object pat_tv05 sq_marine_pat)
				(set pat_count (+ pat_count 1))
			)
			(> pat_count 5)
		)
		35 1500
	)
	
	(if (> pat_count 5)
		(object_set_function_variable marine_pat_globe set_globe 1.0 3.0)
		(object_set_function_variable marine_pat_globe set_globe 0.5 3.0)
	)
)

(script dormant crossing_wait

	(sleep_until
		(volume_test_object bsp_cross_tv02 sq_bsp_veh_cross)
		20 900
	)
	
	(if (volume_test_object bsp_cross_tv02 sq_bsp_veh_cross)
		(set veh_bsp true)
	)
	
	(sleep_until
		(volume_test_object bsp_cross_tv02 sq_bsp_inf_cross)
		10 900
	)
	
	(if (volume_test_object bsp_cross_tv02 sq_bsp_inf_cross)
		(set inf_bsp true)
	)
	
	(if 
		(AND
			(= veh_bsp true)
			(= inf_bsp true)
		)
		(object_set_function_variable bsp_cross_globe set_globe 1.0 3.0)
		(object_set_function_variable bsp_cross_globe set_globe 0.5 3.0)
	)
)

(script dormant slip_wait
	(sleep 700)
	
	(sleep_until
		(OR
			(volume_test_object slip_surface_tv02 sq_slip_surface_pf)
			(volume_test_object slip_surface_tv03 sq_slip_surface_pf)
		)
		10 300
	)
	
	(if (OR
			(volume_test_object slip_surface_tv02 sq_slip_surface_pf)
			(volume_test_object slip_surface_tv03 sq_slip_surface_pf)
		)
		(object_set_function_variable slip_surface_globe set_globe 0.5 3.0)
		(begin
			(sleep_until 
				(volume_test_object slip_surface_tv sq_slip_surface_pf)
				45 1500
			)
			(if (volume_test_object slip_surface_tv sq_slip_surface_pf)
				(object_set_function_variable slip_surface_globe set_globe 1.0 3.0)
				(object_set_function_variable slip_surface_globe set_globe 0.5 3.0)
			)
		)
	)
)

(script dormant multi_wait

	(sleep_until 
		(volume_test_object multi_inst_tv sq_multi_inst_pf)
		10 300
	)
	
	(if (volume_test_object multi_inst_tv sq_multi_inst_pf)
		(object_set_function_variable multi_inst_globe set_globe 1.0 3.0)
		(object_set_function_variable multi_inst_globe set_globe 0.5 3.0)
	)
)

(script dormant vehicle_pf_wait

	(sleep_until
		(volume_test_object veh_pf_tv02 sq_warthog_pf)
		45 2400
	)
	
	(if (volume_test_object veh_pf_tv02 sq_warthog_pf)
		(object_set_function_variable veh_pf_globe set_globe 1.0 3.0)
		(object_set_function_variable veh_pf_globe set_globe 0.5 3.0)
	)
)


;-----------------------------------------------
;                   BVT SCRIPTS
;-----------------------------------------------

;-----------------------------------------------
;
;	These scripts are intended for incoming
;	BVT testers to quickly test simple
;	Sapien functionality by running some
;	basic scripts. All script actions should
;	be printed to let the tester know exactly
;	what was intended and where to mark a pass
;	or fail, and the intent of the specific
;	script. Hurray! a-dacall 2/13/2007
;
;-----------------------------------------------

;;objectives_test ai spawn
(script static void ai_all_ot

	(ai_place sq_leader)
	(ai_place sq_not_leader)
	(ai_place sq_elite_filter)
	(ai_place sq_grunt_filter)
	(ai_place sq_marine_filter)
	(ai_place sq_warthog_in)
	(ai_place sq_warthog_out)
	(ai_place sq_covenant)
	(ai_place sq_human)
	(ai_place sq_greater_than)
	(ai_place sq_lesser_than)
	(ai_place sq_elite_sighted)
	(ai_place sq_human_sighted)
	(ai_place sq_elite_combat_sup)
	(ai_place sq_spartan_combat_sup)
	(ai_place sq_cov_grenade_sup)
	(ai_place sq_hu_grenade_sup)
)

(script static void ot_globes_reset

	(object_set_function_variable vehicle_globe set_globe 0.0 3.0)
	(object_set_function_variable leader_globe set_globe 0.0 3.0)
	(object_set_function_variable type_globe set_globe 0.0 3.0)
	(object_set_function_variable team_globe set_globe 0.0 3.0)
	(object_set_function_variable grenade_globe set_globe 0.0 3.0)
	(object_set_function_variable greater_globe set_globe 0.0 3.0)
	(object_set_function_variable sight_globe set_globe 0.0 3.0)
	(object_set_function_variable combat_globe set_globe 0.0 3.0)
)

;;obstacle_course ai spawn
(script static void ai_all_oc

	(ai_place sq_jump_test)
	(ai_place sq_vehicle_circle_ghost)
	(ai_place sq_marine_pat)
	(ai_place sq_bsp_veh_cross)
	(ai_place sq_bsp_inf_cross)
	(ai_place sq_slip_surface_pf)
	(ai_place sq_multi_inst_pf)
	(ai_place sq_warthog_pf)
)

(script static void oc_globes_reset

	(object_set_function_variable jump_test_globe set_globe 0.0 3.0)
	(object_set_function_variable bsp_cross_globe set_globe 0.0 3.0)
	(object_set_function_variable vehicle_circle_globe set_globe 0.0 3.0)
	(object_set_function_variable slip_surface_globe set_globe 0.0 3.0)
	(object_set_function_variable multi_inst_globe set_globe 0.0 3.0)
	(object_set_function_variable marine_pat_globe set_globe 0.0 3.0)
	(object_set_function_variable veh_pf_globe set_globe 0.0 3.0)
)

;;objectives_test go
(script static void ot_go
	(ai_erase_all)
	(ot_globes_reset)
	(ai_all_ot)
	
	(wake leader_wait)
	(wake type_wait)
	(wake vehicle_wait)
	(wake team_wait)
	(wake grenade_wait)
	(wake sight_wait)
	(wake greater_wait)
	(wake combat_wait)

)

;;obstacle_course go 
(script static void oc_go
	(ai_erase_all)
	(oc_globes_reset)
	(ai_all_oc)
	
	(wake jump_wait)
	(wake circle_wait)
	(wake pat_wait)
	(wake crossing_wait)
	(wake slip_wait)
	(wake multi_wait)
	(wake vehicle_pf_wait)

)
	
(script static void bvt_go
(sleep 60)
	
)
