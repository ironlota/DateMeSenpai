/*panggil aku peta*/

/*place([tempatnya,[up,down,left,right]])*/
place([[kamar,[kosong,kosong,kosong,kamarOrtu]],[kamarOrtu,[kosong,rumah,kamar,kosong]],[rumah,[kamarOrtu,jalanan,kosong,toko]],[toko,[kosong,kosong,rumah,kosong]],[jalanan,[rumah,sekolah,toko,kosong]],[sekolah,[jalanan,lorongSekolahSelatan,ruangSatpam,lorongSekolahTimur]],[ruangSatpam,[kosong,ruangGuru,halamanBelakang,sekolah]],[halamanBelakang,[kosong,kosong,kosong,ruangSatpam]],[lorongSekolahTimur,[kosong,kelas,sekolah,loker]],[loker,[lokerPerempuan,kosong,lorongSekolahTimur,kosong]],[ruangGuru,[ruangSatpam,kosong,kosong,lorongSekolahSelatan]],[lorongSekolahSelatan,[sekolah,perpustakaan,ruangGuru,kelas]],[kelas,[lorongSekolahTimur,depanKelas,lorongSekolahSelatan,kosong]],[perpustakaan,[lorongSekolahSelatan,kosong,kosong,depanKelas]],[depanKelas,[kelas,kosong,perpustakaan,kosong]],[lokerPerempuan,[kosong,loker,kosong,kosong]]]).


place(kamar).
place(kamarOrtu).
place(rumah).
place(toko).
place(jalanan).
place(sekolah).
place(ruangGuru).
place(ruangSatpam).
place(halamanBelakang).
place(lorongSekolahSelatan).
place(lorongSekolahTimur).
place(loker).
place(kelas).
place(depanKelas).
place(perpustakaan).
place(lokerPerempuan).


/*fakta benda*/
location(kotakMusik,kamar).
location(uang,kamarOrtu).
location(beliBarang,toko).
location(payung,lokerPerempuan).
location(guard,ruangSatpam).
location(batuCinta,halamanBelakang).
location(rapor,ruangGuru).
location(buku,perpustakaan).
location(penghapus,kelas).
location(cewe,kelas).
location(jawabSoal,depanKelas).