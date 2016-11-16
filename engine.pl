/* Date Me Senpai!
        Text-Based Visual Dating Simulation using Prolog

        Made by :
            Carry Me Senpai!

    Filename : engine.pl
        Consists of primitive facts and rule to start and exit game.
*/

status(running).
status(not_running).

/* game control */
start:-
  intro_screen(Status),
  nl,
  loop(State).

loop(State) :-
  repeat,
  write('> '),
  read(State),
  call(State),
  fail.

intro_screen(Status) :-
    Status = 'not_running',
    write('Welcome to Date Me Senpai!'),
    nl,
    write('New Game     (new)'),
    nl,
    write('Load Game    (load)'),
    nl,
    write('Exit Game    (exit)'),
    nl.

intro_screen(Status) :-
    Status = 'running',
    write('Welcome to Date Me Senpai!'),
    nl,
    write('Resume Game  (resume)'),
    nl,
    write('New Game     (new)'),
    nl,
    write('Load Game    (load)'),
    nl,
    write('Exit Game    (exit)'),
    nl.

load :-
    write('Available Save File :'),nl,
    directory_files('savegame',ListDir),
    print_dir(ListDir),
    true,
    write('Load file : '),
    read(File),
    atom_concat('savegame/', File, Files),
    atom_concat(Files, '.cms',FilePath),
    loadfile(FilePath),
    fail.

loadfile(File) :-
    open_file(File,read,Save),
    read_save(Save,Cond),
    close(Save),
    print_list(Cond),
    nl.

open_file(F,R,S) :-
     catch( open(F, read, S),_,( write('can''t open file': F), nl, fail) ).
     %http://www.amzi.com/manuals/amzi/pro/ref_io.htm#OpenAndClosingFiles

read_save(Stream, L):-
  read_term(Stream, H, []),
  (   H == end_of_file
  ->  L = []
  ;   L = [H|T],
      read_save(Stream,T)
  ). %http://stackoverflow.com/questions/26826470/reading-lines-into-lists-with-prolog

/* inventory */




