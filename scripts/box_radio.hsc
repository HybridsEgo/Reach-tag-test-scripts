

(script command_script testy
	(print "------- starting path now")	
	(cs_fly_to a/b)
	(print "------- at B")	
	(sleep 30)
	(print "------- starting back path now")	
	(cs_fly_to a/c)
	(print "------- at C")	

)

(global real perf_grunts 0)
(global real perf_elites 0)
(global real perf_spartans 0)
(global real perf_marines 0)

(global real perf_total_units 60)

(global real perf_covenant_percent 0.5)
(global real perf_human_percent 0.5)

(global real temp 0)

(global short g_perf_test_stage 1)

(script static void load_up

	(sleep_until (begin
			(set perf_grunts (* perf_total_units perf_covenant_percent))
			(set perf_grunts (/ perf_grunts 2))
			(set temp (- perf_grunts (ai_living_count grunts)))
			(if (> temp 0) (ai_place grunts temp))

			(set perf_elites (* perf_total_units perf_covenant_percent))
			(set perf_elites (/ perf_elites 2))
			(set temp (- perf_elites (ai_living_count elites)))
			(if (> temp 0) (ai_place elites temp))

			(set perf_spartans (* perf_total_units perf_human_percent))
			(set perf_spartans (/ perf_spartans 2))
			(set temp (- perf_spartans (ai_living_count spartans)))
			(if (> temp 0) (ai_place spartans temp))

			(set perf_marines (* perf_total_units perf_human_percent))
			(set perf_marines (/ perf_marines 2))
			(set temp (- perf_marines (ai_living_count marines)))
			(if (> temp 0) (ai_place marines temp))
			0)
	1)
)
