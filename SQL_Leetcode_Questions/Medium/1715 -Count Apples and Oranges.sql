SELECT sum(IFNULL(box.apple_count, 0) + IFNULL(chest.apple_count, 0)) AS apple_count,
    sum(IFNULL(box.orange_count, 0) + IFNULL(chest.orange_count, 0)) AS orange_count
    FROM Boxes AS box
    LEFT JOIN Chests AS chest
    ON box.chest_id = chest.chest_id;