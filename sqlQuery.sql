CREATE DATABASE Памятники
GO

USE Памятники
GO

CREATE TABLE Памятник
(
	Код INT PRIMARY KEY IDENTITY(1,1),
	Наименование NVARCHAR(50),
	Код_вида INT,
	Код_цвета INT,
	Код_размера INT,
	Код_полировки INT,
	Код_гравировки INT
)

CREATE TABLE Роль
(
	Код INT PRIMARY KEY IDENTITY(1,1),
	Наименование NVARCHAR(50)
)

CREATE TABLE Пользователь
(
	Код INT PRIMARY KEY IDENTITY(1,1),
	Фамилия NVARCHAR(50),
	Имя NVARCHAR(50),
	Отчество NVARCHAR(50),
	Код_роли INT,
	Код_заказа INT
)
