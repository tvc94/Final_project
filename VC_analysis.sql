USE vc_database;

-- GENDER ANALYSIS : men 46% but higher average value +23.49%
  
SELECT
  product_gender_target,
  COUNT(*) AS product_count,
  ROUND(COUNT(*) * 1.0 / (SELECT COUNT(*) FROM my_table), 2) AS product_ratio,
  ROUND(AVG(price_usd), 2) AS mean_price,
  CASE
    WHEN product_gender_target = 'Men'
      THEN ROUND(
        100.0 * (
          (SELECT ROUND(AVG(price_usd), 2) FROM my_table WHERE product_gender_target = 'Men') -
          (SELECT ROUND(AVG(price_usd), 2) FROM my_table WHERE product_gender_target = 'Women')
        ) /
        (SELECT ROUND(AVG(price_usd), 2) FROM my_table WHERE product_gender_target = 'Women'), 
        2
      )
    WHEN product_gender_target = 'Women'
      THEN ROUND(
        100.0 * (
          (SELECT ROUND(AVG(price_usd), 2) FROM my_table WHERE product_gender_target = 'Women') -
          (SELECT ROUND(AVG(price_usd), 2) FROM my_table WHERE product_gender_target = 'Men')
        ) /
        (SELECT ROUND(AVG(price_usd), 2) FROM my_table WHERE product_gender_target = 'Men'),
        2
      )
    ELSE 0
  END AS price_variance_pct
FROM
  my_table
GROUP BY
  product_gender_target;
  
  
 -- GENDER ANALYSIS BY PRODUCT CAT RATIO
  SELECT
  product_gender_target,
  product_category,
  COUNT(*) AS product_count,
  ROUND(COUNT(*) * 1.0 / (
    SELECT COUNT(*) FROM my_table
  ), 2) AS product_ratio
FROM
  my_table
GROUP BY
  product_gender_target, product_category
ORDER BY
  product_gender_target, product_count DESC;
  
  --  ANALYSIS PRODUCTS BY PRODUCT CAT BY GENDER
  
SELECT
  product_gender_target,
  product_category,
  COUNT(*) AS product_count
FROM
  my_table
GROUP BY
  product_gender_target, product_category
ORDER BY
  product_gender_target, product_count DESC;
  
    --  ANALYSIS PRODUCTS BY PRODUCT TYPE BY GENDER
    
SELECT
  product_gender_target,
  product_type,
  COUNT(*) AS product_count
FROM
  my_table
GROUP BY
  product_gender_target, product_type
ORDER BY
  product_gender_target, product_count DESC;
  
    --  ANALYSIS PRODUCTS BY PRODUCT TYPE BY GENDER
    
    
    

  