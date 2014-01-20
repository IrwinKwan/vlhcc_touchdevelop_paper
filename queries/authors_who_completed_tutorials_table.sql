
SELECT 'Authors with published scripts',
COUNT(DISTINCT s.author_id) FROM user_scripts s

UNION

SELECT 'Did not attempt tutorial',
COUNT(DISTINCT s.author_id) FROM user_scripts s
WHERE s.author_id NOT IN (SELECT DISTINCT author_id FROM tutorials_by_normalauthor)

UNION


SELECT 'Did attempt tutorial',
COUNT(DISTINCT s.author_id) FROM user_scripts s
WHERE s.author_id IN (SELECT DISTINCT author_id FROM tutorials_by_normalauthor)

UNION

SELECT 'Attempted but completed 0 tutorials',
COUNT(DISTINCT ta.author_id) FROM tutorials_by_normalauthor ta
WHERE ta.author_id NOT IN (SELECT DISTINCT author_id FROM tutorials_by_author WHERE is_completed = TRUE)

UNION

SELECT 'Completed 1 tutorial', COUNT(*) FROM
(SELECT COUNT(DISTINCT author_id)
FROM tutorials_by_normalauthor ta
WHERE is_completed = TRUE
GROUP BY author_id
HAVING COUNT(author_id) = 1) onetutorial

UNION

SELECT 'Completed 2+ tutorials', COUNT(*) FROM
(SELECT COUNT(DISTINCT author_id)
FROM tutorials_by_normalauthor ta
WHERE is_completed = TRUE
GROUP BY author_id
HAVING COUNT(author_id) >= 2) twotutorials
