CREATE SCHEMA `Магаз` ;

  CREATE TABLE `Магаз`.`пользователи` (
  `имя` VARCHAR(45) ,
  `Email` VARCHAR(45) unique,
  `телефон` VARCHAR(45) unique,
  `дата_регистрации` date NOT NULL,
  `количество_сделаных_заказов` VARCHAR(45) ,
  `ссылка_на_пользователя` VARCHAR(45),
  PRIMARY KEY (`ссылка_на_пользователя`));
  
  CREATE TABLE `Магаз`.`заказы` (
  `ссылка_на_пользователя` VARCHAR(45),
  `сумма` VARCHAR(100),
  `дата` date NOT NULL,
  `статус` VARCHAR(45) default 'В работе',
  `id_заказа` VARCHAR(100),
  FOREIGN KEY (ссылка_на_пользователя)  REFERENCES пользователи (ссылка_на_пользователя),
  PRIMARY KEY (`id_заказа`));

Use Магаз;
INSERT INTO `Магаз`.`пользователи` (`имя`,`Email`,`телефон`,`дата_регистрации`, `количество_сделаных_заказов`, `ссылка_на_пользователя`) VALUES ('Молоконов', '1', '89114062717', '2023-09-23', '3', '1');
INSERT INTO `Магаз`.`пользователи` (`имя`, `Email`, `телефон`, `дата_регистрации`, `количество_сделаных_заказов`, `ссылка_на_пользователя`) VALUES ('Крошев', '2', '89226354589', '2021-04-23', '1', '2');
INSERT INTO `Магаз`.`пользователи` (`имя`, `Email`, `телефон`, `дата_регистрации`, `количество_сделаных_заказов`, `ссылка_на_пользователя`) VALUES ('НОвинов', '3', '89158887759', '2019-12-07', "0", '3');

Use Магаз;
INSERT INTO `Магаз`.`заказы` (`ссылка_на_пользователя`,`сумма`,`дата`,`статус`, `id_заказа`) VALUES ('1', '50', '2024-09-17', "готово", '1');
INSERT INTO `Магаз`.`заказы` (`ссылка_на_пользователя`,`сумма`,`дата`,`статус`,`id_заказа`) VALUES ('2', '230', '2023-02-13', "отменен", '3');
INSERT INTO `Магаз`.`заказы` (`ссылка_на_пользователя`,`сумма`,`дата`,`статус`, `id_заказа`) VALUES ('1', '899', '2024-08-25', "на сортерофке", '2');


Select * From пользователи 
left join заказы on пользователи.ссылка_на_пользователя=заказы.ссылка_на_пользователя
WHERE(`количество_сделаных_заказов` >= '1')
order by 'дата' DESC;

Select * From пользователи WHERE(`количество_сделаных_заказов` = '0') order by 'дата_регистрации' asc;

select пользователи.имя, пользователи.количество_сделаных_заказов, sum(заказы.`сумма`) from пользователи
left join заказы on пользователи.ссылка_на_пользователя=заказы.ссылка_на_пользователя
where пользователи.количество_сделаных_заказов > 0
group by пользователи.имя, пользователи.количество_сделаных_заказов, пользователи.телефон;

select * from пользователи left join заказы on пользователи.ссылка_на_пользователя=заказы.id_заказа order by заказы.дата, заказы.статус DESC;

SELECT пользователи.имя, пользователи.ссылка_на_пользователя, SUM(заказы.сумма)
FROM пользователи
JOIN заказы ON пользователи.ссылка_на_пользователя=заказы.ссылка_на_пользователя
GROUP BY пользователи.ссылка_на_пользователя, пользователи.имя
HAVING SUM(заказы.сумма) > 1000;


select * from пользователи 
left join заказы on пользователи.ссылка_на_пользователя=заказы.ссылка_на_пользователя
WHERE(заказы.статус = 'отменен');

SELECT пользователи.имя, пользователи.ссылка_на_пользователя
FROM пользователи
JOIN заказы ON пользователи.ссылка_на_пользователя = заказы.ссылка_на_пользователя
GROUP BY пользователи.имя, пользователи.ссылка_на_пользователя
HAVING MIN(заказы.сумма) > 500;


select * from пользователи
join заказы on пользователи.ссылка_на_пользователя=заказы.ссылка_на_пользователя
WHERE заказы.дата BETWEEN пользователи.дата_регистрации AND DATE_ADD(пользователи.дата_регистрации, INTERVAL 1 MONTH);

SELECT *
FROM пользователи
LEFT JOIN заказы ON пользователи.ссылка_на_пользователя = заказы.ссылка_на_пользователя AND заказы.дата >= NOW() - INTERVAL 6 MONTH
WHERE пользователи.дата_регистрации < NOW() - INTERVAL 1 YEAR
AND пользователи.количество_сделаных_заказов IS NULL;

SELECT DISTINCT *
FROM пользователи
JOIN заказы ON пользователи.ссылка_на_пользователя=заказы.ссылка_на_пользователя
WHERE MONTH(заказы.дата) = MONTH(CURRENT_DATE())
  AND YEAR(заказы.дата) = YEAR(CURRENT_DATE());

drop schema магаз