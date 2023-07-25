create view employee_user as 
select numIdentification as 'identification'
		, concat(nameEmployee, ' ' , lastName) as 'name' , job
		,sex , address, phone, email , employeeUser as 'User', 
        passwordUser as 'Password'
from employee join userEmployee on (employee.idEmployee = userEmployee.idEmployee)
where  statusEmployee like 'Active';     