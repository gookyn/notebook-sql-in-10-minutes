-- ------------------------------
-- 05. 高级数据过滤
-- ------------------------------

-- 操作符：用来联结或改变 WHERE 子句中的子句的关键字，也称为逻辑操作符

-- 5.1 组合 WHERE 子句

-- 5.1.1 AND 操作符
SELECT prod_id, prod_price, prod_name, vend_id
FROM Products
WHERE vend_id = 'DLL01' AND prod_price <= 4;

-- 5.1.2 OR 操作符
SELECT prod_name, prod_price, vend_id
FROM Products
WHERE vend_id = 'DLL01' OR vend_id = 'BRS01';

-- 5.1.3 求值顺序
SELECT prod_name, prod_price, vend_id
FROM Products
WHERE (vend_id = 'DLL01' OR vend_id = 'BRS01') AND prod_price >= 10;

-- 注意：SQL 会优先处理 AND，因此要用 () 将 OR 提高优先级

-- 5.2 IN 操作符
-- 用来指定条件范围
SELECT prod_name, prod_price, vend_id
FROM Products
WHERE vend_id IN ('DLL01', 'BRS01')
ORDER BY prod_name;

/*
 * 优点
 * 在很多合法选项时，IN 操作符更清楚、直观
 * 在与其他 AND 和 OR 操作符组合使用时，求值顺序更容易管理
 * IN 操作符一般比一组 OR 操作符执行更快
 * IN 的最大优点是可以包含其他 SELECT 语句
*/

-- 5.3 NOT 操作符
-- 用来否定其后条件
SELECT prod_name, vend_id
FROM Products
WHERE NOT vend_id = 'DLL01'
ORDER BY prod_name;