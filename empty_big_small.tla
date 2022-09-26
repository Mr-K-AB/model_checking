-------------------------- MODULE empty_big_small --------------------------
EXTENDS Integers
VARIABLES big, small

Typeok == (big \in 0..5 /\ small \in 0..3)

init == (small = 0 /\ big = 0)


\************************************************************************************************************************/


empty_small == (small'=0 /\ big'=big)
empty_big == (small'=small /\ big'=0)



fill_big == (big'=5 /\ small'=small)
fill_small == (big'=big /\ small'=3)



pour_big_to_small == IF(small+big > 3) THEN (big'=big-(3-small) /\ small'=3)
            ELSE (big'=0 /\ small'=small+big)

pour_small_to_big ==   IF(big+small > 5) THEN (big'=5 /\ small'=small-(5-big))
                ELSE (big'=small+big /\ small'=0)


\************************************************************************************************************************/


next == \/empty_big
        \/empty_small
        \/fill_big
        \/fill_small
        \/pour_big_to_small
        \/pour_small_to_big


=============================================================================
\* Modification History
\* Last modified Wed Aug 17 18:22:03 IST 2022 by mr_ab
\* Created Wed Aug 17 17:40:52 IST 2022 by mr_ab
