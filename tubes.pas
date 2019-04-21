program tubes;//judul program
uses crt;
type lahir = record//tipe data bentukan
	tempat:string;
	tanggal:integer;
	bulan:string;
	tahun:integer;
end;
type siswa = record//tipedata bentukan
		nama: string;
		namaAyah:string;
		namaIbu:string;
		jarak:integer;
		tinggi:integer;
		umur:integer;
		status:string;
		jenisKelamin:string;
		golDarah:string;
		tgl:lahir;
		alamat:string;
		
end;
type tabelSiswa= array [1..1000] of siswa;//array
var//global
	dataSiswa:tabelSiswa;
	pil:char;
	banyakData:integer;
procedure urutJarak(var dataSiswa:tabelSiswa;banyakData:integer); //pengurutan menggunakan selection sort
{is.terdefinisi datasiswa jumlah banyak data
 fs.mengembalikan data yang sudah terurut sesuai jarak dari yang terdekat ke terjauh}	
 var
	pass,i,i_Min,n:integer;
	temp:siswa;
 begin
	pass:=1;
	n:=banyakData;
	while (pass <= n - 1 )do
		begin	
			i_Min:=pass;
			i:= pass+1;
			while i<= n do
				begin
					if (dataSiswa[i_Min].jarak > dataSiswa[i].jarak) then
						begin	
							i_Min:= i;
						end;
					i:=i+1;
				end;
				temp:=dataSiswa[i_Min];
				dataSiswa[i_Min]:=dataSiswa[pass];
				dataSiswa[pass]:=temp;
				pass:=pass+1;
		end;
end;
procedure urutTinggi(var dataSiswa:tabelSiswa;n:integer);//pengurutan menggunakan insertion sort
var
	j,i:integer;
	temp:siswa;
begin
	{pass:=1;
	while pass<= n-1 do //while 1
		begin
			i:=pass+1;
			temp:=dataSiswa[i];
			while(i>1)and (temp.tinggi < dataSiswa[i-1].tinggi) do //while 2
				begin
					dataSiswa[i]:=dataSiswa[i-1];
					i:=i-1;
				end;// end while 2
				dataSiswa[i]:=temp;
				pass:=pass+1;
		end;//end while 1	}
	for i:=2 to n do
		begin
			temp:=dataSiswa[i];
			j:=i;
			while (j>1) and (temp.jarak < dataSiswa[j-1].jarak) do
				begin
					dataSiswa[j]:=dataSiswa[j-1];
					j:=j-1;
				end;
				dataSiswa[j]:=temp;
			end;
end;//end procedure
procedure urutUmur(var dataSiswa:tabelSiswa;n:integer);//pengurutan menggunakan bubble sort
var
	pass,i:integer;
	temp:siswa;
begin
	pass:=1;
	while pass <= n-1 do //while 1
		begin
			i:=1 ;
				while i < n - pass do //while 2
					begin
						if dataSiswa[i].umur < dataSiswa[i+1].umur then
							begin
								temp:=dataSiswa[i];
								dataSiswa[i]:=dataSiswa[i+1];
								dataSiswa[i+1]:=temp;
							end;// end if
						i:=i+1;
					end;// end while 2
				pass:=pass+1;
		end;// end while 1
end;//end procedure
procedure cekStatus(var dataSiswa:tabelSiswa;banyakData:integer);
{is.terdefinisi dataSista dan banyakData
 fs.mengembalikan status siswa terisi diterima atau tidak diterima}
var
	i:integer;
begin
	i:=1;
	repeat
		if (dataSiswa[i].jarak <= 20) or (i<=75) then
			begin
				dataSiswa[i].status:='Diterima';
			end
		else
			dataSiswa[i].status:='Tidak Diterima';
		i:=i+1;
	until(i>banyakData);
end;//end procedure
procedure editData(var data:tabelSiswa; i:integer;banyakData:integer);
{is.terdefinisi dataSiswa dan indeks data yang akan di editData
 fs.Mengembalikan data yang sudah di edit}
var
	pil:string;
 begin
	repeat	
		begin
			clrscr;
			writeln('==========================================');
			writeln('               Edit Data                  ');
			writeln('==========================================');
			write('Nama siswa : ');readln(dataSiswa[i].nama);
			write('Nama Ayah : ');readln(dataSiswa[i].namaAyah);
			write('Nama Ibu : ');readln(dataSiswa[i].namaIbu);
			repeat
				write('Jenis kelamin [L/P] ; ');readln(pil);
			until (pil = 'L') or (pil = 'l' ) or (pil = 'p') or (pil = 'P' );
			if (pil = 'L') or (pil = 'l' ) then
				dataSiswa[i].jenisKelamin:='Laki-Laki'
			else if (pil = 'p') or (pil = 'P' ) then
				dataSiswa[i].jenisKelamin:='Perempuan';
			write('Tempat lahir : ');readln(dataSiswa[i].tgl.tempat);
			repeat
				write('Tanggal lahir : ');readln(dataSiswa[i].tgl.tanggal);
			until(dataSiswa[i].tgl.tanggal >= 1) and (dataSiswa[i].tgl.tanggal <= 31);
			repeat
				write('Bulan lahir : ');readln(pil);
			until (pil='1') or (pil='2') or (pil='3') or (pil='4') or (pil='5') or (pil='6') or (pil='7') or (pil='8') or (pil='9') or (pil='10') or (pil='11') or (pil='12');
			if (pil='1') then
				dataSiswa[i].tgl.bulan := 'Januari'
			else if (pil='2') then
				dataSiswa[i].tgl.bulan := 'Februari'
			else if (pil='3') then
				dataSiswa[i].tgl.bulan := 'Maret'
			else if (pil='4') then
				dataSiswa[i].tgl.bulan := 'April'
			else if (pil='5') then
				dataSiswa[i].tgl.bulan := 'Mei'
			else if (pil='6') then
				dataSiswa[i].tgl.bulan := 'Juni'
			else if (pil='7') then
				dataSiswa[i].tgl.bulan := 'Juli'
			else if (pil='8') then
				dataSiswa[i].tgl.bulan := 'Agustus'
			else if (pil='9') then
				dataSiswa[i].tgl.bulan := 'September'
			else if (pil='10') then
				dataSiswa[i].tgl.bulan := 'Oktober'
			else if (pil='11') then
				dataSiswa[i].tgl.bulan := 'November'
			else if (pil='12') then
				dataSiswa[i].tgl.bulan := 'Desember';
			repeat
				write('Tahun lahir : ');readln(dataSiswa[i].tgl.tahun);
			until (dataSiswa[i].tgl.tahun > 0 );
			dataSiswa[i].umur:=2017 - dataSiswa[i].tgl.tahun;
			repeat
				write('Tinggi badan : ');readln(dataSiswa[i].tinggi);
			until (dataSiswa[i].tinggi > 0);
			repeat
				write('Golongan Darah : ');readln(dataSiswa[i].golDarah);
			until (dataSiswa[i].golDarah = 'a') or (dataSiswa[i].golDarah = 'b') or (dataSiswa[i].golDarah = 'ab') or (dataSiswa[i].golDarah = 'o') or (dataSiswa[i].golDarah = 'A') or (dataSiswa[i].golDarah = 'B') or (dataSiswa[i].golDarah = 'AB') or (dataSiswa[i]
.golDarah = 'O');
			write('Alamat : ');readln(dataSiswa[i].alamat);
			repeat
				write('Masukan Jarak dari rumah ke sekolan : ');readln(dataSiswa[i].jarak);
			until (dataSiswa[i].jarak >0);	
			writeln('==========================================');
			clrscr;
			writeln('==========================================');
			writeln('               Edit Data                  ');
			writeln('==========================================');
			writeln('Nama siswa : ',dataSiswa[i].nama);
			writeln('Nama ayah : ',dataSiswa[i].namaAyah);
			writeln('Nama ibu : ',dataSiswa[i].namaIbu);
			writeln('Jenis kelamin : ',dataSiswa[i].jenisKelamin);
			writeln('Tempat tanggal lahir : ',dataSiswa[i].tgl.tempat,' , ',dataSiswa[i].tgl.tanggal,' ',dataSiswa[i].tgl.bulan,' ',dataSiswa[i].tgl.tahun);
			writeln('Umur : ',dataSiswa[i].umur);
			writeln('Tinggi badan : ',dataSiswa[i].tinggi);
			writeln('Alamat : ',dataSiswa[i].alamat);
			writeln('Jarak dari rumah ke sekolah : ',dataSiswa[i].jarak);
			write('Apakah data tersebut sudah benar? [Y/T] : ');readln(pil);
		end;
	until (pil = 'y') or (pil = 't');
	urutJarak(dataSiswa,banyakData);
	cekStatus(dataSiswa,banyakData);
end;
procedure hapusData(var dataSiswa:tabelSiswa;var banyakData:integer;i:integer);
{is.terdefinisi dataSista dan banyakData
 fs.Melakukan penghapusan data }
var
pilihan:char;
idx:integer;
temp:tabelSiswa;

begin
	clrscr;
	idx:=1;
	writeln('====================Detele data siswa=================');
	writeln('Nama siswa : ',dataSiswa[i].nama);
	writeln('Nama ayah : ',dataSiswa[i].namaAyah);
	writeln('Nama ibu : ',dataSiswa[i].namaIbu);
	writeln('Jenis kelamin : ',dataSiswa[i].jenisKelamin);
	writeln('Tempat tanggal lahir : ',dataSiswa[i].tgl.tempat,' , ',dataSiswa[i].tgl.tanggal,' ',dataSiswa[i].tgl.bulan,' ',dataSiswa[i].tgl.tahun);
	writeln('Umur : ',dataSiswa[i].umur);
	writeln('Tinggi badan : ',dataSiswa[i].tinggi);
	writeln('Jarak dari rumah ke sekolah : ',dataSiswa[i].jarak);
	writeln('Status : ',dataSiswa[i].status);
	writeln('======================================================');
	repeat
		write('Apakah anda yakin ingin menghapusnya?[Y/T] : ');readln(pilihan);
	until(pilihan='y')or(pilihan='Y')or(pilihan='t')or(pilihan='T');
	writeln('======================================================');
	if banyakData = 1 then
		banyakData:=0
	else if (pilihan='y')or(pilihan='Y') and (banyakData>1) then
				begin
					repeat
						if (dataSiswa[idx].nama <> dataSiswa[i].nama) then
							temp[idx]:=dataSiswa[idx];
							idx:=idx+1;
					until(idx>banyakData);
				end;
					banyakData:=banyakData-1;
					idx:=1;
					repeat
						dataSiswa[idx]:=temp[idx];
						idx:=idx+1;
					until(idx>banyakData);
			writeln('Data berhasil dihapus silahkan tekan enter........');readln;
end;
		
procedure tampilData(var dataSiswa:tabelSiswa;var banyakData:integer);
{is.terdefinisi dataSista dan banyakData
 fs.Menampilkan data terurut berdasarkan jarak}
var
	i:integer;
	pill:char;
begin
	i:=1;
	repeat
		clrscr;
		writeln('===============Menampilkan data siswa=================');
		writeln('Nama siswa : ',dataSiswa[i].nama);
		writeln('Nama ayah : ',dataSiswa[i].namaAyah);
		writeln('Nama ibu : ',dataSiswa[i].namaIbu);
		writeln('Jenis kelamin : ',dataSiswa[i].jenisKelamin);
		writeln('Tempat tanggal lahir : ',dataSiswa[i].tgl.tempat,' , ',dataSiswa[i].tgl.tanggal,' ',dataSiswa[i].tgl.bulan,' ',dataSiswa[i].tgl.tahun);
		writeln('Umur : ',dataSiswa[i].umur);
		writeln('Tinggi badan : ',dataSiswa[i].tinggi);
		writeln('Alamat : ',dataSiswa[i].alamat);
		writeln('Jarak dari rumah ke sekolah : ',dataSiswa[i].jarak);
		writeln('Status : ',dataSiswa[i].status);
		writeln('======================================================');
		writeln('[1]Previous  [2]Edit  [3]Delete [4]Next [5]Menu Tampil Data');
		writeln('======================================================');
		repeat
			write('Masukan Pilihan anda : ');readln(pill);
		until (pill ='1')or(pill ='2')or(pill ='3')or(pill ='4')or(pill ='5');
		writeln('======================================================');
		if (pill = '1') and(i>1) then
			i:=i-1
		else if (pill ='1') and (i=1) then
			begin
				clrscr;
				writeln('Tidak ada data sebelumnya');
				writeln('Silahkan tekan enter');readln;
			end
		else if (pill ='2')then
			begin
				editData(dataSiswa,i,banyakData);
				urutJarak(dataSiswa,banyakData);
			end
		else if (pill ='3') then
			begin
				hapusData(dataSiswa,banyakData,i);
				urutJarak(dataSiswa,banyakData);
			end
		else if (pill ='4') then
				i:=i+1;
		{end if}
		
	until(i>banyakData )or (pill = '5');
end;
procedure isidata(var dataSiswa:tabelSiswa;var banyakData:integer);
{is.-
 fs. dataSista terisi sebanyak banyakData}
var
	pil:string;
	i:integer;
begin
	i:=1;
	repeat
		begin
			clrscr;
			writeln('==========================================');
			writeln('   Banyak siswa mendaftar : ',i,' / 200    ');
			writeln('==========================================');
			write('Nama siswa : ');readln(dataSiswa[i].nama);
			write('Nama Ayah : ');readln(dataSiswa[i].namaAyah);
			write('Nama Ibu : ');readln(dataSiswa[i].namaIbu);
			repeat
				write('Jenis kelamin [L/P] ; ');readln(pil);
			until (pil = 'L') or (pil = 'l' ) or (pil = 'p') or (pil = 'P' );
			if (pil = 'L') or (pil = 'l' ) then
				dataSiswa[i].jenisKelamin:='Laki-Laki'
			else if (pil = 'p') or (pil = 'P' ) then
				dataSiswa[i].jenisKelamin:='Perempuan';
			write('Tempat lahir : ');readln(dataSiswa[i].tgl.tempat);
			repeat
				write('Tanggal lahir : ');readln(dataSiswa[i].tgl.tanggal);
			until(dataSiswa[i].tgl.tanggal >= 1) and (dataSiswa[i].tgl.tanggal <= 31);
			repeat
				write('Bulan lahir : ');readln(pil);
			until (pil='1') or (pil='2') or (pil='3') or (pil='4') or (pil='5') or (pil='6') or (pil='7') or (pil='8') or (pil='9') or (pil='10') or (pil='11') or (pil='12');
			if (pil='1') then
				dataSiswa[i].tgl.bulan := 'Januari'
			else if (pil='2') then
				dataSiswa[i].tgl.bulan := 'Februari'
			else if (pil='3') then
				dataSiswa[i].tgl.bulan := 'Maret'
			else if (pil='4') then
				dataSiswa[i].tgl.bulan := 'April'
			else if (pil='5') then
				dataSiswa[i].tgl.bulan := 'Mei'
			else if (pil='6') then
				dataSiswa[i].tgl.bulan := 'Juni'
			else if (pil='7') then
				dataSiswa[i].tgl.bulan := 'Juli'
			else if (pil='8') then
				dataSiswa[i].tgl.bulan := 'Agustus'
			else if (pil='9') then
				dataSiswa[i].tgl.bulan := 'September'
			else if (pil='10') then
				dataSiswa[i].tgl.bulan := 'Oktober'
			else if (pil='11') then
				dataSiswa[i].tgl.bulan := 'November'
			else if (pil='12') then
				dataSiswa[i].tgl.bulan := 'Desember';
			repeat
				write('Tahun lahir : ');readln(dataSiswa[i].tgl.tahun);
			until (dataSiswa[i].tgl.tahun > 0 );
			dataSiswa[i].umur:=2017 - dataSiswa[i].tgl.tahun;
			repeat
				write('Tinggi badan : ');readln(dataSiswa[i].tinggi);
			until (dataSiswa[i].tinggi > 0);
			repeat
				write('Golongan Darah : ');readln(dataSiswa[i].golDarah);
			until (dataSiswa[i].golDarah = 'a') or (dataSiswa[i].golDarah = 'b') or (dataSiswa[i].golDarah = 'ab') or (dataSiswa[i].golDarah = 'o') or (dataSiswa[i].golDarah = 'A') or (dataSiswa[i].golDarah = 'B') or (dataSiswa[i].golDarah = 'AB') or (dataSiswa[i]
.golDarah = 'O');
			write('Alamat : ');readln(dataSiswa[i].alamat);
			repeat
				write('Masukan Jarak dari rumah ke sekolan : ');readln(dataSiswa[i].jarak);
			until (dataSiswa[i].jarak >0);	
			writeln('==========================================');
			i:=i+1;
			if i <= 200 then
					begin
						write('Apakah ingin memasukan data lagi [Y/T] : ');readln(pil);
					end
			else
				writeln('Anda tidak dapat memasukan data lagi karena kouta sudah terpenuhi');
		end;
	until (pil='t') or (pil='T') or (i>200);
	banyakData:=i-1;
end;
procedure tambahData(var dataSiswa:tabelSiswa ;var i:integer);
{is.terdefinisi dataSista dan banyakData
 fs.Melakukan penambahan data tanpa meresert data yang sudah terisi}
var	
	pil:string;
 begin
	i:=i+1;
	repeat
		begin
			clrscr;
			writeln('==========================================');
			writeln('   Banyak siswa mendaftar : ',i,' / 200    ');
			writeln('==========================================');
			write( 'Nama siswa : ');readln(dataSiswa[i].nama);
			write('Nama Ayah : ');readln(dataSiswa[i].namaAyah);
			write('Nama Ibu : ');readln(dataSiswa[i].namaIbu);
			repeat
				write('Jenis kelamin [L/P] ; ');readln(pil);
			until (pil = 'L') or (pil = 'l' ) or (pil = 'p') or (pil = 'P' );
			if (pil = 'L') or (pil = 'l' ) then
				dataSiswa[i].jenisKelamin:='Laki-Laki'
			else if (pil = 'p') or (pil = 'P' ) then
				dataSiswa[i].jenisKelamin:='Perempuan';
			write('Tempat lahir : ');readln(dataSiswa[i].tgl.tempat);
			repeat
				write('Tanggal lahir : ');readln(dataSiswa[i].tgl.tanggal);
			until(dataSiswa[i].tgl.tanggal >= 1) and (dataSiswa[i].tgl.tanggal <= 31);
			repeat
				write('Bulan lahir : ');readln(pil);
			until (pil='1') or (pil='2') or (pil='3') or (pil='4') or (pil='5') or (pil='6') or (pil='7') or (pil='8') or (pil='9') or (pil='10') or (pil='11') or (pil='12');
			if (pil='1') then
				dataSiswa[i].tgl.bulan := 'Januari'
			else if (pil='2') then
				dataSiswa[i].tgl.bulan := 'Februari'
			else if (pil='3') then
				dataSiswa[i].tgl.bulan := 'Maret'
			else if (pil='4') then
				dataSiswa[i].tgl.bulan := 'April'
			else if (pil='5') then
				dataSiswa[i].tgl.bulan := 'Mei'
			else if (pil='6') then
				dataSiswa[i].tgl.bulan := 'Juni'
			else if (pil='7') then
				dataSiswa[i].tgl.bulan := 'Juli'
			else if (pil='8') then
				dataSiswa[i].tgl.bulan := 'Agustus'
			else if (pil='9') then
				dataSiswa[i].tgl.bulan := 'September'
			else if (pil='10') then
				dataSiswa[i].tgl.bulan := 'Oktober'
			else if (pil='11') then
				dataSiswa[i].tgl.bulan := 'November'
			else if (pil='12') then
				dataSiswa[i].tgl.bulan := 'Desember';
			repeat
				write('Tahun lahir : ');readln(dataSiswa[i].tgl.tahun);
			until (dataSiswa[i].tgl.tahun > 0 );
			dataSiswa[i].umur:=2017 - dataSiswa[i].tgl.tahun;
			repeat
				write('Tinggi badan : ');readln(dataSiswa[i].tinggi);
			until (dataSiswa[i].tinggi > 0);
			repeat
				write('Golongan Darah : ');readln(dataSiswa[i].golDarah);
			until (dataSiswa[i].golDarah = 'a') or (dataSiswa[i].golDarah = 'b') or (dataSiswa[i].golDarah = 'ab') or (dataSiswa[i].golDarah = 'o') or (dataSiswa[i].golDarah = 'A') or (dataSiswa[i].golDarah = 'B') or (dataSiswa[i].golDarah = 'AB') or (dataSiswa[i]
.golDarah = 'O');
			write('Alamat : ');readln(dataSiswa[i].alamat);
			repeat
				write('Masukan Jarak dari rumah ke sekolan : ');readln(dataSiswa[i].jarak);
			until (dataSiswa[i].jarak >0);	
			writeln('==========================================');
			i:=i+1;
			if i <= 200 then
					begin
						write('Apakah ingin memasukan data lagi [Y/T] : ');readln(pil);
					end
			else
				writeln('Anda tidak dapat memasukan data lagi karena kouta sudah terpenuhi');
		end;
	until (pil='t') or (pil='T') or (i>200);
	i:=i-1;
end;
procedure cariDataNama(dataSiswa:tabelSiswa;banyakData:integer);
{is.terdefinisi dataSista dan banyakData
 fs.mencari data sesuai dengan inputan user}
var
	i:integer;
	cari:string;
	pill:char;
begin
	clrscr;
	write('Masnukan Nama yang ingin dicari : ');readln(cari);
	i:=1;
	while (i< banyakData) and (cari<>dataSiswa[i].nama) do
		begin
			i:=i+1;
		end;
	if cari=dataSiswa[i].nama then
		begin
			writeln('Nama siswa : ',dataSiswa[i].nama);
			writeln('Nama ayah : ',dataSiswa[i].namaAyah);
			writeln('Nama ibu : ',dataSiswa[i].namaIbu);
			writeln('Jenis kelamin : ',dataSiswa[i].jenisKelamin);
			writeln('Tempat tanggal lahir : ',dataSiswa[i].tgl.tempat,' , ',dataSiswa[i].tgl.tanggal,' ',dataSiswa[i].tgl.bulan,' ',dataSiswa[i].tgl.tahun);
			writeln('Umur : ',dataSiswa[i].umur);
			writeln('Tinggi badan : ',dataSiswa[i].tinggi);
			writeln('Alamat : ',dataSiswa[i].alamat);
			writeln('Jarak dari rumah ke sekolah : ',dataSiswa[i].jarak);
			writeln('Status : ',dataSiswa[i].status);
			writeln('======================================================');
			writeln(' [1]Edit  [2]Delete [3]Menu utama');
			writeln('======================================================');
			repeat
				write('Masukan Pilihan anda : ');readln(pill);
			until (pill ='1')or(pill ='2')or(pill ='3');
			writeln('======================================================');
			 if (pill ='1')then
				begin
					editData(dataSiswa,i,banyakData);
					urutJarak(dataSiswa,banyakData);
				end
			else if (pill ='2') then
				begin
					hapusData(dataSiswa,banyakData,i);
					urutJarak(dataSiswa,banyakData);
				end;
			{end if}
		end
	else
		writeln('Nama tersebut tidak ditemukan');
	write('Silahkan tekan enter........');readln;
end;
procedure pilTampilData(dataSiswa:tabelSiswa;banyakData:integer);
begin	
	repeat
		writeln('======================================================');
		writeln('1. Menampilkan data terurut berdasarkan jarak');
		writeln('2. Menampilkan data terurut berdasarkan umur');
		writeln('3. Menampilkan data terurut berdasarkan tinggi badan');
		writeln('4. Menu Utama ');
		repeat
			write('Masukan pilihan anda : ');readln(pil);
		until (pil='1') or (pil='2') or (pil='3')or (pil='4');
		case pil of
			'1':tampilData(dataSiswa,banyakData);
			'2':begin
					urutUmur(dataSiswa,banyakData);
					tampilData(dataSiswa,banyakData);
				end;
			'3':begin
					urutTinggi(dataSiswa,banyakData);
					tampilData(dataSiswa,banyakData);
				end;
		end;// end case
	until (pil='4');
end;//end procedure
procedure cariTinggi(dataSiswa:tabelSiswa;banyakData:integer);
{is.Terdefinisi dataSiswa dan banyak data
 fs.Menampilkan seluruh nama yang tingginya di inputkan urser}
var
	i:integer;
	tinggi:integer;
	cari:boolean;
begin
	clrscr;
	i:=1;
	cari:=false;
	write('Masukan tinggi badan yang ingin dicari : ');readln(tinggi);
	repeat
		if (tinggi = dataSiswa[i].tinggi) then
			begin
				writeln(dataSiswa[i].nama);
				cari:=true;
			end;
		i:=i+1;
	until i>banyakData;
	if cari = false then
		writeln('Data yang anda cari tidak ditemukan ');
	write('Silahkan tekan enter........');readln;
end;
begin//program utama
	repeat
		clrscr;
		writeln('|====================================================|');
		writeln('|=====================MENU UTAMA=====================|');
		writeln('|====================================================|');
		writeln('| 1.Mengisi data(dengan meresert ada yang sudah ada) |');
		writeln('| 2.Menambahkan data                                 |');
		writeln('| 3.Tampilkan data siswa                             |');
		writeln('| 4.Cari data siswa berdasarkan nama                 |');
		writeln('| 5.Cari data siswa berdasarkan tinggi badan         |');
		writeln('| 6.untuk mengakhiri program                         |');
		writeln('|====================================================|');
		write('Masukan pilihan anda : ');readln(pil);
		case pil of
				'1':begin
						isidata(dataSiswa,banyakData);
						urutJarak(dataSiswa,banyakData);
						cekStatus(dataSiswa,banyakData);
					end;
				'2':begin
						tambahdata(dataSiswa,banyakData);
						urutJarak(dataSiswa,banyakData);
						cekStatus(dataSiswa,banyakData);
					end;
				'3':pilTampilData(dataSiswa,banyakData);
				'4':cariDataNama(dataSiswa,banyakData);
				'5':cariTinggi(dataSiswa,banyakData);
		end;
	until (pil ='6') ;
	clrscr;
	writeln('==========================================');
	writeln('silahkan tekan enter......');readln;
end.
