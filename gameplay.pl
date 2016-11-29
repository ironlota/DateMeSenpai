%Gameplay

jawab(A) :-
  g_read(curLoc,X),
  (X == depanKelas ->
    (A == a ->
      write('Wah! kamu pintar')
      ;
      write('Jawaban kamu salah, Coba lagi!'))
    ;
    write('Tidak bisa menjawab')
  ),nl,
  fail.

confess :-
  g_read(affinity,X),
  g_read(curLoc,Y),
  (Y == kelas ->
	  (X == 100 ->
		write('Kamu diterima')
		;
		write('Kamu difriendzone')
	  ),nl,
      summary_stat,
      g_assign(gameover,1)
      ;
      write('Tidak ada senpai di ruangan ini'),nl
  ).
