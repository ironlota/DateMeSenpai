/* Date Me Senpai!
        Text-Based Visual Dating Simulation using Prolog
        Made by :
            Carry Me Senpai!
    Filename : engine.pl
        Consists of primitive facts and rule to start and exit game.
*/
/* game control */
start:-
  g_assign(gameStatus, not_running),
  intro_screen,
  nl,
  loop.

loop :-
  repeat,
  write('> '),
  read(State),
  do(State),
  (State == exit),
  true.

available(instruksi).
available(new).
available(info).
available(exit).
available(load).
available(pause).

do(X) :- ( available(X) ->
            X
            ;
            write('Woop''s invalid functions ' : X),nl
         ).

exit :-
  write('Thank you kouhai!'),
  nl.

new:-
write('Liburan telah usai, hari ini merupakan hari pertama sekolah di SMA ITB Bandung'),
nl,
write('Dengan penuh antusias kamu pergi ke sekolah berharap mendapatkan cinta baru'),
nl,
write('Setibanya di dalam kelas, tiba-tiba ada senpai yang mendekati kamu'),
nl,
write('Senpai: Kouhai! Nama kamu siapa?'),
nl,
write('(Masukan nama kamu)'),
nl,
write(' = '),
read(X),
g_assign(player,X),
g_assign(affinity,'0'),
g_assign(inventory,[]),
g_assign(curLoc,'kelas'),
write('Senpai: Hmph! Ini bukan berati saya ingin tau namamu, t-tapi.. hmph! lupakan!!'),
nl,
write('Senpai: By the way, salam kenal ya '),
write(X),
write('!'),
nl.

instruksi:-
write('new. -- Untuk memulai game baru'),
nl,
write('load. -- Load saved game'),
nl,
write('pause. -- Membuka menu game'),
nl,
write('resume. -- Melanjutkan game'),
nl,
write('info. -- menampilkan atribut'),
nl,
write('exit. -- Keluar dari permainan'),
nl.

info :-
  g_read(affinity,A),
  write('Affinity'),
  write(' : '),
  write(A), nl.

pause :-
  g_assign(gameStatus, running),
  intro_screen.

intro_screen :-
    g_read(gameStatus, Status),
    write_res_main_menu('res/mainmenu.cml', Status).

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

loadfile(File, L) :-
    open_file(File,read,Save),
    read_save(Save,Cond),
    assign_list(L),
    close(Save),
    fail.

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
/* read resources */

%mainmenu res (mainmenu.cml)
write_res_main_menu(File,Status) :-
    open_file(File,read,Save),
    read(Save,Res),
    Res = [A,B],
    A = [H1|[T1]],
    B = [H2|[T2]],
    (H1 == Status ->
        print_list(T1)
    ;
        print_list(T2)
    ),
    close(Save),
    nl.

write_res_main_menu(File,Status) :- true.

assign_list(X) :-
          X = [[A,B,C,D,E]],
          g_assign(player, A),
          g_assign(curLoc, B),
          g_assign(inventory,C),
          D = [Z],
          g_assign(affinity,Z),
          g_assign(location,E).
