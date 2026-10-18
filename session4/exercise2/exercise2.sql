-- update email for student who don't have an email address yet
UPDATE students
SET email = 'thiennac@example.com'
WHERE student_id = '005';

-- update the gender for the student whose student_id is SV003
UPDATE students
SET gender = 'FEMALE'
WHERE student_id = '003';

-- delete the student whose student_id is SV003
DELETE FROM students WHERE student_id = '003';

select * from students;