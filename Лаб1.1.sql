CREATE SCHEMA `Магазин` ;

  CREATE TABLE `магазин`.`Продукты` (
  `Название` VARCHAR(45) NOT NULL,
  `Цена` INT NOT NULL,
  `Наличие` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Название`));
  
  CREATE TABLE `магазин`.`заказы` (
  `id` INT NOT NULL,
  `Количество` INT NOT NULL,
  `Дата заказа` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`));

Use Магазин;
INSERT INTO `магазин`.`продукты` (`Название`, `Цена`, `Наличие`) VALUES ('Молоко', '25', 'есть');
INSERT INTO `магазин`.`продукты` (`Название`, `Цена`, `Наличие`) VALUES ('Сыр', '30', 'есть');
INSERT INTO `магазин`.`продукты` (`Название`, `Цена`, `Наличие`) VALUES ('Колбаса', '50', 'нет');

Use Магазин;
INSERT INTO `магазин`.`заказы` (`id`, `Количество`, `Дата заказа`) VALUES ('1', '1', '25.09.23');
INSERT INTO `магазин`.`заказы` (`id`, `Количество`, `Дата заказа`) VALUES ('2', '2', '26.09.23');
INSERT INTO `магазин`.`заказы` (`id`, `Количество`, `Дата заказа`) VALUES ('3', '1', '26.09.23');
Select * From Продукты WHERE(`Цена`< 50);

Select * From Заказы WHERE(`Дата заказа` < '26.09.23');

UPDATE заказы
SET Количество= 3
WHERE id =1;
