-- 创建自定义函数的sql
create function myfun3(ia int, ib int) returns int
begin
    return ia + ib;
end

-- create function 函数名([参数列表]) returns 数据类型
-- begin
--  sql语句;
--  return 值;
-- end;


-- delimiter 新符号
-- create function 函数名(形参) returns 返回值类型
-- begin
--     函数体
--     return 返回值数据   //数据必须与结构中定义的返回值类型一致
-- end
-- 新符号           //用于结束语句
-- delimiter ;     //将结束符重新改为 ;



-- 查看自定义函数
show function status [like 'pattern'];
show create function 函数名;

-- 删除自定义函数
drop function 函数名;


-- 使用全局变量
create function my_sum(x int) returns int
begin
    set @i = 1;
    set @sum = 0;
    while @i <= x do
        set @sum = @sum + @i;
        set @i = @i + 1;
    end while;
    return @sum;
end


-- 使用局部变量
-- declare 断言设置变量
create function my_sum2(x int) returns int
begin
    declare i int default 1;
    declare sum int default 0;
    sumwhile:while i <= x do
        if i % 5 = 0 then
            set i = i + 1;
            iterate sumwhile;
        end if;
        set sum = sum + i;
        set i = i + 1;
    end while;
    return sum;
end