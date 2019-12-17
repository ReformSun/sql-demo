-- DELETE 语句用于删除表中的行。
-- DELETE FROM 表名称 WHERE 列名称 = 值

DELETE FROM "public"."Persons" WHERE "LastName" = 'Gates' 

-- 可以在不删除表的情况下删除所有行
-- DELETE FROM table_name 或者 DELETE * FROM table_name