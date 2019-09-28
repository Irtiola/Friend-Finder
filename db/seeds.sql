USE friends_db;

INSERT INTO question
    (q)
VALUES
    ("Your mind is always buzzing with unexplored ideas and plans"),
    ("Generally speaking, you rely more on your experience than your imagination"),
    ("You find it easy to stay relaxed and focused even when there is some pressure"),
    ("You rarely do something just out of sheer curiosity"),
    ("People can rarely upset you"),
    ("It is often difficult for you to relate to other people's feelings"),
    ("In a discussion, truth should be more important than people's sensitivities"),
    ("You rarely get carried away by fantasies and ideas"),
    ("You think that everyone's views should be respected regardless of whether they are supported by facts or not"),
    ("You feel more energetic after spending time with a group of people");

INSERT INTO scores
    (f_id, q_id, score)
VALUES
    (1, 1, 5),
    (1, 2, 3),
    (1, 3, 3),
    (1, 4, 4),
    (1, 5, 2),
    (1, 6, 1),
    (1, 7, 3),
    (1, 8, 5),
    (1, 9, 3),
    (1, 10, 5),
    (2, 1, 3),
    (2, 2, 3),
    (2, 3, 5),
    (2, 4, 5),
    (2, 5, 4),
    (2, 6, 1),
    (2, 7, 4),
    (2, 8, 1),
    (2, 9, 1),
    (2, 10, 3),
    (3, 1, 3),
    (3, 2, 3),
    (3, 3, 5),
    (3, 4, 4),
    (3, 5, 5),
    (3, 6, 3),
    (3, 7, 4),
    (3, 8, 1),
    (3, 9, 3),
    (3, 10, 1),
    (4, 1, 3),
    (4, 2, 4),
    (4, 3, 4),
    (4, 4, 2),
    (4, 5, 1),
    (4, 6, 5),
    (4, 7, 4),
    (4, 8, 3),
    (4, 9, 4),
    (4, 10, 3),
    (5, 1, 4),
    (5, 2, 2),
    (5, 3, 5),
    (5, 4, 2),
    (5, 5, 5),
    (5, 6, 4),
    (5, 7, 3),
    (5, 8, 4),
    (5, 9, 1),
    (5, 10, 5),
    (6, 1, 3),
    (6, 2, 4),
    (6, 3, 4),
    (6, 4, 2),
    (6, 5, 4),
    (6, 6, 5),
    (6, 7, 1),
    (6, 8, 3),
    (6, 9, 4),
    (6, 10, 5),
    (7, 1, 3),
    (7, 2, 2),
    (7, 3, 5),
    (7, 4, 4),
    (7, 5, 5),
    (7, 6, 1),
    (7, 7, 4),
    (7, 8, 1),
    (7, 9, 4),
    (7, 10, 4);

SELECT f.f_name, f.picture_link, GROUP_CONCAT(s.score) AS scores
FROM scores s JOIN friends f     USING (f_id)
GROUP BY f_id;

INSERT INTO friends
    (name, picture_link)
VALUES
    ('?', '?')
SELECT q_id, f_id, t2f_id, score_difference
FROM
    (SELECT *, (score-t2score) AS score_difference
    FROM
        (SELECT *
        FROM scores s1
            LEFT JOIN (SELECT q_id AS t2q_id, f_id AS t2f_id, score AS t2score
            FROM scores s2) t2
            ON t2q_id = s1.q_id) t3)t4;
​
