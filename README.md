# Audiobooks User Behaviour Analysis (SQL)

SQL analysis of how users listen to audiobooks: who adds books, how long they listen and which books they finish.

## Questions answered
1. How many users added *Coraline* and listened to more than 10% of it
2. Number of users and total listening hours by operating system and book (test listenings excluded)
3. The book with the largest number of listeners
4. The book that is most often listened to the end

## Techniques
`JOIN` across three tables (`audiobooks`, `audio_cards`, `listenings`), `GROUP BY`, aggregations, time calculations with `EXTRACT(EPOCH ...)`, filtering test data.

## Files
- `мини проект-2 (1).sql` — queries
- `Мини проект 2 (4).docx` — task description and answers

**Stack:** PostgreSQL / MySQL
