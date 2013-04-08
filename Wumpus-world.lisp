%%% ==========================================
%%%   ABUBAKAR AWUMBILA
%%%   WUMUPS WORLD PROJECT - Wumpus-World Implementation
%%%   FILE:    Wumpus-world.lisp
%%% ==========================================


(setq compiler:tail-call-self-merge-switch t)
(setq compiler:tail-call-non-self-merge-switch t)


;;===========================================================================
;;;Alive or Dead or Exited checkers
;;;==========================================================================

(defconstant *alive* 0)
(defconstant *dead* 1)
(defconstant *exited* 2)

;;==========================================================================



;;==========================================================================
;;;Global constants
;;==========================================================================

(defconstant *down* 0)
(defconstant *left* 1)
(defconstant *up* 2)
(defconstant *right* 3)
(defconstant *none* 4)

;;==========================================================================

;;==========================================================================
;;;Move counter
;;==========================================================================

(defvar move 0)

;;==========================================================================


;;==========================================================================
;;;Element numbers/types
;;==========================================================================

(defconstant *wumpus* 0)
(defconstant *gold* 1)
(defconstant *pit* 2)
(defconstant *arrow* 3)
(defconstant *exit* 4)

;;==========================================================================



;;========================================================================== 
;;;Element Names
;;==========================================================================


(defconstant *element-names* #("W" "$" "O" ">" "E"))

;;==========================================================================


;;==========================================================================
;;;; ELEMENT STRUCT
;;; ------------------------------------------------
;;; INPUT: TYPE, ROW, COL - Creates an element of type with position(row, col)
;;; OUTPUT: None
;;; SIDE-EFFECTS: Creates Element
;;==========================================================================

(defstruct (element (:print-function print-element))
   Type
   row
   col )

;;==========================================================================



;;==========================================================================
;;; PRINT ELEMENT
;;;-------------------------------------------------
;;; INPUT: ELEMENT
;;; OUTPUT: None
;;; SIDE-EFFECTS: Prints nothing now (Initially it printed to element symbols
;;;               for testing)
;;==========================================================================


(defun print-element (element str depth)
   (declare (ignore depth))
   (format str "    " (aref *element-names* (element-type element))))

;;==========================================================================



;;==========================================================================
;;;; AGENT STRUCT
;;; ------------------------------------------------
;;; INPUT: None
;;; OUTPUT: None
;;; SIDE-EFFECTS: Creates A Wumpus world agent with intial row and col = 0
;;==========================================================================
(defstruct (agent (:print-function print-agent))
  (curr-row 0)
  (curr-col 0)
  (stench nil)
  (breeze nil)
  (glitter nil)
  (bump (make-array 4 :initial-element nil))
  (state *alive*)
  (score 1000))

;;==========================================================================



;;;==========================================================================
;;; PRINT AGENT
;;;-------------------------------------------------
;;; INPUT: P, AN AGENT
;;; OUTPUT: None
;;; SIDE-EFFECTS: Prints The agent based on it's state and also prints any
;;;               senses it percieves
;;===========================================================================

(defun print-agent (p str depth)
  (declare (ignore depth))
  (progn
    (if (eq (agent-state p) *dead*)
	(format str "X" )
      (if (eq (agent-state p) *exited*)
	  (format str "@")
	(format str "A" )))
    (if (agent-stench p)
	(format str "^")
      (format str " "))
    (if (agent-breeze p)
	(format str "#")
      (format str " "))
    (if (agent-glitter p)
	(format str "*")
      (format str " "))))-

;;===========================================================================



;;;==========================================================================
;;; UPDATE BUMP
;;;-------------------------------------------------
;;; INPUT: WORLD, A Wumpus World Struct
;;; OUTPUT: None
;;; SIDE-EFFECTS: Updates the Bump/Wall senses
;;===========================================================================

(defun update-bump (world)
  (let* ((agent (wumpusworld-agent world))
	 (bump (agent-bump agent)))
    (setf (aref bump *down*) (check-bottom-wall agent))
    (setf (aref bump *left*) (check-left-wall agent))
    (setf (aref bump *up*) (check-top-wall agent))
    (setf (aref bump *right*) (check-right-wall agent))))

;;===========================================================================


;;;==========================================================================
;;; WUMPUS WORLD STRUCT
;;;-------------------------------------------------
;;; INPUT: None
;;; OUTPUT: None
;;; SIDE-EFFECTS:  Creates a Wumpus World
;;===========================================================================
(defstruct (wumpusworld (:print-function print-WumpusWorld))
  (grid (make-array '(5 5) :initial-element nil))
  (agent (make-agent))
  (move-history nil)
  (num-gold 4)
  (gameover nil))


;;===========================================================================



;;;==========================================================================
;;; PRINT WUMPUS WORLD
;;;-------------------------------------------------
;;; INPUT: WORLD, A Wumpus World STRUCT
;;; OUTPUT: None
;;; SIDE-EFFECTS:  Prints a Text based representation of the world
;;===========================================================================


(defun print-WumpusWorld (world str depth)
  (declare (ignore depth))
  (let* ((grid (wumpusworld-grid world)) )
    (format str "     0     1     2     3     4 ~%")
    ;;;Print the grid with all the elements
    (dotimes (row 5)
      (format str "    ____  ____  ____  ____  ____ ~%")
      (format str "~A: " (- 4 row))
      (dotimes (col 5)
	  (format str "|    |"))
      (format str "~%")
      (format str "   ")
      (dotimes (col 5)
	(let* ((elt (aref grid (- 4 row) col)))
	  (format str "|")
	  (if elt
	      (format str "~A" elt)
	    (format str "    "))
	  (format str "|")))
      (format str "~%")
      (format str "   ")
      (dotimes (i 5)
	(format str "|____|"))
      (format str "~%"))
    (format str "~%")
    (format str "---------------------------~%")
    ;;;Print Information About the world
    (format t "Agent's Current Row: ~A~%" (agent-curr-row (wumpusworld-agent world)))
    (format t "Agent's Current Column: ~A~%" (agent-curr-col (wumpusworld-agent world)))
    (format t "Agent's Stench Sense: ~A~%" (agent-stench (wumpusworld-agent world)))
    (format t "Agent's Breeze Sense: ~A~%" (agent-Breeze (wumpusworld-agent world)))
    (format t "Agent's glitter Sense: ~A~%" (agent-glitter (wumpusworld-agent world)))
    (format t "Agent's Bump Senses: BOTTOM  WALL: ~A          " (aref (agent-bump (wumpusworld-agent world)) 0))
    (format t "LEFT WALL: ~A~%" (aref (agent-bump (wumpusworld-agent world)) 1))
    (format t "                     TOP WALL: ~A            " (aref (agent-bump (wumpusworld-agent world)) 2))
    (format t "RIGHT WALL: ~A~%" (aref (agent-bump (wumpusworld-agent world)) 3))
    (format t "Agent State: ~A~%" (print-state world))
    (format t "Score : ~A~%" (agent-score (wumpusworld-agent world)))
    (format str "Number of gold bars left = ~A~%~%~%" (wumpusworld-num-gold world))
    ;;;Prints Info If Gameover? or Game Won?
    (if (gameover? world)
	(progn
	  (format str "YOU LOSE SUCKER!!!!~%~%")
	  (if (< (agent-score (wumpusworld-agent world)) 0)
	      (setf (agent-score (wumpusworld-agent world)) 0))
	  (format str "YOU FINAL SCORE IS : ~A~%~%" (agent-score (wumpusworld-agent world)))))
    (if (won? world)
	(progn
	  (format str "CONGRATULATIONS!! YOU WIN!!!!~%~%")
	  (format str "YOU FINAL SCORE IS : ~A~%~%" (agent-score (wumpusworld-agent world)))))))



;;==================================================================================================



;;;==========================================================================
;;; PRINT STATE
;;;-------------------------------------------------
;;; INPUT: WORLD, A Wumpus World STRUCT
;;; OUTPUT: None
;;; SIDE-EFFECTS:  A helper function for the PRINT-WUMPUS-WORLD FUNCTION
;;===========================================================================

(defun print-state (world)
  (if (= (agent-state (wumpusworld-agent world)) *alive*)
      "Alive"
    (if (= (agent-state (wumpusworld-agent world)) *dead*)
	"dead"
      "Exited Cave")))

;;===========================================================================



;;;==========================================================================
;;; PLACE ELEMENT 
;;;-------------------------------------------------
;;; INPUT: WORLD, A Wumpus World STRUCT, TYPE, Element tye, ROW, COL 
;;; OUTPUT: None
;;; SIDE-EFFECTS: Creates and inserts the element at position(row, col)
;;===========================================================================

(defun place-element (world type row col)
   (let* ((elt (make-element :type type
			     :row row
			     :col col )))
     (setf (aref (wumpusworld-grid world) row col)  elt)))

;;===========================================================================
  


;;;==========================================================================
;;; PLACE AGENT
;;;-------------------------------------------------
;;; INPUT: WORLD, A Wumpus World STRUCT
;;; OUTPUT: None
;;; SIDE-EFFECTS: Creates and inserts AN AGENT at position(0,0)
;;===========================================================================


(defun place-agent (world)
  (let* ((agent (wumpusworld-agent world))
	 (row (agent-curr-row agent))
	 (col (agent-curr-col agent))
	 (grid (wumpusworld-grid world)))
    
    (setf (aref grid  row col) agent)))


;;===========================================================================



;;;==========================================================================
;;; REMOVE-AGENT
;;;-------------------------------------------------
;;; INPUT: WORLD, A Wumpus World STRUCT
;;; OUTPUT: None
;;; SIDE-EFFECTS: Removes an agent from its current loction
;;===========================================================================

(defun remove-agent (world)
  (let* ((agent (wumpusworld-agent world))
	(row (agent-curr-row agent))
	(col (agent-curr-col agent)))
    (setf (aref (wumpusworld-grid world) row col) nil)))

;;===========================================================================



;;;==========================================================================
;;; RAND-LOC
;;;-------------------------------------------------
;;; INPUT: WORLD, A Wumpus World STRUCT
;;; OUTPUT: None
;;; SIDE-EFFECTS: Generates Random Coordinates
;;===========================================================================


(defun rand-loc (world)
  (let ((rand-loc (make-array 2)))
    (setf (aref rand-loc 0) (random 5))
    (setf (aref rand-loc 1) (random 5))
    (let ((elt (aref (wumpusworld-grid world) (aref rand-loc 0) (aref rand-loc 1))))
      (if elt
	  (rand-loc world)
	rand-loc))))
;;===========================================================================


;;;==========================================================================
;;; INIT-GAME
;;;-------------------------------------------------
;;; INPUT: None
;;; OUTPUT: None
;;; SIDE-EFFECTS: Initializes A Wumpus world Game with Four gold bars,
;;;               one wumpus, four pits, one agent and one exit
;;;===========================================================================


(defun init-game ()
  (let ((game (make-wumpusworld)))
    (place-agent game)
    (place-element game *exit* 4 4)
    (dotimes (i 4)
      (let ((rand (rand-loc game)))
	(place-element game *pit* (aref rand 0) (aref rand 1))))
    (dotimes (i 4)
      (let ((rand (rand-loc game)))
	(place-element game *gold* (aref rand 0) (aref rand 1))))
    (let ((rand (rand-loc game)))
      (place-element game *wumpus* (aref rand 0) (aref rand 1)))
    (update-bump game)
    (detect-stench game)
    (detect-breeze game)
    (detect-glitter game)
    (init-info-kb)
    (tell game)
    game))


;;;===========================================================================


;;;==========================================================================
;;; INIT-INFO-KB
;;;-------------------------------------------------
;;; INPUT: None
;;; OUTPUT: None
;;; SIDE-EFFECTS: Initializes A KNowledge Base File Which is updated as the Game is Played
;;;===========================================================================

(defun init-info-kb ()
  (with-open-file (stream  "InfoKB.in"
                           :direction :output
                           :if-exists :overwrite
                           :if-does-not-exist :create )
    (setf kb (open "InfoKB.in" :direction :output :if-exists :supersede))
    (format stream "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%~%")
    (format stream "%%%   Baba Awumbila~%")
    (format stream "%%%   CS365 - FINAL PROJECT - WUMPUS WORLD~%")
    (format stream "%%%   INFORMATION KNOWLEDGE BASE~%")
    (format stream "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%~%~%")
    (format stream "~%" )
    (format stream "%%%This knowledge base is updated as the game is played~%~%~%" )
    (format stream "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%~%")
    (format stream "%%%            UPDATES                                %%%%~%")
    (format stream "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%~%~%~%")
    ))

;;;===========================================================================



;;;==========================================================================
;;; CHECK-WALL FUNCTIONS
;;;-------------------------------------------------
;;; INPUT: AGENT
;;; OUTPUT: Returns boolean: t if there is a wall in given direction, else returns: nil
;;; SIDE-EFFECTS: None
;;;===========================================================================

(defun check-right-wall (agent)
  (= (agent-curr-col agent) 4))

(defun check-left-wall (agent)
  (= (agent-curr-col agent) 0))

(defun check-bottom-wall (agent)
  (= (agent-curr-row agent) 0))

(defun check-top-wall (agent)
  (= (agent-curr-row agent) 4))

;;;===========================================================================


;;;==========================================================================
;;; CHECK-NEXT-ROOM  FUNCTIONS
;;;-------------------------------------------------
;;; INPUT: WORLD, TYPE
;;; OUTPUT: Boolean
;;; SIDE-EFFECTS: Checks the given room for element:type
;;;===========================================================================

(defun check-right-room (world type)
  (let* ((grid (wumpusworld-grid world))
	 (agent (wumpusworld-agent world))
	 (row (agent-curr-row agent))
	 (col (agent-curr-col agent)))
    (if (aref grid row (+ col 1))
	(eq (element-type (aref grid row (+ col 1))) type)
      nil)))

(defun check-left-room (world type)
  (let* ((grid (wumpusworld-grid world))
	 (agent (wumpusworld-agent world))
	 (row (agent-curr-row agent))
	 (col (agent-curr-col agent)))
    (if (aref grid row (- col 1))
	(eq (element-type (aref grid row (- col 1))) type)
      nil)))

(defun check-top-room (world type)
  (let* ((grid (wumpusworld-grid world))
	 (agent (wumpusworld-agent world))
	 (row (agent-curr-row agent))
	 (col (agent-curr-col agent)))
    (if (aref grid (+ row 1) col)
	(eq (element-type (aref grid (+ row 1) col)) type)
      nil)))

(defun check-bottom-room (world type)
  (let* ((grid (wumpusworld-grid world))
	 (agent (wumpusworld-agent world))
	 (row (agent-curr-row agent))
	 (col (agent-curr-col agent)))
    (if (aref grid (- row 1) col)
	(eq (element-type (aref grid (- row 1) col)) type)
      nil)))

;;;===========================================================================



;;;==========================================================================
;;; UPDATE_SCORE
;;;-------------------------------------------------
;;; INPUT: WORLD
;;; OUTPUT: None
;;; SIDE-EFFECTS: Subtracts 50 points after Each move
;;;===========================================================================

(defun update-score (world)
  (let* ((agent (wumpusworld-agent world))
	 (score (agent-score agent)))
    (setf (agent-score agent) (- score 50))))

;;;===========================================================================




;;;==========================================================================
;;; DO-MOVE FUNCTIONS
;;;-------------------------------------------------
;;; INPUT: GAME, an initialized wumpus world
;;; OUTPUT: None
;;; SIDE-EFFECTS: Moves the agent in given direaction and does necessary updates
;;;===========================================================================

;;Move Right Function

(defun do-move-right (game)
  (let* ((agent (wumpusworld-agent game))
	 (prev-col (agent-curr-col agent)))
    (if (check-right-wall agent)
	(format t "~%Invalid Move: Agent bumped into right wall~%")
      (progn
	(check-for-pit-right game)
	(check-for-wumpus-right game)
	(check-for-gold-right game)
	(check-for-exit-right game)
	(remove-agent game)
	(setf (agent-curr-col agent)(+ prev-col 1))
	(place-agent game)
	(update-score game)))
    (update-bump game)
    (detect-stench game)
    (detect-breeze game)
    (detect-glitter game)
    (tell game)
    game))



;;;move left function

(defun do-move-left (game)
  (let* ((agent (wumpusworld-agent game))
	 (prev-col (agent-curr-col agent)))
    (if (check-left-wall agent)
	(format t "~%Invalid Move: Agent bumped into left wall~%")
      (progn
	(check-for-pit-left game)
	(check-for-wumpus-left game)
	(check-for-gold-left game)
	(check-for-exit-left game)
	(remove-agent game)
	(setf (agent-curr-col agent)(- prev-col 1))
	(place-agent game)
	(update-score game)))
    (update-bump game)
    (update-bump game)
    (detect-stench game)
    (detect-breeze game)
    (detect-glitter game)
    (tell game)
    game))


  
  
;;;move up function

(defun do-move-up (game)
  (let* ((agent (wumpusworld-agent game))
	 (prev-row (agent-curr-row agent)))
    (if (check-top-wall agent)
	(format t "~%Invalid Move: Agent bumped into top wall~%" )
      (progn
	(check-for-pit-up game)
	(check-for-wumpus-up game)
	(check-for-gold-up game)
	(check-for-exit-up game)
	(remove-agent game)
	(setf (agent-curr-row agent)(+ prev-row 1))
	(place-agent game)
	(update-score game)))
    (update-bump game)
    (detect-stench game)
    (detect-breeze game)
    (detect-glitter game)
    (tell game)
    game))



  
;;;move down function

(defun do-move-down (game)
  (let* ((agent (wumpusworld-agent game))
	 (prev-row (agent-curr-row agent)))
    (if (check-bottom-wall agent)
	(format t "~%Invaid Move: Agent bumped into bottom wall~%")
      (progn
	(check-for-pit-down game)
	(check-for-wumpus-down game)
	(check-for-gold-down game)
	(check-for-exit-down game)
	(remove-agent game)
	(setf (agent-curr-row agent)(- prev-row 1))
	(place-agent game)
	(update-score game)))
    (update-bump game)
    (detect-stench game)
    (detect-breeze game)
    (detect-glitter game)
    (tell game)
     game))


;;;==============================================================================



;;;==============================================================================
;;; DETECT STENCH
;;;-------------------------------------------------
;;; INPUT: WORLD, an initialized wumpus world
;;; OUTPUT: None
;;; SIDE-EFFECTS: Checks to see if there is a wumpus in adjacent rooms and updates
;;;               Stench Sense
;;;==============================================================================

(defun detect-stench (world)
    (or (detect-stench-top world)
	(detect-stench-bottom world)
	(detect-stench-left world)
	(detect-stench-right world)))
 

;;;----------------------------------------------------------------------------
;;; DETECT STENCH HELPER FUNCTIONS
;;;----------------------------------------------------------------------------

(defun detect-stench-top (world)
  (let* ((agent (wumpusworld-agent world))
	 (row (agent-curr-row agent))
	 (col (agent-curr-col agent))
	 (grid (wumpusworld-grid world))
	 (bump (agent-bump agent)))
    (if (eq (aref bump 2) nil)
	(if (aref grid (+ row 1) col)
	    (if (= (element-type (aref grid (+ row 1) col)) *wumpus*)
		(setf (agent-stench agent) t)
	      (setf (agent-stench agent) nil))
	  (setf (agent-stench agent) nil)))))


(defun detect-stench-bottom (world)
  (let* ((agent (wumpusworld-agent world))
	 (row (agent-curr-row agent))
	 (col (agent-curr-col agent))
	 (grid (wumpusworld-grid world))
	 (bump (agent-bump agent)))
    (if (eq (aref bump 0) nil)
	(if (aref grid (- row 1) col)
	    (if (= (element-type (aref grid (- row 1) col)) *wumpus*)
		(setf (agent-stench agent) t)
	      (setf (agent-stench agent) nil))
	  (setf (agent-stench agent) nil)))))


(defun detect-stench-left (world)
  (let* ((agent (wumpusworld-agent world))
	 (row (agent-curr-row agent))
	 (col (agent-curr-col agent))
	 (grid (wumpusworld-grid world))
	 (bump (agent-bump agent)))
    (if (eq (aref bump 1) nil)
	(if (aref grid row (- col 1))
	    (if (= (element-type (aref grid row (- col 1))) *wumpus*)
		(setf (agent-stench agent) t)
	      (setf (agent-stench agent) nil))
	  (setf (agent-stench agent) nil)))))



(defun detect-stench-right (world)
  (let* ((agent (wumpusworld-agent world))
	 (row (agent-curr-row agent))
	 (col (agent-curr-col agent))
	 (grid (wumpusworld-grid world))
	 (bump (agent-bump agent)))
    (if (eq (aref bump 3) nil)
	(if (aref grid row (+ col 1))
	    (if (= (element-type (aref grid row (+ col 1))) *wumpus*)
		(setf (agent-stench agent) t)
	      (setf (agent-stench agent) nil))
	  (setf (agent-stench agent) nil)))))


;;;==============================================================================



;;;;==============================================================================
;;; DETECT BREEZE
;;;-------------------------------------------------
;;; INPUT: WORLD, an initialized wumpus world
;;; OUTPUT: None
;;; SIDE-EFFECTS: Checks to see if there is a pit in adjacent rooms and updates
;;;               breeze Sense
;;;==============================================================================


(defun detect-breeze (world)
  (or
   (detect-breeze-bottom world)
   (detect-breeze-left world)
   (detect-breeze-top world)
   (detect-breeze-right world)))


;;;----------------------------------------------------------------------------
;;; DETECT BREEZE  HELPER FUNCTIONS
;;;----------------------------------------------------------------------------

(defun detect-breeze-top (world)
  (let* ((agent (wumpusworld-agent world))
	 (row (agent-curr-row agent))
	 (col (agent-curr-col agent))
	 (grid (wumpusworld-grid world))
	 (bump (agent-bump agent)))
    (if (eq (aref bump 2) nil)
	(if (aref grid (+ row 1) col)
	    (if (= (element-type (aref grid (+ row 1) col)) *pit*)
		(setf (agent-breeze agent) t)
	      (setf (agent-breeze agent) nil))
	  (setf (agent-breeze agent) nil)))))


(defun detect-breeze-bottom (world)
  (let* ((agent (wumpusworld-agent world))
	 (row (agent-curr-row agent))
	 (col (agent-curr-col agent))
	 (grid (wumpusworld-grid world))
	 (bump (agent-bump agent)))
    (if (eq (aref bump 0) nil)
	(if (aref grid (- row 1) col)
	    (if (= (element-type (aref grid (- row 1) col)) *pit*)
		(setf (agent-breeze agent) t)
	      (setf (agent-breeze agent) nil))
	  (setf (agent-breeze agent) nil)))))


(defun detect-breeze-left (world)
  (let* ((agent (wumpusworld-agent world))
	 (row (agent-curr-row agent))
	 (col (agent-curr-col agent))
	 (grid (wumpusworld-grid world))
	 (bump (agent-bump agent)))
    (if (eq (aref bump 1) nil)
	(if (aref grid row (- col 1))
	    (if (= (element-type (aref grid row (- col 1))) *pit*)
		(setf (agent-breeze agent) t)
	      (setf (agent-breeze agent) nil))
	  (setf (agent-breeze agent) nil)))))



(defun detect-breeze-right (world)
  (let* ((agent (wumpusworld-agent world))
	 (row (agent-curr-row agent))
	 (col (agent-curr-col agent))
	 (grid (wumpusworld-grid world))
	 (bump (agent-bump agent)))
    (if (eq (aref bump 3) nil)
	(if (aref grid row (+ col 1))
	    (if (= (element-type (aref grid row (+ col 1))) *pit*)
		(setf (agent-breeze agent) t)
	      (setf (agent-breeze agent) nil))
	  (setf (agent-breeze agent) nil)))))  

;;;;==============================================================================



;;;;==============================================================================
;;; DETECT GLITTER
;;;-------------------------------------------------
;;; INPUT: WORLD, an initialized wumpus world
;;; OUTPUT: None
;;; SIDE-EFFECTS: Checks to see if there is goldn adjacent rooms and updates
;;;               gltter  Sense
;;;==============================================================================




(defun detect-glitter (world)
  (or
   (detect-glitter-bottom world)
   (detect-glitter-left world)
   (detect-glitter-top world)
   (detect-glitter-right world)))
 

;;;----------------------------------------------------------------------------
;;; DETECT BREEZE  HELPER FUNCTIONS
;;;----------------------------------------------------------------------------


(defun detect-glitter-top (world)
  (let* ((agent (wumpusworld-agent world))
	 (row (agent-curr-row agent))
	 (col (agent-curr-col agent))
	 (grid (wumpusworld-grid world))
	 (bump (agent-bump agent)))
    (if (eq (aref bump 2) nil)
	(if (aref grid (+ row 1) col)
	    (if (= (element-type (aref grid (+ row 1) col)) *gold*)
		(setf (agent-glitter agent) t)
	      (setf (agent-glitter agent) nil))
	  (setf (agent-glitter agent) nil)))))


(defun detect-glitter-bottom (world)
  (let* ((agent (wumpusworld-agent world))
	 (row (agent-curr-row agent))
	 (col (agent-curr-col agent))
	 (grid (wumpusworld-grid world))
	 (bump (agent-bump agent)))
    (if (eq (aref bump 0) nil)
	(if (aref grid (- row 1) col)
	    (if (= (element-type (aref grid (- row 1) col)) *gold*)
		(setf (agent-glitter agent) t)
	      (setf (agent-glitter agent) nil))
	  (setf (agent-glitter agent) nil)))))


(defun detect-glitter-left (world)
  (let* ((agent (wumpusworld-agent world))
	 (row (agent-curr-row agent))
	 (col (agent-curr-col agent))
	 (grid (wumpusworld-grid world))
	 (bump (agent-bump agent)))
    (if (eq (aref bump 1) nil)
	(if (aref grid row (- col 1))
	    (if (= (element-type (aref grid row (- col 1))) *gold*)
		(setf (agent-glitter agent) t)
	      (setf (agent-glitter agent) nil))
	  (setf (agent-glitter agent) nil)))))



(defun detect-glitter-right (world)
  (let* ((agent (wumpusworld-agent world))
	 (row (agent-curr-row agent))
	 (col (agent-curr-col agent))
	 (grid (wumpusworld-grid world))
	 (bump (agent-bump agent)))
    (if (eq (aref bump 3) nil)
	(if (aref grid row (+ col 1))
	    (if (= (element-type (aref grid row (+ col 1))) *gold*)
		(setf (agent-glitter agent) t)
	      (setf (agent-glitter agent) nil))
	  (setf (agent-glitter agent) nil))))) 

;;;;;==============================================================================



;;;;;==============================================================================
;;; CHECK-FOR-PIT FUNCTIONS
;;;-------------------------------------------------
;;; INPUT: WORLD, an initialized wumpus world
;;; OUTPUT: None
;;; SIDE-EFFECTS: Checks to see if there is a pit in the room about to be moved in
;;;               If There is a pit, it ends the game accordingly
;;;==============================================================================


(defun check-for-pit-right (world)
  (let* ((agent (wumpusworld-agent world))
	 (score (agent-score agent)))
    (if (check-right-room world *pit*)
	(progn
	  (format t "~%~%YOU FELL INTO A PIT! YOU ARE DEAD! -1000~%~%")
	  (setf (agent-state agent) *dead*)
	  (setf (agent-score agent) (- score 1000))))))

(defun check-for-pit-left (world)
  (let* ((agent (wumpusworld-agent world))
	 (score (agent-score agent)))
    (if (check-left-room world *pit*)
	(progn
	  (format t "~%~%YOU FELL INTO A PIT! YOU ARE DEAD! -1000~%~%")
	  (setf (agent-state agent) *dead*)
	  (setf (agent-score agent) (- score 1000))))))


(defun check-for-pit-up    (world)
  (let* ((agent (wumpusworld-agent world))
	 (score (agent-score agent)))
    (if (check-top-room world *pit*)
	(progn
	  (format t "~%~%YOU FELL INTO A PIT! YOU ARE DEAD! -1000~%~%")
	  (setf (agent-state agent) *dead*)
	  (setf (agent-score agent) (- score 1000))))))


(defun check-for-pit-down (world)
  (let* ((agent (wumpusworld-agent world))
	 (score (agent-score agent)))
    (if (check-bottom-room world *pit*)
	(progn
	  (format t "~%~%YOU FELL INTO A PIT! YOU ARE DEAD! -1000~%~%")
	  (setf (agent-state agent) *dead*)
	  (setf (agent-score agent) (- score 1000))))))

;;;;;==============================================================================


;;;;;==============================================================================
;;; CHECK-FOR-WUMPUS FUNCTIONS
;;;-------------------------------------------------
;;; INPUT: WORLD, an initialized wumpus world
;;; OUTPUT: None
;;; SIDE-EFFECTS: Checks to see if there is a wumpus in the room about to be moved in
;;;               If There is a wumpus, it ends the game accordingly
;;;==============================================================================



(defun check-for-wumpus-right (world)
  (let* ((agent (wumpusworld-agent world))
	 (score (agent-score agent)))
    (if (check-right-room world *wumpus*)
	(progn
	  (format t "~%~%YOU WERE EATEN BY THE WUMPUS! YOU ARE DEAD! -1000~%~%")
	  (setf (agent-state agent) *dead*)
	  (setf (agent-score agent) (- score 1000))))))

(defun check-for-wumpus-left (world)
  (let* ((agent (wumpusworld-agent world))
	 (score (agent-score agent)))
    (if (check-left-room world *wumpus*)
	(progn
	  (format t "~%~%YOU WERE EATEN BY THE WUMPUS! YOU ARE DEAD! -1000~%~%")
	  (setf (agent-state agent) *dead*)
	  (setf (agent-score agent) (- score 1000))))))


(defun check-for-wumpus-up    (world)
  (let* ((agent (wumpusworld-agent world))
	 (score (agent-score agent)))
    (if (check-top-room world *wumpus*)
	(progn
	  (format t "~%~%YOU WERE EATEN BY THE WUMPUS! YOU ARE DEAD! -1000~%~%")
	  (setf (agent-state agent) *dead*)
	  (setf (agent-score agent) (- score 1000))))))


(defun check-for-wumpus-down (world)
  (let* ((agent (wumpusworld-agent world))
	 (score (agent-score agent)))
    (if (check-bottom-room world *wumpus*)
	(progn
	  (format t "~%~%YOU WERE EATEN BY THE WUMPUS! YOU ARE DEAD! -1000~%~%")
	  (setf (agent-state agent) *dead*)
	  (setf (agent-score agent) (- score 1000))))))


;;;;;==============================================================================

;;;;;==============================================================================
;;; CHECK-FOR-GOLD FUNCTIONS
;;;-------------------------------------------------
;;; INPUT: WORLD, an initialized wumpus world
;;; OUTPUT: None
;;; SIDE-EFFECTS: Checks to see if there is gold in the room about to be moved in
;;;               If There is gold, it grabs it and updates the score
;;;==============================================================================



(defun check-for-gold-right (world)
  (let* ((agent (wumpusworld-agent world))
	 (score (agent-score agent))
	 (gold (wumpusworld-num-gold world)))
    (if (check-right-room world *gold*)
	(progn
	  (format t "~%~%YOU PICKED UP A GOLD BAR! +50 POINTS~%~%")
	  (setf (agent-score agent) (+ score 100))
	  (setf (wumpusworld-num-gold world) (- gold 1))))))

(defun check-for-gold-left (world)
  (let* ((agent (wumpusworld-agent world))
	 (score (agent-score agent))
	 (gold (wumpusworld-num-gold world)))
    (if (check-left-room world *gold*)
	(progn
	  (format t "~%~%YOU PICKED UP A GOLD BAR! +50 POINTS~%~%")
	  (setf (agent-score agent) (+ score 100))
	  (setf (wumpusworld-num-gold world) (- gold 1))))))


(defun check-for-gold-up    (world)
  (let* ((agent (wumpusworld-agent world))
	 (score (agent-score agent))
	 (gold (wumpusworld-num-gold world)))
    (if (check-top-room world *gold*)
	(progn
	  (format t "~%~%YOU PICKED UP A GOLD BAR! +50 POINTS~%~%")
	  (setf (agent-score agent) (+ score 100))
	  (setf (wumpusworld-num-gold world) (- gold 1))))))




(defun check-for-gold-down (world)
  (let* ((agent (wumpusworld-agent world))
	 (score (agent-score agent))
	 (gold (wumpusworld-num-gold world)))
    (if (check-bottom-room world *gold*)
	(progn
	  (format t "~%~%YOU PICKED UP A GOLD BAR! +50 POINTS~%~%")
	  (setf (agent-score agent) (+ score 100))
	  (setf (wumpusworld-num-gold world) (- gold 1))))))


;;;;;==============================================================================

;;;===============================================================================
;;; CHECK-FOR-EXIT FUNCTIONS
;;;-------------------------------------------------
;;; INPUT: WORLD, an initialized wumpus world
;;; OUTPUT: None
;;; SIDE-EFFECTS: Checks to see if there is an exit in the room about to be moved in
;;;               If There is an exit, it ends it and updates the score
;;;===============================================================================



(defun check-for-exit-right (world)
  (let* ((agent (wumpusworld-agent world))
	 (score (agent-score agent)))
    (if (check-right-room world *exit*)
	(progn
	  (format t "~%~%YOU FOUND THE EXIT! +1000~%~%")
	  (setf (agent-score agent) (+ score 1000))
	  (setf (agent-state agent) *exited*)))))

(defun check-for-exit-left (world)
  (let* ((agent (wumpusworld-agent world))
	 (score (agent-score agent)))
    (if (check-left-room world *exit*)
	(progn
	  (format t "~%~%YOU FOUND THE EXIT! +1000~%~%")
	  (setf (agent-score agent) (+ score 1000))
	  (setf (agent-state agent) *exited*)))))



(defun check-for-exit-up    (world)
  (let* ((agent (wumpusworld-agent world))
	 (score (agent-score agent)))
    (if (check-top-room world *exit*)
	(progn
	(format t "~%~%YOU FOUND THE EXIT! +1000~%~%")
	(setf (agent-score agent) (+ score 1000))
	(setf (agent-state agent) *exited*)))))

(defun check-for-exit-down (world)
  (let* ((agent (wumpusworld-agent world))
	 (score (agent-score agent)))
    (if (check-bottom-room world *exit*)
	(progn
	 	(format t "~%~%YOU FOUND THE EXIT! +1000~%~%")
	(setf (agent-score agent) (+ score 1000))
	(setf (agent-state agent) *exited*)))))


;;;;;;==============================================================================

;;;===============================================================================
;;; GAMEOVER?
;;;-------------------------------------------------
;;; INPUT: WORLD, an initialized wumpus world
;;; OUTPUT: None
;;; SIDE-EFFECTS: Checks to see if the agent is dead and updates the agents state
;;;===============================================================================

(defun gameover? (world)
  (let* ((agent (wumpusworld-agent world))
	 (state (agent-state agent)))
    (if (eq state *dead*)
	(setf (wumpusworld-gameover world) t)
      (setf (wumpusworld-gameover world) nil))))

;;;================================================================================


;;;===============================================================================
;;; WON?
;;;-------------------------------------------------
;;; INPUT: WORLD, an initialized wumpus world
;;; OUTPUT: None
;;; SIDE-EFFECTS: Checks to see if the agent has exited the cave(Won) 
;;;               and updates the agents state
;;;===============================================================================

(defun won? (world)
  (let* ((agent (wumpusworld-agent world))
	 (state (agent-state agent)))
    (eq state *exited*)))


;;;================================================================================




;;;===============================================================================
;;; WRITE-QUERY
;;; ------------------------------------------------
;;; INPUT: X, Y (Coordinates), STENCH, BREEZE (booleans), MOVE (global variables)
;;; OUTPUT: None
;;; SIDE-EFFECTS:  writes a new query file.
;;;===============================================================================


(defun write-query (x y stench breeze move)
  (setf str (open "query.in" :direction :output :if-exists :supersede))
  (Write-line "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%" str)
  (Write-line "%%%    Baba Awumbila" str)
  (Write-line "%%%    CS365 - FINAL PROJECT - WUMPUS WORLD" str)
  (Write-line "%%%    QUERRY FILE  " str)
  (Write-line "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%" str)
  (format str "~%~%")
  (write-line "%%% ROOM INFORMATION" str)
  (format str "~%")
  (write-line (concatenate 'string "CurrentPos("x","y").") str)
  (if stench
      (write-line (concatenate 'string "Stench("x","y").") str)
    (write-line (concatenate 'string "-Stench("x","y").") str))
  (if breeze
      (write-line (concatenate 'string "Breeze("x","y").") str)
    (write-line (concatenate 'string "-Breeze("x","y").") str))
  (format str "~%~%~%")
  (format str "%%%    NEGATED QUERY~%~%")
  (if (eq move *right*)
      (write-line "-(exists x y ((CanGoRight(x,y)) & $ans(x,y)))." str))
  (if (eq move *left*)
      (write-line "-(exists x y ((CanGoLeft(x,y)) & $ans(x,y)))." str))
  (if (eq move *up*)
      (write-line "-(exists x y ((CanGoUp(x,y)) & $ans(x,y)))." str))
  (if (eq move *down*)
      (write-line "-(exists x y ((CanGoRight(x,y)) & $ans(x,y)))." str))
  (if (eq move *none*)
      (write-line "-(exists x y ((CanGo(x,y)) & $ans(x,y)))." str))
  (format str "~%~%~%")
  (write-line "end_of_list." str)
  (close str)
  )

;;;===============================================================================

;;;===============================================================================
;;; ASK-QUERY
;;; ------------------------------------------------
;;; INPUT: None
;;; OUTPUT: None
;;; SIDE-EFFECTS: Poses a Query to the knowledge base
;;;===============================================================================


(defun ask-query (x y stench breeze move)
  (write-query x y stench breeze move)
  (run-shell-command "make" :wait nil)
  nil )


;;;===============================================================================



;;;===============================================================================
;;; READ-QUERY
;;; ------------------------------------------------
;;; INPUT: None
;;; OUTPUT: BOLEAN, True If the query was proved and Nil if it was not proved
;;; SIDE-EFFECTS: Reads a
;;;===============================================================================

(defun read-query ()
  (with-open-file (stream "query.out")				      
    (loop for line = (read-line stream nil "foo")
	until (if (search "Search stopped by max_proofs option." line)
		  (setf string "Proved")
		(if (eq line "foo")
		    (setf string "Not Proved"))))
    (eq string "Proved")))
		   


;;;===============================================================================


;;;===============================================================================
;;; ASK
;;; ------------------------------------------------
;;; INPUT: WORLD, MOVE
;;; OUTPUT: NONE
;;; SIDE-EFFECTS: Prints the output of a query. i.e. IF it is safe to move in a
;;;               Given Direction or in a given square
;;;===============================================================================

(defun ask (world move)
  (let* ((agent (wumpusworld-agent world))
	 (x (agent-curr-row agent))
	 (y (agent-curr-col agent))
	 (breeze (agent-breeze agent))
	 (stench (agent-stench agent)))
    (ask-query (write-to-string x) (write-to-string y) stench breeze move)
    (read-query)
    (if (eq move *right*)
	(if (read-query)
	    (format t "~%~% It is safe to move Right~%~%")
	  (format t "~%~% It is unsafe to move Right~%~%")))
    (if (eq move *left*)
	(if (read-query)
	    (format t "~%~% It is safe to move Left~%~%")
	  (format t "~%~% It is unsafe to move Left~%~%")))
    (if (eq move *up*)
	(if (read-query)
	    (format t "~%~% It is safe to move Up~%~%")
	  (format t "~%~% It is unsafe to move Up~%~%")))
    (if (eq move *down*)
	(if (read-query)
	    (format t "~%~% It is safe to move Down~%~%")
	  (format t "~%~% It is unsafe to move Down~%~%")))))

;;;===============================================================================




;;;===============================================================================
;;; ASK-POS
;;; ------------------------------------------------
;;; INPUT: WORLD, MOVE
;;; OUTPUT: NONE
;;; SIDE-EFFECTS: Prints the output of a query. i.e. IF it is safe to move in a
;;;               Given Direction or in a given square
;;;===============================================================================

(defun ask-pos (world x y)
  (let* ((agent (wumpusworld-agent world))
	 (breeze (agent-breeze agent))
	 (stench (agent-stench agent)))
    (ask-query (write-to-string x) (write-to-string y) stench breeze *none*)
    (if (read-query)
	(format t "~%~% It is safe to move to desired location~%~%")
      (format t "~%~% It is unsafe to move to desired location~%~%"))))

;;;===============================================================================



;;;===============================================================================
;;; TELL
;;; ------------------------------------------------
;;; INPUT: WORLD
;;; OUTPUT: None
;;; SIDE-EFFECTS: Inputs agent percepts into the knowledge Base
;;;===============================================================================

(defun tell (world)
  (setf str (open "InfoKB.in" :direction :output :if-exists :append))
  (let* ((agent (wumpusworld-agent world))
	 (x (write-to-string (agent-curr-row agent)))
	 (y (write-to-string (agent-curr-col agent)))
	 (stench (agent-stench agent))
	 (breeze (agent-breeze agent))
	 (glitter (agent-glitter agent))
	 (prevmove move))
    (format str "~%~%")
    (Write-line "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%" str)
    (write-line (concatenate 'string "%%%    Information Percieved at Room("x","y") ~%~%") str)
    (write-line (concatenate 'string "%%%   Move :" (write-to-string move)) str)
    (Write-line "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%" str)
    (format str "~%~%")
    (write-line (concatenate 'string "%% CurrentPos("x","y").") str)
    (format str "~%")
    (write-line (concatenate 'string "HasVisited("x","y").") str)
    (if stench
	(write-line (concatenate 'string "Stench("x","y").") str)
      (write-line (concatenate 'string "-Stench("x","y").") str))
    (format str "~%")
    (if breeze
	(write-line (concatenate 'string "Breeze("x","y").") str)
      (write-line (concatenate 'string "-Breeze("x","y").") str))
    (format str "~%")
    (if glitter
	(write-line (concatenate 'string "Glitter("x","y").") str)
      (write-line (concatenate 'string "-Glitter("x","y").") str))
    (format str "~%~%")
    (close str)
    (setf move (+ prevmove 1))
    ))



;;;===============================================================================


;;;===============================================================================
;;;   INITIALIZE GAME
;;;===============================================================================


(defparameter game (init-game))


;;;===============================================================================



;;;END OF WUMPUS WORLD PROGRAM
