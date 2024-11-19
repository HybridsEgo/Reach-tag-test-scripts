(global boolean debug false)
(script startup 010_jungle_insertion
	; snap to black 
	(cinematic_snap_to_black)

	; start intro cinematic (part one) 
	(if (cinematic_skip_start)
		(begin
			(if debug (print "010la_jungle_intro_01"))
			(010la_jungle_intro_01)
		)
	)
	(cinematic_skip_stop)
			
	; finish intro cinematic (part two) 
	(if (cinematic_skip_start)
		(begin
			(if debug (print "010la_jungle_intro_02"))
			(010la_jungle_intro_02)
		)
	)
	(cinematic_skip_stop)
)

