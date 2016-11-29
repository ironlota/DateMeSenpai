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
      summary_stat
      ;
      write('Tidak ada senpai di ruangan ini'),nl
  ).

friendzone_senpai :-
	g_read(affinity,X),
	g_read(curLoc, Y),
	(==(Y,kelas) ->
		(X == 100 ->
			write('Senpai : jadi.. selama ini kamu nge-friendzone-in AKU?'),
			nl,
			write('Senpai : tega kamu, hiks..'),
			nl
		;
			write('Senpai : loh, bukannya memang kita memang SEBATAS teman ya?'),
			nl,
			write('Senpai : lucu kamu, GGWP hahaha!'),
			nl
		),
		summary_stat
	;
		write('Tidak ada senpai di '),
		write(Y),
		nl
	).

examine(Barang) :-
	baca_deskripsi,
	g_read(inventory,Y),
	g_read(deskripsi,Z),
	(member(Barang,Y) ->
		print_deskripsi(Barang,Z)
	;
		write('Item tidak ada di inventory'),nl
	).
