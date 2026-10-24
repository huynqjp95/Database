create table scores (
	student_id varchar(10),
    subject varchar(50),
    score decimal(4,2)
);

insert into scores( student_id, subject, score) values
('SV001', 'Toan',   8.50),
('SV001', 'Ly',     7.00),
('SV001', 'Hoa',    9.00),
('SV002', 'Toan',   6.50),
('SV002', 'Ly',     5.00),
('SV003', 'Toan',   9.50),
('SV003', 'Hoa',    8.00),
('SV003', 'Anh',    7.50),
('SV004', 'Anh',    4.50),
('SV004', 'Toan',   10.00);

-- Calculate average score of each student
select student_id, round(avg(score),2) as avg_score from scores
group by student_id;

-- display students whose average score is greater than 7.0
select student_id, round(avg(score),2) as avg_score from scores
group by student_id having avg_score >= 7;

-- display student whose average score is highest
select student_id, round(avg(score),2) as avg_score from scores
group by student_id order by avg_score desc limit 1;

select student_id, round(avg(score),2) as avg_score from scores
group by student_id 
having avg_score = (select max(avg_score) 
	from(select round(avg(score),2) as avg_score from scores
	group by student_id) as t);
									
-- display students whose average score is greater than the average score of all students
select student_id , round(avg(score),2) as avg_score from scores
group by student_id having avg_score > (select avg(avg_score) from(
								select avg(score) as avg_score from scores
                                group by student_id) as t);