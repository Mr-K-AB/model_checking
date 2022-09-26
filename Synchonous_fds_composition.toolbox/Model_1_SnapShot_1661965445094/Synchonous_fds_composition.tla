--------------------- MODULE Synchonous_fds_composition ---------------------

EXTENDS Integers
VARIABLE S1,S2,Counter

Typeok == (S1 \in 0..1 /\ S2 \in 0..1 /\ Counter \in 0..20)

init0 == (Counter = 0)
init1 == (S1 = 0)
init2 == (S2 = 1)

Init == init0 /\ init1 /\ init2


P1_11 == (S1=1 /\ Counter<20 /\ Counter'=(Counter+1))     /\ UNCHANGED<< S1 >>
P1_10 == (S1=1 /\ Counter=20 /\ Counter'=0 /\ S1'=0 )     /\ UNCHANGED<<  >>
P1_00 == (S1=0 /\ Counter<20 /\ Counter'=(Counter+1))     /\ UNCHANGED<< S1 >>
P1_01 == (S1=0 /\ Counter=20 /\ Counter'=0 /\ S1'=1 )     /\ UNCHANGED<<  >>

P1 == P1_11 \/ P1_10 \/ P1_00 \/ P1_01

P2_11 == (S2=1 /\ Counter<20 /\ Counter'=(Counter+1))     /\ UNCHANGED<< S2 >>
P2_10 == (S2=1 /\ Counter=20 /\ Counter'=0 /\ S2'=0 )     /\ UNCHANGED<<  >>
P2_00 == (S2=0 /\ Counter<20 /\ Counter'=(Counter+1))     /\ UNCHANGED<< S2 >>
P2_01 == (S2=0 /\ Counter=20 /\ Counter'=0 /\ S2'=0 )     /\ UNCHANGED<<  >>

P2 == P2_11 \/ P2_10 \/ P2_00 \/ P2_01


Next == (P1) /\ (P2)


invariant == ~((S1=1/\S2=1)\/(S1=0/\S2=0))
=============================================================================
\* Modification History
\* Last modified Wed Aug 31 22:33:59 IST 2022 by mr_ab
\* Created Wed Aug 31 04:55:11 IST 2022 by mr_ab
