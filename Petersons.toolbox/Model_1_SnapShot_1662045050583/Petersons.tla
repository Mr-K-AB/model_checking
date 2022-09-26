----------------------------- MODULE Petersons -----------------------------

EXTENDS Integers

VARIABLE state0, state1, turn, inter0, inter1

vars == << state0, state1, turn, inter0, inter1 >>

Typeok == (state0 \in 0..7  /\ state1 \in 0..7 /\ turn \in 0..1 /\ inter0 \in BOOLEAN /\ inter1 \in BOOLEAN )


init0 == (state0 = 0 /\ inter0 = FALSE)
init1 == (state1 = 0 /\ inter1 = FALSE)
init2 == (turn = 0)

Init == init2 /\ init1 /\ init0
        
        

P0_01 == (state0=0 /\ state0'=1) /\ UNCHANGED << turn, inter0, inter1 >>
P0_12 == (state0=1 /\ state0'=2) /\ UNCHANGED << turn, inter0, inter1 >>
P0_23 == (inter0'=TRUE /\ state0=2 /\ state0'=3) /\ UNCHANGED << turn, inter1 >>
P0_34 == (turn'=1 /\ state0 = 3 /\ state0'=4) /\ UNCHANGED << inter0, inter1 >>
P0_44 == (state0=4 /\ (turn=1 /\ inter1=TRUE) ) /\ UNCHANGED <<state0, turn, inter0, inter1 >>
P0_45 == (state0=4 /\ ((turn=0) \/ (inter1=FALSE)) /\ state0'=5) /\ UNCHANGED << turn, inter0, inter1 >> 
P0_56 == (state0=5 /\ state0'=6) /\ UNCHANGED << turn,inter0,inter1 >>
P0_67 == (inter0'=FALSE /\ state0=6 /\ state0'=7) /\ UNCHANGED << turn, inter1 >>
P0_70 == (state0=7 /\ state0'=0) /\ UNCHANGED << turn,inter0,inter1 >>

P0 == P0_01 \/ P0_12 \/ P0_23 \/ P0_34 \/ P0_44 \/ P0_45 \/ P0_56 \/ P0_67 \/ P0_70

P1_01 == (state1=0 /\ state1'=1) /\ UNCHANGED << turn, inter0, inter1 >>
P1_12 == (state1=1 /\ state1'=2) /\ UNCHANGED << turn, inter0, inter1 >>
P1_23 == (inter1'=TRUE /\ state1=2 /\ state1'=3) /\ UNCHANGED << turn, inter0 >>
P1_34 == (turn'=0 /\ state1=3 /\ state1'=4) /\ UNCHANGED << inter0, inter1 >>
P1_44 == (state1=4 /\ (turn=0 /\ inter0=TRUE) ) /\ UNCHANGED << state1, turn, inter0, inter1 >>
P1_45 == (state1=4 /\ state1'=5 /\ ((turn=1) \/ (inter0=FALSE))) /\ UNCHANGED << turn, inter0, inter1 >>
P1_56 == (state1=5 /\ state1'=6) /\ UNCHANGED << turn,inter0,inter1 >>
P1_67 == (inter1'=FALSE /\ state1=6 /\ state1'=7) /\ UNCHANGED << turn,inter0 >>
P1_70 == (state1=7 /\ state1'=0) /\ UNCHANGED << turn,inter0,inter1 >>

P1 == P1_01 \/ P1_12 \/ P1_23 \/ P1_34 \/ P1_44 \/ P1_45 \/ P1_56 \/ P1_67 \/ P1_70


Next == (P0 /\ UNCHANGED<< state1 >>) \/ (P1 /\ UNCHANGED<< state0 >>)


invariant == ~((state0=5) /\ (state1=5))


Fairness == \/ WF_state0(P0_01)
            \/ WF_state0(P0_23)
            \/ WF_state0(P0_34)
            \/ WF_state0(P0_45)
            \/ WF_state0(P0_56)
            \/ WF_state0(P0_67)
            \/ WF_state0(P0_70)
            \/ WF_state1(P1_01)
            \/ WF_state1(P1_23)
            \/ WF_state1(P1_34)
            \/ WF_state1(P1_45)
            \/ WF_state1(P1_56)
            \/ WF_state1(P1_67)
            \/ WF_state1(P1_70)



FairSpec == ( Init /\ [][Next]_vars /\ Fairness)


\*BOUNDEDWAIT0 == []( (inter0=TRUE) => (<>(state0=5)) )
\*BOUNDEDWAIT0 == []( (inter0=TRUE) ~> ((state0=5)) )
\*BOUNDEDWAIT1 == []( (inter1=TRUE) ~> (state1=5) )


=============================================================================
\* Modification History
\* Last modified Thu Sep 01 20:40:43 IST 2022 by mr_ab
\* Created Wed Aug 24 17:04:14 IST 2022 by mr_ab
