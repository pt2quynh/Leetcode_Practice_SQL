select tb1.name as Employee
from Employee  tb1, Employee  tb2
where tb1.managerid = tb2.id and tb1.salary > tb2.salary