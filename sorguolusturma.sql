-- SORGU OLUŞTURMA --
-- 1 -- Stoğu 30 un altına düşenleri nasıl buluruz?
select * from tblurun where stokmiktari<30
select * from tblurun where stokmiktari<stokuyarimiktari
update tblurun set stokmiktari=2 where id in (1,2) order by id


create view vwstoguazalanurunler as
select * from tblurun where stokmiktari<stokuyarimiktari order by id

-- 2 -- Marka ve model bilgisini de içeren tablo

--select urn.id,urn.ad,mrk.ad as markaadi,mdl.ad as modeladi from tblmarka as mrk 
--left join tblmodel as mdl on mrk.id=mdl.markaid 
--left join tblurun as urn on urn.modelid=mdl.id
create view vwmarkamodelurunbilgisi as
select urn.id,urn.ad,mrk.ad as markaadi,mdl.ad as modeladi from tblurun as urn 
left join tblmodel as mdl on urn.modelid=mdl.id 
left join tblmarka as mrk on mdl.markaid=mrk.id

select * from vwmarkamodelurunbilgisi

-- 3 -- En çok satışı yapılan ilk üç ürün ??
--select urunid, SUM(miktar) from tblsatisdetay where id in (1,3) order by SUM(miktar) 
create view vwencoksatanilkucurun as

select urunid, SUM(miktar) as toplammiktar from tblsatisdetay 
group by urunid order by toplammiktar desc limit 3

insert into tblmusteri(ad,soyad) values ('Ahmet','BAŞ')
insert into tblsatis (musteriid,toplamtutar) values (1,63000)
insert into tblsatisdetay (satisid,urunid,miktar)
values (1,4,1),(1,1,5),(1,3,2),(1,4,10),(1,1,3),(1,2,8)

-- 4 -- bireysel olarak satılan ürün adedi
-- count kullanırken dikkat !!
--  count(*) yaparsanız var olan satır sayısını sayar.
-- count(sutunadı) yazarsanız o satırda null olmayan kayıtların sayısını verir.
-- bu nedenle sutun adı verirken dikkat ediniz. eksik bilgi dönebilirsiniz.
create view vwsatilanurunadedi as
select urunid, count(*) from tblsatisdetay group by urunid order by count(*) desc 

create view vwmarkamodelencoksatanücürünbilgisi as
select bilgi.id, bilgi.ad, bilgi.markaadi,bilgi.modeladi, vwsat.toplammiktar 
from vwencoksatanilkucurun as vwsat 
left join vwmarkamodelurunbilgisi as bilgi on vwsat.urunid=bilgi.id
