;====================================================================================================================================================================================================
;================================== GLOBAL VARIABLES ================================================================================================================================================
;====================================================================================================================================================================================================
(global boolean editor FALSE)

(global boolean g_play_cinematics TRUE)
(global boolean g_player_training TRUE)

(global boolean debug TRUE)
(global boolean dialogue TRUE)


(global boolean g_null FALSE)

;====================================================================================================================================================================================================
;====================================================================================================================================================================================================
;====================================================================================================================================================================================================
;====================================================================================================================================================================================================

(script startup mission_gravemind
	(if debug (print "gravemind channel test level"))
	(sleep 1)
	(cortana_effect_salvation)
)


