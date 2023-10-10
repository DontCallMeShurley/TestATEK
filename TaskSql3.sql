
1. найти топ-3 неэффективных маршрутов и топ-3 неэффективных машин по каждому из критериев:
  --1.1 Недозагруженность машины, т.е. отношение «загрузка машины/грузоподъемность» после выезда со склада в начале маршрута
  SELECT TOP 3 r.ID AS NumberRoute, c.Capacity - r.Load AS UnLoaded, c.Id AS Car  
  FROM TestCars.Routes r
  INNER JOIN TestCars.Cars c ON r.Car_Id = c.Id
  WHERE r.Load > 0
  ORDER BY c.Capacity - r.Load DESC

  --1.2 Размер остатка в машине после посещения всех магазинов на маршруте
  CREATE TABLE #temp (Loaded INT, DayT DATETIME, carId INT)

  INSERT INTO #Temp (Loaded, DayT, carId)
  SELECT SUM(r.Load), CAST(r.ArrivalTime AS DATE), r.Car_Id
  FROM TestCars.Routes r
  WHERE r.Load < 0
  GROUP BY CAST(r.ArrivalTime AS DATE), r.Car_Id


  SELECT TOP 3 r.Load - temp.Loaded AS Balance, r.Id AS ROUTE, r.Car_Id AS Car
  FROM TestCars.Routes r
  INNER JOIN TestCars.Cars c ON r.Car_Id = c.Id
  INNER JOIN #temp temp ON temp.carId = c.Id AND temp.DayT = CAST(r.ArrivalTime AS DATE)
  WHERE r.Load > 0
  ORDER BY r.Load - temp.Loaded DESC

  DROP TABLE #temp

   --2. Найти самую быструю машину или доказать, что по представленным данным это невозможно сделать.
   --По моему мнению это невозможно подсчитать так как мы банально не знаем расстояния между точками.
   --Соотвественно одна машина может проехать весь город из склада до магазина, а вторая может на складе загрузиться и через дорогу в магазине разгрузиться. 