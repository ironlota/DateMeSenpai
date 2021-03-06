give(X) :-
	have(X),
	g_read(curLoc,Y),
	(Y == kelas ->
		givegirl(X)
	; Y == halamanBelakang ->
		givestone(X)
	; Y == ruangSatpam ->
		giveguard(X)
	;
		write('Aku mau memberi ini ke siapa ya..?'),nl
	),!.

give(X) :-
	\+have(X),
	write('Jangan Berkhayal! Kamu tidak memiliki barang itu!'),nl.

giveguard(X) :-
	g_read(affinity,A),
	(X == kotakMusik ->
		(A == '60' ->
			write('Kamu menyalakan kotak musik dekat pos satpam dan perlahan-lahan pak satpam tertidur pulas.'),nl,
			g_assign(affinity,'80'),
			g_read(inventory,I),
			delete(I,X,D),
			g_assign(inventory,D)
		;
			write('Sepertinya hal ini bisa ditunda, sebaiknya aku menemui senpai terlebih dahulu.'),nl
		)
	;
		write('Ya nak? Terimakasih, sepertinya aku tidak akan membutuhkan itu.'),nl
	).

givestone(X) :-
	(X == jimatKeberuntungan ->
		write('batuCinta : Hmm. Dari cara menjahitnya.. Pilihan warnanya.. Perasaan yang ada di dalamnya..'),nl,
		write('batuCinta : Milik Senpai ya? ;)'),nl,
		write('batuCinta : Kamu tahu? Kelihatannya aku tidak perlu banyak bekerja.'),nl,
		write('batuCinta : Tanpa pengetahuan Goddess pun orang bisa melihat sepertinya Senpai menyukaimu.'),nl,
		write('batuCinta : Baiklah, hubungan baik ini akan ku restui 0;)'),nl,
		write('batuCinta : Hiyaaah!~'),nl,
		g_assign(affinity,'100'),
		g_read(inventory,I),
		delete(I,X,N),
		g_assign(inventory,N)
	;
		write('Ah. Ini? Aku tidak bisa menentukan nasibmu hanya dengan barang ini. Perasaan! Aku butuh perasaan yang mendalam!'),nl
	).

givegirl(X) :-
	g_read(affinity,A),
	(X == penghapus ->
		write('senpai : Hai Kouhai ada apa?'),nl,
		write('senpai : Oh ini! Ini penghapus yang kujatuhkan lalu hilang, dimana kamu menemukannya?'),nl,
		write('senpai : Kelas? Oh iya benar tentu saja :p'),nl,
		write('senpai : Terima kasih ya kouhai yang baik :)'),nl,
		write('senpai : Kamu tahu, aku sampai meninggalkan bukuku untuk mencari penghapus ini!'),nl,
		g_assign(affinity,'20'),
		g_read(inventory,I),
		delete(I,X,N),
		g_assign(inventory,N)
	; X == buku ->
		(A == '20' ->
			write('senpai : Hai lagi Kouhai, ada perlu apa?'),nl,
			write('senpai : Oh! Itu buku yang aku tinggalkan di perpustakaan!'),nl,
			write('senpai : Bagaimana kamu bisa tahu itu buku milikku?'),nl,
			write('senpai : Oh ya, sebagai gantinya, apa kamu ada payung untuk pulang?'),nl,
			write('senpai : Nah! Pas deh, aku memiliki payung di lokerku, nih kuberikan kuncinya.'),nl,
			g_assign(affinity,'40'),
			g_read(inventory,I),
			append([kunciLoker],I,Z),
			delete(Z,X,D),
			g_assign(inventory,D)
		;
			write('Sebelum kamu sempat memanggil senpai, ia menjauh dan bergabung dengan teman-temannya..'),nl
		)
	; X == kacamata ->
		write('senpai : Halo Kouhai!'),nl,
		write('senpai : Ah ada apa ini? Kacamata?'),nl,
		write('senpai : Wah terimakasih Kouhai! Bagaimana kamu bisa tau warna kesukaanku?'),nl,
		write('senpai : Oiya! Jangan pergi dulu Kouhai.'),nl,
		write('senpai : Ini, sebenarnya aku sudah ingin memberikan ini kepadamu, tapi karena suatu lain hal aku.. hehe..'),nl,
		write('senpai : Ya pokoknya ini untukmu lah! Good Luck charm buatanku sendiri loh ;)'),nl,
		g_assign(affinity,'60'),
		g_read(inventory,I),
		append([jimatKeberuntungan],I,Z),
		delete(Z,X,D),
		g_assign(inventory,D)
	;
		write('Ah Kouhai! Ku rasa aku tidak membutuhkan itu, lebih baik kamu menyimpannya!'),nl
	).