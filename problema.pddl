(define (problem Sciame-problem)
  (:domain Sciame)
 (:objects 
   sciame1 - Sciame
   ostile1 - DroneOstile
   ostile2 - DroneOstile
   cella1 cella2 cella3 cella4 cella5 cella6 cella7 - Cella 
 )
 (:init 
   (at sciame1 cella1)
   (=(vite_sciame sciame1) 4)

   ; Definisco connessioni caselle
   (connected cella1 cella2)
   (connected cella2 cella3)
   (connected cella3 cella4)
   (connected cella4 cella5)
   (connected cella5 cella6)
   (connected cella6 cella7)
   
   ; Definisco celle input
   (is_input_cell cella4)

   ; Definisco celle output
   (is_output_cell cella6)

   ; Timed Initial Literals
   (at 120 (can_capture ostile1)) 
   (at 15 (not (can_capture ostile1))) 
   (at 20 (can_capture ostile2)) 
   (at 30 (not (can_capture ostile2)))
 ) 

  (:goal (and (catturato ostile1) (catturato ostile2)))
 )