-- display students whose birth years are between 2003 and 2005
SELECT * FROM students
WHERE birth_date BETWEEN '2003-01-01' AND '2005-12-31';

-- display students whose gender are "MALE" or 'FEMALE'
SELECT * FROM students
WHERE gender IN ('MALE','FEMALE');

-- display students with student_ids are SV001 , SV004 and SV005
SELECT * FROM students
WHERE student_id IN ('001','004','005');

-- display only student_id ,full_name and birth_date
SELECT student_id, full_name, birth_date FROM students;