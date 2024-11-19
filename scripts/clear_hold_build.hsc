;-----------------------------------------------
; GLOBAL
;-----------------------------------------------
(global vehicle insertion_pelican none)
;-----------------------------------------------

;-----------------------------------------------
; STARTUP
;-----------------------------------------------

(script startup clear_hold_build
	(print "scripts starting!")
	(wake marine_ins)
)

;-----------------------------------------------

;-----------------------------------------------
; MARINE INSERTION
;-----------------------------------------------
(script dormant marine_ins
	(print "start marine_ins")
	(ai_place pelican_ins)
	(set insertion_pelican (ai_vehicle_get_from_starting_location pelican_ins/pelican_pilot))
	(cs_run_command_script pelican_ins/pelican_pilot pelican_ins_flight)
	(ai_place marine_ins)
	(vehicle_load_magic insertion_pelican "" (ai_actors marine_ins))
	(sleep 30)

)

(script command_script pelican_ins_flight
	(print "flying pelican")
	(cs_fly_by pelican_ins_flight/p0 2)
	(cs_fly_by pelican_ins_flight/p1 2)
	(cs_fly_by pelican_ins_flight/p2 2)
	(cs_fly_by pelican_ins_flight/p3 2)
	(cs_fly_to pelican_ins_flight/p4)
	(wake unload_marines)
	(sleep_until (< (ai_living_count pelican_ins) 4) 90)
	(cs_fly_by pelican_ins_flight/p5 2)
	(cs_fly_to pelican_ins_flight/p6)
	(ai_erase pelican_ins)
)

(script dormant unload_marines
	(print "unloading marines")
	(vehicle_unload insertion_pelican "pelican_p_l01")
	(sleep 30)
	(vehicle_unload insertion_pelican "pelican_p_l02")
	(sleep 30)
	(vehicle_unload insertion_pelican "pelican_p_l03")
	(sleep 30)
	(vehicle_unload insertion_pelican "pelican_p_l04")
	(sleep 30)
	(vehicle_unload insertion_pelican "pelican_p_l05")
	(sleep 30)
	(vehicle_unload insertion_pelican "pelican_p_r01")
	(sleep 30)
	(vehicle_unload insertion_pelican "pelican_p_r02")
	(sleep 30)
	(vehicle_unload insertion_pelican "pelican_p_r03")
	(sleep 30)
	(vehicle_unload insertion_pelican "pelican_p_r04")
	(sleep 30)
	(vehicle_unload insertion_pelican "pelican_p_r05")
)
;-----------------------------------------------

