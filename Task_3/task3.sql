-- Создание четырех таблиц из обработанных файлов архива

CREATE TABLE users (
id VARCHAR(50),
role VARCHAR(5)
);

COPY users FROM 'users.csv' WITH DELIMITER ';'; -- здесь прописывается полный путь к файлу csv

-------

CREATE TABLE lessons (
id VARCHAR(50) UNIQUE,
event_id VARCHAR(10),
subject VARCHAR(10),
scheduled_time TIMESTAMP
);

COPY lessons FROM 'lessons.csv' WITH DELIMITER ';'; -- здесь прописывается полный путь к файлу csv

-------

CREATE TABLE participants (
event_id VARCHAR(50),
user_id VARCHAR(50)
);

COPY participants FROM 'participants.csv' WITH DELIMITER ';'; -- здесь прописывается полный путь к файлу csv

-------

CREATE TABLE quality (
lesson_id VARCHAR(50),
tech_quality SMALLINT
);

COPY quality FROM 'quality.csv' WITH DELIMITER ';'; -- здесь прописывается полный путь к файлу csv


-- Соединение таблиц для вывода дат, учителей и средних оценок

with table1 as (select l.scheduled_time as day, u.id as tutor_id, q.lesson_id as lesson, tech_quality as score from users u
join participants p on u.id = p.user_id
join lessons l on p.event_id = l.event_id
join quality q on l.id = q.lesson_id
where u.role = 'tutor' and l.subject = 'phys' and q.tech_quality > 0)


select (day  + interval '3 hour')::date, tutor_id, round(avg(score), 2) as avg_score from table1
group by tutor_id, day
order by avg_score
limit 1