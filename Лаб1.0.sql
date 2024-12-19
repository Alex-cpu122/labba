CREATE SCHEMA `Контакты` ;

  CREATE TABLE `контакты`.`люди` (
  `Имя` VARCHAR(45) NOT NULL,
  `Фамилия` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Имя`));
  
Use контакты;

INSERT INTO `контакты`.`люди` (`Имя`, `Фамилия`, `Email`) VALUES ('Андрей', 'Кошкин', 'Andeycat@bk.ru');
INSERT INTO `контакты`.`люди` (`Имя`, `Фамилия`, `Email`) VALUES ('Антон', 'Теремов', 'IamHatethecat@gmail.com');
INSERT INTO `контакты`.`люди` (`Имя`, `Фамилия`, `Email`) VALUES ('Валера', 'Кромовен', 'NewEmail@bk.ru');

Select Имя, Фамилия From люди;
Select * From люди;

UPDATE люди
SET Email="NewEmail@bk.ru"
WHERE Имя="Валера";

Delete from люди
WHERE Имя="Антон";

Select * From люди;