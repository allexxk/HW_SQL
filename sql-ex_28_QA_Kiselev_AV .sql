--1. Найдите номер модели, скорость и размер жесткого диска для всех ПК стоимостью менее 500 дол. Вывести: model, speed и hd

select model,speed,hd from pc
where price < 500
======================================
--2. Найдите производителей принтеров. Вывести: maker

Select distinct Maker from product
where type = 'printer'
======================================
--3. Найдите номер модели, объем памяти и размеры экранов ПК-блокнотов, цена которых превышает 1000 дол.

Select model,ram,screen from laptop
where price > 1000
