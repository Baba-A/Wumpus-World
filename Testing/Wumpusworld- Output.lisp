
==============================================================
Starting image `alisp'
  with no arguments
  in directory `/home/abawumbila/cs365/BabaAwumbila-Wumpusworld/'
  on machine `localhost'.

International Allegro CL Enterprise Edition
8.1 [Linux (x86)] (Jul 17, 2008 11:39)
Copyright (C) 1985-2007, Franz Inc., Oakland, CA, USA.  All Rights Reserved.

This development copy of Allegro CL is licensed to:
   [TC17501] Vassar College

;; Optimization settings: safety 1, space 1, speed 1, debug 2.
;; For a complete description of all compiler switches given the current optimization settings evaluate
;; (EXPLAIN-COMPILER-SETTINGS).
CL-USER(1): ;; Setting (stream-external-format *terminal-io*) to :emacs-mule.
CL-USER(2): 
CL-USER(2): 
CL-USER(2): game
     0     1     2     3     4 
    ____  ____  ____  ____  ____ 
4: |    ||    ||    ||    ||    |
   |    ||    ||    ||    ||    |
   |____||____||____||____||____|
    ____  ____  ____  ____  ____ 
3: |    ||    ||    ||    ||    |
   |    ||    ||    ||    ||    |
   |____||____||____||____||____|
    ____  ____  ____  ____  ____ 
2: |    ||    ||    ||    ||    |
   |    ||    ||    ||    ||    |
   |____||____||____||____||____|
    ____  ____  ____  ____  ____ 
1: |    ||    ||    ||    ||    |
   |    ||    ||    ||    ||    |
   |____||____||____||____||____|
    ____  ____  ____  ____  ____ 
0: |    ||    ||    ||    ||    |
   |A   ||    ||    ||    ||    |
   |____||____||____||____||____|

---------------------------
Agent's Current Row: 0
Agent's Current Column: 0
Agent's Stench Sense: NIL
Agent's Breeze Sense: NIL
Agent's glitter Sense: NIL
Agent's Bump Senses: BOTTOM  WALL: T          LEFT WALL: T
                     TOP WALL: NIL            RIGHT WALL: NIL
Agent State: Alive
Score : 1000
Number of gold bars left = 4


CL-USER(3): 
CL-USER(3): 
CL-USER(3): 
CL-USER(3): 
CL-USER(4): 
CL-USER(4): 
CL-USER(4): 
CL-USER(4): (ask game *right*)


 It is safe to move Right

NIL
CL-USER(5): Running query...

-------- PROOF -------- 30 [binary,4.1,15.1,unit_del,16,17,18] -$ans(0,0).

Search stopped by max_proofs option.

...done running query!

CL-USER(5): 
CL-USER(5): 
CL-USER(5): 
CL-USER(5): 
CL-USER(5): 
CL-USER(5): (do-move-right game)
     0     1     2     3     4 
    ____  ____  ____  ____  ____ 
4: |    ||    ||    ||    ||    |
   |    ||    ||    ||    ||    |
   |____||____||____||____||____|
    ____  ____  ____  ____  ____ 
3: |    ||    ||    ||    ||    |
   |    ||    ||    ||    ||    |
   |____||____||____||____||____|
    ____  ____  ____  ____  ____ 
2: |    ||    ||    ||    ||    |
   |    ||    ||    ||    ||    |
   |____||____||____||____||____|
    ____  ____  ____  ____  ____ 
1: |    ||    ||    ||    ||    |
   |    ||    ||    ||    ||    |
   |____||____||____||____||____|
    ____  ____  ____  ____  ____ 
0: |    ||    ||    ||    ||    |
   |    ||A   ||    ||    ||    |
   |____||____||____||____||____|

---------------------------
Agent's Current Row: 0
Agent's Current Column: 1
Agent's Stench Sense: NIL
Agent's Breeze Sense: NIL
Agent's glitter Sense: NIL
Agent's Bump Senses: BOTTOM  WALL: T          LEFT WALL: NIL
                     TOP WALL: NIL            RIGHT WALL: NIL
Agent State: Alive
Score : 950
Number of gold bars left = 4


CL-USER(6): 
CL-USER(6): 
CL-USER(6): 
CL-USER(6): (ask game *right*)


 It is safe to move Right

NIL
CL-USER(7): Running query...

-------- PROOF -------- 35 [binary,4.1,19.1,unit_del,20,21,22] -$ans(0,1).

Search stopped by max_proofs option.

...done running query!

CL-USER(7): 
CL-USER(7): 
CL-USER(7): 
CL-USER(7): 
CL-USER(7): (do-move-right game)
     0     1     2     3     4 
    ____  ____  ____  ____  ____ 
4: |    ||    ||    ||    ||    |
   |    ||    ||    ||    ||    |
   |____||____||____||____||____|
    ____  ____  ____  ____  ____ 
3: |    ||    ||    ||    ||    |
   |    ||    ||    ||    ||    |
   |____||____||____||____||____|
    ____  ____  ____  ____  ____ 
2: |    ||    ||    ||    ||    |
   |    ||    ||    ||    ||    |
   |____||____||____||____||____|
    ____  ____  ____  ____  ____ 
1: |    ||    ||    ||    ||    |
   |    ||    ||    ||    ||    |
   |____||____||____||____||____|
    ____  ____  ____  ____  ____ 
0: |    ||    ||    ||    ||    |
   |    ||    ||A # ||    ||    |
   |____||____||____||____||____|

---------------------------
Agent's Current Row: 0
Agent's Current Column: 2
Agent's Stench Sense: NIL
Agent's Breeze Sense: T
Agent's glitter Sense: NIL
Agent's Bump Senses: BOTTOM  WALL: T          LEFT WALL: NIL
                     TOP WALL: NIL            RIGHT WALL: NIL
Agent State: Alive
Score : 900
Number of gold bars left = 4


CL-USER(8): 
CL-USER(8): 
CL-USER(8):
CL-USER(9): 
CL-USER(9): 
CL-USER(9): 
CL-USER(9): (ask game *right*)


 It is unsafe to move Right

NIL
CL-USER(10): Running query...

Search stopped by max_seconds option.

...done running query!

CL-USER(10): 
CL-USER(10): 
CL-USER(10): 
CL-USER(10): (do-move-left game)
     0     1     2     3     4 
    ____  ____  ____  ____  ____ 
4: |    ||    ||    ||    ||    |
   |    ||    ||    ||    ||    |
   |____||____||____||____||____|
    ____  ____  ____  ____  ____ 
3: |    ||    ||    ||    ||    |
   |    ||    ||    ||    ||    |
   |____||____||____||____||____|
    ____  ____  ____  ____  ____ 
2: |    ||    ||    ||    ||    |
   |    ||    ||    ||    ||    |
   |____||____||____||____||____|
    ____  ____  ____  ____  ____ 
1: |    ||    ||    ||    ||    |
   |    ||    ||    ||    ||    |
   |____||____||____||____||____|
    ____  ____  ____  ____  ____ 
0: |    ||    ||    ||    ||    |
   |    ||A   ||    ||    ||    |
   |____||____||____||____||____|

---------------------------
Agent's Current Row: 0
Agent's Current Column: 1
Agent's Stench Sense: NIL
Agent's Breeze Sense: NIL
Agent's glitter Sense: NIL
Agent's Bump Senses: BOTTOM  WALL: T          LEFT WALL: NIL
                     TOP WALL: NIL            RIGHT WALL: NIL
Agent State: Alive
Score : 850
Number of gold bars left = 4


CL-USER(11): 
CL-USER(12): 
CL-USER(12): 
CL-USER(12): 
CL-USER(12): (ask game *up*)


 It is safe to move Up

NIL
CL-USER(13): Running query...

-------- PROOF -------- 48 [binary,6.1,27.1,unit_del,28,29,30] -$ans(0,1).

Search stopped by max_proofs option.

...done running query!

CL-USER(13): 
CL-USER(13): 
CL-USER(13): 
CL-USER(13): 
CL-USER(13): 
CL-USER(13): (do-move-up game)
     0     1     2     3     4 
    ____  ____  ____  ____  ____ 
4: |    ||    ||    ||    ||    |
   |    ||    ||    ||    ||    |
   |____||____||____||____||____|
    ____  ____  ____  ____  ____ 
3: |    ||    ||    ||    ||    |
   |    ||    ||    ||    ||    |
   |____||____||____||____||____|
    ____  ____  ____  ____  ____ 
2: |    ||    ||    ||    ||    |
   |    ||    ||    ||    ||    |
   |____||____||____||____||____|
    ____  ____  ____  ____  ____ 
1: |    ||    ||    ||    ||    |
   |    ||A # ||    ||    ||    |
   |____||____||____||____||____|
    ____  ____  ____  ____  ____ 
0: |    ||    ||    ||    ||    |
   |    ||    ||    ||    ||    |
   |____||____||____||____||____|

---------------------------
Agent's Current Row: 1
Agent's Current Column: 1
Agent's Stench Sense: NIL
Agent's Breeze Sense: T
Agent's glitter Sense: NIL
Agent's Bump Senses: BOTTOM  WALL: NIL          LEFT WALL: NIL
                     TOP WALL: NIL            RIGHT WALL: NIL
Agent State: Alive
Score : 800
Number of gold bars left = 4


CL-USER(14): 
CL-USER(14): 
CL-USER(14): 
CL-USER(14): (do-move-down game)
     0     1     2     3     4 
    ____  ____  ____  ____  ____ 
4: |    ||    ||    ||    ||    |
   |    ||    ||    ||    ||    |
   |____||____||____||____||____|
    ____  ____  ____  ____  ____ 
3: |    ||    ||    ||    ||    |
   |    ||    ||    ||    ||    |
   |____||____||____||____||____|
    ____  ____  ____  ____  ____ 
2: |    ||    ||    ||    ||    |
   |    ||    ||    ||    ||    |
   |____||____||____||____||____|
    ____  ____  ____  ____  ____ 
1: |    ||    ||    ||    ||    |
   |    ||    ||    ||    ||    |
   |____||____||____||____||____|
    ____  ____  ____  ____  ____ 
0: |    ||    ||    ||    ||    |
   |    ||A   ||    ||    ||    |
   |____||____||____||____||____|

---------------------------
Agent's Current Row: 0
Agent's Current Column: 1
Agent's Stench Sense: NIL
Agent's Breeze Sense: NIL
Agent's glitter Sense: NIL
Agent's Bump Senses: BOTTOM  WALL: T          LEFT WALL: NIL
                     TOP WALL: NIL            RIGHT WALL: NIL
Agent State: Alive
Score : 750
Number of gold bars left = 4


CL-USER(15): 
CL-USER(15): 
CL-USER(15): 
CL-USER(15): (do-move-left game)
     0     1     2     3     4 
    ____  ____  ____  ____  ____ 
4: |    ||    ||    ||    ||    |
   |    ||    ||    ||    ||    |
   |____||____||____||____||____|
    ____  ____  ____  ____  ____ 
3: |    ||    ||    ||    ||    |
   |    ||    ||    ||    ||    |
   |____||____||____||____||____|
    ____  ____  ____  ____  ____ 
2: |    ||    ||    ||    ||    |
   |    ||    ||    ||    ||    |
   |____||____||____||____||____|
    ____  ____  ____  ____  ____ 
1: |    ||    ||    ||    ||    |
   |    ||    ||    ||    ||    |
   |____||____||____||____||____|
    ____  ____  ____  ____  ____ 
0: |    ||    ||    ||    ||    |
   |A   ||    ||    ||    ||    |
   |____||____||____||____||____|

---------------------------
Agent's Current Row: 0
Agent's Current Column: 0
Agent's Stench Sense: NIL
Agent's Breeze Sense: NIL
Agent's glitter Sense: NIL
Agent's Bump Senses: BOTTOM  WALL: T          LEFT WALL: T
                     TOP WALL: NIL            RIGHT WALL: NIL
Agent State: Alive
Score : 700
Number of gold bars left = 4


CL-USER(16): 
CL-USER(16): 
CL-USER(16): 
CL-USER(16): (ask game *up*)


 It is safe to move Up

NIL
CL-USER(17): Running query...

-------- PROOF -------- 61 [binary,6.1,39.1,unit_del,40,41,42] -$ans(0,0).

Search stopped by max_proofs option.

...done running query!

CL-USER(17): 
CL-USER(17): 
CL-USER(17): 
CL-USER(17): (do-move-up game)
     0     1     2     3     4 
    ____  ____  ____  ____  ____ 
4: |    ||    ||    ||    ||    |
   |    ||    ||    ||    ||    |
   |____||____||____||____||____|
    ____  ____  ____  ____  ____ 
3: |    ||    ||    ||    ||    |
   |    ||    ||    ||    ||    |
   |____||____||____||____||____|
    ____  ____  ____  ____  ____ 
2: |    ||    ||    ||    ||    |
   |    ||    ||    ||    ||    |
   |____||____||____||____||____|
    ____  ____  ____  ____  ____ 
1: |    ||    ||    ||    ||    |
   |A   ||    ||    ||    ||    |
   |____||____||____||____||____|
    ____  ____  ____  ____  ____ 
0: |    ||    ||    ||    ||    |
   |    ||    ||    ||    ||    |
   |____||____||____||____||____|

---------------------------
Agent's Current Row: 1
Agent's Current Column: 0
Agent's Stench Sense: NIL
Agent's Breeze Sense: NIL
Agent's glitter Sense: NIL
Agent's Bump Senses: BOTTOM  WALL: NIL          LEFT WALL: T
                     TOP WALL: NIL            RIGHT WALL: NIL
Agent State: Alive
Score : 650
Number of gold bars left = 4


CL-USER(18): 
CL-USER(18): 
CL-USER(18): 
CL-USER(18): 
CL-USER(18): (ask game *up*)


 It is safe to move Up

NIL
CL-USER(19): Running query...

-------- PROOF -------- 68 [binary,6.1,43.1,unit_del,44,45,46] -$ans(1,0).

Search stopped by max_proofs option.

...done running query!

CL-USER(19): 
CL-USER(19): 
CL-USER(19): 
CL-USER(19): 
CL-USER(19): (do-move-up game)
     0     1     2     3     4 
    ____  ____  ____  ____  ____ 
4: |    ||    ||    ||    ||    |
   |    ||    ||    ||    ||    |
   |____||____||____||____||____|
    ____  ____  ____  ____  ____ 
3: |    ||    ||    ||    ||    |
   |    ||    ||    ||    ||    |
   |____||____||____||____||____|
    ____  ____  ____  ____  ____ 
2: |    ||    ||    ||    ||    |
   |A   ||    ||    ||    ||    |
   |____||____||____||____||____|
    ____  ____  ____  ____  ____ 
1: |    ||    ||    ||    ||    |
   |    ||    ||    ||    ||    |
   |____||____||____||____||____|
    ____  ____  ____  ____  ____ 
0: |    ||    ||    ||    ||    |
   |    ||    ||    ||    ||    |
   |____||____||____||____||____|

---------------------------
Agent's Current Row: 2
Agent's Current Column: 0
Agent's Stench Sense: NIL
Agent's Breeze Sense: NIL
Agent's glitter Sense: NIL
Agent's Bump Senses: BOTTOM  WALL: NIL          LEFT WALL: T
                     TOP WALL: NIL            RIGHT WALL: NIL
Agent State: Alive
Score : 600
Number of gold bars left = 4


CL-USER(20): 
CL-USER(20): 
CL-USER(20): 
CL-USER(20): (ask game *up*)


 It is safe to move Up

NIL
CL-USER(21): Running query...

-------- PROOF -------- 75 [binary,6.1,47.1,unit_del,48,49,50] -$ans(2,0).

Search stopped by max_proofs option.

...done running query!

CL-USER(21): 
CL-USER(21): 
CL-USER(21): (do-move-up game)
     0     1     2     3     4 
    ____  ____  ____  ____  ____ 
4: |    ||    ||    ||    ||    |
   |    ||    ||    ||    ||    |
   |____||____||____||____||____|
    ____  ____  ____  ____  ____ 
3: |    ||    ||    ||    ||    |
   |A  *||    ||    ||    ||    |
   |____||____||____||____||____|
    ____  ____  ____  ____  ____ 
2: |    ||    ||    ||    ||    |
   |    ||    ||    ||    ||    |
   |____||____||____||____||____|
    ____  ____  ____  ____  ____ 
1: |    ||    ||    ||    ||    |
   |    ||    ||    ||    ||    |
   |____||____||____||____||____|
    ____  ____  ____  ____  ____ 
0: |    ||    ||    ||    ||    |
   |    ||    ||    ||    ||    |
   |____||____||____||____||____|

---------------------------
Agent's Current Row: 3
Agent's Current Column: 0
Agent's Stench Sense: NIL
Agent's Breeze Sense: NIL
Agent's glitter Sense: T
Agent's Bump Senses: BOTTOM  WALL: NIL          LEFT WALL: T
                     TOP WALL: NIL            RIGHT WALL: NIL
Agent State: Alive
Score : 550
Number of gold bars left = 4


CL-USER(22): 
CL-USER(22): 
CL-USER(22): 
CL-USER(22): (ask game *up*)


 It is safe to move Up

NIL
CL-USER(23): Running query...

-------- PROOF -------- 82 [binary,6.1,51.1,unit_del,52,53,54] -$ans(3,0).

Search stopped by max_proofs option.

...done running query!

CL-USER(23): 
CL-USER(23): 
CL-USER(23): 
CL-USER(23): (do-move-up game)


YOU PICKED UP A GOLD BAR! +50 POINTS

     0     1     2     3     4 
    ____  ____  ____  ____  ____ 
4: |    ||    ||    ||    ||    |
   |A   ||    ||    ||    ||    |
   |____||____||____||____||____|
    ____  ____  ____  ____  ____ 
3: |    ||    ||    ||    ||    |
   |    ||    ||    ||    ||    |
   |____||____||____||____||____|
    ____  ____  ____  ____  ____ 
2: |    ||    ||    ||    ||    |
   |    ||    ||    ||    ||    |
   |____||____||____||____||____|
    ____  ____  ____  ____  ____ 
1: |    ||    ||    ||    ||    |
   |    ||    ||    ||    ||    |
   |____||____||____||____||____|
    ____  ____  ____  ____  ____ 
0: |    ||    ||    ||    ||    |
   |    ||    ||    ||    ||    |
   |____||____||____||____||____|

---------------------------
Agent's Current Row: 4
Agent's Current Column: 0
Agent's Stench Sense: NIL
Agent's Breeze Sense: NIL
Agent's glitter Sense: NIL
Agent's Bump Senses: BOTTOM  WALL: NIL          LEFT WALL: T
                     TOP WALL: T            RIGHT WALL: NIL
Agent State: Alive
Score : 600
Number of gold bars left = 3


CL-USER(24): 
CL-USER(24): 
CL-USER(24): 
CL-USER(24): (ask game *up*)


 It is safe to move Up

NIL
CL-USER(25): Running query...

-------- PROOF -------- 89 [binary,6.1,55.1,unit_del,56,57,58] -$ans(4,0).

Search stopped by max_proofs option.

...done running query!

CL-USER(25): 
CL-USER(25): 
CL-USER(25): 
CL-USER(25): (do-move-up game)

Invalid Move: Agent bumped into top wall
     0     1     2     3     4 
    ____  ____  ____  ____  ____ 
4: |    ||    ||    ||    ||    |
   |A   ||    ||    ||    ||    |
   |____||____||____||____||____|
    ____  ____  ____  ____  ____ 
3: |    ||    ||    ||    ||    |
   |    ||    ||    ||    ||    |
   |____||____||____||____||____|
    ____  ____  ____  ____  ____ 
2: |    ||    ||    ||    ||    |
   |    ||    ||    ||    ||    |
   |____||____||____||____||____|
    ____  ____  ____  ____  ____ 
1: |    ||    ||    ||    ||    |
   |    ||    ||    ||    ||    |
   |____||____||____||____||____|
    ____  ____  ____  ____  ____ 
0: |    ||    ||    ||    ||    |
   |    ||    ||    ||    ||    |
   |____||____||____||____||____|

---------------------------
Agent's Current Row: 4
Agent's Current Column: 0
Agent's Stench Sense: NIL
Agent's Breeze Sense: NIL
Agent's glitter Sense: NIL
Agent's Bump Senses: BOTTOM  WALL: NIL          LEFT WALL: T
                     TOP WALL: T            RIGHT WALL: NIL
Agent State: Alive
Score : 600
Number of gold bars left = 3


CL-USER(26): 
CL-USER(26): 
CL-USER(26): 
CL-USER(26): 
CL-USER(26): (ask game *right*)


 It is safe to move Right

NIL
CL-USER(27): Running query...

-------- PROOF -------- 81 [binary,4.1,59.1,unit_del,60,61,62] -$ans(4,0).

Search stopped by max_proofs option.

...done running query!

CL-USER(27): 
CL-USER(27): 
CL-USER(27): 
CL-USER(27): 
CL-USER(27): (do-move-right game)
     0     1     2     3     4 
    ____  ____  ____  ____  ____ 
4: |    ||    ||    ||    ||    |
   |    ||A   ||    ||    ||    |
   |____||____||____||____||____|
    ____  ____  ____  ____  ____ 
3: |    ||    ||    ||    ||    |
   |    ||    ||    ||    ||    |
   |____||____||____||____||____|
    ____  ____  ____  ____  ____ 
2: |    ||    ||    ||    ||    |
   |    ||    ||    ||    ||    |
   |____||____||____||____||____|
    ____  ____  ____  ____  ____ 
1: |    ||    ||    ||    ||    |
   |    ||    ||    ||    ||    |
   |____||____||____||____||____|
    ____  ____  ____  ____  ____ 
0: |    ||    ||    ||    ||    |
   |    ||    ||    ||    ||    |
   |____||____||____||____||____|

---------------------------
Agent's Current Row: 4
Agent's Current Column: 1
Agent's Stench Sense: NIL
Agent's Breeze Sense: NIL
Agent's glitter Sense: NIL
Agent's Bump Senses: BOTTOM  WALL: NIL          LEFT WALL: NIL
                     TOP WALL: T            RIGHT WALL: NIL
Agent State: Alive
Score : 550
Number of gold bars left = 3


CL-USER(28): 
CL-USER(28): 
CL-USER(28): (ask game *right*)


 It is safe to move Right

NIL
CL-USER(29): Running query...

-------- PROOF -------- 86 [binary,4.1,63.1,unit_del,64,65,66] -$ans(4,1).

Search stopped by max_proofs option.

...done running query!

CL-USER(29): 
CL-USER(29): 
CL-USER(29): 
CL-USER(29): 
CL-USER(29): 
CL-USER(29): 
CL-USER(29): 
CL-USER(29): (do-move-right game)
     0     1     2     3     4 
    ____  ____  ____  ____  ____ 
4: |    ||    ||    ||    ||    |
   |    ||    ||A  *||    ||    |
   |____||____||____||____||____|
    ____  ____  ____  ____  ____ 
3: |    ||    ||    ||    ||    |
   |    ||    ||    ||    ||    |
   |____||____||____||____||____|
    ____  ____  ____  ____  ____ 
2: |    ||    ||    ||    ||    |
   |    ||    ||    ||    ||    |
   |____||____||____||____||____|
    ____  ____  ____  ____  ____ 
1: |    ||    ||    ||    ||    |
   |    ||    ||    ||    ||    |
   |____||____||____||____||____|
    ____  ____  ____  ____  ____ 
0: |    ||    ||    ||    ||    |
   |    ||    ||    ||    ||    |
   |____||____||____||____||____|

---------------------------
Agent's Current Row: 4
Agent's Current Column: 2
Agent's Stench Sense: NIL
Agent's Breeze Sense: NIL
Agent's glitter Sense: T
Agent's Bump Senses: BOTTOM  WALL: NIL          LEFT WALL: NIL
                     TOP WALL: T            RIGHT WALL: NIL
Agent State: Alive
Score : 500
Number of gold bars left = 3


CL-USER(30): 
CL-USER(30): 
CL-USER(30): 
CL-USER(30): (ask game *right*)


 It is safe to move Right

NIL
CL-USER(31): Running query...

-------- PROOF -------- 91 [binary,4.1,67.1,unit_del,68,69,70] -$ans(4,2).

Search stopped by max_proofs option.

...done running query!

CL-USER(31): 
CL-USER(31): 
CL-USER(31): 
CL-USER(31): 
CL-USER(31): (do-move-right game)


YOU PICKED UP A GOLD BAR! +50 POINTS

     0     1     2     3     4 
    ____  ____  ____  ____  ____ 
4: |    ||    ||    ||    ||    |
   |    ||    ||    ||A # ||    |
   |____||____||____||____||____|
    ____  ____  ____  ____  ____ 
3: |    ||    ||    ||    ||    |
   |    ||    ||    ||    ||    |
   |____||____||____||____||____|
    ____  ____  ____  ____  ____ 
2: |    ||    ||    ||    ||    |
   |    ||    ||    ||    ||    |
   |____||____||____||____||____|
    ____  ____  ____  ____  ____ 
1: |    ||    ||    ||    ||    |
   |    ||    ||    ||    ||    |
   |____||____||____||____||____|
    ____  ____  ____  ____  ____ 
0: |    ||    ||    ||    ||    |
   |    ||    ||    ||    ||    |
   |____||____||____||____||____|

---------------------------
Agent's Current Row: 4
Agent's Current Column: 3
Agent's Stench Sense: NIL
Agent's Breeze Sense: T
Agent's glitter Sense: NIL
Agent's Bump Senses: BOTTOM  WALL: NIL          LEFT WALL: NIL
                     TOP WALL: T            RIGHT WALL: NIL
Agent State: Alive
Score : 550
Number of gold bars left = 2


CL-USER(32): 
CL-USER(32): 
CL-USER(32): 
CL-USER(32): 
CL-USER(32): 
CL-USER(32): 
CL-USER(33): 
CL-USER(34): (ask game *right*)


 It is unsafe to move Right

NIL
CL-USER(35): Running query...

Search stopped by max_seconds option.

...done running query!

CL-USER(35): 
CL-USER(35): 
CL-USER(35): ;;;IT IS UNSAFE TO MOVE RIGHT BUT THAT IS THE EXIT SQUARE SO THE AGENT WILL MOVE THERE ANYWAY

CL-USER(35): 
CL-USER(35): 
CL-USER(35): 
CL-USER(35): (do-move-right game)


YOU FOUND THE EXIT! +1000

     0     1     2     3     4 
    ____  ____  ____  ____  ____ 
4: |    ||    ||    ||    ||    |
   |    ||    ||    ||    ||@   |
   |____||____||____||____||____|
    ____  ____  ____  ____  ____ 
3: |    ||    ||    ||    ||    |
   |    ||    ||    ||    ||    |
   |____||____||____||____||____|
    ____  ____  ____  ____  ____ 
2: |    ||    ||    ||    ||    |
   |    ||    ||    ||    ||    |
   |____||____||____||____||____|
    ____  ____  ____  ____  ____ 
1: |    ||    ||    ||    ||    |
   |    ||    ||    ||    ||    |
   |____||____||____||____||____|
    ____  ____  ____  ____  ____ 
0: |    ||    ||    ||    ||    |
   |    ||    ||    ||    ||    |
   |____||____||____||____||____|

---------------------------
Agent's Current Row: 4
Agent's Current Column: 4
Agent's Stench Sense: NIL
Agent's Breeze Sense: NIL
Agent's glitter Sense: NIL
Agent's Bump Senses: BOTTOM  WALL: NIL          LEFT WALL: NIL
                     TOP WALL: T            RIGHT WALL: T
Agent State: Exited Cave
Score : 1500
Number of gold bars left = 2


CONGRATULATIONS!! YOU WIN!!!!

YOU FINAL SCORE IS : 1500

CL-USER(36): 