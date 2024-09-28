use chandana_project2;
#university Table
create table universitycha(
UniversityId int primary key,
UniversityName varchar(20),
UniversityType varchar(10),
UniversityGrade varchar(10),
UniversityAddress varchar(30));

#inserting values into university Table
insert into  universitycha values(1,'AAAAAA','public','A','raipur'),
								 (2,'BBBBBB','public','A','bhilai'),
                                 (3,'CCCCCC','private','B','durg'),
                                 (4,'DDDDDD','Arts','C','rajnandagaon'),
                                 (5,'EEEEEE','medical','B','bilaspur');
                                 select * from  universitycha;    
 
 #college Table
 drop table if exists collegecha;
 create table collegecha(
    CollegeId int primary key,
    CollegeName varchar(20),
    CollegeType varchar(10),
    CollegeAddress varchar(30),
   UniversityId int,
   foreign key(UniversityId) references universitycha(UniversityId));
   
#inserting values into college Table
insert into collegecha(CollegeId, CollegeName, CollegeType, CollegeAddress, UniversityId) 
values(1, 'gayatri', 'public', 'raipur', 1),
       (2, 'ambika', 'public', 'bhilai', 2),
       (3, 'shankara', 'private', 'durg', 3),
       (4, 'vivekananda', 'arts', 'rajnandagaon', 4),
       (5, 'chaithanya', 'medical', 'bilaspur', 5);
 select * from collegecha;
 
#department Table
select * from chandana_project2.department;
create table department(
DepartmentId int primary key,
DepartmentName varchar(20),
NumberOfClass int,
DepartmentHead varchar(10),
CollegeId int,
    foreign key (CollegeId) references collegecha(CollegeId)
);

#inserting values into department Table
insert into department values(101,'computers',10,'cse',1),
						  (102,'electronic',5,'ece',2),
                          (103,'mechanical',4,'mech',3),
                          (104, 'Medical', 5, 'pharma', 4);
select * from department;
 

#Professor Table
use chandana_project2;
create table professorcha(
ProfessorId int,
ProfessorName varchar(30),
ProfessorAddress varchar(50),
ProfessorAge int,
Salary int,
DepartmentId int,
foreign key (DepartmentId) references department(DepartmentId));

#inserting values into Professor Table
insert into professorcha values(1,'ravi','vizag',30,50000,101),
							(2,'gopal','hyderabad',35,40000,102),
                            (3,'hema','bilaspur',40,60000,103),
                            (4,'sundar','raipur',45,65000,104);
select * from professorcha;                       
                            
                          
#student Table
use chandana_project2;
create table studentcha(
student_id int primary key,
student_name varchar(20),
student_address varchar(30),
student_age int,
student_percentage int,
student_marks int,
student_result varchar(30),
DepartmentId int, 
foreign key(DepartmentId) references department(DepartmentId));

#inserting values into student Table
insert into studentcha values
   (1, 'chandu', 'ambikapur', 25, 80, 800, 'Firstdivision', 101),
   (3, 'vijju', 'vizag', 24, 70, 700, 'Thirddivision', 102),
   (2, 'devi', 'durg', 27, 30, 300, 'Failed', 103),
   (4, 'durga', 'raipur', 26, 40, 400, 'Seconddivision', 104);
commit;
select * from studentcha;
                           
               
                             
                        