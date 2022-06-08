--создадим 3 таблицы

--таблица alary
create table salary(
	id serial primary key,
	monthly_salary int not null
);

select * from salary;
drop table salary;


--таблица roles
create table roles(
id serial primary key,
role_title varchar(50) unique not null
);
drop table roles;
select * from roles;

--таблица roles salary
create table roles_salary(
	id serial primary key,
	id_role int not null,
	id_salary int not null,
	foreign key (id_role) --внешний ключ
		references roles(id),
	foreign key(id_salary)
		references salary(id) 
);
select * from roles_salary;
drop table roles_salary;

--заполним таблицы данными

insert into salary(id, monthly_salary)
values (default, 1450),
	   (default, 1650),
	   (default, 2250);
	  
  
insert into roles(role_title)
values ('QA_Engineer_junior'),
	   ('QA_Engineer_middle'),
	   ('QA_Engineer_senior'),
	   ('QA_Engineer_automation_junior'),
	   ('QA_Engineer_automation_middle'),
	   ('QA_Engineer_automation_senior'),
	   ('Java_developer_junior'),
	   ('Java_developer_middle'),
	   ('Java_developer_senior'),
	   ('Python_developer_junior'),
	   ('Python_developer_middle'),
	   ('Python_developer_senior'),
	   ('Manager'),
	   ('Designer'),
	   ('HR');
	   
	  
insert into roles_salary(id_role, id_salary)
values (1, 4),
	   (2, 3),
	   (2, 3),
	   (3, 6),
	   (6, 9),
	   (9, 8),
	   (3, 15);
	  
	  select * from roles;	  

	alter table roles -- добавить столбец
add column parking int;

alter table roles       -- переименовать столбец
rename column parking to taxi;

alter table roles --удалить столбец
drop column taxi;

alter table roles 
alter column parking type varchar(30) using parking::varchar(30);

alter table roles 
alter column parking type int using parking::integer;

update roles
set role_title='HR_Business_partner'
where id = 15;
  




	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  