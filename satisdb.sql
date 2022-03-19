-- SATIŞ OTOMASTON DATABASE --
create table tblil(
	id serial primary key,
	ad varchar(25),
	plaka int
)

create table tblilce(
	id serial primary key,
	ad varchar(30),
	ilid bigint references tblil(id)
)

create table tbladres(
	id bigserial primary key,
	tanim varchar(255), -- adrese bir isim ver
	adres varchar(500),	
	ilid integer references tblil(id),
	ilceid integer references tblilce(id),
	musteriid bigint references tblmusteri(id),
	kapino varchar(10),
	apartman varchar(50),
	sokak varchar(50),
	cadde varchar(50),
	mahalle varchar(100),
	longtitude double precision,
	latitude double precision,
	locationurl varchar(1000)
)
create table tblmusteri(
	id bigserial primary key,
	ad varchar(100) not null,
	soyad varchar(100) not null,
	tckimlik varchar(11),
	firmaadi varchar(255),
	verginumarasi varchar(11),
	vergidairesi varchar(255),
	adres varchar(500),
	profilephoto varchar(255),
	telefon varchar(14),
	email varchar(255),
	borclimiti double precision,
	musteritipi boolean, -- true-> bireysel/ false->firma
	state integer default 1	
)