delimiter //
create procedure sp_classify_student ( in avg_score decimal(4,2), out s_rank varchar(15))
begin
	declare c_rank varchar(15);
    case
		when avg_score >= 8 then set c_rank = 'Excellent';
        when avg_score >= 6.5 then set c_rank = 'Good';
        when avg_score >= 5 then set c_rank = 'Average';
        else set c_rank = 'Weak';
	end case;
    set s_rank = c_rank;
end //
delimiter ;

call sp_classify_student(5.2,@rank);
select @rank as result;

call sp_classify_student(4.8,@rank);
select @rank as result;