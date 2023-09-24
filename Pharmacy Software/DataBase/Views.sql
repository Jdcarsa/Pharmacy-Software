create view view_employee_user as 
select numIdentification as 'identification'
		, concat(nameEmployee, ' ' , lastName) as 'name' , job
		,sex , address, phone, email , employeeUser as 'User', 
        passwordUser as 'Password'
from employee join userEmployee on (employee.idEmployee = userEmployee.idEmployee)
where  statusEmployee like 'Active';     

create view product_pre_lab as 
select idProduct , descriptionProduct as 'name' , concentration , 
cost , salePrice as 'price', expirationDate as 'expDate' , healthRegister , 
descriptionPresentation as 'Presentation',nameLaboratory as 'Laboratory'
from (product join laboratory on (product.idLaboratory = laboratory.idLaboratory))
join  presentation on (product.idPresentation = presentation.idPresentation)
where statusProduct like 'Active'; 