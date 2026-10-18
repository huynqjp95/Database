-- display students whose email address is not set yet
SELECT * FROM students
WHERE email IS NULL;

-- display students whose email addresses have been set
SELECT * FROM students
WHERE email IS NOT NULL;

-- display students whose name begin with "Ng"
SELECT * FROM students
WHERE full_name LIKE "Ng%";

-- display students whose gender is not "MALE"
SELECT * FROM students
WHERE gender != "MALE";
