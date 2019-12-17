-- 测试数据
-- 创建表
DROP TABLE IF EXISTS "public"."Persons";
CREATE SEQUENCE pk_PersonID START 1;
CREATE TABLE "public"."Persons" (
"id" serial,
"LastName" varchar(255),
"FirstName" varchar(255),
"Address" varchar(255),
"City" varchar(20),
"Year" int8,
CONSTRAINT pk_PersonID PRIMARY KEY (id)
);
-- 插入数据
INSERT INTO "public"."Persons" ("LastName","FirstName","Address","City","Year") VALUES ('Adams', 'John', 'Oxford Street', 'London',1970);
INSERT INTO "public"."Persons" ("LastName","FirstName","Address","City","Year") VALUES ('Bush', 'George', 'Fifth Avenue', 'New York',1975);
INSERT INTO "public"."Persons" ("LastName","FirstName","Address","City","Year") VALUES ('Carter', 'Thomas', 'Changan Street', 'Beijing',1980);
INSERT INTO "public"."Persons" ("LastName","FirstName","Address","City","Year") VALUES ('Gates', 'Bill', 'Bill', 'Beijing',1985)




-- TOP 子句用于规定要返回的记录的数目。
-- 对于拥有数千条记录的大型表来说，TOP 子句是非常有用的。
-- 注释：并非所有的数据库系统都支持 TOP 子句。

-- SELECT TOP number|percent column_name(s) FROM table_name
-- postsql mysql 不支持
SELECT TOP 2 * FROM "public"."Persons";
-- 等价 mysql支持
SELECT * FROM "public"."Persons" LIMIT 2 ;
SELECT Salary FROM Employee ORDER BY Salary LIMIT 2