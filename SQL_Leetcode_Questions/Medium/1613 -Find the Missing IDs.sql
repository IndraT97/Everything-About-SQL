WITH RECURSIVE CTE AS(
    SELECT 1 AS 'id', MAX(c.customer_id) AS 'Max_Id'
    FROM t_1613 c
    UNION ALL
    SELECT id+1, Max_Id
    FROM CTE
    WHERE id < Max_id
)

SELECT id AS 'ids'
FROM CTE c
WHERE c.id NOT IN (SELECT customer_id 
					FROM t_1613)
ORDER BY 1 ASC