--veritabanı yablosu oluşturmak
---create table -> tablo oluştur
create table tblmusteri(
	id serial primary key, --identity, serial otomatik numaraiçin kullanılır.
	ad varchar(100),
	soyad varchar(100),
	adres varchar(500),
	telefon varchar(14),
	tckimlik varchar(11),
	cinsiyet integer,--0 belirtilmeyen, 1 erkek, 2 kadın....
	createdate bigint, --int ->int , long -> bigint...
	updatedate bigint,-- bu iki alan oluşturulma ve değiştirilme zamanlarını belirtir.
	isactive int --

)
create table tblurun(
	id serial primary key,
	ad varchar(150),
	barkod varchar(100),
	fiyat double precision,
	stok integer,
	kdv integer,
	resim varchar(255),
	aciklama varchar(1000),
	isactive int default 1 --0 pasif
						   --1 aktif
						   --2 silinmiş kayıt

)
create table tblmarka(
	id serial primary key,
	ad varchar(150)
)
create table tblmodel(
	id serial primary key,
	ad varchar(100),
	markaid int references tblmarka(id)--başka bir tabloya ilişki kurma... referans vermek için kullanılır.
										-- adı "foreignkey" dir.
)