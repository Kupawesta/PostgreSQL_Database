-- ÜRÜN İLE İLGİLİ TABLOLAR --
create table tblmodel(
	id serial primary key,
	markaid integer references tblmarka(id),
	ad varchar(255),
	aciklama varchar(500)
)
create table tblmarka(
	id serial primary key,
	ad varchar(250),
	logo varchar(255),
	adres varchar(500),
	notes varchar(250)
)
create table tblkategori(
	id serial primary key,
	ad varchar(120),
	parentid integer 
)
create table tblurun(
	id bigserial primary key,
	ad varchar(255),
	markaid integer references tblmarka(id),
	modelid integer references tblmodel(id),
	satisfiyat double precision,
	alisfiyat double precision,
	birimi varchar(25),--adet kilo vs. için
	stokmiktari integer,
	kdv integer,
	barkod varchar(40),
	stokuyarimiktari integer,
	kategoriid integer references tblkategori(id),
	aciklama varchar(500)
)
