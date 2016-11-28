benda(kotakMusik).
benda(uang).
benda(payung).
benda(guard).
benda(rapor).
benda(buku).
benda(penghapusan).

take(Thing):-
  adabarang(Thing),
  is_takable(Thing),
  barangdipindah(Thing),
  kata(['Sekarang kamu punya ',Thing]),!.

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
      Z=['0',B],
      delete(Y,H,X),
      append([Z],X,M),
      g_assign(location,M),
      !
      ;
      deletebarang(Thing,T,Here)
  ).
deletebarang(Thing,[],Here) :- fail.


% drop - allows the player to transfer a possession to a room

drop(Thing):-
  g_read(inventory,X),
  member(Thing,X),
  delete(X,Thing,Y),
  g_assign(inventory,Y),fail.
drop(Thing):-
  kata(['You don''t have the ',Thing]).