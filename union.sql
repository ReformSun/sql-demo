-- 测试数据
-- 创建表
DROP TABLE IF EXISTS "public"."Employees_China";
DROP SEQUENCE IF EXISTS pk_Employees_China_ID;
CREATE SEQUENCE pk_Employees_China_ID START 1;
CREATE TABLE "public"."Employees_China" (
"E_ID" int8 DEFAULT nextval('pk_Employees_China_ID'::regclass) NOT NULL,
"E_Name" varchar(255)
);
-- 插入数据
INSERT INTO "public"."Employees_China" ("E_Name") VALUES ('Zhang, Hua');
INSERT INTO "public"."Employees_China" ("E_Name") VALUES ('Wang, Wei');
INSERT INTO "public"."Employees_China" ("E_Name") VALUES ('Carter, Thomas');
INSERT INTO "public"."Employees_China" ("E_Name") VALUES ('Yang, Ming');

-- 创建表
DROP TABLE IF EXISTS "public"."Employees_USA";
DROP SEQUENCE IF EXISTS pk_Employees_USA_ID;
CREATE SEQUENCE pk_Employees_USA_ID START 1;
CREATE TABLE "public"."Employees_USA" (
"E_ID" int8 DEFAULT nextval('pk_Employees_USA_ID'::regclass) NOT NULL,
"E_Name" varchar(255)
);
-- 插入数据
INSERT INTO "public"."Employees_USA" ("E_Name") VALUES ('Adams, John');
INSERT INTO "public"."Employees_USA" ("E_Name") VALUES ('Bush, George');
INSERT INTO "public"."Employees_USA" ("E_Name") VALUES ('Carter, Thomas');
INSERT INTO "public"."Employees_USA" ("E_Name") VALUES ('Gates, Bill');


-- UNION 操作符用于合并两个或多个 SELECT 语句的结果集

-- 语法
-- SELECT column_name(s) FROM table_name1
-- UNION
-- SELECT column_name(s) FROM table_name2


-- 列出在中国和美国的所有雇员的名字 其中有名字重复的采用UNION不允许重复
SELECT "E_Name" FROM "public"."Employees_China"
UNION
SELECT "E_Name" FROM "public"."Employees_USA"
-- 列出在中国和美国的所有雇员的名字 其中有名字重复的采用UNION ALL可以允许重复
SELECT "E_Name" FROM "public"."Employees_China"
UNION ALL
SELECT "E_Name" FROM "public"."Employees_USA"