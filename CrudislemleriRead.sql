--READ--
-- Select kullanımı ve parametreleri
-- 1- SELECT - seçme anahtarı yazılır
-- 2- seçim soncunda hangi dataların alınacağını belirtmek için tablaya ait alanların adı ya da tüm dataları
-- çekmek için * karakteri kullanılır.
-- 4- hangi tablonun kullanılacağı belirtmek adına önce from anatar kelimesi bir boşluk ırakılarak eklenir.
-- 5- ardından bir boşluk bırakılarak tablonun ad yazılır.
select * from tblurun
select id,ad,satisfiyat from tblurun

--WHERE anahtar kelimesi ile yapılan kısıtlamalar
select * from tblurun where id=1

select * from tblurun where id>3

select * from tblurun where id>=3

select * from tblurun where id!=2

--WHERE AND, OR Kullanımı

select * from tblurun where id=1 or id=4

select * from tblurun where id>1 and id<4

select * from tblurun where stokmiktari<=20

select id,ad,stokmiktari from tblurun where stokmiktari<=15

--LIMIT Parametresi -> Kısıtlama parametresi
-- Tabloda belirli bir sayıda kayıt çekmek için kullanılır.
select * from tblilce limit 4 --ilk 4 kaydı gösterir.

-- IN parametresi -> 
-- 1000 kaydın oluğu bir durumda 200 ile 245 arasındaki kayıtları göstermek istiyorsunuz diyelim...
-- cevap where in id>200 and id<246
-- 1000 kayıt içinde rastgele seçilmiş 46 adet değeriniz olsa idi...
-- cevap id=1 or id=999 or id=34 or id=435..
select * from tblilce where id in(3,65,343,34,500)
--örnek sorgu
select * from tblilce where id in(select id from tblilce where ad ilike 'an%')

--BETWEEN, Arasında parametresi -> belli bir aralıktaki degerleri getirmek için kullanılır.

select * from tblil where id>10 and id<20

select * from tblil where id between 10 and 20 --10 ve 20 dahil...


--IS NULL , IS NOT NULL --dolu mu boş mu parametresi

select id,ad,kdv from tblurun where kdv is null
select id,ad,kdv from tblurun where kdv is not null
--  update tblurun set kdv=18 where id in(1,4)

--LIKE, ILIKE
--% yüzde işareti -> parametre
--_ alt tire ->parametre

select * from tblilce where ad like 'A%'--A ile başlayan devamında uzunluğu ve içeriği farketmeyen kayıtları
select * from tblilce where ad like '%AN%'
--AN....
--...AN..
--....AN
--AN hepsini sorgular.


--- _ alttire parametresi tek bir karakter yerine geçer.
select * from tblilce where ad like '__A%' --- ilk iki karakterinden sonra A harfi gelecek tüm ifadeler
select * from tblilce where ad like '__A___' -- üçüncü harfi a olan ve 6 karakterli kayıtları getir.

select * from tblilce where ad ilike '%a%' --ilike parametresi keys sensetive olmadan
											--arama yapmak için kullanılır.byük küçük harf ayrımı yapmaz.
											

-- SELECT kendisine verilen bilgiyi tablo olarak gösterme eğilimindedir.
select 5 + 33334 as toplam
-- AS -> Alias -> Takma ad,Mahlas
--tablo adına uygulanabilir. herhangi bir sorguya uygulanabilir.
select 'Veli CANLI'
select NOW()
select id as uunid,ad as urunadi,kdv,markaid from tblurun
------------------------------
------------------------------
--ORDER BY,
---ASC,DESC
select * from tblil order by ad --ada göre a dan z ye sırala
select * from tblil order by ad desc --ada göre(büyükten küçüğe) z den a ya sıralama
select * from tblil order by ad asc --ad a göre a dan z ye sıralama

--asc, küçükten büyüğe, 0...9 a....z
--NOT eğer order by ek parametre almaz is asc şeklinde davranır.
--desc, büyükten küçüğe 9...0 z.....a
----------------------
----------------------

select * from tblmusteri
insert into tblmusteri(ad,soyad) values
('Veli','CANLI'),('Şükrü','SAĞOĞLU')
('Ahmet','BAŞ'),('Canan','TURNA'),('Gül','GENİŞ'),('Demet','TEK'),('Ayhan','SİCİM')
select *from tblodeme
insert into tblodeme(musteriid,nakitodemetutari) values
(1,2500),(2,6900),(3,1120),(4,1200),(5,150),
(1,400),(2,900),(3,110),(4,800),(5,500),
(1,250),(2,750),(3,240),(4,400),(5,10),
(1,50),(2,80),(3,180),(4,260),(5,360),
(1,450),(2,700),(3,800),(4,850),(5,350)

select * from tblodeme
--Ödeme yapan müşteri listesini çıkart
--select musteriid from tblodeme order by musteriid
select id,ad,soyad from tblmusteri where id in (select musteriid from tblodeme order by musteriid)

--Tekrar eden kayıtların tek gösterim ile gösterilmesi
--DISTINCT
select distinct musteriid from tblodeme order by musteriid
--------------------
-------------------------------

----GROUP  BY,
select musteriid, SUM(nakitodemetutari) from tblodeme group by musteriid

-------------------------
---------------------------

---Bir tabloda var olan yabancı anahtarlı değerlerin diğer tablodan alınarak
---birleştirilmesi nasıl yapılır?

--JOIN, referans verilmiş iki tabloyu bu referans değerini baz alarak birleştirme işlemi yapar.

--Birleştirme işleminde dikkat edilmesi gereken durumlar
--hangi tabloyu, hangi tabloya birleştirelim??
---soruya ya da soruna göre değişir?

select * from tblodeme
select * from tblmusteri
--odeme yapan musteriler
select * from tblodeme join tblmusteri on tblodeme.musteriid=tblmusteri.id

-- * parametresi tüm alanları getiriyor. Peki sadece istediğim tablodan istediğim alanları çekmek istersem ne nasıl olacak?
select tblmusteri.id,tblmusteri.ad,tblmusteri.soyad,tblodeme.nakitodemetutari from tblodeme
join tblmusteri on tblodeme.musteriid=tblmusteri.id

--Peki, tablo adları ve alan adları çok uzunsa nasıl yazmak lazım..
select mu.id,mu.ad,mu.soyad,od.nakitodemetutari from tblodeme as od
join tblmusteri as mu on od.musteriid=mu.id

--ödeme tablosunda hangi müşteri ödeme yaptı ve tutar ne idi
select musteriid, count(*),SUM(nakitodemetutari) from tblodeme group by musteriid

--count(*) kaç kere geçtiğini gösterir. birden fazla geçen değerlerin sayısını tutar.
--group by kullanımında where yerine having parametresi kullnılır.

select mu.id,mu.ad,mu.soyad,SUM(od.nakitodemetutari),count(*) from tblodeme as od
join tblmusteri as mu on od.musteriid=mu.id
group by mu.id
having SUM(od.nakitodemetutari)>10000
order by SUM(od.nakitodemetutari)
------------------------------
--------------------------------
insert into tblodeme(nakitodemetutari) values (25444),(150),(3650)

----------------------
------------------------------
--Birden Fazla TAblonun birleşimi
select * from tblurun
left join tblmodel on tblmodel.id=tblurun.modelid
left join tblmarka on tblmarka.id=tblmodel.markaid

-------------------------------------------
-------------------------------------------
---VIEW OLUŞTURMA
create view vwtumurunler as
select urn.id,urn.ad as urunadi,urn.satisfiyat,mrk.ad as markaadi,mdl.ad as modeladi
from tblurun as urn
left join tblmodel as mdl on mdl.id=urn.modelid
left join tblmarka as mrk on mrk.id=mdl.markaid

---VIEW ÇAĞIRMA
select * from vwtumurunler where satisfiyat>15000


---- 1- Bir proje seçiniz.
---- 2- Tablolar ve ilişkilerini yazınız. tablolar 8 den az olmasın.. en az 4 ilişki olsun
---- 3- Soru çıkartın.
----    Neden? uygulamamız yapılmak istenilen program isteklerine cevap verebiliyor mu?
----    Bu ay hangi müşterilere satış yapıldı? gibi
---- 4- 