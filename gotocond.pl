gotocond(X) :-
	(X == kamarOrtu ->
		(have(rapor) ->
			write('Ibu: Halo '),write(N),write(' apa yang bisa Ayah dan Ibu bantu?'),
			goto(kamarOrtu)
		;
			g_read(nama,N),
			write('Ibu: Halo '),write(N),write(' bagaimana dengan rapormu? Ayo cepat ambil dulu di sekolah!')
		)
	; X == jalanan ->
		(have(payung) ->
			goto(jalanan)
		;
			write('Hujan sangat deras! Aku belum bisa pulang sekarang, mungkin lebih baik aku kebali ke kelas')
		)
	; X == halamanBelakang ->
		(have(kunciSatpam) ->
			write('Pintu belakang berhasil terbuka dengan kunci dari ruang satpam. Pintu itu agak berat, mungkin karena lama tidak dibuka..'),
			goto(halamanBelakang)
		;
			write('Pintu ini terkunci rapat.')
		)
	; X == lokerPerempuan ->
		(have(kunciLoker) ->
			write('Sebaiknya aku melakukan ini dengan cepat')
		;
			write('Aku pasti memiliki otak porno apabila masuk ke sini tanpa alasan.')
		)
	;
		goto(X)
	).
	
have(X) :-
	g_read(inventory,I),
	member(X,I).