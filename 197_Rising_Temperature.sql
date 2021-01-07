SELECT ww.id AS "Id"
  FROM weather ww
  JOIN weather w 
    ON ww.recordDate - w.recordDate = 1
   AND ww.Temperature > w.Temperature;