/* panggil aku peta*/

/*place([tempatnya,[up,down,left,right]])*/
place([kamarOrtu,[kosong,kosong,kosong,kamar]]).
place([kamar,[kosong,rumah,kamarOrtu,kosong]]).
place([rumah,[kamar,jalanan,kosong,toko]]).
place([toko,[kosong,kosong,rumah,kosong]]).
place([jalanan,[rumah,sekolah,toko,kosong]]).
place([sekolah,[jalanan,lorongSekolahSelatan,ruangSatpam,lorongSekolahTimur]]).
place([ruangSatpam,[kosong,ruangGuru,halamanBelakang,sekolah]]).
place([halamanBelakang,[kosong,kosong,kosong,ruangSatpam]]).
place([lorongSekolahTimur,[kosong,kelas,sekolah,loker]]).
place([loker,[lokerPerempuan,kosong,lorongSekolahTimur,kosong]]).
place([lokerPerempuan,[kosong,loker,kosong,kosong]]).
place([ruangGuru,[ruangSatpam,kosong,kosong,lorongSekolahSelatan]]).
place([lorongSekolahSelatan,[sekolah,perpustakaan,ruangGuru,kelas]]).
place([kelas,[lorongSekolahTimur,depanKelas,lorongSekolahSelatan,kosong]]).
place([perpustakaan,[lorongSekolahSelatan,kosong,kosong,depanKelas]]).
place([depanKelas,[kelas,kosong,perpustakaan,kosong]]).


goto(kosong):-!,
  kata(['Kamu menabrak tembok.']),
  fail.
goto(Location):-
  can_go(Location),
  g_assign(curLoc,Location).

can_go(Location):-
  g_read(curLoc,X),
  hubungan(X,Location),!.
can_go(Location):-
  kata(['Ga bisa ke ',Location,' dari sini']),fail.


hubungan(Here,Loc) :-
  place(X),
  X=[H,Y],
  H==Here,
  S=Y,
	member(Loc,S),!.


moveup :-
  g_read(curLoc,X),
  place(Y),
  Y=[H,M],
  H==X,
  M=[A,_,_,_],
  gotocond(A),
  g_read(location,L),
  loadscenetext(A),nl,
  print_obj(L),
  fail.

movedown :-
  g_read(curLoc,X),
  place(Y),
  Y=[H,M],
  H==X,
  M=[_,B,_,_],
  gotocond(B),
  g_read(location,L),
  loadscenetext(B),nl,
  print_obj(L),
  fail.

moveleft :-
  g_read(curLoc,X),
  place(Y),
  Y=[H,M],
  H==X,
  M=[_,_,C,_],
  gotocond(C),
  g_read(location,L),
  loadscenetext(C),nl,
  print_obj(L),
  fail.

moveright :-
  g_read(curLoc,X),
  place(Y),
  Y=[H,M],
  H==X,
  M=[_,_,_,D],
  gotocond(D),
  g_read(location,L),
  loadscenetext(D),nl,
  print_obj(L),
  fail.


kata([]):-
  write('.'),nl,nl.

kata([H|T]):-
  write(H),
  kata(T).

gotocond(X) :-
	g_read(player,N),
	(X == kamarOrtu ->
		(have(rapor) ->
			write('Ibu: Halo '),write(N),write(' apa yang bisa Ayah dan Ibu bantu?'),nl,
			goto(X)
		;
			g_read(player,N),
			write('Ibu: Halo '),write(N),write(' bagaimana dengan rapormu? Ayo cepat ambil dulu di sekolah!'),nl,fail
		)
	; X == jalanan ->
		(have(payung) ->
			goto(X)
		;
			write('Hujan sangat deras! Aku belum bisa pulang sekarang, mungkin lebih baik aku kebali ke kelas'),nl,fail
		)
	; X == halamanBelakang ->
		(have(kunciSatpam) ->
			write('Pintu belakang berhasil terbuka dengan kunci dari ruang satpam. Pintu itu agak berat, mungkin karena lama tidak dibuka..'),nl,
			goto(X)
		;
			write('Pintu ini terkunci rapat.'),nl,fail
		)
	; X == lokerPerempuan ->
		(have(kunciLoker) ->
			write('Sebaiknya aku melakukan ini dengan cepat.'),nl,
			goto(X)
		;
			write('Aku pasti memiliki otak porno apabila masuk ke sini tanpa alasan.'),nl,fail
		)
	;
		goto(X)
	).

have(X) :-
	g_read(inventory,I),
	member(X,I).

%bantuan dari www.amzi.com
