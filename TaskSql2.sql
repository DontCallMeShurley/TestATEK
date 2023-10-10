/*
Напишите скрипт, который вернет список всех неперсекающихся и несмежных периодов (т.е., между двумя периодами должен быть минимум один «пустой» день) между @DateBegin и @DateEnd включительно, когда у клиента был хотя бы один активный договор типа @Type_Id. Если, можете 
Пример параметров:
declare
  @Type_Id    int   = 1,
  @DateBegin  date  = '20000601',
  @DateEnd    date  = '20010131'

Учесть, что у клиента может быть несколько действующих договоров одного типа одновременно.*/
declare
  @Type_Id    int   = 1,
  @DateBegin  date  = '20190101',
  @DateEnd    date  = '20220101'

select*from Test.Contracts c 
where 
c.Type_Id = @Type_Id 
and c.DateFrom >= @DateBegin 
and ISNULL(c.DateTo,'20700101') <= @DateEnd
and not exists(select*from test.Contracts c2 where c2.Client_Id = c.Client_Id and c2.Type_Id = c.Type_Id and c2.Id <> c.Id
				and (ABS(DATEDIFF(day, c.DateFrom, c2.DateFrom)) < 1 
					or ABS(DATEDIFF(day, c.DateFrom, c2.DateTo)) < 1 
					or ABS(DATEDIFF(day, c.DateTo, c2.DateFrom)) < 1
					or ABS(DATEDIFF(day, c.DateTo, c2.DateTo)) < 1))