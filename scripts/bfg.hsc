; =================================================================================================
; BFG SCRIPTS
; =================================================================================================
(script startup bfg_start
	(print "bfg go")
	(ai_place sq_bfg)
)

(script command_script cs_bfg_shoot
	(cs_shoot_point TRUE ps_bfg/p0)
	(sleep_forever)
)