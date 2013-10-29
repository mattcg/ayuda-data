SELECT
	`Año` AS `año`,
	`16.a. País o región` AS `nombre`,
	SUM(REPLACE(`13. Des AOD (€)`,',','')) AS `total`
FROM `2007a2012`
WHERE `16.a. País o región` LIKE '%NO ESPECIFICADOS'
GROUP BY `año`, `nombre`
ORDER BY `año`, `nombre`;
