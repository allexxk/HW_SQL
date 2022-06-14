/*1. Найдите номер модели, скорость и размер жесткого диска для всех ПК стоимостью менее 500 дол. Вывести: model, speed и hd*/

select model,speed,hd from pc
where price < 500
======================================
/*2. Найдите производителей принтеров. Вывести: maker*/

Select distinct Maker from product
where type = 'printer'
======================================
/*3. Найдите номер модели, объем памяти и размеры экранов ПК-блокнотов, цена которых превышает 1000 дол.*/

Select model,ram,screen from laptop
where price > 1000
=======================================
/*4. Найдите все записи таблицы Printer для цветных принтеров.*/

select * from printer
where color = 'y'
=======================================
/*5. Найдите номер модели, скорость и размер жесткого диска ПК, имеющих 12x или 24x CD и цену менее 600 дол.*/

select model, speed, hd from pc
where (cd = '12x' or cd = '24x') and price < 600
=======================================
/*6. Для каждого производителя, выпускающего ПК-блокноты c объёмом жесткого диска не менее 10 Гбайт, 
найти скорости таких ПК-блокнотов. Вывод: производитель, скорость.*/

select distinct Product.maker, Laptop.speed
FROM Product, Laptop 
WHERE product.model=laptop.model and Laptop.hd >= 10
=======================================
/*7. Найдите номера моделей и цены всех имеющихся в продаже продуктов (любого типа) 
производителя B (латинская буква).*/

select distinct pc.model,price 
from pc inner join   
     Product ON PC.model = Product.model
where maker = 'B'
union
select distinct printer.model,price 
from printer inner join   
     Product ON printer.model = Product.model
where maker = 'B'
union
select distinct laptop.model,price 
from laptop inner join   
     Product ON laptop.model = Product.model
where maker = 'B'
=======================================
/*8. Найдите производителя, выпускающего ПК, но не ПК-блокноты.*/

select distinct maker from product
where type = 'pc' and 
      maker not in (select maker from product where type = 'laptop')
=======================================
/*9. Найдите производителей ПК с процессором не менее 450 Мгц. Вывести: Maker*/

select distinct maker from product
inner join 
PC on PC.model = Product.model
where pc.speed >=450
=======================================
/*10. Найдите модели принтеров, имеющих самую высокую цену. Вывести: model, price*/

select model, price from printer
where price = (select max(price) from printer)
=======================================
/*11. Найдите среднюю скорость ПК.*/

Select avg(speed) from pc
=======================================
/*12. Найдите среднюю скорость ПК-блокнотов, цена которых превышает 1000 дол.*/

select avg(speed) from laptop
where price > 1000
=======================================
/*13. Найдите среднюю скорость ПК, выпущенных производителем A.*/

select avg(speed) from pc
inner join
Product on pc.model = Product.model
WHERE maker = 'A'
=======================================
/*14. Найдите класс, имя и страну для кораблей из таблицы Ships, имеющих не менее 10 орудий.*/

select ships.class, ships.name, classes.country from ships, classes
where classes.class = ships.class and classes.numGuns >= 10
=======================================
/*15. Найдите размеры жестких дисков, совпадающих у двух и более PC. Вывести: HD*/

select hd from pc
group by hd
having count(hd) >= 2
=======================================
/*16. Найдите пары моделей PC, имеющих одинаковые скорость и RAM. 
В результате каждая пара указывается только один раз, т.е. (i,j), но не (j,i), 
Порядок вывода: модель с большим номером, модель с меньшим номером, скорость и RAM.*/

select distinct pc1.model, pc2.model, pc1.speed, pc1.ram from pc pc1, pc pc2
where pc1.speed=pc2.speed and pc1.ram=pc2.ram and pc1.model>pc2.model
=======================================
/*17. Найдите модели ПК-блокнотов, скорость которых меньше скорости каждого из ПК.
Вывести: type, model, speed*/

select distinct type, laptop.model, speed from laptop join 
product on product.model = laptop.model
where speed < all (select speed from pc)
=======================================
/*18. Найдите производителей самых дешевых цветных принтеров. Вывести: maker, price*/

select Maker, price from printer join product on 
product.model = printer.model
where price = (select min(price) from printer
               where color = 'y') and color='y'
group by Maker,price

=======================================
/*19. Для каждого производителя, имеющего модели в таблице Laptop,
найдите средний размер экрана выпускаемых им ПК-блокнотов.
Вывести: maker, средний размер экрана.*/

select maker, avg(screen) from laptop 
join product on product.model = laptop.model
group by maker

=======================================
/*20. Найдите производителей, выпускающих по меньшей мере три различных модели ПК. 
Вывести: Maker, число моделей ПК.*/


=======================================
/*21.Найдите максимальную цену ПК, выпускаемых каждым производителем, 
у которого есть модели в таблице PC. Вывести: maker, максимальная цена.*/

select maker, max(price) from pc 
join product on product.model = pc.model
group by maker

=======================================
/*22. Для каждого значения скорости ПК, превышающего 600 МГц, 
определите среднюю цену ПК с такой же скоростью. Вывести: speed, средняя цена.*/

select speed, avg(price) from pc 
where speed > 600
group by speed

=======================================

