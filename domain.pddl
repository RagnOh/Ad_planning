(define(domain Sciame)
    (:requirements :strips :equality :typing :fluents :durative-actions :timed-initial-literals :numeric-fluents)

    (:types Sciame Cella Drone_Ostile)

(:predicates
   (at ?s - Sciame ?c-Cella)
   (connected ?c1 ?c2 -Cella)
   (can_capture ?d - Drone_Ostile)
   (is_input_cell ?c - Cella)
   (is_output_cell ?c -Cella)
   (catturato ?d - Drone_Ostile)
)

(:functions
   (vite_sciame ?s - Sciame)
)


(:durative-action move
   :parameters (?s - Sciame ?c_from - Cella ?c_to - Cella)
   :duration (= ?duration 2)
   :condition (and
     (at start (at ?s ?c_from))
     (at start (connected ?c_from ?c_to))
   )
   :effect (and
      (at start (not (at ?s ?c_from)))
      (at end (at ?s ?c_to))
   )
)

 (:durative-action cattura
   :parameters (?s - Sciame ?d-Drone_Ostile ?c_in - Cella ?c_out-Cella)
   :duration (= ?duration 10)
   :condition (and
     (at start (at ?s ?c_in))
     (at start (is_input_cell ?c_in))
     (at start (>= (vite_sciame ?s) 3))
     (at start (can_capture ?d-Drone_Ostile))
   )
   :effect (and
      (at end (catturato ?d))
      (at start (not (at ?s ?c_in)))
      (at end (is_output_cell ?c_out))
      (at end (at ?s ?c_out))
      (at end (decrease (vite_sciame ?s) 1))
   )
   )
)   