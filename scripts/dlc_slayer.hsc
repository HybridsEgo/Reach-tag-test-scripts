(script continuous vol_power
	(if
		
		(
		 or (<= (device_get_position low_grav) 0) (>= (device_get_position low_Grav) 1)
		)
		
	(begin
		;(print "LOW GRAV INACTIVE!")
		(device_set_power switch01 1)		
		(device_set_power switch02 1)	
	)
	(begin
		;(print "LOW GRAV ACTIVE!")
		(device_set_power switch01 0)
		(device_set_power switch02 0)
	))
)


