SELECT
	`2007a2012`.`Año` AS `año`,
	`2007a2012`.`16.a. País o región` AS `nombre`,
	ABS(SUM(IF(`2007a2012`.`13. Des AOD (€)` > 0, 0, REPLACE(`2007a2012`.`13. Des AOD (€)`,',','')))) AS `créditos`
FROM `2007a2012`
WHERE `16.a. País o región` LIKE '%NO ESPECIFICADOS'
GROUP BY `año`, `nombre`
ORDER BY `año`, `nombre`;
