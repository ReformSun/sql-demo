-- 简单的创表语句
CREATE TABLE "public"."Persons" (
"Id_P" varchar(255),
"LastName" int8,
"FirstName" varchar(255),
"Address" varchar(255),
"City" varchar(20)
)

-- 为表增加主键约束  mysql 写法
CREATE TABLE "public"."Persons" (
"Id_P" varchar(255) NOT NULL,
"LastName" int8,
"FirstName" varchar(255),
"Address" varchar(255),
"City" varchar(20),
PRIMARY KEY (Id_P)
)
-- 其他类型的数据库
CREATE TABLE "public"."Persons" (
"Id_P" varchar(255) NOT NULL PRIMARY KEY,
"LastName" int8,
"FirstName" varchar(255),
"Address" varchar(255),
"City" varchar(20)
)

-- 为多个列设置约束
CREATE TABLE "public"."Persons1"
(
Id_P int8 NOT NULL,
LastName varchar(255) NOT NULL,
FirstName varchar(255),
Address varchar(255),
City varchar(255),
CONSTRAINT pk_PersonID PRIMARY KEY (Id_P,LastName)
)


-- 如果表已经存在，为表增加主键
ALTER TABLE Persons
ADD PRIMARY KEY (Id_P)
-- 多列
ALTER TABLE Persons
ADD CONSTRAINT pk_PersonID PRIMARY KEY (Id_P,LastName)

-- 撤销主键
-- mysql
ALTER TABLE Persons
DROP PRIMARY KEY

ALTER TABLE Persons
DROP CONSTRAINT pk_PersonID

