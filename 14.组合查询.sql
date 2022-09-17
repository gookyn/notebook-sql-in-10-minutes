-- ------------------------------
-- 14. 组合查询
-- ------------------------------

/*
 * 14.1 组合查询
 * 
 * SQL 允许执行多个查询（多条 SELECT 语句），并将结果作为一个查询结果集返回
 *
 * 主要有两种情况需要组合查询：
 * 1、在一个查询中从不同的表返回结构数据
 * 2、对一个表执行多个查询，按一个查询返回数据
*/

-- 14.2 创建组合查询

-- 14.2.1 使用 UNION
SELECT cust_name, cust_contact, cust_email
FROM Customers
WHERE cust_state IN ('IL', 'IN', 'MI')
UNION
SELECT cust_name, cust_contact, cust_email
FROM Customers
WHERE cust_name = 'Fun4All';

/*
 * 14.2.2 UNION 规则
 * 必须由两条或两条以上的 SELECT 语句组成，语句间用 UNION 分隔
 * 每个查询必须包含相同的列、表达式或聚集函数（顺序无关）
 * 列数据类型必须兼容
*/

-- 14.2.3 包含或取消重复的行

-- UNION 默认会去除重复行

-- 如果期望返回所有的匹配行，需要使用 UNION ALL
SELECT cust_name, cust_contact, cust_email
FROM Customers
WHERE cust_state IN ('IL', 'IN', 'MI')
UNION ALL
SELECT cust_name, cust_contact, cust_email
FROM Customers
WHERE cust_name = 'Fun4All';

-- 14.2.4 对组合查询结果排序
-- 在 UNION 组合查询时，只能使用一条 ORDER BY 语句，必须位于最后一条 SELECT 语句之后
SELECT cust_name, cust_contact, cust_email
FROM Customers
WHERE cust_state IN ('IL', 'IN', 'MI')
UNION
SELECT cust_name, cust_contact, cust_email
FROM Customers
WHERE cust_name = 'Fun4All'
ORDER BY cust_name, cust_contact;
