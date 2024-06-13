SELECT month,
    COALESCE(ROUND(SUM(ride_distance)/3,2),0) AS average_ride_distance,
    COALESCE(ROUND(SUM(ride_duration)/3,2),0) AS average_ride_duration
FROM
(
    SELECT months.month, ride_id
    FROM Rides
    RIGHT JOIN
    (
        SELECT "2020-1-1" AS start, "2020-3-31" AS last, 1 AS month
        UNION SELECT "2020-2-1", "2020-4-30", 2
        UNION SELECT "2020-3-1", "2020-5-31", 3
        UNION SELECT "2020-4-1", "2020-6-30", 4
        UNION SELECT "2020-5-1", "2020-7-31", 5
        UNION SELECT "2020-6-1", "2020-8-31", 6
        UNION SELECT "2020-7-1", "2020-9-30", 7
        UNION SELECT "2020-8-1", "2020-10-31", 8
        UNION SELECT "2020-9-1", "2020-11-30", 9
        UNION SELECT "2020-10-1", "2020-12-31", 10
    ) AS months
    ON months.start <= requested_at AND months.last >= requested_at
) total
LEFT JOIN AcceptedRides AS a
ON total.ride_id=a.ride_id
GROUP BY month
ORDER BY month;