;=====================================================================;
;=====globals=========================================================;
;=====================================================================;


;=====================================================================;
;=====main script=====================================================;
;=====================================================================;

(script startup ambient_test
	(print "ambient life test start")
	(ai_allegiance player human)
	
	(sleep 1)

)

(script static void civilian
	(wake sc_civilian01)
	(sleep 100)
	(wake sc_civilian02)
	(sleep 100)
	(wake sc_civilian03)
	(sleep 100)	
	(wake sc_civilian04)
	(sleep 100)	
	(wake sc_civilian05)
	(sleep 100)	
)

(script dormant sc_civilian01
	(sleep_until
		(begin
			(ai_place sq_civilian01)
			(sleep 600)
			(ai_erase sq_civilian01)
		0)
	1)
)

(script dormant sc_civilian02
	(sleep_until
		(begin
			(ai_place sq_civilian02)
			(sleep 600)
			(ai_erase sq_civilian02)
		0)
	1)
)

(script dormant sc_civilian03
	(sleep_until
		(begin
			(ai_place sq_civilian03)
			(sleep 600)
			(ai_erase sq_civilian03)
		0)
	1)
)

(script dormant sc_civilian04
	(sleep_until
		(begin
			(ai_place sq_civilian04)
			(sleep 600)
			(ai_erase sq_civilian04)
		0)
	1)
)

(script dormant sc_civilian05
	(sleep_until
		(begin
			(ai_place sq_civilian05)
			(sleep 600)
			(ai_erase sq_civilian05)
		0)
	1)
)
