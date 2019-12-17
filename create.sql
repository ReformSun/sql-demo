CREATE TABLE "public"."Persons" (
"LastName" varchar(255),
"FirstName" varchar(255),
"Address" varchar(255),
"City" varchar(20)
)


-- 数据类型
-- 仅容纳整数。在括号内规定数字的最大位数。
-- integer(size)
-- int(size)
-- smallint(size)
-- tinyint(size)

-- 容纳带有小数的数字。
-- decimal(size,d)
-- numeric(size,d)


-- "size" 规定数字的最大位数。"d" 规定小数点右侧的最大位数。

-- 容纳固定长度的字符串（可容纳字母、数字以及特殊字符）。
-- 在括号中规定字符串的长度。
-- char(size)	

-- 容纳可变长度的字符串（可容纳字母、数字以及特殊的字符）。
-- 在括号中规定字符串的最大长度。
-- varchar(size)	

-- 容纳日期。
-- date(yyyymmdd)	


-- Constraints 约束

-- NOT NULL
-- 约束强制列不接受 NULL 值。
-- 约束强制字段始终包含值。这意味着，如果不向字段添加值，就无法插入新记录或者更新记录。
DROP TABLE IF EXISTS "public"."Persons_test";
CREATE TABLE "public"."Persons_test" (
"LastName" varchar(255) NOT NULL,
"FirstName" varchar(255),
"Address" varchar(255),
"City" varchar(20)
);
-- 执行会报错 因为LastName不能为null
INSERT INTO "public"."Persons_test" ("FirstName","Address","City") VALUES ('John', 'Oxford Street', 'London');
-- 不报错
INSERT INTO "public"."Persons_test" ("LastName","FirstName","Address","City") VALUES ('ad','John', 'Oxford Street', 'London');
INSERT INTO "public"."Persons_test" ("LastName","FirstName","Address") VALUES ('ad','John', 'Oxford Street');

-- UNIQUE
-- 约束唯一标识数据库表中的每条记录
-- UNIQUE 和 PRIMARY KEY 约束均为列或列集合提供了唯一性的保证。
-- PRIMARY KEY 拥有自动定义的 UNIQUE 约束。
-- 请注意，每个表可以有多个 UNIQUE 约束，但是每个表只能有一个 PRIMARY KEY 约束
DROP TABLE IF EXISTS "public"."Persons_test";
CREATE TABLE "public"."Persons_test" (
"LastName" varchar(255) NOT NULL UNIQUE,
"FirstName" varchar(255),
"Address" varchar(255),
"City" varchar(20)
);
-- 执行会报错 因为LastName补不能重复
INSERT INTO "public"."Persons_test" ("LastName","FirstName","Address","City") VALUES ('ad','John', 'Oxford Street', 'London');
INSERT INTO "public"."Persons_test" ("LastName","FirstName","Address","City") VALUES ('ad','John', 'Oxford Street', 'London');
-- 执行正确
INSERT INTO "public"."Persons_test" ("LastName","FirstName","Address","City") VALUES ('ad','John', 'Oxford Street', 'London');
INSERT INTO "public"."Persons_test" ("LastName","FirstName","Address","City") VALUES ('ad1','John', 'Oxford Street', 'London');



-- PRIMARY KEY
-- PRIMARY KEY 约束唯一标识数据库表中的每条记录。
-- 主键必须包含唯一的值
-- 主键列不能包含 NULL 值
-- 每个表都应该有一个主键，并且每个表只能有一个主键。
DROP TABLE IF EXISTS "public"."Persons_test";
CREATE TABLE "public"."Persons_test" (
"Id_P" int8 NOT NULL PRIMARY KEY,
"LastName" varchar(255) NOT NULL,
"FirstName" varchar(255),
"Address" varchar(255),
"City" varchar(20)
);

-- MySQL / SQL Server / Oracle / MS Access:
CREATE TABLE Persons
(
Id_P int NOT NULL,
LastName varchar(255) NOT NULL,
FirstName varchar(255),
Address varchar(255),
City varchar(255),
CONSTRAINT pk_PersonID PRIMARY KEY (Id_P,LastName)
)

-- 如果表已经存在，为表添加主键
ALTER TABLE Persons
ADD PRIMARY KEY (Id_P)
-- 为多列添加主键
ALTER TABLE Persons
ADD CONSTRAINT pk_PersonID PRIMARY KEY (Id_P,LastName)




-- FOREIGN KEY
-- 一个表中的 FOREIGN KEY 指向另一个表中的 PRIMARY KEY。
-- 创建表
DROP TABLE IF EXISTS "public"."Persons";
DROP SEQUENCE IF EXISTS pk_PersonID;
CREATE SEQUENCE pk_PersonID START 1;
CREATE TABLE "public"."Persons" (
"Id_P" int8 DEFAULT nextval('pk_PersonID'::regclass) NOT NULL,
"LastName" varchar(255),
"FirstName" varchar(255),
"Address" varchar(255),
"City" varchar(20),
"Year" int8,
CONSTRAINT pk_PersonID PRIMARY KEY ("Id_P")
);
-- 插入数据
INSERT INTO "public"."Persons" ("LastName","FirstName","Address","City","Year") VALUES ('Adams', 'John', 'Oxford Street', 'London',1970);
INSERT INTO "public"."Persons" ("LastName","FirstName","Address","City","Year") VALUES ('Bush', 'George', 'Fifth Avenue', 'New York',1975);
INSERT INTO "public"."Persons" ("LastName","FirstName","Address","City","Year") VALUES ('Carter', 'Thomas', 'Changan Street', 'Beijing',1980);
INSERT INTO "public"."Persons" ("LastName","FirstName","Address","City","Year") VALUES ('Gates', 'Bill', 'Bill', 'Beijing',1985);
-- 创建表
DROP TABLE IF EXISTS "public"."Orders";
DROP SEQUENCE IF EXISTS pk_ordersID;
CREATE SEQUENCE pk_ordersID START 1;
CREATE TABLE "public"."Orders" (
"Id_O" int8 DEFAULT nextval('pk_ordersID'::regclass) NOT NULL,
"OrderNo" int8,
"Id_P" int8,
CONSTRAINT pk_ordersID PRIMARY KEY ("Id_O"),
FOREIGN KEY ("Id_P") REFERENCES "Persons"("Id_P")
);
-- 注意postsql 不支持外键
-- 插入数据
INSERT INTO "public"."Orders" ("OrderNo","Id_P") VALUES (1970,1);
INSERT INTO "public"."Orders" ("OrderNo","Id_P") VALUES (1975,8);
INSERT INTO "public"."Orders" ("OrderNo","Id_P") VALUES (1980,2);
INSERT INTO "public"."Orders" ("OrderNo","Id_P") VALUES (1985,10)

-- 请注意，"Orders" 中的 "Id_P" 列指向 "Persons" 表中的 "Id_P" 列。
-- "Persons" 表中的 "Id_P" 列是 "Persons" 表中的 PRIMARY KEY。
-- "Orders" 表中的 "Id_P" 列是 "Orders" 表中的 FOREIGN KEY。
-- FOREIGN KEY 约束用于预防破坏表之间连接的动作。
-- FOREIGN KEY 约束也能防止非法数据插入外键列，因为它必须是它指向的那个表中的值之一。
-- https://www.w3school.com.cn/sql/sql_foreignkey.asp


-- CHECK
-- 约束用于限制列中的值的范围
-- 如果对单个列定义 CHECK 约束，那么该列只允许特定的值。
-- 如果对一个表定义 CHECK 约束，那么此约束会在特定的列中对值进行限制。
DROP TABLE IF EXISTS "public"."Persons_test";
CREATE TABLE "public"."Persons_test" (
"Id_P" int8 NOT NULL CHECK ("Id_P">0),
"LastName" varchar(255) NOT NULL,
"FirstName" varchar(255),
"Address" varchar(255),
"City" varchar(20)
);
-- 插入失败
INSERT INTO "public"."Persons_test" ("Id_P","LastName","FirstName","Address","City") VALUES (0,'ad','John', 'Oxford Street', 'London');
-- 插入成功
INSERT INTO "public"."Persons_test" ("Id_P","LastName","FirstName","Address","City") VALUES (1,'ad','John', 'Oxford Street', 'London');



-- DEFAULT
-- DEFAULT 约束用于向列中插入默认值。
-- 如果没有规定其他的值，那么会将默认值添加到所有的新记录。
DROP TABLE IF EXISTS "public"."Persons_test";
CREATE TABLE "public"."Persons_test" (
"Id_P" int8 NOT NULL,
"LastName" varchar(255) NOT NULL,
"FirstName" varchar(255),
"Address" varchar(255),
"City" varchar(20) DEFAULT '北京'
);
INSERT INTO "public"."Persons_test" ("Id_P","LastName","FirstName","Address") VALUES (0,'ad','John', 'Oxford Street');



