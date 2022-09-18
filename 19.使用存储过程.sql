-- ------------------------------
-- 19. 使用存储过程
-- ------------------------------

-- 19.1 存储过程
-- 为以后使用而保存的一条或多条 SQL 语句

/*
* 19.2 为什么要使用存储过程
*
* 1、通过把处理封装在一个易用的单元中，简化复杂的操作
* 2、由于不要求反复建立一些处理步骤，因而保证数据的一致性
* 3、防止错误
* 4、简化对变动的管理
* 5、安全性
* 6、提高性能
* 7、存在一些还能用在单个请求中的 SQL 元素和特性，可以更强、更灵活编码
*/

-- 19.3 执行存储过程
-- 需要先通过后续步骤创建（不同 DBMS 实现方式不同）

EXECUTE AddNewProduct(
	'JTS01',
	'Stuffed Eiffel Tower',
	6.49,
	'Plush stuffed toy with the text La Tour Eiffel in red white and blue'
)

-- 19.4 创建存储过程
-- Oracle
CREATE PROCEDURE MailingListCount (
	ListCount OUT INTEGER
)
IS
v_rows INTEGER;
BEGIN
	SELECT COUNT(*) INTO v_rows
	FROM Customers
	WHERE NOT cust_email IS NULL;
	ListCount := v_rows;
END;

-- 执行存储过程
var ReturnValue NUMBER
EXEC MailingListCount(:ReturnValue);
SELECT ReturnValue;
