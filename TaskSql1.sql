--Напишите скрипт, который вернет список «ошибок» в системе. Под «ошибкой» подразумевается ситуация, когда счет действует (действовал), а договор, в рамках которого заключен счет, не действует (не действовал).

SELECT 
	acc.Number as AccountNumber, 
	acc.DateTimeFrom as AccountDateFrom, 
	acc.DateTimeTo as AccountDateTo, 
	con.DocNo as ContractNumber, 
	con.DateFrom as ContractDateFrom,
	con.DateTo as ContractDateTo
FROM TestDoc.Accounts acc
INNER JOIN TestDoc.Contracts con on acc.Contract_Id = con.Id
WHERE (acc.DateTimeFrom < con.DateFrom) OR (ISNULL(acc.DateTimeTo,'20700101') > ISNULL(con.DateTo, '20700101'))