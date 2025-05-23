--- What med did we spend the most money on in total?
SELECT 
  med_name AS medication,
  SUM(SAFE_CAST(total_price AS FLOAT64)) AS total_spent
FROM `operating-edge-458018-f9.Healthtail.invoices`
GROUP BY medication
ORDER BY total_spent DESC;


--- What med had the highest monthly total_value spent on patients? At what month? 
 
SELECT 
  month,
  medication,
  total_value
FROM (
  SELECT 
    DATE_TRUNC(visit_datetime, MONTH) AS month,
    med_prescribed AS medication,
    SUM(SAFE_CAST(med_cost AS FLOAT64)) AS total_value
  FROM `operating-edge-458018-f9.Healthtail.visits`
  WHERE med_prescribed IS NOT NULL
  GROUP BY month, medication
)
ORDER BY total_value DESC;



  ---What month was the highest in packs of meds spent in vet clinic?
SELECT 
  DATE_TRUNC(month_invoice, MONTH) AS month,
  SUM(SAFE_CAST(packs AS INT64)) AS total_packs
FROM `operating-edge-458018-f9.Healthtail.invoices`
GROUP BY month
ORDER BY total_packs DESC;

---What’s an average monthly spent in packs of the med that generated the most revenue? 
WITH med_revenue AS (
  SELECT 
    med_name,
    SUM(SAFE_CAST(total_price AS FLOAT64)) AS total_revenue
  FROM `operating-edge-458018-f9.Healthtail.invoices`
  GROUP BY med_name
  ORDER BY total_revenue DESC
  LIMIT 1
),
monthly_packs AS (
  SELECT 
    DATE_TRUNC(month_invoice, MONTH) AS month,
    med_name,
    SUM(SAFE_CAST(packs AS INT64)) AS total_packs
  FROM `operating-edge-458018-f9.Healthtail.invoices`
  GROUP BY month, med_name
)

SELECT 
  mp.med_name,
  AVG(mp.total_packs) AS avg_monthly_packs
FROM monthly_packs mp
JOIN med_revenue mr
  ON mp.med_name = mr.med_name
GROUP BY mp.med_name;



