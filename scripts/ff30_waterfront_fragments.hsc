(script static boolean obj_shero__0_7
(<= (ai_task_count obj_survival/remaining) 3))

(script static boolean obj_smain__0_9
(and (<= (ai_task_count obj_survival/hero_follow) 0) (<= (ai_task_count obj_survival/remaining) 3)))

(script static boolean obj_sbonus_0_20
b_sur_bonus_round_running)

(script static boolean obj_sgener_0_22
b_sur_generator_defense_active)

(script static boolean obj_sgen0_0_23
b_sur_generator0_alive)

(script static boolean obj_sgen1_0_24
b_sur_generator1_alive)

(script static boolean obj_sgen2_0_25
b_sur_generator2_alive)

(script static boolean obj_ssnipe_0_28
(volume_test_object tv_cliff_fall_left (ai_get_object sq_sur_sniper_01/sniper_01)))

(script static boolean obj_ssnipe_0_29
(volume_test_object tv_cliff_fall_right (ai_get_object sq_sur_sniper_01/sniper_01)))

(script static boolean obj_ssnipe_0_30
(volume_test_object tv_cliff_fall_left (ai_get_object sq_sur_sniper_02/sniper_02)))

(script static boolean obj_ssnipe_0_31
(volume_test_object tv_cliff_fall_right (ai_get_object sq_sur_sniper_02/sniper_02)))

