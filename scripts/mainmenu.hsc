;*
mainmenu.hsc
oh mainmenu script, what can you not do wrong?
"shaddap!" says mainmenu.hsc
*;

;---------- variables

;* ui location
	0 == main menu
	1 == campaign lobby
	2 == matchmaking lobby
	3 == custom games lobby
	4 == editor lobby
	5 == theater lobby
	6 == activities lobby
	7 == survival lobby ("unknown" for obfuscation purposes)
*;
(global short g_location 0)

(global boolean g_elite_mandibles_hidden false)
(global boolean g_elite_armory_mandibles_hidden false)
(global boolean g_elite_pgcr_mandibles_hidden false)
(global boolean g_elite_exit_mandibles_hidden false)

;---------- local scripts

(script static void (set_location (short location))
	(set g_location location)
)

(script static boolean (sleep_location (short location) (short seconds))
 	(if
		(!= location g_location)
		(begin
			(sleep_forever)
			TRUE)
		(begin
			(sleep seconds)
			FALSE))
)

(script static boolean (update_elite_mandibles_idle (boolean mandibles_hidden))
	(if
	 	(!= mandibles_hidden g_elite_mandibles_hidden)
		(begin
		 	(if mandibles_hidden
			 	(begin
				 	(print "elite's mandibles have been hidden")
					(custom_animation_loop elite objects\characters\elite\elite "depot:rifle:idle_helmet" FALSE))
				(begin
				 	(print "elite's mandibles have become visible")
				 	(custom_animation_loop elite objects\characters\elite\elite "depot:rifle:idle" FALSE)))
			(set g_elite_mandibles_hidden mandibles_hidden))
		TRUE)
)

(script static boolean (update_elite_armory_mandibles_idle (boolean mandibles_hidden))
	(if
	 	(!= mandibles_hidden g_elite_armory_mandibles_hidden)
		(begin
		 	(if mandibles_hidden
			 	(begin
				 	(print "elite_armory's mandibles have been hidden")
					(custom_animation_loop elite_armory objects\characters\elite\elite "depot:rifle:idle_helmet" FALSE))
				(begin
				 	(print "elite_armory's mandibles have become visible")
					(custom_animation_loop elite_armory objects\characters\elite\elite "depot:rifle:idle" FALSE)))
			(set g_elite_armory_mandibles_hidden mandibles_hidden))
		TRUE)
)

(script static boolean (update_elite_pgcr_mandibles_idle (boolean mandibles_hidden))
	(if
	 	(!= mandibles_hidden g_elite_pgcr_mandibles_hidden)
		(begin
		 	(if mandibles_hidden
				(begin
					(print "elite_pgcr's mandibles have been hidden")
					(custom_animation_loop elite_pgcr objects\characters\elite\elite "depot:rifle:idle_helmet" FALSE))
				(begin
				 	(print "elite_pgcr's mandibles have become visible")
					(custom_animation_loop elite_pgcr objects\characters\elite\elite "depot:rifle:idle" FALSE)))
			(set g_elite_pgcr_mandibles_hidden mandibles_hidden))
		TRUE)
)

(script static boolean (update_elite_exit_mandibles_idle (boolean mandibles_hidden))
	(if
	 	(!= mandibles_hidden g_elite_exit_mandibles_hidden)
		(begin
		 	(if mandibles_hidden
				(begin
					(print "elite_exit's mandibles have been hidden")
					(custom_animation_loop elite_exit objects\characters\elite\elite "depot:rifle:idle_helmet" FALSE))
				(begin
				 	(print "elite_exit's mandibles have become visible")
					(custom_animation_loop elite_exit objects\characters\elite\elite "depot:rifle:idle" FALSE)))
			(set g_elite_exit_mandibles_hidden mandibles_hidden))
		TRUE)
)

; ---------- public scripts

(script startup mainmenu
	(print "mainmenu statup script")

	(camera_control on)

	(wake appearance_characters)
	
	(wake elites_mandibles_idle)

	; when we enter the UI scenario, the game will start faded to black, so we need to fade in
	(fade_out 0 0 0 0)
	(sleep 8)

	;this compensates for the 10 tick delay in camera swapping
	(fade_in 0 0 0 22)	
)

; =======================================================================================================================================================================

(script dormant elites_mandibles_idle
	(sleep_until
		(begin
			(update_elite_mandibles_idle (unit_has_mandibles_hidden elite))
			(update_elite_armory_mandibles_idle (unit_has_mandibles_hidden elite_armory))
			(update_elite_pgcr_mandibles_idle (unit_has_mandibles_hidden elite_pgcr))
			(update_elite_exit_mandibles_idle (unit_has_mandibles_hidden elite_exit))
			FALSE)
		0)
)

(script dormant appearance_characters
	(print "appearance characters [static script]")
	; place and activate appearance characters
	(pvs_set_object chief)
	(pvs_set_object chief_armory)
	(pvs_set_object chief_screenshot)
	(pvs_set_object chief_exit)
	(pvs_set_object chief_pgcr)
	
	(pvs_set_object elite)
	(pvs_set_object elite_armory)
	(pvs_set_object elite_exit)
	(pvs_set_object elite_pgcr)
	(cinematic_light_object chief target_main appearance_spartan spartan_light_anchor)
	(cinematic_light_object chief_screenshot target_main appearance_spartan spartan_screenshot_light_anchor)
	(cinematic_light_object chief_armory target_main appearance_spartan spartan_armory_light_anchor)
	(cinematic_light_object chief_exit target_main appearance_spartan spartan_exit_light_anchor)
	(cinematic_light_object chief_pgcr target_main appearance_spartan spartan_pgcr_light_anchor)
	
	(cinematic_light_object elite target_main appearance_elite elite_light_anchor)
	(cinematic_light_object elite_armory target_main appearance_elite elite_armory_light_anchor)
	(cinematic_light_object elite_exit target_main appearance_elite elite_exit_light_anchor)
	(cinematic_light_object elite_pgcr target_main appearance_elite elite_pgcr_light_anchor)
	(sleep 1)
	
	(custom_animation_loop chief objects\characters\spartans\spartans "depot:rifle:roster_idle" FALSE)
	(custom_animation_loop chief_screenshot objects\characters\spartans\spartans "depot:rifle:idle" FALSE)
	(custom_animation_loop chief_armory objects\characters\spartans\spartans "depot:unarmed:idle" FALSE)
	(custom_animation_loop chief_exit objects\characters\spartans\spartans "depot:rifle:idle" FALSE)	
	(custom_animation_loop chief_pgcr objects\characters\spartans\spartans "depot:rifle:roster_idle" FALSE)

	(if	(unit_has_mandibles_hidden elite)		
		(custom_animation_loop elite objects\characters\elite\elite "depot:rifle:idle_helmet" FALSE)
		(custom_animation_loop elite objects\characters\elite\elite "depot:rifle:idle" FALSE))
	(if	(unit_has_mandibles_hidden elite_armory)	
		(custom_animation_loop elite_armory objects\characters\elite\elite "depot:rifle:idle_helmet" FALSE)
		(custom_animation_loop elite_armory objects\characters\elite\elite "depot:rifle:idle" FALSE))
	(if	(unit_has_mandibles_hidden elite_exit)
		(custom_animation_loop elite_exit objects\characters\elite\elite "depot:rifle:idle_helmet" FALSE)
		(custom_animation_loop elite_exit objects\characters\elite\elite "depot:rifle:idle" FALSE))
	(if	(unit_has_mandibles_hidden elite_pgcr)	
		(custom_animation_loop elite_pgcr objects\characters\elite\elite "depot:rifle:idle_helmet" FALSE)
		(custom_animation_loop elite_pgcr objects\characters\elite\elite "depot:rifle:idle" FALSE))
)

; =======================================================================================================================================================================
; scripts for exit experience events
; =======================================================================================================================================================================

; spartan exit experience animations

(script static void exit_experience_flair
	(print "You didn't rank up")
		(begin_random_count 1
			(custom_animation chief_exit objects\characters\spartans\spartans "depot:rifle:end_game" TRUE)
			(custom_animation chief_exit objects\characters\spartans\spartans "depot:rifle:end_game:var1" TRUE)
		)
	(sleep (unit_get_custom_animation_time chief_exit))
	(unit_stop_custom_animation chief_exit)
	(custom_animation_loop chief_exit objects\characters\spartans\spartans "depot:rifle:end_idle" TRUE)
	(kill_thread (get_executing_running_thread))
)

(script static void subrank_up
	(print "You've gone up in subrank! Spartan model")
	(custom_animation chief_exit objects\characters\spartans\spartans "depot:rifle:sub_levelup" TRUE)
	(sleep (unit_get_custom_animation_time chief_exit))
	(unit_stop_custom_animation chief_exit)
	(custom_animation_loop chief_exit objects\characters\spartans\spartans "depot:rifle:end_idle" TRUE)
	(kill_thread (get_executing_running_thread))
)

(script static void rank_up
	(print "You've gone up in rank! Spartan model")
	(custom_animation chief_exit objects\characters\spartans\spartans "depot:rifle:levelup" TRUE)
	(sleep (unit_get_custom_animation_time chief_exit))
	(unit_stop_custom_animation chief_exit)
	(custom_animation_loop chief_exit objects\characters\spartans\spartans "depot:rifle:end_idle" TRUE)
	(kill_thread (get_executing_running_thread))
)
; =======================================================================================================================================================================
; elite exit experience animations

(script static void elite_exit_experience_flair
	(print "You didn't rank up (Elite model)")
	(begin_random_count 1
		(if	(unit_has_mandibles_hidden elite_exit)
			(custom_animation_loop elite_exit objects\characters\elite\elite "depot:rifle:end_game_helmet" TRUE)
			(custom_animation_loop elite_exit objects\characters\elite\elite "depot:rifle:end_game" TRUE))
		(if (unit_has_mandibles_hidden elite_exit)
			(custom_animation_loop elite_exit objects\characters\elite\elite "depot:rifle:end_game_helmet:var1" TRUE)
			(custom_animation_loop elite_exit objects\characters\elite\elite "depot:rifle:end_game:var1" TRUE))
		(if	(unit_has_mandibles_hidden elite_exit)
			(custom_animation_loop elite_exit objects\characters\elite\elite "depot:rifle:end_game_helmet:var2" TRUE)
			(custom_animation_loop elite_exit objects\characters\elite\elite "depot:rifle:end_game:var2" TRUE)))
	(sleep (unit_get_custom_animation_time elite_exit))
	(unit_stop_custom_animation elite_exit)
	(if (unit_has_mandibles_hidden elite_exit)
		(custom_animation_loop elite_exit objects\characters\elite\elite "depot:rifle:end_idle_helmet" TRUE)
		(custom_animation_loop elite_exit objects\characters\elite\elite "depot:rifle:end_idle" TRUE))
	(kill_thread (get_executing_running_thread))
)

(script static void elite_subrank_up
	(print "You've gone up in subrank! (Elite model)")
	(sleep 30)
	(if (unit_has_mandibles_hidden elite_exit)
		(custom_animation elite_exit objects\characters\elite\elite "depot:rifle:sub_levelup_helmet" TRUE)
		(custom_animation elite_exit objects\characters\elite\elite "depot:rifle:sub_levelup" TRUE))
	(sleep (unit_get_custom_animation_time elite_exit))
	(unit_stop_custom_animation elite_exit)
	(if (unit_has_mandibles_hidden elite_exit)
		(custom_animation_loop elite_exit objects\characters\elite\elite "depot:rifle:end_idle_helmet" TRUE)
		(custom_animation_loop elite_exit objects\characters\elite\elite "depot:rifle:end_idle" TRUE))
	(kill_thread (get_executing_running_thread))
)

(script static void elite_rank_up
	(print "You've gone up in rank! Elite model")
	(if (unit_has_mandibles_hidden elite_exit)
		(custom_animation elite_exit objects\characters\elite\elite "depot:rifle:levelup_helmet" TRUE)
	 	(custom_animation elite_exit objects\characters\elite\elite "depot:rifle:levelup" TRUE))
	(sleep (unit_get_custom_animation_time elite_exit))
	(unit_stop_custom_animation elite_exit)
	(if (unit_has_mandibles_hidden elite_exit)
		(custom_animation_loop elite_exit objects\characters\elite\elite "depot:rifle:end_idle_helmet" TRUE)
		(custom_animation_loop elite_exit objects\characters\elite\elite "depot:rifle:end_idle" TRUE))
	(kill_thread (get_executing_running_thread))
)


; =======================================================================================================================================================================
; SUPPLY DEPOT ANIMATIONS
; =======================================================================================================================================================================


(script static void default_idle_pose
	(print "default idle animations")
	(custom_animation_loop chief objects\characters\spartans\spartans "depot:rifle:roster_idle" FALSE)
	(custom_animation_loop elite objects\characters\elite\elite "depot:rifle:idle" FALSE)
	(kill_thread (get_executing_running_thread))
)

;script for exit experience initialization
(script static void exit_experience_initialization
	(print "exit experience idle animations")
	(custom_animation_loop chief_exit objects\characters\spartans\spartans "depot:rifle:idle" FALSE)
	(if (unit_has_mandibles_hidden elite_exit)
		(custom_animation_loop elite_exit objects\characters\elite\elite "depot:rifle:idle_helmet" TRUE)
		(custom_animation_loop elite_exit objects\characters\elite\elite "depot:rifle:idle" TRUE))
	(kill_thread (get_executing_running_thread))
)

; script for supply depot initialization
(script static void supply_depot_initialization
	(print "unarmed idles")
	(sleep (unit_get_custom_animation_time chief_armory))
	(custom_animation_loop chief_armory objects\characters\spartans\spartans "depot:unarmed:idle" TRUE)
	(kill_thread (get_executing_running_thread))
)

; ================================================
; scripts for supply depot specific item purchases

; HELMET SCRIPTS

(script static void anim_depot_unarmed_helmet
	(custom_animation chief_armory objects\characters\spartans\spartans "depot:unarmed:helmet" TRUE)
	(sleep (unit_get_custom_animation_time chief_armory))
	(unit_stop_custom_animation chief_armory)
)
(script static void anim_depot_unarmed_helmet_var1
	(custom_animation chief_armory objects\characters\spartans\spartans "depot:unarmed:helmet:var1" TRUE)
	(sleep (unit_get_custom_animation_time chief_armory))
	(unit_stop_custom_animation chief_armory)
)
(script static void anim_depot_unarmed_helmet_var2
	(custom_animation chief_armory objects\characters\spartans\spartans "depot:unarmed:helmet:var2" TRUE)
	(sleep (unit_get_custom_animation_time chief_armory))
	(unit_stop_custom_animation chief_armory)
)

; LEFT SHOULDER SCRIPTS

(script static void anim_depot_unarmed_left_shoulder
	(custom_animation chief_armory objects\characters\spartans\spartans "depot:unarmed:left_shoulder" TRUE)
	(sleep (unit_get_custom_animation_time chief_armory))
	(unit_stop_custom_animation chief_armory)
)

(script static void anim_depot_unarmed_left_shoulder_var1
	(custom_animation chief_armory objects\characters\spartans\spartans "depot:unarmed:left_shoulder:var1" TRUE)
	(sleep (unit_get_custom_animation_time chief_armory))
	(unit_stop_custom_animation chief_armory)
)

; RIGHT SHOULDER SCRIPTS

(script static void anim_depot_unarmed_right_shoulder
	(custom_animation chief_armory objects\characters\spartans\spartans "depot:unarmed:right_shoulder" TRUE)
	(sleep (unit_get_custom_animation_time chief_armory))
	(unit_stop_custom_animation chief_armory)
)
(script static void anim_depot_unarmed_right_shoulder_var1
	(custom_animation chief_armory objects\characters\spartans\spartans "depot:unarmed:right_shoulder" TRUE)
	(sleep (unit_get_custom_animation_time chief_armory))
	(unit_stop_custom_animation chief_armory)
)

; CHEST SCRIPTS

(script static void anim_depot_unarmed_chest
	(custom_animation chief_armory objects\characters\spartans\spartans "depot:unarmed:chest" TRUE)
	(sleep (unit_get_custom_animation_time chief_armory))
	(unit_stop_custom_animation chief_armory)
)
(script static void anim_depot_unarmed_chest_var1
	(custom_animation chief_armory objects\characters\spartans\spartans "depot:unarmed:chest:var1" TRUE)
	(sleep (unit_get_custom_animation_time chief_armory))
	(unit_stop_custom_animation chief_armory)
)
(script static void anim_depot_unarmed_chest_var2
	(custom_animation chief_armory objects\characters\spartans\spartans "depot:unarmed:chest:var2" TRUE)
	(sleep (unit_get_custom_animation_time chief_armory))
	(unit_stop_custom_animation chief_armory)
)

; WRIST SCRIPTS

(script static void anim_depot_unarmed_wrist
	(custom_animation chief_armory objects\characters\spartans\spartans "depot:unarmed:wrist" TRUE)
	(sleep (unit_get_custom_animation_time chief_armory))
	(unit_stop_custom_animation chief_armory)
)
(script static void anim_depot_unarmed_wrist_var1
	(custom_animation chief_armory objects\characters\spartans\spartans "depot:unarmed:wrist:var1" TRUE)
	(sleep (unit_get_custom_animation_time chief_armory))
	(unit_stop_custom_animation chief_armory)
)

; UTILITY SCRIPTS

(script static void anim_depot_unarmed_utility
	(custom_animation chief_armory objects\characters\spartans\spartans "depot:unarmed:thigh" TRUE)
	(sleep (unit_get_custom_animation_time chief_armory))
	(unit_stop_custom_animation chief_armory)
)

; VISOR SCRIPTS

(script static void anim_depot_unarmed_visor
	(custom_animation chief_armory objects\characters\spartans\spartans "depot:unarmed:visor_equip" TRUE)
	(sleep (unit_get_custom_animation_time chief_armory))
	(unit_stop_custom_animation chief_armory)
)

; KNEE SCRIPTS

(script static void anim_depot_unarmed_knee
	(custom_animation chief_armory objects\characters\spartans\spartans "depot:unarmed:knee" TRUE)
	(sleep (unit_get_custom_animation_time chief_armory))
	(unit_stop_custom_animation chief_armory)
)


; ================================================
; Purchase category scripts

(script static void helmet_purchase
	(print "You purchased/wore a helmet!")
	(begin_random_count 1
		(anim_depot_unarmed_helmet)
		(anim_depot_unarmed_helmet_var1)
		(anim_depot_unarmed_helmet_var2)
	)
	(supply_depot_initialization)
)

(script static void left_shoulder_purchase
	(print "You purchased/wore a left shoulder!")
	(begin_random_count 1
		(anim_depot_unarmed_left_shoulder)
		(anim_depot_unarmed_left_shoulder_var1)
	)
	(supply_depot_initialization)
)

(script static void right_shoulder_purchase
	(print "You purchased/wore a right shoulder!")
	(begin_random_count 1
		(anim_depot_unarmed_right_shoulder)
		(anim_depot_unarmed_right_shoulder_var1)
	)
	(supply_depot_initialization)
)

(script static void chest_purchase
	(print "You purchased/wore a chest piece!")
	(begin_random_count 1
		(anim_depot_unarmed_chest)
		(anim_depot_unarmed_chest_var1)
		(anim_depot_unarmed_chest_var2)
	)
	(supply_depot_initialization)
)

(script static void wrist_purchase
	(print "You purchased/wore a wrist piece!")
	(begin_random_count 1
		(anim_depot_unarmed_wrist)
		(anim_depot_unarmed_wrist_var1)
	)
	(supply_depot_initialization)
)

(script static void utility_purchase
	(print "You purchased/wore a utility piece!")
	(begin_random_count 1
		(anim_depot_unarmed_utility)
		(anim_depot_unarmed_knee)
	)
	(supply_depot_initialization)
)

(script static void visor_purchase
	(print "You purchased/wore a visor color!")
	(begin_random_count 1
		(anim_depot_unarmed_visor)
	)
	(supply_depot_initialization)
)

(script static void knee_purchase
	(print "You purchased/wore a knee piece!")
	(begin_random_count 1
		(anim_depot_unarmed_utility)
		(anim_depot_unarmed_knee)
	)
	(supply_depot_initialization)
)

; =======================================================================================================================================================================
; camera point scripts to be called in the menu camera scripts. Allows us to change which backgrounds are used in each lobby easily.
; =======================================================================================================================================================================

; takes a UI location number (see top of file)
(script static void (camera_path_custom (short location))
 	(sleep_location location 0)
	(camera_set custom_path_01 0)
	(sleep_location location 0)
	(camera_set custom_path_02 1800)
	(sleep_location location 1800)
	(camera_set custom_path_01 1800)
	(sleep_location location 1800)
)

(script static void (camera_path_title (short location))
 	(sleep_location location 0)
	(camera_set title_01 0)
	(sleep_location location 0)
	(camera_set title_02 1800)
	(sleep_location location 1800)
	(camera_set title_03 1800)
	(sleep_location location 1800)
	(camera_set title_01 1800)
	(sleep_location location 1800)
)

(script static void (camera_path_custom_no_movement (short location))
	(sleep_location location 0)
	(camera_set custom_path_01 100)
)

; takes a UI location number (see top of file)

(script static void (camera_path_campaign_act1 (short location))
 	(sleep_location location 0)
	(camera_set campaign_act1_01 0)
	(sleep_location location 0)
	(camera_set campaign_act1_02 1800)
	(sleep_location location 1800)
	(camera_set campaign_act1_03 1800)
	(sleep_location location 1800)
	(camera_set campaign_act1_04 1800)
	(sleep_location location 1800)
	(camera_set campaign_act1_01 1800)
	(sleep_location location 1800)
)


(script static void (camera_path_campaign_act2 (short location))
 	(sleep_location location 0)
	(camera_set campaign_act2_01 0)
	(sleep_location location 0)
	(camera_set campaign_act2_02 1800)
	(sleep_location location 1800)
	(camera_set campaign_act2_03 1800)
	(sleep_location location 1800)
	(camera_set campaign_act2_01 1800)
	(sleep_location location 1800)
)

(script static void (camera_path_campaign_act3 (short location))
 	(sleep_location location 0)
	(camera_set campaign_act3_01 0)
	(sleep_location location 0)
	(camera_set campaign_act3_02 1800)
	(sleep_location location 1800)
	(camera_set campaign_act3_03 1800)
	(sleep_location location 1800)
	(camera_set campaign_act3_01 1800)
	(sleep_location location 1800)
)

; takes a UI location number (see top of file)
(script static void (camera_path_matchmaking (short location))
	(sleep_location location 0)
	(camera_set matchmaking_01 0)
	(sleep_location location 10)
	(camera_set matchmaking_02 1200)
	(sleep_location location 1200)
	(camera_set matchmaking_01 1200)
	(sleep_location location 1200)
)

; takes a UI location number (see top of file)
(script static void (camera_path_editor (short location))
	(sleep_location location 0)
	(camera_set editor_path_02 0)
	(sleep_location location 10)
	(camera_set editor_path_03 1200)
	(sleep_location location 1200)
	(camera_set editor_path_02 1200)
	(sleep_location location 1200)
)

; takes a UI location number (see top of file)
(script static void (camera_path_theater (short location))
 	(sleep_location location 0)
	(camera_set theater_cam_01 0)
	(sleep_location location 10)
	(camera_set theater_cam_02 2400)
	(sleep_location location 2400)
	(camera_set theater_cam_01 2400)
	(sleep_location location 2400)
)

; takes a UI location number (see top of file)
(script static void (camera_path_spartans_kiva (short location))
 	(sleep_location location 0)
	(camera_set spartans_kiva_00 0)
	(sleep_location location 0)
	(camera_set spartans_kiva_01 1800)
	(sleep_location location 1800)
	(camera_set spartans_kiva_02 1800)
	(sleep_location location 1800)
	(camera_set spartans_kiva_03 1800)
	(sleep_location location 1800)
	(camera_set spartans_kiva_00 1800)
	(sleep_location location 1800)
)
; =======================================================================================================================================================================
; rain scripts

(script static void rain_title_start
	(print "title screen rain start")
	(weather_animate_force rain_title 1 0)
;	(sleep_until
;		(begin
;			(weather_animate_force rain_title 1 (random_range 5 15))
;			(sleep 
;				(random_range 
;					(* 30 20) 
;					(* 30 30)
;				)
;			)
;			
;			(weather_animate_force off 1 (random_range 5 15))
;			(sleep 
;				(random_range 
;					(* 30 60) 
;					(* 30 90)
;				)
;			)
;			
;			FALSE
;		)
;	)	
)

(script static void rain_act2_start
	(print "act2 rain start")
	(weather_animate_force rain_act2 1 0)
	
)

(script static void rain_theater_start
	(print "theater rain start")
	(weather_animate_force rain_theater 1 0)
;		(sleep_until
;		(begin
;			(weather_animate_force rain_theater 1 (random_range 5 15))
;			(sleep 
;				(random_range 
;					(* 30 20) 
;					(* 30 30)
;				)
;			)
;			
;			(weather_animate_force off 1 (random_range 5 15))
;			(sleep 
;				(random_range 
;					(* 30 60) 
;					(* 30 90)
;				)
;			)
;			
;			FALSE
;		)
;	)	
)

(script static void rain_stop
	(print "rain stop")
	(weather_animate_force off 1 0)
)



; =======================================================================================================================================================================
; this script is intended to be run by the title screen when it loads
(script static void mainmenu_cam
	(print "mainmenu camera")
	(set_location 0)
	(rain_title_start)
	(sleep_until
		(begin
			(camera_path_title 0)
			FALSE)
		0)
)

; this script is intended to be run by the campaign lobby ui screen when it loads
(script static void campaign_cam_act1
	(print "campaign camera act 1")
	(set_location 1)
	(rain_stop)
	(sleep_until
		(begin
			(camera_path_campaign_act1 1)
			FALSE)
		0)
)

; this script is intended to be run by the campaign lobby ui screen when it loads
(script static void campaign_cam_act2
	(print "campaign camera act 2")
	(set_location 1)
	(rain_act2_start)
	(sleep_until
		(begin
			(camera_path_campaign_act2 1)
			FALSE)
		0)
)

; this script is intended to be run by the campaign lobby ui screen when it loads
(script static void campaign_cam_act3
	(print "campaign camera act 3")
	(set_location 1)
	(rain_stop)
	(sleep_until
		(begin
			(camera_path_campaign_act3 1)
			FALSE)
		0)
)

; this script is intended to be run by the matchmaking lobby ui screen when it loads
(script static void matchmaking_cam
	(print "matchmaking camera")
	(set_location 2)
	(rain_stop)
	(sleep_until
		(begin
			(camera_path_matchmaking 2)
			FALSE)
		0)
)

; this script is intended to be run by the custom games lobby ui screen when it loads
(script static void custom_games_cam
	(print "custom games camera")
	(set_location 3)
	(rain_stop)
	(sleep_until
		(begin
			(camera_path_custom 3)
			FALSE)
		0)
)

; this script is intended to be run by the editor lobby ui screen when it loads
(script static void editor_cam
	(print "editor camera")
	(set_location 4)
	(rain_stop)
	(sleep_until
		(begin
			(camera_path_editor 4)
			FALSE)
		0)
)

; this script is intended to be run by the theater lobby ui screen when it loads
(script static void theater_cam
	(print "theater camera")
	(set_location 5)
	(rain_theater_start)
	(sleep_until
		(begin
			(camera_path_theater 5)
			FALSE)
		0)
)

; this script is intended to be run by the main menu lobby ui screen when it loads
(script static void activities_cam
	(print "activities camera")
	(set_location 6)
	(rain_stop)
	(sleep_until
		(begin
			(camera_path_spartans_kiva 6)
			FALSE)
		0)
)

; this script is intended to be run by the Firefight lobby ui screen when it loads
(script static void survival_cam
	(print "survival camera")
	(set_location 7)
	(rain_stop)
	(sleep_until
		(begin
			(camera_path_spartans_kiva 7)
			FALSE)
		0)
)
