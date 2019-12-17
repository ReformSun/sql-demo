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


-- 操作符用于在 WHERE 子句中搜索列中的指定模式。


-- 取出表中居住在以N开头的城市中
SELECT * FROM "public"."Persons" WHERE "City" LIKE 'N%'
-- 取出表中居住在以g结尾的城市中
SELECT * FROM "public"."Persons" WHERE "City" LIKE '%g'
-- 取出表中居住在包含Lon的城市中
SELECT * FROM "public"."Persons" WHERE "City" LIKE '%Lon%'


-- 经常使用的通配符
-- %   替代一个或多个字符
-- _   仅替代一个字符
-- [charlist] 字符列中的任何单一字符
--  [^charlist] or [!charlist] 不在字符列中的任何单一字符