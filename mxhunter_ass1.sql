# mateu hunter
# mxhunter
# Assignment 1
# November 5, 2009

# Question 1
select * from Classes where 
(
    MondaySchedule    = 1 
and TuesdaySchedule   = 0
and WednesdaySchedule = 1 
and ThursdaySchedule  = 0
and FridaySchedule    = 0
and SaturdaySchedule  = 0
)
or
(
    MondaySchedule    = 0
and TuesdaySchedule   = 1
and WednesdaySchedule = 0
and ThursdaySchedule  = 1
and FridaySchedule    = 0
and SaturdaySchedule  = 0
)
;

# Question 2
SELECT * 
FROM Classes as C
WHERE MondaySchedule = 0
   OR
(
MondaySchedule = 1
  AND 
  (hour(StartTime)*60 + minute(StartTime) > 14*60 + 30
    OR
   hour(StartTime)*60 + minute(StartTime) + duration < 13*60
  )
)
;

# Question 3
select duration as "class duration in minutes", count(*) as "number of classes" 
from Classes
group by duration
;

# Question 4
SELECT * 
FROM Classes as classes
JOIN Subjects as subjects
ON subjects.SubjectID=classes.SubjectID
Where subjects.SubjectName LIKE '%algorithm%'
   Or subjects.SubjectDescription LIKE '%algorithm%'
;

# Question 5
-- This query seems a little weak to me
-- since I'm not giving you all the three-class
-- combinations.  I'm merely listing all the classes
-- involved.  You have to note which Catgory 
-- the come from and make 1 choice from each category
-- The number of triplets are m*n*o
-- where m,n,o are number of subjects from ECO, HIS
-- and Mat.
select * from Classes as C 
  join Subjects as S 
    on S.SubjectID = C.SubjectID
 where S.CategoryID IN ('ECO', 'HIS', 'MAT')
;

# Question 6
SELECT * FROM Classes as C
WHERE duration <= 60
;

# Question 7
SELECT * FROM Classes
WHERE SaturdaySchedule = 0
AND
(
MondaySchedule = 0
OR
  (
   MondaySchedule = 1 AND hour(StartTime)*60 +    
   minute(StartTime) >= 12*60
  )
)
;

# Question 8
SELECT SubjectName, SubjectCode 
  FROM Subjects 
 WHERE SubjectCode LIKE '%101%';

