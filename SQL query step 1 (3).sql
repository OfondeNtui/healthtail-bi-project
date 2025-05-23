SELECT
  patient_id,
  owner_id,
  owner_name,
  pet_type,
  IFNULL(breed, 'Unknown') AS breed,
  INITCAP(TRIM(patient_name)) AS patient_name,
  UPPER(gender) AS gender,
  SAFE_CAST(patient_age AS INT64) AS patient_age,
  date_registration,
  REGEXP_REPLACE(owner_phone, r'[^0-9]', '') AS owner_phone
FROM `operating-edge-458018-f9.Healthtail.healthtail_reg_cards`;

---------------------------------------------------------------------------

WITH meds_used AS (
  SELECT 
    DATE_TRUNC(visit_datetime, MONTH) AS month,
    med_prescribed AS medication,
    COUNT(*) AS prescriptions,
    SUM(SAFE_CAST(med_cost AS FLOAT64)) AS total_value,
    'Stock_out' AS stock_movement
  FROM `operating-edge-458018-f9.Healthtail.visits`
  WHERE med_prescribed IS NOT NULL
  GROUP BY month, medication
),
meds_purchased AS (
  SELECT 
    DATE_TRUNC(month_invoice, MONTH) AS month,
    med_name AS medication,
    SUM(SAFE_CAST(packs AS INT64)) AS prescriptions,
    SUM(SAFE_CAST(total_price AS FLOAT64)) AS total_value,
    'Stock_in' AS stock_movement
  FROM `operating-edge-458018-f9.Healthtail.invoices`
  GROUP BY month, medication
)

SELECT * FROM meds_used
UNION ALL
SELECT * FROM meds_purchased;