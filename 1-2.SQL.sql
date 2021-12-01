create database data_lit;

use data_lit;

create table exercise_logs(
id integer primary key auto_increment,
type text,
minutes integer,
calories integer,
heart_rate integer
);

insert into exercise_logs(type, minutes, calories, heart_rate)
values('biking', 30, 100, 110);

select*from exercise_logs;

select type,sum(calories)as tatal_calories
from exercise_logs
group by type;

select count(*),    
  case         
    when heart_rate > 220 - 30 then 'above max'        
    when heart_rate > round(.9 * (220 - 30)) then 'above target'
    when heart_rate > round(.5 * (220 - 30)) then 'within target'
    else 'below target'    
end as 'heart_rate_zone'
from exercise_logs
group by heart_rate_zone;


create table drs_favorites ( 
  id integer primary key,    /* Unique identifier */
  type text,                 /* Type of activity */
  reason text                /* Why the doctor recommends it */
);

insert into drs_favorites(id, type, reason)
values (01,'running', 'improves cardiovascular health.');
insert into drs_favorites(id, type, reason)
values (02,'biking', 'improves cardiovascular health.');
insert into drs_favorites(id, type, reason)
values (03,'running', 'habbit.');

select*
from exercise_logs
where type in(select type from drs_favorites where reason like'%cardiovascular%')