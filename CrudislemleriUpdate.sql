--UPDATE--
-- 1- ilk olarak update komutu girilir.
-- 2- bir boşluk bırakılarak tablo adı girilir.
-- 3- set anahtar kelimesi girilir.
-- 4- değiştirilmek istenilen alan adı yazılır,sonra eşittir eklenerek atanmak istenilen değer yazılır.
-- DİKKAT!! atanılacak değer alan adının tipine uygun şekilde yazılmalıdır.
-- ÇOOOK DİKKAT!! değiştirilmek istenilen ürün belirtilmelidir.
-- eğer değiştirmek istediğiniz değerin primary key (id) değerini girmez iseniz tüm kayıtların güncellenmesine 
-- neden olursunuz.
-- where anahtar değeri ile hangi kayıt ın güncelleneceği belirtilir.
update tblurun set markaid=3, modelid=3 where id=1

-- id<3 olarak yazıldığında id si 3 den küçük tüm satırları değiştirir....