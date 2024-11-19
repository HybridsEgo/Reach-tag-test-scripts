; =================================================================================================
; GLOBALS
; =================================================================================================
(global short g_set_all 11) ;how does this work?

; =================================================================================================
; TRENCH RUN
; =================================================================================================
(script static void ir (ins_trenchrun))
(script static void ins_trenchrun
	(if debug (print "::: insertion point: trenchrun"))
	(set g_insertion_index 1)
			
	; Snap out
	(cinematic_snap_to_black)
	
	; Switch to correct zone set unless "set_all" is loaded 
	(if (!= (current_zone_set) g_set_all)
		(begin
			(if debug (print "switching zone set: trenchrun"))
			(switch_zone_set set_trenchrun)
			(sleep 1))
			(if debug (print "switched: trenchrun")))
	
	; Launch Mongoose
	(ai_place sq_v_mongoose1_start)
	(vehicle_load_magic (ai_vehicle_get_from_spawn_point sq_v_mongoose1_start/start) "mongoose_d" (player0))
	(object_teleport (ai_vehicle_get_from_spawn_point sq_v_mongoose1_start/start) spawn_trenchrun_player0)
	(object_set_velocity (ai_vehicle_get_from_spawn_point sq_v_mongoose1_start/start) 10)

	; Teleport
	;(object_teleport (player0) spawn_trenchrun_player0)
	(object_teleport (player1) spawn_trenchrun_player1)
	(object_teleport (player2) spawn_trenchrun_player2)
	(object_teleport (player3) spawn_trenchrun_player3)
	
	(cinematic_fade_to_gameplay)
)


; =================================================================================================
; DIRT ROAD
; =================================================================================================
(script static void id (ins_dirtroad))
(script static void ins_dirtroad
	(if debug (print "::: insertion point: dirt road"))
	(set g_insertion_index 2)
				
	; Snap out
	(cinematic_snap_to_black)
	
	; Kill other scripts
	(trenchrun_kill_scripts)
	
	; Switch to correct zone set unless "set_all" is loaded 
	(if (!= (current_zone_set) g_set_all)
		(begin
			(if debug (print "switching zone sets..."))
			(switch_zone_set set_dirtroad)
			(sleep 1)))


	; Launch Mongoose
	(ai_place sq_v_mongoose1_start)
	(vehicle_load_magic (ai_vehicle_get_from_spawn_point sq_v_mongoose1_start/start) "mongoose_d" (player0))
	(object_teleport (ai_vehicle_get_from_spawn_point sq_v_mongoose1_start/start) spawn_dirtroad_player0)
	(object_set_velocity (ai_vehicle_get_from_spawn_point sq_v_mongoose1_start/start) 10)
	
	; Teleport
	;(object_teleport (player0) spawn_dirtroad_player0)
	(object_teleport (player1) spawn_dirtroad_player1)
	(object_teleport (player2) spawn_dirtroad_player2)
	(object_teleport (player3) spawn_dirtroad_player3)
	
	(cinematic_fade_to_gameplay)
)


; =================================================================================================
; SCARAB DROP
; =================================================================================================
(script static void is (ins_scarabdrop))
(script static void ins_scarabdrop
	(if debug (print "::: insertion point: scarab drop"))
	(set g_insertion_index 3)
				
	; Snap out
	(cinematic_snap_to_black)
	
	; Kill other scripts
	(trenchrun_kill_scripts)
	(dirtroad_kill_scripts)
	
	; Switch to correct zone set unless "set_all" is loaded 
	(if (!= (current_zone_set) g_set_all)
		(begin
			(if debug (print "switching zone sets..."))
			(switch_zone_set set_scarabdrop)
			(sleep 1)))

	; Launch Mongoose
	(ai_place sq_v_mongoose1_start)
	(vehicle_load_magic (ai_vehicle_get_from_spawn_point sq_v_mongoose1_start/start) "mongoose_d" (player0))
	(object_teleport (ai_vehicle_get_from_spawn_point sq_v_mongoose1_start/start) spawn_scarabdrop_player0)
	(object_set_velocity (ai_vehicle_get_from_spawn_point sq_v_mongoose1_start/start) 10)

	
	; Teleport
	;(object_teleport (player0) spawn_scarabdrop_player0)
	(object_teleport (player1) spawn_scarabdrop_player1)
	(object_teleport (player2) spawn_scarabdrop_player2)
	(object_teleport (player3) spawn_scarabdrop_player3)
	
	(cinematic_fade_to_gameplay)
)


; =================================================================================================
; BLOCKADE
; =================================================================================================
(script static void ix (ins_blockade))
(script static void ins_blockade
	(if debug (print "::: insertion point: blockade"))
	(set g_insertion_index 4)
				
	; Snap out
	(cinematic_snap_to_black)
	
	; Kill other scripts
	(trenchrun_kill_scripts)
	(dirtroad_kill_scripts)
	(scarabdrop_kill_scripts)
	
	; Switch to correct zone set unless "set_all" is loaded 
	(if (!= (current_zone_set) g_set_all)
		(begin
			(if debug (print "switching zone sets..."))
			(switch_zone_set set_blockade)
			(sleep 1)))

	; Launch Mongoose
	(ai_place sq_v_mongoose1_start)
	(vehicle_load_magic (ai_vehicle_get_from_spawn_point sq_v_mongoose1_start/start) "mongoose_d" (player0))
	(object_teleport (ai_vehicle_get_from_spawn_point sq_v_mongoose1_start/start) spawn_blockade_player0)
	(object_set_velocity (ai_vehicle_get_from_spawn_point sq_v_mongoose1_start/start) 10)
	
	; Teleport
	;(object_teleport (player0) spawn_blockade_player0)
	(object_teleport (player1) spawn_blockade_player1)
	(object_teleport (player2) spawn_blockade_player2)
	(object_teleport (player3) spawn_blockade_player3)
	
	(cinematic_fade_to_gameplay)
)


; =================================================================================================
; CAVE
; =================================================================================================
(script static void ic (ins_cave))
(script static void ins_cave
	(if debug (print "::: insertion point: cave"))
	(set g_insertion_index 5)
				
	; Snap out
	(cinematic_snap_to_black)
	
	; Kill other scripts
	(trenchrun_kill_scripts)
	(dirtroad_kill_scripts)
	(scarabdrop_kill_scripts)
	(blockade_kill_scripts)
	
	; Switch to correct zone set unless "set_all" is loaded 
	(if (!= (current_zone_set) g_set_all)
		(begin
			(if debug (print "switching zone sets..."))
			(switch_zone_set set_cave)
			(sleep 1)))
	
	; Teleport
	(object_teleport (player0) spawn_cave_player0)
	(object_teleport (player1) spawn_cave_player1)
	(object_teleport (player2) spawn_cave_player2)
	(object_teleport (player3) spawn_cave_player3)
	
	(cinematic_fade_to_gameplay)
)


; =================================================================================================
; BONEYARD
; =================================================================================================
(script static void ib (ins_boneyard))
(script static void ins_boneyard
	(if debug (print "::: insertion point: boneyard"))
	(set g_insertion_index 6)
				
	; Snap out
	(cinematic_snap_to_black)
	
	; Kill other scripts
	(trenchrun_kill_scripts)
	(dirtroad_kill_scripts)
	(scarabdrop_kill_scripts)
	(blockade_kill_scripts)
	(cave_kill_scripts)
		
	; Switch to correct zone set unless "set_all" is loaded 
	(if (!= (current_zone_set) g_set_all)
		(begin
			(if debug (print "switching zone sets..."))
			(switch_zone_set set_boneyard)
			(sleep 1)))
	
	; Teleport
	(object_teleport (player0) spawn_boneyard_player0)
	(object_teleport (player1) spawn_boneyard_player1)
	(object_teleport (player2) spawn_boneyard_player2)
	(object_teleport (player3) spawn_boneyard_player3)
	
	(cinematic_fade_to_gameplay)
)


; =================================================================================================
; SMELTER
; =================================================================================================
(script static void im (ins_smelter))
(script static void ins_smelter
	(if debug (print "::: insertion point: smelter"))
	(set g_insertion_index 7)
	
	; Snap out
	(cinematic_snap_to_black)
	
	; Kill other scripts
	(trenchrun_kill_scripts)
	(dirtroad_kill_scripts)
	(scarabdrop_kill_scripts)
	(blockade_kill_scripts)
	(cave_kill_scripts)
	(boneyard_kill_scripts)

	; Switch to correct zone set unless "set_all" is loaded 
	(if (!= (current_zone_set) g_set_all)
		(begin
			(if debug (print "switching zone sets..."))
			(switch_zone_set set_smelter)
			(sleep 1)))
	
	; Teleport
	(object_teleport (player0) spawn_smelter_player0)
	(object_teleport (player1) spawn_smelter_player1)
	(object_teleport (player2) spawn_smelter_player2)
	(object_teleport (player3) spawn_smelter_player3)
	
	(cinematic_fade_to_gameplay)
)


; =================================================================================================
; BIG GUN
; =================================================================================================
(script static void ig (ins_biggun))
(script static void ins_biggun
	(if debug (print "::: insertion point: big gun"))
	(set g_insertion_index 8)
					
	; Snap out
	(cinematic_snap_to_black)
	
	; Kill other scripts
	(trenchrun_kill_scripts)
	(dirtroad_kill_scripts)
	(scarabdrop_kill_scripts)
	(blockade_kill_scripts)
	(cave_kill_scripts)
	(boneyard_kill_scripts)
	(biggun_kill_scripts)

	; Switch to correct zone set unless "set_all" is loaded 
	(if (!= (current_zone_set) g_set_all)
		(begin
			(if debug (print "switching zone sets..."))
			(switch_zone_set set_biggun)
			(sleep 1)))
	
	; Teleport
	(object_teleport (player0) spawn_biggun_player0)
	(object_teleport (player1) spawn_biggun_player1)
	(object_teleport (player2) spawn_biggun_player2)
	(object_teleport (player3) spawn_biggun_player3)
	
	(cinematic_fade_to_gameplay)
)