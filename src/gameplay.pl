%Gameplay

jawab(A) :-
  g_read(curLoc,X),
  (X == depanKelas ->
    (A == a ->
      write('                  ___ .~- ` `\' "\' ` -~. ____'),nl,
      write('                 :~+.-`  .-"-.  .-"~._  `-.+~:'),nl,
      write('                 !  /  -`     `       `\'--~:.l'),nl,
      write('                  :\'         .              \'.'),nl,
      write('                 /'),nl,
      write('                /-".        :  .            \`'),nl,
      write('                 .`      /.-"\\ : `-  ^       :`'),nl,
      write('                 ^      "`    `.    \\:\'._  \\ `!`'),nl,
      write('                :     :-===-.    .-===-.\\  .!/\'.'),nl,
      write('                 \'.; /     .             : :'),nl,
      write('                : `.l   .mPm.\\    .mPm.  |/    l'),nl,
      write('               .     :                   :\':   |'),nl,
      write('                   \\ \'        d:         \' /   :'),nl,
      write('              :     \'-:        "        :-;:   `'),nl,
      write('              .       .     ._..._.     :::`   _'),nl,
      write('             /        ::               ;::;.   !'),nl,
      write('            .      .  :;:.           .::::;:   \''),nl,
      write('            . :  : :  `:::\'.       .\'::::;::.   '),nl,
      write('            \'/.  .  .  `::l \'-. .-\' \'|:::::::.   ;'),nl,
      write('            : |: :: ::__`.-.        _.-.::::::_  ;'),nl,
      write('            .~"` \\ \\ :`"/    `-..- `     \"`//    "~.'),nl,
      write('           /      \\ \\ .   ___ /\\ ___      .//        '),nl,
      write('          :        \\ \\.-`  _.~l)=~  `\' -.:"'),nl,
      write('          `         \\\'/  .    ":`-.       \\            :'),nl,
      write('          .           -::    _lm.      .`         zi. |'),nl,
      write('                      \\ /`-\'  :::- ::.:'),nl,
      write('                       :       !:`   ":'),nl,
      write('                            :  .      \''),nl,
      write('                       "-._::  ^: .    ;'),nl,
      write('                            `-" \\::_.~\''),nl,
      write('                             : : :'),nl,
      write('                             \' \' :'),nl,
      write('                               \' :'),nl,
      write('Senpai : Wah! kamu pintar')
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
	  (X == '100' ->
		write('Kamu diterima'),nl,
    write('senpai : Daisuki kouhai!'),nl,
    write('senpai : Oops, not kouhai, but darling ♥')
		;
		write('senpai : Hmm, mungkin kita lebih baik berteman aja deh ya hehe..'),nl,
    write('senpai : Maafin aku ya :(')
	  ),nl,
      summary_stat
  ; Y == ruangSatpam ->
      write('satpam : .... Ba-bagaimana kamu mengetahui kalo aku "wanita"?'),nl,
      write('satpam : i love you so much ♥'), nl,
      write('Kamu lari terbirit-birit'), nl,
      write('satpam : HEI! Mau kemana kamu! Sini main sama om!'),nl
  ; Y == kamarOrtu->
      write('mama : mama juga sayang sama kamu kok nak, gausah kamu bilang juga gapapa'),nl,
      write('papa : bacot kamu nak, pasti ada maunya nih!'), nl,
      write('mama : hus, papa jangan gitu dong, jarang-jarang anak kita ngomong gini loh'), nl,
      write('papa : bacot kamu ma!'),nl
  ; Y == halamanBelakang->
      write('batuCinta : kamu suka yang keras-keras ya? ...'),nl,
      write('batuCinta : seperti batu? ;)'),nl
  ;
      write('Kukuh, Winarto, Ray, Adrian : kami juga sayang kamu kok ♥'),nl
  ).

friendzone_senpai :-
	g_read(affinity,X),
	g_read(curLoc, Y),
	(==(Y,kelas) ->
		(X == '100' ->
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

gabisa([senpai,satpam,batuCinta,kamar,kamarOrtu,rumah,toko,jalanan,sekolah,ruangGuru,ruangSatpam,halamanBelakang,lorongSekolahSelatan,lorongSekolahTimur,loker,kelas,depanKelas,perpustakaan,lokerPerempuan]).

beli(N) :-
  g_read(curLoc,X),
  (X==toko ->
    g_read(inventory,Y),
    (member(uang,Y) ->
      gabisa(Gab),
      (member(N,Gab) ->
        write('item tersebut dilarang untuk dibeli'),nl,!
        ;
        delete(Y,uang,Z),
        append([N],Z,M),
        g_assign(inventory,M),
        write('kamu membeli '), write(N),nl,!
      )
      ;
      write('kamu ga punya uang untuk membeli barang'),nl
    )
    ;
    write('kamu harus berada di toko untuk membeli'),nl
  ).

