SELECT
	`2007a2012`.`Año` AS `año`,
	`subcontinentes_códigos`.`código` AS `subcontinente`,
	SUM(REPLACE(2007a2012.`13. Des AOD (€)`,',','')) AS `total`
FROM 2007a2012
RIGHT JOIN `subcontinentes_códigos` ON
	`2007a2012`.`16.a. País o región` = `subcontinentes_códigos`.`nombre`
GROUP BY `Año`, `subcontinente`
ORDER BY `año`, `subcontinente`;
