CREATE FUNCTION getNthHighestSalary(N IN NUMBER) RETURN NUMBER IS
result NUMBER;
BEGIN
    /* Write your PL/SQL query statement below */
    select ord into result from(
    select distinct salary ord, 
           dense_rank() over (order by salary desc) as rn
      from employee e
    )
     where rn = n;
     
    RETURN result;
END;