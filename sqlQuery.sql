CREATE DATABASE Памятники;

USE Памятники;

CREATE TABLE Количество_фио
(
	Код INT PRIMARY KEY AUTO_INCREMENT,
	Количество INT
);

CREATE TABLE Количество_портретов
(
	Код INT PRIMARY KEY AUTO_INCREMENT,
	Количество INT
);

CREATE TABLE Гравировка
(
	Код INT PRIMARY KEY AUTO_INCREMENT,
	Код_количество_фио INT,
	Код_количество_портретов INT,

	FOREIGN KEY(Код_количество_фио) REFERENCES Количество_фио(Код),
	FOREIGN KEY(Код_количество_портретов) REFERENCES Количество_портретов(Код)
);

CREATE TABLE Полировка
(
	Код INT PRIMARY KEY AUTO_INCREMENT,
	Наименование NVARCHAR(50)
);

CREATE TABLE Размер
(
	Код INT PRIMARY KEY AUTO_INCREMENT,
	Наименование NVARCHAR(50)
);

CREATE TABLE Цвет
(
	Код INT PRIMARY KEY AUTO_INCREMENT,
	Наименование NVARCHAR(50)
);

CREATE TABLE Вид
(
	Код INT PRIMARY KEY AUTO_INCREMENT,
	Наименование NVARCHAR(50)
);

CREATE TABLE Памятник
(
	Код INT PRIMARY KEY AUTO_INCREMENT,
	Наименование NVARCHAR(50),
	Цена FLOAT,
    Фото NVARCHAR(50),
	Код_вида INT,
	Код_цвета INT,
	Код_размера INT,
	Код_полировки INT,
	Код_гравировки INT,

	FOREIGN KEY(Код_вида) REFERENCES Вид(Код),
	FOREIGN KEY(Код_цвета) REFERENCES Цвет(Код),
	FOREIGN KEY(Код_размера) REFERENCES Размер(Код),
	FOREIGN KEY(Код_полировки) REFERENCES Полировка(Код),
	FOREIGN KEY(Код_гравировки) REFERENCES Гравировка(Код)
);

CREATE TABLE Роль
(
	Код INT PRIMARY KEY AUTO_INCREMENT,
	Наименование NVARCHAR(50)
);

CREATE TABLE Заказ
(
	Код INT PRIMARY KEY AUTO_INCREMENT,
	Код_памятник INT,
    
    FOREIGN KEY(Код_памятник) REFERENCES Памятник(Код)
);

CREATE TABLE Пользователь
(
	Код INT PRIMARY KEY AUTO_INCREMENT,
	Фамилия NVARCHAR(50),
	Имя NVARCHAR(50),
	Отчество NVARCHAR(50),
	Код_роли INT,
	Код_заказа INT,

	FOREIGN KEY(Код_роли) REFERENCES Роль(Код),
	FOREIGN KEY(Код_заказа) REFERENCES Заказ(Код)
);
