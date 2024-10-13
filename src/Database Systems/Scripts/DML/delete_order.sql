-- DML Transactions
DECLARE @order_to_delete VARCHAR(36);
SET @order_to_delete = '2a2c0e97-c9af-4519-9b92-0969731d9c61';

-- BEFORE TRANSACTION
SELECT * FROM dbo.[order] WHERE order_id = @order_to_delete;
SELECT * FROM dbo.[order_line_item] WHERE order_id = @order_to_delete;

BEGIN TRANSACTION
	DELETE FROM	[order_line_item]
	WHERE order_id = @order_to_delete;

	DELETE FROM dbo.[order]
	WHERE order_id = @order_to_delete;
COMMIT

SELECT * FROM dbo.[order] WHERE order_id = @order_to_delete;
SELECT * FROM dbo.[order_line_item] WHERE order_id = @order_to_delete;