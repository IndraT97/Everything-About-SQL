-- 1783
CREATE TABLE Championships (
    year INT PRIMARY KEY,
    Wimbledon INT,
    Fr_Open INT,
    US_Open INT,
    Au_Open INT,
    FOREIGN KEY (Wimbledon) REFERENCES Players(player_id),
    FOREIGN KEY (Fr_Open) REFERENCES Players(player_id),
    FOREIGN KEY (US_Open) REFERENCES Players(player_id),
    FOREIGN KEY (Au_Open) REFERENCES Players(player_id)
);