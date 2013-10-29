SELECT
	`2007a2012`.`Año` AS `año`,
	`2007a2012`.`16.a. País o región` AS `nombre`,
	SUM(IF(`2007a2012`.`13. Des AOD (€)` < 0, 0, REPLACE(`2007a2012`.`13. Des AOD (€)`,',',''))) AS `deuda`
FROM `2007a2012`
LEFT OUTER JOIN `países_códigos` ON
	`2007a2012`.`16.a. País o región` = `países_códigos`.`nombre`
WHERE `países_códigos`.`nombre` IS NULL
GROUP BY `año`, `nombre`
ORDER BY `año`, `nombre`;
