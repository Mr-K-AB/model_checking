-------------------------- MODULE vending_machine --------------------------

EXTENDS Integers

VARIABLES state,paid,drink_dispensed

\*Typeok == ()


init == (state=0 /\ paid=0 /\ drink_dispensed =0)


coin_insert == (state'=1 /\ paid'=1 /\ drink_dispensed'=drink_dispensed)

select_drink_coc == (state'=2 /\ paid'=1 /\ drink_dispensed'=drink_dispensed)
select_drink_pepsi == (state'=3 /\ paid'=1 /\ drink_dispensed'=drink_dispensed)

drink_dispensing == (state'=4 /\ paid'=1 /\ drink_dispensed'=1)

reset == (state'=0 /\ paid'=0 /\ drink_dispensed'=0)


next == \/coin_insert
        \/select_drink_coc
        \/select_drink_pepsi
        \/drink_dispensing
        \/reset

=============================================================================
\* Modification History
\* Last modified Fri Aug 19 08:45:01 IST 2022 by mr_ab
\* Created Wed Aug 17 17:28:06 IST 2022 by mr_ab
