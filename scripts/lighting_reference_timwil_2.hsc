(script startup lighting_reference_timwil_2
	(print "hiho2!")

)


(script static void first_3_a
								(device_set_position_track temp01 mp_boneyard_a 0)
								(device_animate_position temp01 0.1 10 0 5 false)
								(print "float")
								(sleep 330)
								;*
								(device_animate_position temp01 0.9 -1 0 0 false)
								;(device_set_position_immediate temp01 .9) 
								(print "move to .9")
								(sleep 1)
								(sleep 300)
								(device_animate_position temp01 1.0 10 0 0 false)
								(sleep 300)								
								(device_animate_position temp01 0.0 -1 0 0 false)
								(device_animate_position temp01 0.1 10 0 5 false)
								(print "float")
								(sleep 330)
		*;
								(device_animate_position temp01 0.2 10 0 5 true)
								(print "move in")
								(sleep 330)
								(device_animate_position temp01 0.3 10 0 0 false)
								(print "float")
								(sleep 330)	
								(device_animate_position temp01 0.4 10 0 5 false)
								(print "fly away")
														
)

(script static void first_3_b
								(device_set_position_track temp01 mp_boneyard_b 0)
								(device_animate_position temp01 .1 10 0 0 false)
								(sleep 330)
								(device_animate_position temp01 .2 10 0 0 false)
								(sleep 330)
								(device_animate_position temp01 .3 10 0 0 false)
								(sleep 330)
								(device_animate_position temp01 .4 10 0 0 false)
								(sleep 330)
								(device_animate_position temp01 .5 10 0 0 false)
								(sleep 330)
								(device_animate_position temp01 .6 10 0 0 false)
								
)