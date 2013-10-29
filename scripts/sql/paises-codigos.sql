CREATE TEMPORARY TABLE `países_códigos` (
	`nombre` varchar(255) NOT NULL,
	`código` varchar(255) NOT NULL,
	PRIMARY KEY (`nombre`)
) DEFAULT CHARSET=utf8;

LOAD DATA LOCAL INFILE 'scripts/data/paises-codigos.csv' INTO TABLE `países_códigos`
	FIELDS TERMINATED BY ',' ENCLOSED BY '"'
	LINES TERMINATED BY '\n'
	IGNORE 1 LINES;
