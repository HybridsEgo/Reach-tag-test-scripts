(script static boolean obj_ffoyer_0_1
(>= (ai_task_count obj_foyer_cov1/all_fallback) 1))

(script static boolean obj_fdefen_1_3
(volume_test_players trg_foyer_right))

(script static boolean obj_fdefen_1_6
(volume_test_players trg_foyer_left))

(script static boolean obj_felite_1_7
(volume_test_players trg_foyer_middle))

(script static boolean obj_finiti_1_8
(NOT (volume_test_players trg_foyer_rear)))

(script static boolean obj_ccatwa_4_5
(NOT (volume_test_players trg_catwalk_level2_entry)))

(script static boolean obj_sgate__5_6
(volume_test_players trg_spiral_floor))

(script static boolean obj_ccatwa_6_1
(<= (ai_task_count obj_catwalk_cov1/catwalk_lowerlevels_gate) 0))

(script static boolean obj_ccatwa_6_4
(<= (ai_task_count obj_catwalk_cov1/catwalk_ramp_gate) 0))

(script static boolean obj_ttunne_7_0
(NOT (volume_test_players trg_tunnel02_adv_room1rear)))

(script static boolean obj_ttunne_7_1
(NOT (volume_test_players trg_tunnel02_adv_room1middle)))

(script static boolean obj_ttunne_7_3
(NOT (volume_test_players trg_tunnel02_adv_room2front)))

(script static boolean obj_ttunne_7_5
(NOT (volume_test_players trg_tunnel02_adv_room2rear)))

(script static boolean obj_cgate__8_6
(volume_test_players trg_cavern_level2_enter))

(script static boolean obj_celite_8_9
(volume_test_players trg_cavern_level1_enter))

(script static boolean obj_sgate__9_3
(volume_test_players trg_steps_level1_start))

(script static boolean obj_sgate__9_5
(volume_test_players trg_steps_level1_hall1))

(script static boolean obj_sgate__9_7
(volume_test_players trg_steps_level2_start))

(script static boolean obj_ttunne_10_1
(>= (ai_task_count obj_tunnel03_cov1/tunnel_rear) 1))

(script static boolean obj_ttunne_10_3
(<= (ai_living_count obj_tunnel03_cov1) 0))

(script static boolean obj_sfloor_12_1
(volume_test_players trg_steps_hum_coverfloor))

(script static boolean obj_sfloor_12_2
(<= (ai_task_count obj_steps_cov1/gate_floor) 0))

(script static boolean obj_sgate__12_3
(volume_test_players trg_steps_start1))

