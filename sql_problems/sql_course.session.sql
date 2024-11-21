SELECT
    EXTRACT(MONTH FROM job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'America/New_York') AS date_month,
    count(job_id)
    
FROM job_postings_fact


GROUP BY
    date_month
ORDER BY
    date_month
;

SELECT
    company_dim.name AS company_name,
    COUNT(job_postings_fact.job_id) AS job_count
FROM job_postings_fact

LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id

WHERE
    job_health_insurance = TRUE AND 
    EXTRACT(quarter FROM job_posted_date) = 2

GROUP BY
    company_name

ORDER BY
    job_count DESC
;