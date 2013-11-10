SELECT
	`2007a2012`.`Año` AS `año`,
	`países_códigos`.`código` AS `código`,
	SUM(REPLACE(`2007a2012`.`13. Des AOD (€)`,',','')) AS `total`,
	SUM(IF(`2007a2012`.`13. Des AOD (€)` < 0, 0, REPLACE(`2007a2012`.`13. Des AOD (€)`,',',''))) AS `deuda`,
	ABS(SUM(IF(`2007a2012`.`13. Des AOD (€)` > 0, 0, REPLACE(`2007a2012`.`13. Des AOD (€)`,',','')))) AS `créditos`,
	`2007a2012`.`16.a. País o región` AS `nombre`
FROM `2007a2012`
RIGHT JOIN `países_códigos` ON
	`2007a2012`.`16.a. País o región` = `países_códigos`.`nombre`
GROUP BY `año`, `código`
ORDER BY `año`, `código`;
