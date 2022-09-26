---- MODULE MC ----
EXTENDS Synchonous_fds_composition, TLC

\* INVARIANT definition @modelCorrectnessInvariants:0
inv_16619057829768000 ==
~((S1=1/\S2=1)\/(S1=0/\S2=0))
----
=============================================================================
\* Modification History
\* Created Wed Aug 31 05:59:42 IST 2022 by mr_ab
