create database Psyliq;
use Psyliq;
show tables from Psyliq;
#*****************
select * from employee_survey_data;
select * from general_data;
select * from manager_survey_data;
#*********************************

# 1. Retrieve total no. of employees in the datset
select count(EmployeeID) as total_employees from employee_survey_data;

# 2.  List all unique job roles in the dataset
select distinct JobRole from general_data;

# 3. Find the average age of employees. 
select avg(age) from general_data;

# 4. Retrieve the names and ages of employees who have worked at the company for more than 5 years. 
select Emp Name,age from general_data where YearsAtCompany>5;

# 5. Get a count of employees grouped by their department.
select Department,count(*) from general_data group by Department;

# 6.  List employees who have 'High' Job Satisfaction.
select EmployeeID from employee_survey_data where JobSatisfaction=3;

# 7. Find the highest Monthly Income in the dataset. 
 select max(MonthlyIncome) from general_data;
 
 # 8.  List employees who have 'Travel_Rarely' as their BusinessTravel type. 
 select EmployeeID from general_data where BusinessTravel='Travel_Rarely';
 
 # 9.  Retrieve the distinct MaritalStatus categories in the dataset. 
 select distinct MaritalStatus from general_data;
 
 # 10.  Get a list of employees with more than 2 years of work experience but less than 4 years in their current role.
 select EmployeeID from general_data where TotalWorkingYears>2 and YearsAtCompany<4;
 
 # 11. List employees who have changed their job roles within the company (JobLevel and JobRole differ from their previous job). 
 select EmployeeID,JobRole from general_data group by EmployeeID;
 
 # 12.  Find the average distance from home for employees in each department. 
 select Department,avg(DistanceFromHome) from general_data group by Department;
 
 # 13. Retrieve the top 5 employees with the highest MonthlyIncome. 
 select EmployeeID,MonthlyIncome from general_data order by MonthlyIncome limit 5;
 
 # 14.  Calculate the percentage of employees who have had a promotion in the last year. 
 select count(EmployeeID)/(select count(EmployeeID) from general_data)*100 from general_data where YearsSinceLastPromotion=1;
 
 # 15.  List the employees with the highest and lowest EnvironmentSatisfaction. 
 select EmployeeID,EnvironmentSatisfaction from employee_survey_data where EnvironmentSatisfaction =4 or EnvironmentSatisfaction =1 ;
 
 # 16. Find the employees who have the same JobRole and MaritalStatus. 
 select EmployeeID,MaritalStatus from general_data group by JobRole;
 
 # 17.  List the employees with the highest TotalWorkingYears who also have a PerformanceRating of 4.
select general_data.EmployeeID from general_data inner join manager_survey_data on general_data.EmployeeID=manager_survey_data.EmployeeID where PerformanceRating=4 order by TotalWorkingYears Desc;

# 18. Calculate the average Age and JobSatisfaction for each BusinessTravel type. 
select general_data.BusinessTravel,avg(Age),avg(JobSatisfaction) from general_data inner join employee_survey_data on general_data.EmployeeID=employee_survey_data.EmployeeID group by general_data.BusinessTravel;

# 19. Retrieve the most common EducationField among employees.
select distinct EducationField from general_data;

# 20. List the employees who have worked for the company the longest but haven't had a promotion.
 select EmployeeID from general_data where YearsSinceLastPromotion=0 or YearsSinceLastPromotion>YearsAtCompany;