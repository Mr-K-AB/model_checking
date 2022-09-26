----------------------------- MODULE semaphore -----------------------------
EXTENDS Integers

VARIABLE stateP, stateQ, sem

vars == << stateP, stateQ, sem >>

Typeok == (stateP \in 0..5  /\ stateQ \in 0..5 /\ sem \in 0..1)


init0 == (stateP = 0)
init1 == (stateQ = 0)
init2 == (sem = 0)

Init == init2 /\ init1 /\ init0


\*#################################################################################################################



P_0 == (stateP=0 /\ stateP'=1)     /\ UNCHANGED<< sem >>
P_1 == (stateP=1 /\ stateP'=2)     /\ UNCHANGED<< sem >>

P_21 == (stateP=2 /\ sem=1 /\ stateP'=2)     /\ UNCHANGED<< sem >>
P_22 == (stateP=2 /\ sem=0 /\ sem'=1 /\ stateP'=3)     /\ UNCHANGED<<  >>

P_2 == (stateP=2 /\ IF (sem = 0) THEN (sem'=1 /\ stateP'=3) ELSE (stateP'=2))     /\ UNCHANGED<<  >>
P_3 == (stateP=3 /\ stateP'=4)     /\ UNCHANGED<< sem >>
P_4 == (stateP=4 /\ stateP'=5 /\ sem'=0)     /\ UNCHANGED<<  >>
P_5 == (stateP=5 /\ stateP'=0)     /\ UNCHANGED<< sem >>



P == (P_0 \/ P_1 \/ P_21 \/ P_22 \/ P_3 \/ P_4 \/ P_5)

\*#################################################################################################################


Q_0 == (stateQ=0 /\ stateQ'=1)     /\ UNCHANGED<< sem >>
Q_1 == (stateQ=1 /\ stateQ'=2)     /\ UNCHANGED<< sem >>

Q_21 == (stateQ=2 /\ sem=1 /\ stateQ'=2)     /\ UNCHANGED<< sem >>
Q_22 == (stateQ=2 /\ sem=0 /\ sem'=1 /\ stateQ'=3)     /\ UNCHANGED<<  >>

\*Q_2 == (stateQ=2 /\ IF (sem = 0) THEN (sem'=1 /\ stateQ'=3) ELSE (stateQ'=2))     /\ UNCHANGED<<  >>
Q_3 == (stateQ=3 /\ stateQ'=4)     /\ UNCHANGED<< sem >>
Q_4 == (stateQ=4 /\ stateQ'=5 /\ sem'=0)     /\ UNCHANGED<<  >>
Q_5 == (stateQ=5 /\ stateQ'=0)     /\ UNCHANGED<< sem >>



Q == (Q_0 \/ Q_1 \/ Q_21 \/ Q_22 \/ Q_3 \/ Q_4 \/ Q_5)

\*#################################################################################################################



Next == (P /\ UNCHANGED<< stateQ >>) \/ (Q /\ UNCHANGED<< stateP >>)



invariant == ~((stateP=3) /\ (stateQ=3))



\*#################################################################################################################

WeakFairness == /\ WF_stateQ(Q_0)
            /\ WF_stateQ(Q_1)
\*            /\ WF_stateQ(Q_21)
            /\ WF_stateQ(Q_22)
            /\ WF_stateQ(Q_3)
            /\ WF_stateQ(Q_4)
            /\ WF_stateQ(Q_5)
            /\ WF_stateP(P_0)
            /\ WF_stateP(P_1)
\*            /\ WF_stateP(P_21)
            /\ WF_stateP(P_22)
            /\ WF_stateP(P_3)
            /\ WF_stateP(P_4)
            /\ WF_stateP(P_5)
            
StrongFairness == /\ SF_stateQ(Q_22)
\*            /\ SF_stateQ(Q_3)
\*            /\ SF_stateQ(Q_22)
            /\ SF_stateP(P_22)
\*            /\ SF_stateP(P_3)
\*            /\ SF_stateP(P_22)



FairSpecWeak == ( Init /\ [][Next]_vars /\ WeakFairness)
FairSpecStrong == ( Init /\ [][Next]_vars /\ StrongFairness)



BOUNDEDWAIT0 == []( (stateQ=3) => (<> (stateQ=4) ) )
BOUNDEDWAIT1 == []( (stateP=3) => (<> (stateP=4) ) )


=============================================================================
\* Modification History
\* Last modified Wed Sep 21 18:54:41 IST 2022 by mr_ab
\* Created Wed Sep 21 16:44:49 IST 2022 by mr_ab
