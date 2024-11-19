(script startup blah  
	(print "Yo mama")
)

(script static void test
	(ai_place elite_drop)
	(sleep 120)
	;(custom_animation elite_drop/01 objects\characters\elite\elite "combat:sword:draw" TRUE)
	(vs_custom_animation elite_drop/01 TRUE objects\characters\elite\elite "combat:sword:draw" TRUE)
)