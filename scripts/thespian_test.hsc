;=====================================================================;
;=====globals=========================================================;
;=====================================================================;
(global boolean b_evaluate 0)
(global boolean b_thespian_spartan 0)
(global boolean b_thespian_trooper 0)
(global boolean b_thespian_elite 0)
(global boolean b_thespian_grunt 0)
(global boolean b_thespian_skirmisher 0)
(global boolean b_thespian_brute 0)
(global boolean b_thespian 0)
(global short s_thespian 0)

;=====================================================================;
;=====main script=====================================================;
;=====================================================================;

(script startup thespain_test
	(print "thespian test start")
	(ai_allegiance player human)
	
	(sleep 1)
	
	(wake sc_thespian_input)
	
	(wake sc_spartan_input)
	(wake sc_trooper_input)
	(wake sc_elite_input)
	(wake sc_grunt_input)
	(wake sc_brute_input)
	(wake sc_skirmisher_input)
)

(script dormant sc_thespian_input
	(sleep_until
		(begin
			(print " ************* ")
			(print "waiting for input")
			(print "type spart_thes for spartan thespians")
			(print "type troop_thes for trooper thespians")
			(print "type elite_thes for elite thespians")
			(print "type brute_thes for brute thespians")
			(print "type grunt_thes for grunt thespians")
			(print "type skirm_thes for skirmisher thespians")
			(sleep 100)
		0)
	1)
)

(script static void civilian_injured
	(male_injured)
	(female_injured)
)

(script static void male_injured
	(ai_place sq_civilian_injured)
	(sleep 1)	
	(thespian_performance_setup_and_begin thes_civilian_injured "" 0)	
)

(script static void female_injured
	(ai_place sq_female_injured)
	(sleep 1)	
	(thespian_performance_setup_and_begin thes_female_injured "" 0)	
)

(script static void spart_thes
	(print "spartan thespians")
	(sleep_forever sc_thespian_input)
	
	(set b_thespian_spartan 1)
	(set b_thespian_trooper 0)
	(set b_thespian_elite 0)
	(set b_thespian_grunt 0)
	(set b_thespian_brute 0)
	(set b_thespian_skirmisher 0)
)

(script static void troop_thes
	(print "trooper thespians")
	(sleep_forever sc_thespian_input)

	(set b_thespian_spartan 0)
	(set b_thespian_trooper 1)
	(set b_thespian_elite 0)
	(set b_thespian_grunt 0)
	(set b_thespian_brute 0)
	(set b_thespian_skirmisher 0)
)

(script static void elite_thes
	(print "elite thespians")
	(sleep_forever sc_thespian_input)

	(set b_thespian_spartan 0)
	(set b_thespian_trooper 0)
	(set b_thespian_elite 1)
	(set b_thespian_grunt 0)
	(set b_thespian_brute 0)
	(set b_thespian_skirmisher 0)
)

(script static void brute_thes
	(print "brute thespians")
	(sleep_forever sc_thespian_input)

	(set b_thespian_spartan 0)
	(set b_thespian_trooper 0)
	(set b_thespian_elite 0)
	(set b_thespian_grunt 0)
	(set b_thespian_brute 1)
	(set b_thespian_skirmisher 0)
)

(script static void grunt_thes
	(print "grunt thespians")
	(sleep_forever sc_thespian_input)

	(set b_thespian_spartan 0)
	(set b_thespian_trooper 0)
	(set b_thespian_elite 0)
	(set b_thespian_grunt 1)
	(set b_thespian_brute 0)
	(set b_thespian_skirmisher 0)
)

(script static void skirm_thes
	(print "skirmisher thespians")
	(sleep_forever sc_thespian_input)

	(set b_thespian_spartan 0)
	(set b_thespian_trooper 0)
	(set b_thespian_elite 0)
	(set b_thespian_grunt 0)
	(set b_thespian_brute 0)
	(set b_thespian_skirmisher 1)
)

(script dormant sc_spartan_input
	(sleep_until
		(begin
			(if (= b_thespian_spartan 1)
				(begin
					(print "type 1 for goto crouch look around")
					(sleep 15)
				)
			)
			(if (= b_thespian_spartan 1)
				(begin
					(print "type 2 for goto inspect ground")
					(sleep 15)
				)
			)
			(if (= b_thespian_spartan 1)
				(begin
					(print "type 3 for goto investigate enemy body")
					(sleep 15)
				)
			)		
			(if (= b_thespian_spartan 1)
				(begin
					(print "type 4 for goto investigate friendly body")
					(sleep 15)
				)
			)		
			(if (= b_thespian_spartan 1)
				(begin
					(print "type 5 for goto investigate room")
					(sleep 15)
				)
			)	
			(if (= b_thespian_spartan 1)
				(begin
					(print "type 6 for goto kick door")
					(sleep 15)
				)
			)	
			(if (= b_thespian_spartan 1)
				(begin
					(print "type 7 for goto look around 3 points")
					(sleep 15)
				)
			)	
			(if (= b_thespian_spartan 1)
				(begin
					(print "type 8 for goto poke kick body")
					(sleep 15)
				)
			)	
			(if (= b_thespian_spartan 1)
				(begin
					(print "type 9 for goto rock jump01")
					(sleep 15)
				)
			)	
			(if (= b_thespian_spartan 1)
				(begin
					(print "type 10 for goto rock jump02")
					(sleep 15)
				)
			)	
			(if (= b_thespian_spartan 1)
				(begin
					(print "type 11 for goto rock jump03")
					(sleep 15)
				)
			)	
			(if (= b_thespian_spartan 1)
				(begin
					(print "type 12 for goto rock jump04")
					(sleep 15)
				)
			)	
			(if (= b_thespian_spartan 1)
				(begin
					(print "type 13 for goto shuffle aim around")
					(sleep 15)
				)
			)	
			(if (= b_thespian_spartan 1)
				(begin
					(print "type 14 for immediate inspect ground")
					(sleep 15)
				)
			)	
			(if (= b_thespian_spartan 1)
				(begin
					(print "type 15 for immediate 360 look")
					(sleep 15)
				)
			)	
			(if (= b_thespian_spartan 1)
				(begin
					(print "type 16 for immediate shuffle aim around")
					(sleep 15)
				)
			)	
			(if (= b_thespian_spartan 1)
				(begin
					(print "type 17 for immediate signal attack")
					(sleep 15)
				)
			)	
			(if (= b_thespian_spartan 1)
				(begin			
					(print "type 18 for immediate signal cease fire")
					(sleep 15)
				)
			)	
			(if (= b_thespian_spartan 1)
				(begin			
					(print "type 19 for immediate signal come")
					(sleep 15)
				)
			)	
			(if (= b_thespian_spartan 1)
				(begin			
					(print "type 20 for immediate signal deploy")
					(sleep 15)
				)
			)	
			(if (= b_thespian_spartan 1)
				(begin			
					(print "type 21 for immediate signal find cover")
					(sleep 15)
				)
			)	
			(if (= b_thespian_spartan 1)
				(begin			
					(print "type 22 for immediate signal freeze")
					(sleep 15)
				)
			)	
			(if (= b_thespian_spartan 1)
				(begin			
					(print "type 23 for immediate signal hear")
					(sleep 15)
				)
			)	
			(if (= b_thespian_spartan 1)
				(begin			
					(print "type 24 for immediate signal hold stop")
					(sleep 15)
				)
			)	
			(if (= b_thespian_spartan 1)
				(begin			
					(print "type 25 for immediate signal hurry")
					(sleep 15)
				)
			)	
			(if (= b_thespian_spartan 1)
				(begin			
					(print "type 26 for immediate signal move up")
					(sleep 15)
				)
			)	
			(if (= b_thespian_spartan 1)
				(begin			
					(print "type 27 for immediate signal positive")
					(sleep 15)
				)
			)	
			(if (= b_thespian_spartan 1)
				(begin			
					(print "type 28 for immediate signal rally")
					(sleep 15)
				)
			)	
			(if (= b_thespian_spartan 1)
				(begin			
					(print "type 29 for immediate signal rally wave")
					(sleep 15)
				)
			)	
			(if (= b_thespian_spartan 1)
				(begin			
					(print "type 30 for immediate signal spread out")
					(sleep 15)
				)
			)	
			(if (= b_thespian_spartan 1)
				(begin			
					(print "type 31 for immediate signal take point")
					(sleep 15)
				)
			)	
		0)
	1)
)

(script dormant sc_trooper_input
	(sleep_until
		(begin
			(if (= b_thespian_trooper 1)
				(begin
					(print "type 1 for goto break window")
					(sleep 15)
				)
			)
			(if (= b_thespian_trooper 1)
				(begin
					(print "type 2 for goto kick enemy body")
					(sleep 15)
				)
			)
			(if (= b_thespian_trooper 1)
				(begin
					(print "type 3 for goto salute")
					(sleep 15)
				)
			)
			(if (= b_thespian_trooper 1)
				(begin
					(print "type 4 for goto survey equipment")
					(sleep 15)
				)
			)
			(if (= b_thespian_trooper 1)
				(begin
					(print "type 5 for immediate adjust backpack")
					(sleep 15)
				)
			)
			(if (= b_thespian_trooper 1)
				(begin
					(print "type 6 for immediate brace")
					(sleep 15)
				)
			)
			(if (= b_thespian_trooper 1)
				(begin
					(print "type 7 for immediate cover dust")
					(sleep 15)
				)
			)
			(if (= b_thespian_trooper 1)
				(begin
					(print "type 8 for immediate look up ship")
					(sleep 15)
				)
			)
			(if (= b_thespian_trooper 1)
				(begin
					(print "type 9 for immediate salute")
					(sleep 15)
				)
			)
			(if (= b_thespian_trooper 1)
				(begin
					(print "type 10 for immediate stagger explosions")
					(sleep 15)
				)
			)
			(if (= b_thespian_trooper 1)
				(begin
					(print "type 11 for immediate wave")
					(sleep 15)
				)
			)
		0)
	1)
)

(script dormant sc_elite_input
	(sleep_until
		(begin
			(if (= b_thespian_elite 1)
				(begin
					(print "type 1 for wake grunt")
					(sleep 15)
				)
			)
		0)
	1)
)

(script dormant sc_brute_input
	(sleep_until
		(begin
			(if (= b_thespian_brute 1)
				(begin
					(print "type 1 for celebrate")
					(sleep 15)
				)
			)
		0)
	1)
)

(script dormant sc_grunt_input
	(sleep_until
		(begin
			(if (= b_thespian_grunt 1)
				(begin
					(print "type 1 for warm fire")
					(sleep 15)
				)
			)
		0)
	1)
)

(script dormant sc_skirmisher_input
	(sleep_until
		(begin
			(if (= b_thespian_skirmisher 1)
				(begin
					(print "type 1 for marine desecration")
					(sleep 15)
				)
			)
		0)
	1)
)

(script static void thespian_carter
	(ai_erase sq_thespian_carter)

	(if (= b_thespian_spartan 1)
		(begin
			(sleep 1)
			(ai_place sq_thespian_carter)
			(sleep 1)
			(if (= s_thespian 1)
				(thespian_performance_setup_and_begin thes_spartan_goto_crouch_look_around "" 0)	
			)
			(if (= s_thespian 2)
				(thespian_performance_setup_and_begin thes_spartan_goto_inspect_ground "" 0)	
			)
			(if (= s_thespian 3)
				(thespian_performance_setup_and_begin thes_spartan_goto_inv_enemy_body "" 0)	
			)
			(if (= s_thespian 4)
				(thespian_performance_setup_and_begin thes_spartan_goto_inv_friendly_body "" 0)	
			)
			(if (= s_thespian 5)
				(thespian_performance_setup_and_begin thes_spartan_goto_inv_room "" 0)	
			)
			(if (= s_thespian 6)
				(thespian_performance_setup_and_begin thes_spartan_goto_kick_door "" 0)	
			)
			(if (= s_thespian 7)
				(thespian_performance_setup_and_begin thes_spartan_goto_look_around_3_points "" 0)	
			)
			(if (= s_thespian 8)
				(thespian_performance_setup_and_begin thes_spartan_goto_poke_kick_body "" 0)	
			)
			(if (= s_thespian 9)
				(thespian_performance_setup_and_begin thes_spartan_goto_rock_jump01 "" 0)	
			)
			(if (= s_thespian 10)
				(thespian_performance_setup_and_begin thes_spartan_goto_rock_jump02 "" 0)	
			)
			(if (= s_thespian 11)
				(thespian_performance_setup_and_begin thes_spartan_goto_rock_jump03 "" 0)	
			)
			(if (= s_thespian 12)
				(thespian_performance_setup_and_begin thes_spartan_goto_rock_jump04 "" 0)	
			)
			(if (= s_thespian 13)
				(thespian_performance_setup_and_begin thes_spartan_goto_shuffle_aim_around "" 0)	
			)
			(if (= s_thespian 14)
				(begin
					(sleep 90)
					(thespian_performance_setup_and_begin thes_spartan_immediate_360_look "" 0)	
				)
			)
			(if (= s_thespian 15)
				(begin
					(sleep 90)
					(thespian_performance_setup_and_begin thes_spartan_immediate_inspect_ground "" 0)	
				)
			)
			(if (= s_thespian 16)
				(begin
					(sleep 90)
					(thespian_performance_setup_and_begin thes_spartan_immediate_shuffle_aim_around "" 0)	
				)
			)
			(if (= s_thespian 17)
				(begin
					(sleep 90)
					(thespian_performance_setup_and_begin thes_spartan_immediate_signal_attack "" 0)	
				)
			)
			(if (= s_thespian 18)
				(begin
					(sleep 90)
					(thespian_performance_setup_and_begin thes_spartan_immediate_signal_cease_fire "" 0)	
				)
			)
			(if (= s_thespian 19)
				(begin
					(sleep 90)
					(thespian_performance_setup_and_begin thes_spartan_immediate_signal_come "" 0)	
				)
			)
			(if (= s_thespian 20)
				(begin
					(sleep 90)
					(thespian_performance_setup_and_begin thes_spartan_immediate_signal_deploy "" 0)	
				)
			)
			(if (= s_thespian 21)
				(begin
					(sleep 90)
					(thespian_performance_setup_and_begin thes_spartan_immediate_signal_find_cover "" 0)	
				)
			)
			(if (= s_thespian 22)
				(begin
					(sleep 90)
					(thespian_performance_setup_and_begin thes_spartan_immediate_signal_freeze "" 0)	
				)
			)
			(if (= s_thespian 23)
				(begin
					(sleep 90)
					(thespian_performance_setup_and_begin thes_spartan_immediate_signal_hear "" 0)	
				)
			)
			(if (= s_thespian 24)
				(begin
					(sleep 90)
					(thespian_performance_setup_and_begin thes_spartan_immediate_signal_hold_stop "" 0)	
				)
			)
			(if (= s_thespian 25)
				(begin
					(sleep 90)
					(thespian_performance_setup_and_begin thes_spartan_immediate_signal_hurry "" 0)	
				)
			)
			(if (= s_thespian 26)
				(begin
					(sleep 90)
					(thespian_performance_setup_and_begin thes_spartan_immediate_signal_move_up "" 0)	
				)
			)
			(if (= s_thespian 27)
				(begin
					(sleep 90)
					(thespian_performance_setup_and_begin thes_spartan_immediate_signal_positive "" 0)	
				)
			)
			(if (= s_thespian 28)
				(begin
					(sleep 90)
					(thespian_performance_setup_and_begin thes_spartan_immediate_signal_rally "" 0)	
				)
			)
			(if (= s_thespian 29)
				(begin
					(sleep 90)
					(thespian_performance_setup_and_begin thes_spartan_immediate_signal_rally_wave "" 0)	
				)
			)
			(if (= s_thespian 30)
				(begin
					(sleep 90)
					(thespian_performance_setup_and_begin thes_spartan_immediate_signal_spread_out "" 0)	
				)
			)
			(if (= s_thespian 31)
				(begin
					(sleep 90)
					(thespian_performance_setup_and_begin thes_spartan_immediate_signal_take_point "" 0)	
				)
			)
		)
	)
)

(script static void thespian_trooper
	(ai_erase sq_thespian_trooper)
	(if (= b_thespian_trooper 1)
		(begin
			(sleep 1)
			(ai_place sq_thespian_trooper)
			(sleep 1)
			(if (= s_thespian 1)
				(thespian_performance_setup_and_begin thes_trooper_goto_break_window "" 0)	
			)
			(if (= s_thespian 2)
				(thespian_performance_setup_and_begin thes_trooper_goto_kick_enemy_body "" 0)	
			)
			(if (= s_thespian 3)
				(thespian_performance_setup_and_begin thes_trooper_goto_salute "" 0)	
			)
			(if (= s_thespian 4)
				(thespian_performance_setup_and_begin thes_trooper_goto_survey_environment "" 0)	
			)
			(if (= s_thespian 5)
				(begin
					(sleep 90)
					(thespian_performance_setup_and_begin thes_trooper_immediate_adjust_backpack "" 0)	
				)
			)
			(if (= s_thespian 6)
				(begin
					(sleep 90)
					(thespian_performance_setup_and_begin thes_trooper_immediate_brace "" 0)	
				)
			)
			(if (= s_thespian 7)
				(begin
					(sleep 90)
					(thespian_performance_setup_and_begin thes_trooper_immediate_cover_dust "" 0)	
				)
			)
			(if (= s_thespian 8)
				(begin
					(sleep 90)
					(thespian_performance_setup_and_begin thes_trooper_immediate_look_up_ship "" 0)	
				)
			)
			(if (= s_thespian 9)
				(begin
					(sleep 90)
					(thespian_performance_setup_and_begin thes_trooper_immediate_salute "" 0)	
				)
			)
			(if (= s_thespian 10)
				(begin
					(print "booga")
					(sleep 300)
					(thespian_performance_setup_and_begin thes_trooper_immediate_stagger_explosions "" 0)	
				)
			)
			(if (= s_thespian 11)
				(begin
					(sleep 90)
					(thespian_performance_setup_and_begin thes_trooper_immediate_wave "" 0)	
				)
			)
		)
	)
)

(script static void thespian_elite
	(ai_erase sq_thespian_elite)
	(if (= b_thespian_elite 1)
		(begin
			(sleep 1)
			(ai_place sq_thespian_elite)
			(sleep 1)
			(if (= s_thespian 1)
				(thespian_performance_setup_and_begin thes_elite_wake_grunt "" 0)	
			)
		)
	)
)

(script static void thespian_grunt
	(ai_erase sq_thespian_grunt)
	(if (= b_thespian_grunt 1)
		(begin
			(sleep 1)
			(ai_place sq_thespian_grunt)
			(sleep 1)
			(if (= s_thespian 1)
				(thespian_performance_setup_and_begin thes_grunt_warm_fire "" 0)	
			)
		)
	)
)

(script static void thespian_brute
	(ai_erase sq_thespian_brute)
	(if (= b_thespian_brute 1)
		(begin
			(sleep 1)
			(ai_place sq_thespian_brute)
			(sleep 1)
			(if (= s_thespian 1)
				(thespian_performance_setup_and_begin thes_brute_celebrate "" 0)	
			)
		)
	)
)

(script static void thespian_skirmisher
	(ai_erase sq_thespian_skirmisher)
	(if (= b_thespian_skirmisher 1)
		(begin
			(sleep 1)
			(ai_place sq_thespian_skirmisher)
			(sleep 1)
			(if (= s_thespian 1)
				(thespian_performance_setup_and_begin thes_skirmisher_marine_desecration "" 0)	
			)
		)
	)
)

(script static void 1
	(set s_thespian 1)
	(sleep 1)
	(thespian_carter)
	(thespian_trooper)
	(thespian_elite)
	(thespian_brute)
	(thespian_grunt)
	(thespian_skirmisher)
)

(script static void 2
	(set s_thespian 2)
	(sleep 1)
	(thespian_carter)
	(thespian_trooper)
	(thespian_elite)
	(thespian_brute)
	(thespian_grunt)
	(thespian_skirmisher)
)

(script static void 3
	(set s_thespian 3)
	(sleep 1)
	(thespian_carter)
	(thespian_trooper)
	(thespian_elite)
	(thespian_brute)
	(thespian_grunt)
	(thespian_skirmisher)
)

(script static void 4
	(set s_thespian 4)
	(sleep 1)
	(thespian_carter)
	(thespian_trooper)
	(thespian_elite)
	(thespian_brute)
	(thespian_grunt)
	(thespian_skirmisher)
)

(script static void 5
	(set s_thespian 5)
	(sleep 1)
	(thespian_carter)
	(thespian_trooper)
	(thespian_elite)
	(thespian_brute)
	(thespian_grunt)
	(thespian_skirmisher)
)

(script static void 6
	(set s_thespian 6)
	(sleep 1)
	(thespian_carter)
	(thespian_trooper)
	(thespian_elite)
	(thespian_brute)
	(thespian_grunt)
	(thespian_skirmisher)
)

(script static void 7
	(set s_thespian 7)
	(sleep 1)
	(thespian_carter)
	(thespian_trooper)
	(thespian_elite)
	(thespian_brute)
	(thespian_grunt)
	(thespian_skirmisher)
)

(script static void 8
	(set s_thespian 8)
	(sleep 1)
	(thespian_carter)
	(thespian_trooper)
	(thespian_elite)
	(thespian_brute)
	(thespian_grunt)
	(thespian_skirmisher)
)

(script static void 9
	(set s_thespian 9)
	(sleep 1)
	(thespian_carter)
	(thespian_trooper)
	(thespian_elite)
	(thespian_brute)
	(thespian_grunt)
	(thespian_skirmisher)
)

(script static void 10
	(set s_thespian 10)
	(sleep 1)
	(thespian_carter)
	(thespian_trooper)
	(thespian_elite)
	(thespian_brute)
	(thespian_grunt)
	(thespian_skirmisher)
)

(script static void 11
	(set s_thespian 11)
	(sleep 1)
	(thespian_carter)
	(thespian_trooper)
	(thespian_elite)
	(thespian_brute)
	(thespian_grunt)
	(thespian_skirmisher)
)

(script static void 12
	(set s_thespian 12)
	(sleep 1)
	(thespian_carter)
	(thespian_trooper)
	(thespian_elite)
	(thespian_brute)
	(thespian_grunt)
	(thespian_skirmisher)
)

(script static void 13
	(set s_thespian 13)
	(sleep 1)
	(thespian_carter)
	(thespian_trooper)
	(thespian_elite)
	(thespian_brute)
	(thespian_grunt)
	(thespian_skirmisher)
)

(script static void 14
	(set s_thespian 14)
	(sleep 1)
	(thespian_carter)
	(thespian_trooper)
	(thespian_elite)
	(thespian_brute)
	(thespian_grunt)
	(thespian_skirmisher)
)

(script static void 15
	(set s_thespian 15)
	(sleep 1)
	(thespian_carter)
	(thespian_trooper)
	(thespian_elite)
	(thespian_brute)
	(thespian_grunt)
	(thespian_skirmisher)
)

(script static void 16
	(set s_thespian 16)
	(sleep 1)
	(thespian_carter)
	(thespian_trooper)
	(thespian_elite)
	(thespian_brute)
	(thespian_grunt)
	(thespian_skirmisher)
)

(script static void 17
	(set s_thespian 17)
	(sleep 1)
	(thespian_carter)
	(thespian_trooper)
	(thespian_elite)
	(thespian_brute)
	(thespian_grunt)
	(thespian_skirmisher)
)

(script static void 18
	(set s_thespian 18)
	(sleep 1)
	(thespian_carter)
	(thespian_trooper)
	(thespian_elite)
	(thespian_brute)
	(thespian_grunt)
	(thespian_skirmisher)
)

(script static void 19
	(set s_thespian 19)
	(sleep 1)
	(thespian_carter)
	(thespian_trooper)
	(thespian_elite)
	(thespian_brute)
	(thespian_grunt)
	(thespian_skirmisher)
)

(script static void 20
	(set s_thespian 20)
	(sleep 1)
	(thespian_carter)
	(thespian_trooper)
	(thespian_elite)
	(thespian_brute)
	(thespian_grunt)
	(thespian_skirmisher)
)

(script static void 21
	(set s_thespian 21)
	(sleep 1)
	(thespian_carter)
	(thespian_trooper)
	(thespian_elite)
	(thespian_brute)
	(thespian_grunt)
	(thespian_skirmisher)
)

(script static void 22
	(set s_thespian 22)
	(sleep 1)
	(thespian_carter)
	(thespian_trooper)
	(thespian_elite)
	(thespian_brute)
	(thespian_grunt)
	(thespian_skirmisher)
)

(script static void 23
	(set s_thespian 23)
	(sleep 1)
	(thespian_carter)
	(thespian_trooper)
	(thespian_elite)
	(thespian_brute)
	(thespian_grunt)
	(thespian_skirmisher)
)

(script static void 24
	(set s_thespian 24)
	(sleep 1)
	(thespian_carter)
	(thespian_trooper)
	(thespian_elite)
	(thespian_brute)
	(thespian_grunt)
	(thespian_skirmisher)
)

(script static void 25
	(set s_thespian 25)
	(sleep 1)
	(thespian_carter)
	(thespian_trooper)
	(thespian_elite)
	(thespian_brute)
	(thespian_grunt)
	(thespian_skirmisher)
)

(script static void 26
	(set s_thespian 26)
	(sleep 1)
	(thespian_carter)
	(thespian_trooper)
	(thespian_elite)
	(thespian_brute)
	(thespian_grunt)
	(thespian_skirmisher)
)

(script static void 27
	(set s_thespian 27)
	(sleep 1)
	(thespian_carter)
	(thespian_trooper)
	(thespian_elite)
	(thespian_brute)
	(thespian_grunt)
	(thespian_skirmisher)
)

(script static void 28
	(set s_thespian 28)
	(sleep 1)
	(thespian_carter)
	(thespian_trooper)
	(thespian_elite)
	(thespian_brute)
	(thespian_grunt)
	(thespian_skirmisher)
)

(script static void 29
	(set s_thespian 29)
	(sleep 1)
	(thespian_carter)
	(thespian_trooper)
	(thespian_elite)
	(thespian_brute)
	(thespian_grunt)
	(thespian_skirmisher)
)

(script static void 30
	(set s_thespian 30)
	(sleep 1)
	(thespian_carter)
	(thespian_trooper)
	(thespian_elite)
	(thespian_brute)
	(thespian_grunt)
	(thespian_skirmisher)
)

(script static void 31
	(set s_thespian 31)
	(sleep 1)
	(thespian_carter)
	(thespian_trooper)
	(thespian_elite)
	(thespian_brute)
	(thespian_grunt)
	(thespian_skirmisher)
)

(script static void 32
	(set s_thespian 32)
	(sleep 1)
	(thespian_carter)
	(thespian_trooper)
	(thespian_elite)
	(thespian_brute)
	(thespian_grunt)
	(thespian_skirmisher)
)


;=====================================================================;
;=====debug script====================================================;
;=====================================================================;
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

(script static void throttle
	(if (= debug_biped_throttle 0)
		(begin
			(print "throttle set to 1")
			(set debug_biped_throttle 1)
			(set ai_render_emotions 1)
		)
		(begin
			(print "throttle set to 0")
			(set debug_biped_throttle 0)
			(set ai_render_emotions 0)
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
			(print "game speed set to 1")
			(set game_speed 1)
		)
		(begin
			(print "game speed set to 0")
			(set game_speed 0)
		)		
	)
)

(script static void g_kill_branch
	(print "branching")
)

(global boolean b_test 0)
(script static void sv_branch_test
	(branch 
		;(< (object_get_health (object_get_ai ai_current_actor)) 1) 
		(= b_test 1)
		(g_kill_branch)
	)
)

