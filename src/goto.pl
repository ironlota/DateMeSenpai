/* panggil aku peta*/

/*place([tempatnya,[up,down,left,right]])*/
place([kamarOrtu,[kosong,kosong,kosong,kamar]]).
place([kamar,[kosong,rumah,kamarOrtu,kosong]]).
place([rumah,[kamarOrtu,jalanan,kosong,toko]]).
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
  kata(['Ga bisa gerak kesana']),
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
  M=[A,B,C,D],
  goto(A),
  g_read(location,L),
  loadscenetext(A),nl,
  print_obj(L),
  fail.

movedown :-
  g_read(curLoc,X),
  place(Y),
  Y=[H,M],
  H==X,
  M=[A,B,C,D],
  goto(B),
  g_read(location,L),
  loadscenetext(B),nl,
  print_obj(L),
  fail.

moveleft :-
  g_read(curLoc,X),
  place(Y),
  Y=[H,M],
  H==X,
  M=[A,B,C,D],
  goto(C),
  g_read(location,L),
  loadscenetext(C),nl,
  print_obj(L),
  fail.

moveright :-
  g_read(curLoc,X),
  place(Y),
  Y=[H,M],
  H==X,
  M=[A,B,C,D],
  goto(D),
  g_read(location,L),
  loadscenetext(D),nl,
  print_obj(L),
  fail.


kata([]):-
  write('.'),nl,nl.

kata([H|T]):-
  write(H),
  kata(T).

%bantuan dari www.amzi.com
