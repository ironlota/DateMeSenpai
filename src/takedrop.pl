benda(kotakMusik).
benda(uang).
benda(payung).
benda(rapor).
benda(buku).
benda(kunciSatpam).
benda(penghapus).

take(Thing):-
  g_read(affinity,A),
  (Thing == kunciSatpam ->
      (A == '80' ->
          adabarang(Thing),
          barangdipindah(Thing),
          kata(['Sekarang kamu punya ',Thing]),!
      ;
          write('satpam : Woi, ngapain kamu?!'),nl,!
      )
  ;
      adabarang(Thing),
      is_takable(Thing),
      barangdipindah(Thing),
      kata(['Sekarang kamu punya ',Thing]),!
  ).

adabarang(Thing):-
  g_read(curLoc,X),
  g_read(location,Brng),
  contains(Thing,Brng,X),!.
adabarang(Thing):-
  kata(['Tidak ada ',Thing,' disini']),
  fail.


contains(Thing,[H|T],Here):-
  H=[A,B],
  (A==Thing, B==Here ->
      !
      ;
      contains(Thing,T,Here)
  ).
contains(Thing,[],Here):- fail.

is_takable(Thing):-
  \+ benda(Thing),
  kata(['Kamu ga bsa ngambil ',Thing]),
  !,fail.
is_takable(_).

barangdipindah(Barang) :-
  g_read(curLoc,Location),
  g_read(location,Brng),
  deletebarang(Barang,Brng,Location),
  g_read(inventory,X),
  append([Barang],X,Y),
  g_assign(inventory,Y).


deletebarang(Thing,Brng,Here) :-
  Brng=[H|T],
  H=[A,B],
  (A==Thing, B==Here ->
      g_read(location,Y),
      delete(Y,H,X),
      g_assign(location,X),
      !
      ;
      deletebarang(Thing,T,Here)
  ).
deletebarang(Thing,[],Here) :- fail.


% drop - allows the player to transfer a possession to a room

drop(Thing):-
  g_read(inventory,X),
  g_read(curLoc, Z),
  g_read(location,L),
  member(Thing,X),!,
  V = [Thing,Z],
  append([V],L,T),
  delete(X,Thing,Y),
  g_assign(location,T),
  g_assign(inventory,Y),
  kata(['Kamu meletakkan ',Thing,' di ',Z]),fail.
drop(Thing):-
  kata(['You don''t have the ',Thing]).
