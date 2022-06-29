
create table phones_samsung(
 id serial primary key,
 model varchar(40),
 ram int not null,
 front_camera int,
 price int
)


insert into phones_samsung(model, ram, front_camera, price)
values ('A50', 6, 10, 300),
    ('A50', 8, 10, 400),
    ('A52', 8, 16, 500),
    ('S20', 8, 24, 1500),
    ('S21', 8, 12, 1000),
    ('S22', 6, 12, 1200),
    ('A71', 6, 12, 1200),
    ('A91', 4, 12, 1900),
    ('A57', 8, 8, 900),
    ('A32', 8, 4, 800),
    ('A33', 8, 5, 750),
    ('A43', 8, 5, 850)
 ;
 
create table phones_apple(
 id serial primary key,
 model varchar(40),
 ram int not null,
 front_camera int,
 price int
)


insert into phones_apple(model, ram, front_camera, price)
values ('X', 4, 8, 400),
    ('11', 6, 10, 700),
    ('12', 8, 12, 1000),
    ('7', 4, 12, 400),
    ('XR', 6, 12, 800),
    ('XS', 6, 12, 1000),
    ('13', 6, 12, 1500),
    ('8', 4, 12, 700),
    ('SE 2020', 6, 8, 700)
 ;
   -- находим телефоны эппл с ценой меньше средней цены самсунга 
select * from phones_apple
where price < (select avg(price) from phones_samsung);
-- находим телефоны эппл которые по цене равны самсунг
select * from phones_apple
where price in (select price from phones_samsung);

select pa.model, pa.price, ps.model, ps.price from phones_apple pa
join phones_samsung ps 
on pa.price = ps.price;
   
-- находим телефоны эппл которые не равны по цене самсунг
select * from phones_apple
where price not in (select price from phones_samsung);  



-- находим самсунг который стоит меньше самого дешевого эппл
select * from phones_samsung
where price < all (select price from phones_apple where price < 1000);  

-- находим самсунг который стоит дороже самого дорогого эппл < 1000
select * from phones_samsung
where price > all (select price from phones_apple where price < 1000);  


select * from phones_samsung
where price = all (select price from phones_apple where price < 1000);

select * from phones_samsung
where price <> all (select price from phones_apple where price < 1000);

--находим самсунг который стоит меньше самого дорогого эппл
select * from phones_samsung
where price < any (select price from phones_apple where price < 1000);

--находим самсунг который стоит больше самого дешевого эппл
select * from phones_samsung
where price > any (select price from phones_apple where price < 1000);

select * from phones_samsung
where price <> any (select price from phones_apple where price < 1000);


select * from phones_samsung
where price = any (select price from phones_apple where price < 1000);


===============================================

--UNION

-- юниион выбирает уникальные не повторяющиеся данные
select ram, price from phones_apple pa 
union
select ram, price from phones_samsung

select ram, price from phones_apple pa 
union all
select ram, price from phones_samsung
order by price;


-- средняя цена по группам оперативной памяти
select ram, avg(price) from phones_apple pa 
group by ram 

--max цена по группам оперативной памяти
select ram, max(price) from phones_apple pa 
group by ram 


--min цена по группам оперативной памяти
select ram, min(price) from phones_apple pa 
group by ram 




select * from phones_apple 
;
   