
create database event_management;

use event_management;

create table users (
    user_id int primary key auto_increment,
    full_name varchar(100) not null,
    email varchar(100) unique not null,
    city varchar(100) not null,
    registration_date date not null
);

create table events (
    event_id int primary key auto_increment,
    title varchar(200) not null,
    description text,
    city varchar(100) not null,
    start_date datetime not null,
    end_date datetime not null,
    status enum('upcoming','completed','cancelled'),
    organizer_id int,
    foreign key (organizer_id) references users(user_id)
);

create table sessions (
    session_id int primary key auto_increment,
    event_id int,
    title varchar(200) not null,
    speaker_name varchar(100) not null,
    start_time datetime not null,
    end_time datetime not null,
    foreign key (event_id) references events(event_id)
);

create table registrations (
    registration_id int primary key auto_increment,
    user_id int,
    event_id int,
    registration_date date not null,
    foreign key (user_id) references users(user_id),
    foreign key (event_id) references events(event_id)
);

create table feedback (
    feedback_id int primary key auto_increment,
    user_id int,
    event_id int,
    rating int check (rating between 1 and 5),
    comments text,
    feedback_date date not null,
    foreign key (user_id) references users(user_id),
    foreign key (event_id) references events(event_id)
);

create table resources (
    resource_id int primary key auto_increment,
    event_id int,
    resource_type enum('pdf','image','link'),
    resource_url varchar(255) not null,
    uploaded_at datetime not null,
    foreign key (event_id) references events(event_id)
);

insert into users
(user_id, full_name, email, city, registration_date)
values
(1,'Alice Johnson','alice@example.com','New York','2024-12-01'),
(2,'Bob Smith','bob@example.com','Los Angeles','2024-12-05'),
(3,'Charlie Lee','charlie@example.com','Chicago','2024-12-10'),
(4,'Diana King','diana@example.com','New York','2025-01-15'),
(5,'Ethan Hunt','ethan@example.com','Los Angeles','2025-02-01');

insert into events
(event_id, title, description, city, start_date, end_date, status, organizer_id)
values
(1,'Tech Innovators Meetup',
'A meetup for tech enthusiasts.',
'New York',
'2025-06-10 10:00:00',
'2025-06-10 16:00:00',
'upcoming',
1),

(2,'AI & ML Conference',
'Conference on AI and ML advancements.',
'Chicago',
'2025-05-15 09:00:00',
'2025-05-15 17:00:00',
'completed',
3),

(3,'Frontend Development Bootcamp',
'Hands-on training on frontend tech.',
'Los Angeles',
'2025-07-01 10:00:00',
'2025-07-03 16:00:00',
'upcoming',
2);

insert into sessions
(session_id, event_id, title, speaker_name, start_time, end_time)
values
(1,1,'Opening Keynote','Dr. Tech',
'2025-06-10 10:00:00',
'2025-06-10 11:00:00'),

(2,1,'Future of Web Dev','Alice Johnson',
'2025-06-10 11:15:00',
'2025-06-10 12:30:00'),

(3,2,'AI in Healthcare','Charlie Lee',
'2025-05-15 09:30:00',
'2025-05-15 11:00:00'),

(4,3,'Intro to HTML5','Bob Smith',
'2025-07-01 10:00:00',
'2025-07-01 12:00:00');

insert into registrations
(registration_id, user_id, event_id, registration_date)
values
(1,1,1,'2025-05-01'),
(2,2,1,'2025-05-02'),
(3,3,2,'2025-04-30'),
(4,4,2,'2025-04-28'),
(5,5,3,'2025-06-15');

insert into feedback
(feedback_id, user_id, event_id, rating, comments, feedback_date)
values
(1,3,2,4,'Great insights!','2025-05-16'),
(2,4,2,5,'Very informative.','2025-05-16'),
(3,2,1,3,'Could be better.','2025-06-11');

insert into resources
(resource_id, event_id, resource_type, resource_url, uploaded_at)
values
(1,1,'pdf',
'https://portal.com/resources/tech_meetup_agenda.pdf',
'2025-05-01 10:00:00'),

(2,2,'image',
'https://portal.com/resources/ai_poster.jpg',
'2025-04-20 09:00:00'),

(3,3,'link',
'https://portal.com/resources/html5_docs',
'2025-06-25 15:00:00');


-- 1. user upcoming events

select u.full_name,
       e.title,
       e.city,
       e.start_date
from users u
join registrations r on u.user_id = r.user_id
join events e on r.event_id = e.event_id
where e.status = 'upcoming'
and u.city = e.city
order by e.start_date;

-- 2. top rated events

select e.event_id,
       e.title,
       avg(f.rating) as avg_rating
from events e
join feedback f on e.event_id = f.event_id
group by e.event_id, e.title
having count(f.feedback_id) >= 10
order by avg_rating desc;

-- 3. inactive users

select *
from users
where user_id not in (
    select distinct user_id
    from registrations
    where registration_date >= curdate() - interval 90 day
);

-- 4. peak session hours

select e.title,
       count(s.session_id) as session_count
from events e
left join sessions s
on e.event_id = s.event_id
and time(s.start_time) between '10:00:00' and '12:00:00'
group by e.event_id, e.title;

-- 5. most active cities

select u.city,
       count(distinct r.user_id) as registrations
from users u
join registrations r
on u.user_id = r.user_id
group by u.city
order by registrations desc
limit 5;

-- 6. event resource summary

select e.title,
       count(case when resource_type='pdf' then 1 end) as pdf_count,
       count(case when resource_type='image' then 1 end) as image_count,
       count(case when resource_type='link' then 1 end) as link_count
from events e
left join resources r
on e.event_id = r.event_id
group by e.event_id,e.title;

-- 7. low feedback alerts

select u.full_name,
       e.title,
       f.rating,
       f.comments
from feedback f
join users u on f.user_id=u.user_id
join events e on f.event_id=e.event_id
where f.rating < 3;

-- 8. sessions per upcoming event

select e.title,
       count(s.session_id) as total_sessions
from events e
left join sessions s
on e.event_id=s.event_id
where e.status='upcoming'
group by e.event_id,e.title;

-- 9. organizer event summary

select u.full_name,
       e.status,
       count(*) as total_events
from events e
join users u
on e.organizer_id=u.user_id
group by u.full_name,e.status;

-- 10. feedback gap

select e.title
from events e
join registrations r
on e.event_id=r.event_id
left join feedback f
on e.event_id=f.event_id
where f.feedback_id is null
group by e.event_id,e.title;

-- 11. daily new user count

select registration_date,
       count(*) as total_users
from users
where registration_date >= curdate() - interval 7 day
group by registration_date;

-- 12. event with maximum sessions

select e.title,
       count(s.session_id) as total_sessions
from events e
join sessions s
on e.event_id=s.event_id
group by e.event_id,e.title
having count(s.session_id)=(
    select max(session_count)
    from (
        select count(*) as session_count
        from sessions
        group by event_id
    ) t
);

-- 13. average rating per city

select e.city,
       avg(f.rating) as average_rating
from events e
join feedback f
on e.event_id=f.event_id
group by e.city;

-- 14. most registered events

select e.title,
       count(r.registration_id) as total_registrations
from events e
join registrations r
on e.event_id=r.event_id
group by e.event_id,e.title
order by total_registrations desc
limit 3;

-- 15. event session time conflict

select s1.event_id,
       s1.title as session1,
       s2.title as session2
from sessions s1
join sessions s2
on s1.event_id=s2.event_id
and s1.session_id < s2.session_id
and s1.start_time < s2.end_time
and s1.end_time > s2.start_time;

-- 16. unregistered active users

select *
from users u
where registration_date >= curdate() - interval 30 day
and not exists (
    select 1
    from registrations r
    where r.user_id=u.user_id
);

-- 17. multi-session speakers

select speaker_name,
       count(*) as total_sessions
from sessions
group by speaker_name
having count(*) > 1;

-- 18. resource availability check

select e.title
from events e
left join resources r
on e.event_id=r.event_id
where r.resource_id is null;

-- 19. completed events with feedback summary

select e.title,
       count(distinct r.registration_id) as total_registrations,
       avg(f.rating) as average_rating
from events e
left join registrations r
on e.event_id=r.event_id
left join feedback f
on e.event_id=f.event_id
where e.status='completed'
group by e.event_id,e.title;

-- 20. user engagement index

select u.full_name,
       count(distinct r.event_id) as events_attended,
       count(distinct f.feedback_id) as feedback_submitted
from users u
left join registrations r
on u.user_id=r.user_id
left join feedback f
on u.user_id=f.user_id
group by u.user_id,u.full_name;

-- 21. top feedback providers

select u.full_name,
       count(f.feedback_id) as total_feedbacks
from users u
join feedback f
on u.user_id=f.user_id
group by u.user_id,u.full_name
order by total_feedbacks desc
limit 5;

-- 22. duplicate registrations check

select user_id,
       event_id,
       count(*) as duplicate_count
from registrations
group by user_id,event_id
having count(*) > 1;

-- 23. registration trends

select year(registration_date) as year,
       month(registration_date) as month,
       count(*) as total_registrations
from registrations
where registration_date >= curdate() - interval 12 month
group by year(registration_date),
         month(registration_date)
order by year,month;

-- 24. average session duration per event

select e.title,
       avg(timestampdiff(minute,
           s.start_time,
           s.end_time)) as avg_duration_minutes
from events e
join sessions s
on e.event_id=s.event_id
group by e.event_id,e.title;

-- 25. events without sessions

select e.title
from events e
left join sessions s
on e.event_id=s.event_id
where s.session_id is null;