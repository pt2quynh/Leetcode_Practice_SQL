CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      # Write your MySQL query statement below.
      /* correlation subquery
        select ifnull(
            (select distinct salary as getNthHighestSalary
            from employee e1
            where N-1 = (select count(distinct salary) from employee e2
                    where e2.salary > e1.salary)),
            null)
       */
      
      with cte_rank as (
          select salary,
                dense_rank() over(order by salary desc) as rank_sal
          from employee
         )
      
      select max(salary)
      from cte_rank
      where rank_sal = N
      
  );
END