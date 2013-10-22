SELECT
	`2007a2012`.`Año` AS `año`,
	`continentes_códigos`.`código` AS `código`,
	SUM(IF(`2007a2012`.`13. Des AOD (€)` < 0, 0, REPLACE(`2007a2012`.`13. Des AOD (€)`,',',''))) AS `deuda`
FROM 2007a2012
RIGHT JOIN `continentes_códigos` ON
	`2007a2012`.`16.a. País o región` = `continentes_códigos`.`nombre`
GROUP BY `año`, `código`
ORDER BY `año`, `código`;
