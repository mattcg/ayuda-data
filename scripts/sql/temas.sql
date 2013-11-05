SELECT
	`2007a2012`.`Año` AS `año`,
	SUBSTRING_INDEX(`2007a2012`.`14.d. Sector CAD`, ' - ', 1) AS `CAD`,
	COUNT(`CAD`) AS `total`,
	`temas_códigos`.`nombre` AS `nombre`
FROM `2007a2012`
LEFT JOIN `temas_códigos` ON
	SUBSTRING_INDEX(`2007a2012`.`14.d. Sector CAD`, ' - ', 1) = `temas_códigos`.`CAD`
WHERE `nombre` IS NOT NULL
GROUP BY `año`, `CAD`
ORDER BY `año`, `CAD`;
