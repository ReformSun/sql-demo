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
"Year" int8
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
CONSTRAINT pk_ordersID PRIMARY KEY ("Id_O")
);
-- 插入数据
INSERT INTO "public"."Orders" ("OrderNo","Id_P") VALUES (1970,1);
INSERT INTO "public"."Orders" ("OrderNo","Id_P") VALUES (1975,8);
INSERT INTO "public"."Orders" ("OrderNo","Id_P") VALUES (1980,2);
INSERT INTO "public"."Orders" ("OrderNo","Id_P") VALUES (1985,10)


CREATE VIEW [Current Product List] AS
SELECT "LastName","FirstName"
FROM "public"."Persons"