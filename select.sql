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

-- 获取全部内容 * 代表了打印所有列
SELECT * FROM "public"."Persons"
-- 获取部分内容
SELECT 'LastName','FirstName' FROM "public"."Persons"



-- DISTINCT 去重语句的学习 postsql
SELECT DISTINCT "Company" FROM "public"."Orders"


-- where 有条件的从表中获取数据
-- SELECT 列名称 FROM 表名称 WHERE 列 运算符 值
-- BETWEEN 在某个范围内 LIKE 搜索某种模式
-- 注意：使用单引号引用文本值

SELECT * FROM "public"."Persons" WHERE "City"='Beijing'
SELECT * FROM "public"."Persons" WHERE "Year"=1970
SELECT * FROM "public"."Persons" WHERE "Year">1970



-- AND 和 OR 运算符


-- ORDER BY 语句用于根据指定的列对结果集进行排序。
-- ORDER BY 语句默认按照升序对记录进行排序。
-- 如果您希望按照降序对记录进行排序，可以使用 DESC 关键字。

-- 以字母顺序显示公司名称
SELECT "Company", "OrderNumber" FROM "public"."Orders" ORDER BY "Company"

-- 首先以字母顺序显示公司名称，相同公司名称的以数字顺序显示
SELECT "Company", "OrderNumber" FROM "public"."Orders" ORDER BY "Company", "OrderNumber"

-- 以逆字母顺序显示公司名称
SELECT "Company", "OrderNumber" FROM "public"."Orders" ORDER BY "Company" DESC

-- 以逆字母顺序显示公司名称，并以逆数字顺序显示顺序号
SELECT "Company", "OrderNumber" FROM "public"."Orders" ORDER BY "Company" DESC, "OrderNumber" DESC




-- SELECT INTO 语句从一个表中选取数据，然后把数据插入另一个表中
-- 语句常用于创建表的备份复件或者用于对记录进行存档

-- 语法
-- 所有的列插入新表：
-- SELECT *
-- INTO new_table_name [IN externaldatabase] 
-- FROM old_tablename

-- 把希望的列插入新表：
-- SELECT column_name(s)
-- INTO new_table_name [IN externaldatabase] 
-- FROM old_tablename

-- 如果我们希望拷贝某些域，可以在 SELECT 语句后列出这些域：
-- SELECT LastName,FirstName
-- INTO Persons_backup
-- FROM Persons

-- 提出居住在北京的人信息，创建一个带有两列"LastName","FirstName"的备份表
SELECT "LastName","FirstName"
INTO "public"."Persons_backup"
FROM "public"."Persons"
WHERE "City"='Beijing'

-- 下面的例子会创建一个名为 "Persons_Order_Backup" 的新表，其中包含了从 Persons 和 Orders 两个表中取得的信息：
SELECT "Persons"."LastName","Orders"."OrderNo"
INTO "public"."Persons_Order_Backup"
FROM "public"."Persons"
INNER JOIN "public"."Orders"
ON "Persons"."Id_P"="Orders"."Id_P"




-- IN 
-- 操作符允许我们在 WHERE 子句中规定多个值。

-- 获取表中LastName字段值等于('Adams','Carter')中的值的行，
SELECT * FROM "public"."Persons"
WHERE "LastName" IN ('Adams','Carter')


-- BETWEEN
-- 操作符在 WHERE 子句中使用，作用是选取介于两个值之间的数据范围。
SELECT * FROM "public"."Persons"
WHERE "LastName"
BETWEEN 'Adams' AND 'Carter'

-- 重要事项：不同的数据库对 BETWEEN...AND 操作符的处理方式是有差异的。某些数据库会列出介于 "Adams" 和 "Carter" 
-- 之间的人，但不包括 "Adams" 和 "Carter" ；某些数据库会列出介于 "Adams" 和 "Carter" 之间并包括 "Adams" 和 
-- "Carter" 的人；而另一些数据库会列出介于 "Adams" 和 "Carter" 之间的人，包括 "Adams" ，但不包括 "Carter" 。

SELECT * FROM "public"."Persons"
WHERE "LastName"
NOT BETWEEN 'Adams' AND 'Carter'