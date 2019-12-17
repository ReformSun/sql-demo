-- CREATE INDEX
-- CREATE INDEX 语句用于在表中创建索引。
-- 在不读取整个表的情况下，索引使数据库应用程序可以更快地查找数据。
-- 您可以在表中创建索引，以便更加快速高效地查询数据。
-- 用户无法看到索引，它们只能被用来加速搜索/查询。
-- 注释：更新一个包含索引的表需要比更新一个没有索引的表更多的时间，
-- 这是由于索引本身也需要更新。因此，理想的做法是仅仅在常常被搜索的列（以及表）上面创建索引。

-- 如果您希望以降序索引某个列中的值，您可以在列名称之后添加保留字 DESC：
CREATE INDEX "PersonIndex"
ON "public"."Persons" ("LastName" DESC) 

CREATE INDEX "PersonIndex"
ON "public"."Persons" ("LastName","FirstName") 


-- 删除索引
-- mysql
ALTER TABLE "public"."Persons" DROP INDEX "PersonIndex"
