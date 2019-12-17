-- ALTER
-- ALTER TABLE 语句用于在已有的表中添加、修改或删除列。
-- 测试表
DROP TABLE IF EXISTS "public"."Persons_test";
CREATE TABLE "public"."Persons_test" (
"Id_P" int8 NOT NULL,
"LastName" varchar(255) NOT NULL,
"FirstName" varchar(255),
"Address" varchar(255),
"City" varchar(20) DEFAULT '北京'
);

-- 在已有的表中添加Birthday列
ALTER TABLE "public"."Persons_test"
ADD "Birthday" date

-- 改变列的数据类型
ALTER TABLE "public"."Persons_test"
ALTER COLUMN "Birthday" varchar(20)


ALTER TABLE "public"."Persons_test"
DROP COLUMN "Birthday"