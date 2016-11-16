/* Date Me Senpai!
        Text-Based Visual Dating Simulation using Prolog

        Made by :
            Carry Me Senpai!

    Filename : engine.pl
        Consists of primitive facts and rule to start and exit game.
*/

status(running).
status(not_running).

/* start rule */
start:-
  write('Date Me Senpai!'),
  nl,
  initial_state(State),
  control_loop(State).

/* end of start */

/* initial state */

/*end of initial state*.

/* inventory */
inventory([,]).
/* end of inventory */

/* loop of commands */

/* end of loop of commands */

/* load rule */
load :- status(X).

/* end of load */

/* exit rule */
exit :- status(X).

/* end of start */

/* start rule */


/* end of start */

/*      a nonassertive version of nani search */

