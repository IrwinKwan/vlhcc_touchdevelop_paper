-- Author statistics for authors who didn't try tutorials
SELECT DISTINCT
a.id, a.name, join_date, activedays, receivedpositivereviews, subscribers, score, 'notutorial'
FROM notutorial_scripts ts
JOIN normal_authors a ON ts.author_id = a.id

UNION

-- Author statistics for authors who completed 0 tutorials
SELECT DISTINCT
a.id, a.name, join_date, activedays, receivedpositivereviews, subscribers, score, '0tutorial'
FROM tutorial0_scripts ts
INNER JOIN normal_authors a ON ts.author_id = a.id

UNION

-- Author statistics for authors who completed 1 tutorial
SELECT DISTINCT
a.id, a.name, join_date, activedays, receivedpositivereviews, subscribers, score, '1tutorial'
FROM tutorial1_scripts ts
INNER JOIN normal_authors a ON ts.author_id = a.id

UNION

-- Author statistics for authors who completed 2+ tutorials
SELECT DISTINCT
a.id, a.name, join_date, activedays, receivedpositivereviews, subscribers, score, '2tutorial'
FROM tutorial2plus_scripts ts
INNER JOIN normal_authors a ON ts.author_id = a.id