-- ------------------------------
-- 08. 使用函数处理数据
-- ------------------------------

-- 每个 DBMS 都有特定的函数，而且差异比较大

-- 8.2 使用函数

-- SQL 函数不区分大小写 

/*
 * 8.2.1 文本处理函数
 *
 * 常用的文本处理函数
 *
 * LEFT() 返回字符串左边的字符
 * RIGHT() 返回字符串右边的字符
 * LOWER() 将字符串转换为小写
 * UPPER() 将字符串转换为大写
 * LTRIM() 去掉字符串左边的空格
 * RTRIM() 去掉字符串右边的空格
 * LENGTH() 返回字符串的长度
 * SUBSTR() 或 SUBSTRING() 提取字符串的组成部分
 * SOUNDEX() 返回字符串的 SOUNDEX 值（将任何文本串转为描述其语音表示的字母数字模式算法）
*/

-- SOUNDEX(str)
SELECT cust_name, cust_contact
FROM Customers
WHERE SOUNDEX(cust_contact) = SOUNDEX('Michael Green');

-- 8.2.2 日期和时间处理函数
-- 每个 DBMS 都有自己特殊的形式

-- 8.2.3 数值处理函数
-- 仅处理数值数据，一般主要用于代数、三角或几何运算

-- 挑战题

-- 1 登录名为 联系人字段前两字符 + 所在城市前三个字符，全大写
SELECT cust_id, cust_name, UPPER(CONCAT(SUBSTR(cust_contact, 1, 2), SUBSTR(cust_city, 1, 3))) AS user_login
FROM Customers;

SELECT cust_id, cust_name, UPPER(CONCAT(LEFT(cust_contact, 2), LEFT(cust_city, 3))) AS user_login
FROM Customers;

-- 2 2020年1月份的订单
SELECT order_num, order_date
FROM Orders
WHERE YEAR(order_date) = 2020 AND MONTH(order_date) = 1 
ORDER BY order_date;
