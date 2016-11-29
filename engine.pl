/* Date Me Senpai!
        Text-Based Visual Dating Simulation using Prolog
        Made by :
            Carry Me Senpai!
    Filename : engine.pl
        Consists of primitive facts and rule to start and exit game.
*/
npc(senpai, kelas).
npc(batuCinta, halamanBelakang).
npc(satpam, ruangSatpam).
/* game control */
start:-
  g_assign(gameStatus, not_running),
  g_assign(gameover,0),
  intro_screen,
  nl,
  loop.

loop :-
  repeat,
  write('> '),
  read(State),
  do(State),
  g_read(gameover,X),
  (State == exit;
   X == 1).

%Edit di sini untuk menambahkan status akhir game
summary_stat :-
  write('Permainan berakhir'),
  nl,true.


available(instruksi).
available(new).
available(stat).
available(exit).
available(load).
available(pause).
available(save).
available(look).
available(take(X)).
available(drop(X)).
available(n).
available(s).
available(e).
available(w).
available(confess).

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
	loadfile('res/init.cmr'),
	g_assign(player,X),
	write('Senpai: Hmph! Ini bukan berati saya ingin tau namamu, t-tapi.. hmph! lupakan!!'),
	nl,
	write('Senpai: By the way, salam kenal ya '),
	write(X),
	write('!'),
	nl,
	fail.

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

save :-
	write('Enter file name : '),
	read(File),
	nl,write('Save successful!'),
    atom_concat('savegame/', File, Files),
    atom_concat(Files, '.cms',FilePath),
    save_state(FilePath),
    nl,
	fail.

load :-
    write('Available Save File :'),nl,
    directory_files('savegame',ListDir),
    print_dir(ListDir),
    write('Load file : '),
    read(File),
    atom_concat('savegame/', File, Files),
    atom_concat(Files, '.cms',FilePath),
    loadfile(FilePath),!,
    fail.

loadfile(File) :-
    open_file(File,read,Save),
    read_save(Save,Cond),
    assign_list(Cond),
    close(Save).

assign_list(X) :-
          X = [[A,B,C,D,E]],
          g_assign(player, A),
          g_assign(curLoc, B),
          g_assign(inventory,C),
          D = [Z],
          g_assign(affinity,Z),
          g_assign(location,E).

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

save_state(File) :-
    g_read(player,A),
    g_read(curLoc,B),
    g_read(inventory,C),
    g_read(affinity,D),
    g_read(location,E),
    open(File,write,Save),
    write(Save,'['''),
    write(Save,A),
    write(Save,''','''),
    write(Save,B),
    write(Save,''',['),
    ( save_inventory(Save,C) ->
        write(Save,'],['''),
        write(Save,D),
        write(Save,'''],['),
        ( save_location(Save,E) ->
            write(Save,']].')
            ;
            fail
        )
        ;
        fail
    ),
    close(Save).

save_inventory(Save,[]).
save_inventory(Save,[H]) :-
    write(Save,''''),
    write(Save,H),
    write(Save,'''').
save_inventory(Save,[H|T]) :-
    write(Save,''''),
    write(Save,H),
    write(Save,''','),
    save_inventory(Save,T).

save_location(Save,[]).
save_location(Save,[H]) :-
    H = [A,B],
    write(Save,'['''),
    write(Save,A),
    write(Save,''','''),
    write(Save,B),
    write(Save,''']').
save_location(Save,[H|T]) :-
    H = [A,B],
    write(Save,'['''),
    write(Save,A),
    write(Save,''','''),
    write(Save,B),
    write(Save,'''],'),
    save_location(Save,T).

load_dialog(File) :-
    open_file(File,read,Save),
    read_save(Save,Cond),
    parse_dialog(Cond, Dialog),
    g_assign(gameMessage, Dialog),
    close(Save).

parse_dialog([], _).
parse_dialog([H|T], Dialog) :-
    Cond = [[H|T]],
    g_read(affinity,A).

stat :-
	info,
	print_inv.

look :-
	g_read(location,X),
	print_curloc,
	print_inv,
	write('Daftar object yang ada di ruangan :'),nl,
	print_obj(X),
	print_npc,
	fail.

print_curloc :-
  write('            _____________________'), nl,
  write('           |          |          |'),nl,
  write('           | Kamar    | Kamar    |'),nl,
  write('           | Ortu     |          |'),nl,
  write('           |          |          |'),nl,
  write('           |__________|__________|__________'), nl,
  write('                      |          |          |'),nl,
  write('                      |  Rumah   | Toko     |'),nl,
  write('                      |          |          |'),nl,
  write('                      |          |          |'),nl,
  write('                      |__________|__________|__________'), nl,
  write('                      |          |          |          |'),nl,
  write('                      | Jalanan  |          | Locker   |'),nl,
  write('                      |          |          | Perempuan|'),nl,
  write('                      |          |          |          |'),nl,
  write(' _____________________|__________|__________|__________|'),nl,
  write('|          |          |          |          |          |'),nl,
  write('| Halaman  | Ruang    | Sekolah  | Lorong   | Locker   |'),nl,
  write('| Belakang | satpam   |          | Sekolah  |          |'),nl,
  write('|          |          |          | Timur    |          |'),nl,
  write('|__________|__________|__________|__________|__________|'),nl,
  write('           |          |          |          |'),nl,
  write('           | Ruang    |  Lorong  | Kelas    |'),nl,
  write('           | Guru     |  Sekolah |          |'),nl,
  write('           |          |  Selatan |          |'),nl,
  write('           |__________|__________|__________|'),nl,
  write('                      |          |          |'),nl,
  write('                      |  Perpus  | Depan    |'),nl,
  write('                      |  takaan  | Kelas    |'),nl,
  write('                      |          |          |'),nl,
  write('                      |__________|__________|'),nl,
  g_read(curLoc, X),
  write('Kamu sedang berada di: '),
  write(X),nl.

print_inv :-
	g_read(inventory,X),
	(\+X = [] ->
		write('Item yang ada di inventory kamu: '),nl,
		\+print_list(X)
		;
		write('Inventory kamu kosong'),nl
	).

print_obj([]) :- fail.
print_obj([[X|Y]|[]]) :-
	!,g_read(curLoc,Z),
	Y = [V],
	(Z = V ->
		(npc(X,Z) ->
			true
			;
			write(X),
			nl
		)
		;
		true
	).
print_obj([[X|Y]|T]) :-
	g_read(curLoc,Z),
	Y = [V],
	(Z = V ->
		(npc(X,Z) ->
			true
			;
			write(X),
			nl
		)
		;
		true
	),
	print_obj(T).


print_npc :-
	g_read(curLoc,X),
	(npc(Y,X) ->
		write('Di ruangan ini terdapat npc : '),
		write(Y)
		;
		write('Tidak ada npc di ruangan ini')
	),nl.

n :-
  moveup.

s :-
  movedown.

e :-
  moveright.

w :-
  moveleft.
