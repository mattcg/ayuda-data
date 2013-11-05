SELECT
	`2007a2012`.`Año` AS `año`,
	`2007a2012`.`14.a. Sector CRS` AS `CRS`,
	COUNT(`CAD`) AS `total`,
	`temas_códigos`.`nombre` AS `nombre`
FROM `2007a2012`
LEFT JOIN `temas_códigos` ON
	`2007a2012`.`14.a. Sector CRS` = `temas_códigos`.`CRS`
WHERE `nombre` IS NOT NULL
GROUP BY `año`, `CRS`
ORDER BY `año`, `CRS`;
