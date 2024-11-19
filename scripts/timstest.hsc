(script startup mission_timstest
	(scenery_animation_start_loop dead_marine_a objects\characters\marine\marine e3_deadbody_01)
)

;*
(script dormant respawning_brutes
     (sleep_until 
     	(begin
			(sleep_until 
				(= (ai_living_count brutes) 0)
			)
			(ai_place brutes)
		0)
	)
)
	*;
	
