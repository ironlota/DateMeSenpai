give(X) :- 
	have(X),
	g_read(curLoc,Y),
	(Y == kelas ->
		givegirl(X)
	; Y == halamanBelakang ->
		givestone(X)
	; Y == ruangSatpam ->
		giveguard(X)
	).
	
give(X) :-
	write('Jangan berkhayal! Kamu tidak memiliki barang itu Kouhai!').
	
giveguard(X) :-
	g_read(affinity,A),
	(X == kotakMusik ->
		write('Kamu menyalakan kotak musik dekat pos satpam dan perlahan-lahan pak satpam tertidur pulas.'),
		A is A+5,
		g_assign(affinity,A),
		drop(X)
	;
		write('Ya nak? Terimakasih, sepertinya aku tidak akan membutuhkan itu.')
	).
	
givestone(X) :-
	g_read(affinity,A),
	(X == jimatKeberuntungan ->
		write('Hmm. Dari cara menjahitnya.. Pilihan warnanya.. Perasaan yang ada di dalamnya..'),nl,
		write('Milik Senpai ya? ;)'),nl,
		write('Kamu tahu? Kelihatannya aku tidak perlu banyak bekerja.'),nl,
		write('Tanpa pengetahuan Goddess pun orang bisa melihat sepertinya Senpai menyukaimu.'),nl,
		write('Baiklah, hubungan baik ini akan ku restui 0;)'),nl,
		write('Hiyaaah!~'),nl,
		A is A+15,
		g_assign(affinity,A),
		drop(X)
	;
		write('Ah. Ini? Aku tidak bisa menentukan nasibmu hanya dengan barang ini. Perasaan! Aku butuh perasaan yang mendalam!')
	).
	
givegirl(X) :-
	g_read(affinity,A),
	(X == penghapus ->
		write('Hai Kouhai ada apa?'),nl,
		write('Oh ini! Ini penghapus yang kujatuhkan lalu hilang, dimana kamu menemukannya?'),nl,
		write('Kelas? Oh iya benar tentu saja :p'),nl,
		write('Terima kasih ya kouhai yang baik :)'),nl,
		write('Kamu tahu, aku sampai meninggalkan bukuku untuk mencari penghapus ini!'),nl,
		A is A+10,
		g_assign(affinity,A),
		drop(X)
	; X == buku ->
		write('Hai lagi Kouhai, ada perlu apa?'),nl,
		write('Oh! Itu buku yang aku tinggalkan di perpustakaan!'),nl,
		write('Bagaimana kamu bisa tahu itu buku milikku?'),nl,
		write('Oh ya, sebagai gantinya, apa kamu ada payung untuk pulang?'),nl,
		write('Nah! Pas deh, aku memiliki payung di lokerku, nih kuberikan kuncinya.'),nl,
		A is A+10,
		g_read(inventory,I),
		append([kunciLoker],I,Z),
		g_assign(inventory,Z)
	; X == payungPink ->
		write('Halo Kouhai!'),nl,
		write('Ah ada apa ini? Payung Pink?'),nl,
		write('Wah terimakasih Kouhai! Bagaimana kamu bisa tau pink adalah warna kesukaanku?'),nl,
		write('Oiya! Jangn pergi dulu Kouhai.'),nl,
		write('Ini, sebenarnya aku sudah ingin memberikan ini kepadamu, tapi karena suatu lain hal aku.. hehe..'),nl,
		write('Ya pokoknya ini untukmu lah! Good Luck charm buatanku sendiri loh ;)'),nl,
		A is A+20,
		g_assign(affinity,A),
		g_read(inventory,I),
		append([jimatKeberuntungan],I,Z),
		g_assign(inventory,Z)
	; 
		write('Ah Kouhai! Ku rasa aku tidak membutuhkan itu, lebih baik kamu menyimpannya!')
	).