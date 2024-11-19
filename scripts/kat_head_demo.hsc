(script static void dialog_angry
	(custom_animation kat_head objects\characters\temp\kat_head_test\kat_head_test dialog:angry TRUE)
	(sleep 10)
	(sound_impulse_start objects\characters\temp\kat_head_test\temp\sounds\angry kat_head 1.0)
)

(script static void dialog_killyou
	(custom_animation kat_head objects\characters\temp\kat_head_test\kat_head_test dialog:kill_you TRUE)
	(sleep 12)
	(sound_impulse_start objects\characters\temp\kat_head_test\temp\sounds\kill kat_head 1.0)
)

(script static void dialog_emotions
	(custom_animation kat_head objects\characters\temp\kat_head_test\kat_head_test dialog:emotions TRUE)
)

(script static void dialog_phonemes
	(custom_animation kat_head objects\characters\temp\kat_head_test\kat_head_test dialog:phonemes TRUE)
)

(script static void all
	(dialog_angry)
	(sleep 115)
	(dialog_killyou)
	(sleep 484)
	(dialog_emotions)
	(sleep 839)
	(dialog_phonemes)
	(sleep 959)
)