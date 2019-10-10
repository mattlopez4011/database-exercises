-- Albums released after 1991
SELECT 'I am output!' AS 'Info';
DELETE FROM albums WHERE release_date >= 1991;

-- Albums with the genre 'disco'
SELECT 'I am output!' AS 'Info';
DELETE FROM albums WHERE genre = 'disco';

-- Albums by 'Whitney Houston' (...or maybe an artist of your choice)
SELECT 'I am output!' AS 'Info';
DELETE FROM albums WHERE artist = 'Whitney Houston';

