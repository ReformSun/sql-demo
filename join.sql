-- 测试数据
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


-- 我们可以通过引用两个表的方式，从两个表中获取数据：
SELECT "Persons"."LastName", "Persons"."FirstName", "Orders"."OrderNo"
FROM "public"."Persons", "public"."Orders"
WHERE "Persons"."Id_P" = "Orders"."Id_P" 

-- 上面的数据获取方式我们还可以通过使用join关键字实现
SELECT "Persons"."LastName", "Persons"."FirstName", "Orders"."OrderNo"
FROM "public"."Persons"
INNER JOIN "public"."Orders"
ON "Persons"."Id_P" = "Orders"."Id_P"
ORDER BY "Persons"."LastName"


-- Join 有多种形式
-- JOIN: 如果表中有至少一个匹配，则返回行
-- 如果两张表没有匹配就不返回任何值，如果有就返回所有行

-- LEFT JOIN: 即使右表中没有匹配，也从左表返回所有的行
SELECT "Persons"."LastName", "Persons"."FirstName", "Orders"."OrderNo"
FROM "public"."Persons"
LEFT JOIN "public"."Orders"
ON "Persons"."Id_P" = "Orders"."Id_P"
ORDER BY "Persons"."LastName"
-- 上面的sql语句中Persons表代表的是左表，Orders代表的右表
-- LEFT JOIN的使用表示右表中如果有匹配的项OrderNo就有值，如果没有匹配就为null，但是左表会返回所有行


-- RIGHT JOIN: 即使左表中没有匹配，也从右表返回所有的行
SELECT "Persons"."LastName", "Persons"."FirstName", "Orders"."OrderNo"
FROM "public"."Persons"
RIGHT JOIN "public"."Orders"
ON "Persons"."Id_P" = "Orders"."Id_P"
ORDER BY "Persons"."LastName"
-- 和上面的逻辑刚好相反

-- FULL JOIN: 只要其中一个表中存在匹配，就返回行
SELECT "Persons"."LastName", "Persons"."FirstName", "Orders"."OrderNo"
FROM "public"."Persons"
FULL JOIN "public"."Orders"
ON "Persons"."Id_P" = "Orders"."Id_P"
ORDER BY "Persons"."LastName"

-- 如果左边表和右边表有匹配就返回行，但是没有匹配的左边表和右边表也要返回
-- 有匹配
-- Adams	John	1970
-- Bush	    George	1980
-- Carter	Thomas  null	
-- Gates	Bill	null
--  null    null    1985
--  null    null    1975
-- 无匹配
-- Adams	John	null
-- Bush	    George	null
-- Carter	Thomas  null	
-- Gates	Bill	null
--  null    null    1985
--  null    null    1975
--  null    null    1970
--  null    null    1980