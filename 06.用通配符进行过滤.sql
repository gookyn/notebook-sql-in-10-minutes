-- ------------------------------
-- 06.用通配符进行过滤
-- ------------------------------

/*
 * 通配符：用来匹配值的一部分特殊字符
 * 通配符搜索只能用于文本字段（字符串），非文本数据类型不能使用
 *
 * 搜索模式：由字面值、通配值或两者组合构成的搜索条件
*/

-- 6.1 LIKE 操作符

-- 6.1.1 % 通配符
-- 表示任何字符出现任意次数（包括 0 次）
SELECT prod_id, prod_name
FROM Products
WHERE prod_name LIKE 'Fish%'; -- 找出所有以 Fish 开头的产品

-- 根据 DBMS 的不同及其配置，可以区分大小写

-- 通配符可以在搜索模式中的任意位置使用，并且可以使用多个通配符
SELECT prod_id, prod_name
FROM Products
WHERE prod_name LIKE '%bean bag%';

SELECT prod_id, prod_name
FROM Products
WHERE prod_name LIKE 'F%y'; -- 也可以在字符串中间

-- 注意：% 不会匹配 NULL

-- 6.1.2 _ 通配符
-- 表示只匹配单个字符
SELECT prod_id, prod_name
FROM Products
WHERE prod_name LIKE '__ inch teddy bear'; -- 两个字符

-- 6.1.3 [] 通配符
-- 表示指定一个字符集，必须匹配指定位置（通配符的位置）的一个字符，只匹配一个字符
-- 注意：不是所有 DBMS 都支持

/*
 * 6.2 使用通配符的技巧
 *
 * 通配符搜索一般比前面的其他搜索要耗费更长时间
 * 
 * 1、不要过度使用，尽可能使用其他能达到目的的操作符
 * 2、在确实需要使用时，尽量不要用在搜索模式的开始处，会导致搜索很慢
 * 3、仔细注意通配符的位置
*/
