(script static boolean obj_smain__0_2
(and (<= (ai_task_count obj_survival/hero_follow) 0) (<= (ai_task_count obj_survival/remaining) 3)))

(script static boolean obj_shero__0_12
(<= (ai_task_count obj_survival/remaining) 3))

(script static boolean obj_sbonus_0_17
b_sur_bonus_round_running)

(script static boolean obj_sgener_0_26
b_sur_generator_defense_active)

(script static boolean obj_sgen0_0_27
(> (object_get_health generator0) 0))

(script static boolean obj_sgen1_0_28
(> (object_get_health generator1) 0))

(script static boolean obj_sgen2_0_29
(> (object_get_health generator2) 0))

