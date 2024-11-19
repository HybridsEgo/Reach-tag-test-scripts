;=====================================================================;
;=====globals=========================================================;
;=====================================================================;
(global boolean b_phantom 0)
(global boolean b_rally 0)
(global boolean b_carter 0)
(global short s_combat_dialog 0)

;=====================================================================;
;=====main script=====================================================;
;=====================================================================;

(script startup ai_test
	(print "cue_test")
	(ai_allegiance player human)
	
	(sleep 1)	
	
	(wake sc_spawn)
	
	(sleep 1)
	
	(wake sc_master_script)

)

(script dormant sc_spawn
	(ai_place sq_marine01)
	(ai_place sq_marine_runner)
	(ai_place sq_marine_sgt)
	
	(sleep 1)
	
	(ai_place sq_phantom01)
	
	(sleep 90)
	
	(ai_place sq_elite01)
		
)

(script dormant sc_master_script
	(sleep 300)
	
	(wake sc_marine_communication)
	
	(sleep 30)
	
	(wake sc_marine_cower)
	
	(sleep 30)
	
	(cs_run_command_script sq_marine_runner cs_marine_flee)
	
	(sleep 360)
	
	(ai_place sq_carter)
	(wake sc_carter_rally)
	
)

(script dormant sc_marine_communication
	(print "Noble Actual, this is detachment bravo.")
	(sleep 30)
	(print "We are pinned down")
	(sleep 30)
	(print "Multiple Elite squads with Phantom support")
	(sleep 60)
	(print "Repeat:  We are pinned down by Elite squads")
	(sleep 45)
	(print "Need backup support ASAP")
	(sleep 30) 
)

(script dormant sc_marine_cower
	
	(sleep (random_range 30 45))
	
	(sleep_until
		(begin
			(set s_combat_dialog (random_range 0 2) )
				(cond 
					((= s_combat_dialog 0) 
						(print "THIS WILL BE COMBAT DIALOG: What the hell was command thinking?!")
					)
					((= s_combat_dialog 1) 
						(print "THIS WILL BE COMBAT DIALOG: How the fuck do we get out of this?")
					)
					((= s_combat_dialog 2) 
						(print "THIS WILL BE COMBAT DIALOG: Brass screwed the pooch again")
					)
				)		
			(sleep (random_range 30 180))
		(= b_rally 1))
	1)
)

(script dormant sc_carter_rally

	(cs_run_command_script sq_carter cs_carter)
		
	(sleep_until (= b_carter 1) 1)

	(print "I will take care of the Phantom, you boys help clean up the Elites when I am done!")
	(ai_prefer_target (object_get_ai sq_phantom01) TRUE)
	(sleep 45)
	(print "We got your back sir!")
	(sleep 15)
	(print "Yeaaahhh!!!")
	(sleep 30)
	(set b_rally 1)
)

(script command_script cs_carter

	(cs_go_to ps_carter/p0)
	
	(set b_carter 1)
)

(script command_script cs_marine_flee

	(sleep (random_range 150 210))
	
	(print "They are everywhere!")
	(sleep 30)
	(print "Ahhhhhh!")
	(unit_set_current_vitality (ai_get_unit sq_marine_runner) 0.1 0)
	(unit_set_maximum_vitality (ai_get_unit sq_marine_runner) 0.1 0)
	(cs_go_to ps_marine_flee/p0)
	(cs_go_to ps_marine_flee/p1)
	(cs_go_to ps_marine_flee/p2)
	
	(ai_kill ai_current_squad)
)

(script command_script cs_phantom01
	(cs_fly_to ps_phantom01/p0 1)
	(cs_fly_to ps_phantom01/p1 1)
	(cs_fly_to_and_face ps_phantom01/p2 ps_phantom01/p3 1)
	(sleep_until (= b_phantom 1) 1)
)










































;* commenting these out, cuz they ain't real!

(script dormant sc_test_vignette
	;carter, kat, emile, and jorge all move to their spots as a part
	;of the base AI Cue elements
	
	;we likely need a new type of script to allow exit conditions
	;OR
	;we need a new type of condition for a dormant script that allows us
	;to exit it prematurely
	(exit_condition 
		(> s_test_objective_control 1)
		;player runs ahead and carter has line of dialog to confirm
		(cue_play DIALOG_CARTER00) ;charge!
	)
	
	(exit_condition
		(or
			(> (ai_combat_status ACTOR_CARTER) 3)
			(> (ai_combat_status ACTOR_KAT) 3)
			(> (ai_combat_status ACTOR_EMILE) 3)
			(> (ai_combat_status ACTOR_JORGE) 3)
		)
		;the combat status of Noble Company gets too high
		(cue_play DIALOG_CARTER05) ;
	)
	
	;waiting until the player gets close to Noble Company
	(sleep_until (= s_test_objective_control 1) 1)
		;carter tells everyone to hold up and give the fist hand gesture
		(ai_cue_play DIALOG_CARTER01)
		(ai_cue_play ANIM_CARTER_FIST)
	(sleep 120)
		;carter gives some orders
		(ai_cue_block DIALOG_CARTER02)
		(ai_cue_block DIALOG_CARTER03)
		(ai_cue_block DIALOG_CARTER04)
	(sleep 60)
		;noble company responds
		(ai_cue_delay ANIM_JORGE_NOD (30 60))
		(ai_cue_delay DIALOG_KAT01 (15 45))
		(ai_cue_delay DIALOG_EMILE01 (0 30))
	(sleep 60)
		;carter orders people to move out
		(ai_cue_play DIALOG_CARTER05)
		(ai_cue_block ANIM_CARTER_POINT)
	;sets objective control to 2, so that the Spartans move to next task
	(set s_test_objective_control 2)	
)

(script dormant sc_civilian_kiva_vignette
	;this script is triggered when the player hits a trigger volume
	;near Sorvad's Kiva
	
	(exit_condition 
		(> s_test_objective_control 1)
		;player runs past the kiva and towards the next space
		(cue_play DIALOG_CARTER00) ;damn that kid!
	)
	
	(exit_condition
		(or
			(> (ai_combat_status ACTOR_CARTER) 3)
			(> (ai_combat_status ACTOR_KAT) 3)
			(> (ai_combat_status ACTOR_EMILE) 3)
			(> (ai_combat_status ACTOR_JORGE) 3)
		)
		;the combat status of Noble Company gets too high
		(cue_play DIALOG_CARTER05) ;it is too hot here!
	)
	
	(exit_condition
		(< (unit_get_health (ai_get_unit sq_kiva_civilians)) 1)
		;the player starts killing civilians
		(begin
			(cue_play DIALOG_CARTER07) ;He has gone rogue!
			(ai_allegiance_remove (player) (human))
		)
	)
	
	;some script to make the motion tracker blips more pronounced
	(motion_tracker_blip)
	
	;training text script to call attention to your motion tracker
	(cinematic_set_title ct_training01)
	
	;carter calls out the blips for the player
	(cue_block DIALOG_CARTER10) ;we have unknown movement
	(cue_block DIALOG_CARTER20) ;keep your eyes peeled
	
	(sleep 150)
	
	;carter orders people to locations
	(cue_block DIALOG_CARTER30) ;Jorge get on that structure
	(cue_block DIALOG_CARTER40) ;Emile set up a perimeter
	(cue_block DIALOG_CARTER50) ;Kat stack on that door
	(cue_play DIALOG_CARTER60) ;Noble 6, on me
	(cue_play ANIM_CATER_POINT) ;Carter point at player and then at himself
	
	;increase a short to change tasks, which assign new AI_Cues to the team
	(set s_kiva 1)
	
	;player gets a tutorial message to open the door by using melee attack
	(play_tutorial_message)
	
	;when player bashes door, he can enter space and hits a trigger volume
	(sleep_until (= (volume_test_players tv_kiva_door) 1) 1)
	
	;we trigger the cinematic where the player enters the space
	;carter and kat follow
	(cinematic_script_call)
	
	;carter orders player to search the room
	(cue_play DIALOG_CARTER70) ;Noble 6, sweep and clear
	(cue_play ANIM_CARTER_CIRCLE) ;Carter circles his fist
	
	;sleep until the player hits a trigger volume near the civilians
	(sleep_until (= (volume_test_player tv_kiva_civilian) 1) 1)
	
	;increase a short to give a new task transition
	(set s_kiva 2)
	
	;the new task transition gives the civilians and Noble company new AI_Cues
	
	(cue_play ANIM_CIVILIAN_REACTION) 
		;multiple civilians are given a hands up cue
		;one civilian is given a cower stance cue
		;all of this happens with that one cue_play ANIM_CIVILIAN_REACTION

	(cue_play DIALOG_CARTER80) ;Carter orders them to put their hands up
	(cue_delay DIALOG_KAT10 (30 60)) ;Kat orders them to keep their hands up
	
	(sleep 120)
	
	(cue_play DIALOG_CARTER90) ;Carter orders them outside
	
	;increase a short to give a new task transition
	(set s_kiva 3)
	
	;Noble company and Civilians are given new AI_Cues outside
	;these happen via task transitions
	;Noble company takes position around the wall that the civies move to
	;Civilians are told to sit next to the wall
	
	;Civilians all talk in local dialect/language
	(cue_delay DIALOG_CIVILIANS10 (30 90)) ;this call goes out to multiple civilians
	
	;Carter tells Jorge to talk to them
	(cue_play DIALOG_CARTER100) ;Jorge, find out what happened
	
	;Jorge and the Civilians have a conversation, with occasional Jorge translations
	(cue_block DIALOG_JORGE10)
	(cue_block DIALOG_CIVILIANS20)
	(cue_block DIALOG_JORGE20)
	(cue_block DIALOG_CIVILIANS30)
	(cue_block DIALOG_JORGE30)
	(cue_block DIALOG_CIVILIANS40)
	
	;Carter tells Jorge to have the civilians find shelter, and he will call for transport
	(cue_block DIALOG_CARTER110) ;Jorge, tell them to find a safe spot
	(cue_block DIALOG_CARTER120) ;help is on the way
	
	;Jorge does that
	(cue_block DIALOG_JORGE40)
	(cue_block DIALOG_CIVILIANS50)
	(cue_block DIALOG_JORGE50)
	(cue_block DIALOG_CIVILIANS60)
	
	;flip a bit to get the civilians to go to their spots
	(set b_kiva_civilains 1)
	
	;carter tells noble to move out
	(cue_block DIALOG_CARTER 130) ;move out noble
	
	;increment the short to give a new task transition
	(set s_kiva 4)
)

(script dormant sc_bfg_vignette
	(sleep_until
		(begin
		
		(= b_)
	1)
)
*;
