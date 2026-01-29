/*
===============================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
===============================================================================
Script Purpose:
    This stored procedure loads data into the 'bronze' schema from external CSV files. 
    It performs the following actions:
    - Truncates the bronze tables before loading data.
    - Uses the `BULK INSERT` command to load data from csv Files to bronze tables.

Parameters:
    None. 
	  This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC bronze.load_bronze;
===============================================================================
*/

-- EXEC bronze.load_bronze;
CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME;
	BEGIN TRY
		SET  @batch_start_time = GETDATE();
		PRINT '================================================';
		PRINT 'LOADING THE BRONZE LAYER';
		PRINT '================================================';

		PRINT '-------------------------------------------------';
		PRINT 'Loading CRM Tables'
		PRINT '-------------------------------------------------';

		SET @start_time = GETDATE();
		PRINT 'Truncating table bronze.crm_cust_info ';
		TRUNCATE TABLE bronze.crm_cust_info;

		PRINT 'Inserting data into table bronze.crm_cust_info ';
		BULK INSERT bronze.crm_cust_info
		FROM 'C:\Users\Obed\Downloads\sql-projects\sql-data-warehouse-project\source_crm\cust_info.CSV'
		WITH 
			(
				FIRSTROW = 2,
				FIELDTERMINATOR = ',',
				TABLOCK
			);
		SET @end_time = GETDATE();
		PRINT 'Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' second(s)';


		SELECT * FROM bronze.crm_cust_info;

		-- LOAD INTO bronze.crm_prd_info

		SET @start_time = GETDATE();
		PRINT 'Truncating table bronze.crm_prd_info ';
		TRUNCATE TABLE bronze.crm_prd_info;
		-- GO

		PRINT 'Inserting data into table bronze.crm_prd_info';
		BULK INSERT bronze.crm_prd_info
		FROM 'C:\Users\Obed\Downloads\sql-projects\sql-data-warehouse-project\source_crm\prd_info.CSV'
		WITH 
			(
				FIRSTROW = 2,
				FIELDTERMINATOR = ',',
				TABLOCK
			);
		SET @end_time = GETDATE();
		PRINT 'Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' second(s)';

		SELECT * FROM bronze.crm_prd_info;

		-- LOAD INTO bronze.crm_sales_detail

		SET @start_time = GETDATE();
		PRINT 'Truncating table bronze.crm_sales_detail:';
		TRUNCATE TABLE bronze.crm_sales_detail;
		-- GO

		PRINT 'Inserting data into table bronze.crm_sales_detail:';
		BULK INSERT bronze.crm_sales_detail
		FROM 'C:\Users\Obed\Downloads\sql-projects\sql-data-warehouse-project\source_crm\sales_details.csv'
		WITH 
			(
				FIRSTROW = 2,
				FIELDTERMINATOR = ',',
				TABLOCK
			);
		SET @end_time = GETDATE();
		PRINT 'Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' second(s)';

		SELECT * FROM bronze.crm_sales_detail;


		PRINT '-------------------------------------------------';
		PRINT 'Loading ERP Tables'
		PRINT '-------------------------------------------------';

		-- LOAD INTO bronze.erp_CUST_AZ12

		SET @start_time = GETDATE();
		PRINT 'Truncating table bronze.erp_CUST_AZ12:';
		TRUNCATE TABLE bronze.erp_CUST_AZ12;
		-- GO

		PRINT 'Inserting data into table bronze.erp_CUST_AZ12:';
		BULK INSERT bronze.erp_CUST_AZ12
		FROM 'C:\Users\Obed\Downloads\sql-projects\sql-data-warehouse-project\source_erp\CUST_AZ12.CSV'
		WITH 
			(
				FIRSTROW = 2,
				FIELDTERMINATOR = ',',
				TABLOCK
			);
		SET @end_time = GETDATE();
		PRINT 'Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' second(s)';


		SELECT * FROM bronze.erp_CUST_AZ12;


		-- LOAD INTO bronze.erp_LOC_A101

		SET @start_time = GETDATE();
		PRINT 'Truncating table bronze.erp_LOC_A101:';
		TRUNCATE TABLE bronze.erp_LOC_A101;
		-- GO

		PRINT 'Inserting data into table bronze.erp_LOC_A101:';
		BULK INSERT bronze.erp_LOC_A101
		FROM 'C:\Users\Obed\Downloads\sql-projects\sql-data-warehouse-project\source_erp\LOC_A101.CSV'
		WITH 
			(
				FIRSTROW = 2,
				FIELDTERMINATOR = ',',
				TABLOCK
			);
		SET @end_time = GETDATE();
		PRINT 'Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' second(s)';


		SELECT * FROM bronze.erp_LOC_A101;

		-- LOAD INTO bronze.erp_PX_CAT_G1V2

		SET @start_time = GETDATE();
		PRINT 'Truncating table bronze.erp_PX_CAT_G1V2:';
		TRUNCATE TABLE bronze.erp_PX_CAT_G1V2;
		-- GO

		PRINT 'Inserting data into table bronze.erp_PX_CAT_G1V2:';
		BULK INSERT bronze.erp_PX_CAT_G1V2
		FROM 'C:\Users\Obed\Downloads\sql-projects\sql-data-warehouse-project\source_erp\PX_CAT_G1V2.CSV'
		WITH 
			(
				FIRSTROW = 2,
				FIELDTERMINATOR = ',',
				TABLOCK
			);
		SET @end_time = GETDATE();
		PRINT 'Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' second(s)';


		SELECT * FROM bronze.erp_PX_CAT_G1V2;
		SET  @batch_end_time = GETDATE();
		PRINT 'Load Duration: ' + CAST(DATEDIFF(second, @batch_start_time, @batch_end_time) AS NVARCHAR) + ' second(s)';
	END TRY
	BEGIN CATCH
		PRINT '================================================';
		PRINT 'Error occured during loading THE bronze layer!';
		PRINT 'Error Message:' + ERROR_MESSAGE();
		PRINT 'Error Message:' + CAST (ERROR_NUMBER() AS NVARCHAR);
		PRINT '================================================';
	END CATCH
END
