
-- 创建表
DROP TABLE IF EXISTS "public"."Persons";
CREATE TABLE "public"."Persons" (
"LastName" varchar(255),
"FirstName" varchar(255),
"Address" varchar(255),
"City" varchar(20)
);
-- 插入数据
INSERT INTO "public"."Persons" VALUES ('Adams', 'John', 'Oxford Street', 'London');
INSERT INTO "public"."Persons" VALUES ('Bush', 'George', 'Fifth Avenue', 'New York');
INSERT INTO "public"."Persons" VALUES ('Carter', 'Thomas', 'Changan Street', 'Beijing')


-- 创建表
DROP TABLE IF EXISTS "public"."Persons";
CREATE TABLE "public"."Persons" (
"LastName" varchar(255),
"FirstName" varchar(255),
"Address" varchar(255),
"City" varchar(20),
"Year" int8
);
-- 插入数据
INSERT INTO "public"."Persons" VALUES ('Adams', 'John', 'Oxford Street', 'London',1970);
INSERT INTO "public"."Persons" VALUES ('Bush', 'George', 'Fifth Avenue', 'New York',1975);
INSERT INTO "public"."Persons" VALUES ('Carter', 'Thomas', 'Changan Street', 'Beijing',1980);
INSERT INTO "public"."Persons" VALUES ('Gates', 'Bill', 'Bill', 'Beijing',1985)

-- 创建表
DROP TABLE IF EXISTS "public"."Orders";
CREATE TABLE "public"."Orders" (
"Company" varchar(255),
"OrderNumber" int8
);
-- 插入数据
INSERT INTO "public"."Orders" VALUES ('IBM', 3532);
INSERT INTO "public"."Orders" VALUES ('W3School', 2356);
INSERT INTO "public"."Orders" VALUES ('Apple', 4698);
INSERT INTO "public"."Orders" VALUES ('W3School', 6953)

-- mysql
-- 创建表
DROP TABLE IF EXISTS Employee;
CREATE TABLE Employee (
E_id int NOT NULL AUTO_INCREMENT,
Salary int,
PRIMARY KEY (E_id)
);
-- 插入数据
INSERT INTO Employee (Salary) VALUES (1000);
INSERT INTO Employee (Salary) VALUES (1003);
INSERT INTO Employee (Salary) VALUES (1002);
INSERT INTO Employee (Salary) VALUES (1005);
INSERT INTO Employee (Salary) VALUES (1009);
INSERT INTO Employee (Salary) VALUES (1008);
