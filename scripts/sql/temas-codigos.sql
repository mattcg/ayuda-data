CREATE TEMPORARY TABLE `temas_códigos` (
	`CAD` varchar(255) NOT NULL,
	`CRS` varchar(255) NOT NULL,
	`nombre` varchar(255) NOT NULL
) DEFAULT CHARSET=utf8;

LOAD DATA LOCAL INFILE 'scripts/data/temas-codigos.csv' INTO TABLE `temas_códigos`
	FIELDS TERMINATED BY ',' ENCLOSED BY '"'
	LINES TERMINATED BY '\n'
	IGNORE 1 LINES;
