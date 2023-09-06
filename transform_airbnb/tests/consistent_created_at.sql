WITH 

review_dates AS (

SELECT listing_id, MIN(review_date) AS first_review_date FROM {{ ref("fct_reviews") }}
GROUP BY listing_id
),

created_at_listing AS (
SELECT listing_id, created_at FROM {{ ref("dim_listing_cleansed") }}
ORDER BY listing_id ASC
)

SELECT * FROM review_dates rd
LEFT JOIN created_at_listing cal ON cal.LISTING_ID = rd.LISTING_ID
WHERE rd.first_review_date <= cal.created_at
