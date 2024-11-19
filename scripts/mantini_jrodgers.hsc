(script static void squad_creation_test    

    (if (test_create_runtime_squad)
        (print "create runtime squad -- SUCCESS")
        (print "create runtime squad -- FAIL"))
        
    (if (test_create_runtime_point_set)
        (print "create runtime point set -- SUCCESS")
        (print "create runtime point set -- FAIL"))
    
    (if (test_add_runtime_point_to_set)
        (print "add runtime point to set -- SUCCESS")
        (print "add runtime point to set -- FAIL"))
    
    
    ;(mantini_add_starting_location_to_squad "squad_test" "spawn1" point_set_test/point1)
    ;(ai_place squad_test)
)


(script static boolean test_create_runtime_squad
    (mantini_create_runtime_squad "objects\characters\brute\ai\brute" "objects\weapons\rifle\plasma_rifle\plasma_rifle" "squad_test")
)

(script static boolean test_create_runtime_point_set
    (mantini_create_runtime_point_set "point_set_test")
)

(script static boolean test_add_runtime_point_to_set
    (mantini_add_runtime_point_to_set "point_set_test" "point1" 0.0 0.0)
)