-- Preamble 
-- Purpose: Pre-processes the raw dataset and processes the analysis dataset.
-- Author: Zhengjie Zhu
-- Date: 14 November 2024
-- Contact: zhuzhengjie2020@gmail.com
-- License: MIT
-- Pre-requisites: the raw dataset (.sqlite) has been retrieved from https://jacobfilipp.com/hammer/


-- Combine the raw and product tables 
CREATE TABLE merged_data AS
SELECT
    p.id AS product_id,
    p.vendor,
	CAST(r.current_price AS NUMERIC) AS current_price,
    CAST(r.old_price AS NUMERIC) AS old_price
FROM
    product p
JOIN
    raw r
ON
    p.id = r.product_id;

-- Creates analysis dataset
CREATE TABLE analysis_data AS
SELECT 
    vendor,
    current_price,
    old_price
FROM 
    merged_data
WHERE 
	vendor is not NULL and vendor = "Walmart"
	AND current_price is not NULL
	AND old_price is not NULL

