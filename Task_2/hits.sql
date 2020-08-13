CREATE TABLE hits (
host VARCHAR(50),
ip VARCHAR(50),
page VARCHAR(50)
);

COPY hits FROM 'hits.txt'; -- здесь должен быть указан полный путь к файлу hits.txt

SELECT ip FROM hits
GROUP BY ip
ORDER BY COUNT(*) DESC
LIMIT 5