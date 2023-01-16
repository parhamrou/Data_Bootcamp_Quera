-- Section1
    SELECT p_title, c_title FROM
    (SELECT problems.title AS p_title, COUNT(submissions.id) AS number, contests.title AS c_title
    FROM problems
    JOIN submissions
    ON problems.id = submissions.problem_id
    JOIN contests
    ON problems.contest_id = contests.id
    GROUP BY p_title, c_title
    ORDER BY number DESC, p_title ASC, c_title ASC) A;
-- Section2
SELECT title, amount FROM
    (SELECT contests.title AS title, COUNT(DISTINCT submissions.user_id) AS amount, problems.contest_id c_id
    FROM contests
    JOIN problems
    ON contests.id = problems.contest_id
    JOIN submissions
    ON problems.id = submissions.problem_id
    GROUP BY title, c_id
    ORDER BY amount DESC, title ASC) A;
-- Section3
SELECT name, SUM(max_score) AS score FROM
    (SELECT name, problem_id, MAX(score) AS max_score FROM contests c
    JOIN problems p on c.id = p.contest_id
    JOIN submissions s on p.id = s.problem_id
    JOIN users u on u.id = s.user_id
    WHERE c.title = 'mahale'
    GROUP BY name, problem_id) T
GROUP BY name
ORDER BY score DESC, name ASC
-- Section4
    SELECT name, COALESCE(SUM(score), 0) AS score FROM
        (SELECT problems.id p_id, MAX(submissions.score) score, users.name name
        FROM users
        LEFT JOIN submissions
        ON users.id = submissions.user_id
        LEFT JOIN problems
        ON submissions.problem_id = problems.id
        GROUP BY problems.id, name) T
    GROUP BY name
    ORDER BY score DESC, name ASC
-- Section5
    UPDATE contests
    SET title = "Mosabeghe Mahale"
    WHERE title = "mahale"
-- Section6
    DELETE FROM contests
    WHERE id NOT IN (
        SELECT T.id FROM (
        SELECT DISTINCT c.id FROM contests c
        JOIN problems p ON c.id = p.contest_id
        JOIN submissions s on p.id = s.problem_id
        ) T
    );
