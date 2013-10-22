SELECT
	`2007a2012`.`Año` AS `año`,
	`2007a2012`.`16.a. País o región` AS `nombre`,
	`subcontinentes_códigos`.`código` AS `código`,
	SUM(IF(`2007a2012`.`13. Des AOD (€)` < 0, 0, REPLACE(`2007a2012`.`13. Des AOD (€)`,',',''))) AS `deuda`
FROM 2007a2012
RIGHT JOIN `subcontinentes_códigos` ON
	`2007a2012`.`16.a. País o región` = `subcontinentes_códigos`.`nombre`
GROUP BY `año`, `código`
ORDER BY `año`, `código`;
