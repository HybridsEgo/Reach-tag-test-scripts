(script static boolean obj_shero__0_7
(<= (ai_task_count obj_survival/remaining) 3))

(script static boolean obj_smain__0_9
(and (<= (ai_task_count obj_survival/hero_follow) 0) (<= (ai_task_count obj_survival/remaining) 3)))

(script static boolean obj_sbonus_0_20
b_sur_bonus_round_running)
