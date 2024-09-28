use chandana_project2;
#university->college->department->professor,student

# 1.Get the list of students who belong with a University Name is 'AAAAAA'
select s.student_name
from studentcha s
join department d on s.DepartmentId = d.DepartmentId
join collegecha c on d.CollegeId = c.CollegeId
join universitycha u on c.UniversityId = u.UniversityId
where u.UniversityName = 'AAAAAA';

# 2.Group the students university-wise, college-wise, and department-wise
select
    u.UniversityName,
    c.CollegeName,
    d.DepartmentName,
    count(s.student_id) AS StudentCount
from studentcha s
join department d on s.DepartmentId = d.DepartmentId
join collegecha c on d.CollegeId = c.CollegeId
join universitycha u on c.UniversityId = u.UniversityId
group by 
    u.UniversityName,
    c.CollegeName,
    d.DepartmentName
order by 
    u.UniversityName,
    c.CollegeName,
    d.DepartmentName;

# 3.Get the list of professors (University name, 'Collegename' , 'DepartmentName', 'ProfessorId', 'ProfessorName')
select

u.UniversityName, c.CollegeName, d.DepartmentName, p.ProfessorId, p.ProfessorName
from professorcha p
join department d on p.DepartmentId = d.DepartmentId
join collegecha c on d.CollegeId = c.CollegeId
join universitycha u on c.UniversityId = u.UniversityId;

# 4.Get the sum of salary whose belonging university Name is ‘BBBBBB’.
select
    SUM(Salary) AS total_salary
from professorcha p join department d on p.DepartmentId = d.DepartmentId
join collegecha c on d.CollegeId = c.CollegeId
join universitycha u on c.UniversityId = u.UniversityId
where UniversityName = 'BBBBBB';


# 5.Count students university-wise who have passed the first, second and third division.
select
    u.UniversityName,
    SUM(CASE WHEN s.student_marks >= 60 THEN 1 ELSE 0 END) AS FirstDivision,
    SUM(CASE WHEN s.student_marks >= 50 AND s.student_marks < 60 THEN 1 ELSE 0 END) AS SecondDivision,
    SUM(CASE WHEN s.student_marks >= 40 AND s.student_marks < 50 THEN 1 ELSE 0 END) AS ThirdDivision
from studentcha s
join department d on s.DepartmentId = d.DepartmentId
join collegecha c on d.CollegeId = c.CollegeId
join universitycha u on c.UniversityId = u.UniversityId
group by u.UniversityName;


# 6.Get List of students who study in the ‘Computer Science’ department

select
    s.student_id,
    s.student_name,
    d.DepartmentName,
    c.CollegeName,
    u.UniversityName
from studentcha s
join department d on s.DepartmentId = d.DepartmentId
join collegecha c on d.CollegeId = c.CollegeId
join universitycha u on c.UniversityId = u.UniversityId
where d.DepartmentName = 'computers';


# 7.Get the name of the university who have passed with maximum marks
select
    u.UniversityName, 
    MAX(s.student_marks) as max_marks
from studentcha s 
join department d on s.DepartmentId = d.DepartmentId
join collegecha c on d.CollegeId = c.CollegeId
join universitycha u on c.UniversityId = u.UniversityId
group by  u.UniversityName
order by max_marks desc
limit 1;


# 8.Get list of students who study in grade ‘A’ University

select s.student_name
from studentcha s
join department d on s.DepartmentId = d.DepartmentId
join collegecha c on d.CollegeId = c.CollegeId
join universitycha u on c.UniversityId = u.UniversityId
where u.UniversityGrade = 'A';


# 9.The percentage of passed students who belong with a University Name is ‘AAAAAA’.
select
    u.UniversityName,
    (SUM(CASE WHEN s.student_marks >= 40 THEN 1 ELSE 0 END) * 100.0 / COUNT(s.student_id)) as PassPercentage
from studentcha s
join department d on s.DepartmentId = d.DepartmentId
join collegecha c on d.CollegeId = c.CollegeId
join universitycha u on c.UniversityId = u.UniversityId
where u.UniversityName = 'AAAAAA'
group by u.UniversityName;


# 10.Get the percentage of the result college wise.
select
    c.CollegeName,
    (SUM(CASE WHEN s.student_marks >= 400 THEN 1 ELSE 0 END) * 1000.0 / COUNT(s.student_id)) AS PassPercentage
from studentcha s
join department d ON s.DepartmentId = d.DepartmentId
join collegecha c ON d.CollegeId = c.CollegeId
group by c.CollegeName;