-- ------------------------------
-- 20. 管理事务处理
-- ------------------------------

/*
 * 20.1 事务处理
 * 
 * 确保成批的 SQL 操作要么完全执行，要么完全不执行，维护数据库的完整性
 *
 * 术语解释：
 * 事务：一组 SQL 语句
 * 回退：撤销指定 SQL 语句的过程
 * 提交：将未存储的 SQL 语句结果写入数据库表
 * 保留点：事务处理中设置的临时占位符，可以对它发布回退
 *
 * 可以回退哪些语句：
 * 事务处理用来管理 INSERT、UPDATE、DELETE 语句
 * 不能回退 SELECT 语句（没有必要）、不能回退 CREATE、DROP
*/

-- 20.2 控制事务处理
-- 管理事务的关键在于将 SQL 语句组分解为逻辑块，并明确规定数据应该何时回退、何时不应该回退

-- 20.2.1 使用 ROLLBACK
-- 回退（撤销）SQL 语句

-- 20.2.2 使用 COMMIT
-- 一般的 SQL 语句都是针对数据库表直接执行和编写 -- 隐式提交，即提交（或保存）操作是自动进行的
-- 在事务处理块中，提交不会隐式进行，需要明确提交

-- SQL Server
BEGIN TRANSACTION
DELETE OrderItems WHERE order_num = 12345
DELETE Orders WHERE order_num = 12345
COMMIT TRANSACTION;

-- 20.2.3 使用保留点
-- 要支持回退部分事务，必须在事务处理块中的何时位置放置占位符 -- 保留点
SAVEPOINT delete1;

ROLLBACK TO delete1;

-- 保留点越多越好
