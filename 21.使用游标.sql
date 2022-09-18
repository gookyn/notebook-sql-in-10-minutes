-- ------------------------------
-- 21. 使用游标
-- ------------------------------

/*
 * 21.1 游标
 * 
 * 结果集：
 * SQL 查询所检索出的结果
 *
 * 游标：
 * 一个存储在 DBMS 服务器上的数据库查询
 * 不是一条 SELECT 语句，而是该语句检索的结果集
 *
 * 存储游标之后，应用程序可以根据需要滚动或浏览其中的数据
*/

/*
 * 21.2 使用游标
 * 
 * 步骤：
 * 声明游标
 * 打开游标
 * 对于填有数据的游标，根据需要取出（检索）各行
 * 结束使用时，关闭游标、释放游标
*/

-- 21.2.1 创建游标
DECLARE CustCursor CURSOR
FOR
SELECT * FROM Customers
WHERE cust_email IS NULL;

-- 21.2.2 使用游标
OPEN CURSOR CustCursor;

-- 用 FETCH 语句访问游标数据
-- FETCH 指出要检索哪些行，从何处检索它们以及将它们放于何处
DECLARE TYPE CustCursor IS REF CURSOR
	RETURN Customers%ROWTYPE;
DECLARE CustRecord Customers%ROWTYPE
BEGIN
	OPEN CustCursor;
	FETCH CustCursor INTO CustRecord;
	CLOSE CustCursor;
END;

-- 21.2.3 关闭游标
CLOSE CustCursor;
