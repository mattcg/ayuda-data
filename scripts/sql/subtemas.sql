SELECT
	`2007a2012`.`Año` AS `año`,
	SUBSTRING_INDEX(`2007a2012`.`14.d. Sector CAD`, ' - ', 1) AS `CAD`,
	`2007a2012`.`14.a. Sector CRS` AS `CRS`,
	COUNT(`CAD`) AS `num`,
	SUM(REPLACE(`2007a2012`.`13. Des AOD (€)`,',','')) AS `total`,
	SUM(IF(`2007a2012`.`13. Des AOD (€)` < 0, 0, REPLACE(`2007a2012`.`13. Des AOD (€)`,',',''))) AS `deuda`,
	ABS(SUM(IF(`2007a2012`.`13. Des AOD (€)` > 0, 0, REPLACE(`2007a2012`.`13. Des AOD (€)`,',','')))) AS `créditos`,
	`temas_códigos`.`nombre` AS `nombre`
FROM `2007a2012`
LEFT JOIN `temas_códigos` ON
	`2007a2012`.`14.a. Sector CRS` = `temas_códigos`.`CRS`
WHERE `nombre` IS NOT NULL
GROUP BY `año`, `CRS`
ORDER BY `año`, `CRS`;
