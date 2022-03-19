--Create, (Insert Into)
--Run
--Update
--Delete

-- Create İşlemleri -- (Insert into)
--bir toblaya veri eklemek
--1 -ilk olarak insert into
--2- tablo ismi ve hangi verilerin girileceği() içinde
--3- values parametresi
--4- parantez içine sıra ile tablo parantezinde bulunan alanlar için değerler girilir.
--DİKKAT!! valeus içine girdiğiniz değerler, kolon alanlarının değişken türüne uygun şekilde olmalıdır.
--varchar iin tek tırnak içinde değer giriniz 'Veli CANLI' gibi
--sayısal değerler için -> ırnak olmadan sayı değeri giriniz 544.3

insert into tblurun(ad,alisfiyat,satisfiyat,stokmiktari,stokuyarimiktari)
values
('Samsung Galaxy S21 Plus 5G 128 GB',11099,15999,25,5),
('Samsung Galaxy Note 10 lite 128 GB',9117,9399,150,15)		

insert into tblmarka(ad) 
values('Lenova'),('Asus'),('Apple'),('HP'),('Samsung')

insert into tblmodel(ad,markaid) 
values ('Macbook Air M1',3), ('MacBook Pro M1',3), ('MacBook Pro İntel',3)

insert into tblurun(ad,alisfiyat,satisfiyat,stokmiktari,stokuyarimiktari,markaid,modelid)
values 
('Apple MacBook Air M1',11500,14999,15,5,3,2),
('Apple Macbook M1 Pro',20500,24498,20,5,3,3)