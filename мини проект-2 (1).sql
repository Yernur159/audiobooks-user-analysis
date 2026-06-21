
--1.	Выведите сколько пользователей добавили книгу 'Coraline', сколько пользователей прослушало больше 10%
select count(ac.user_id) FROM audiobooks a
JOIN audio_cards ac ON ac.audiobook_uuid = a.uuid
JOIN listenings l ON l.audiobook_uuid = a.uuid
where a.title='Coraline' and ((((round(extract(epoch from (finished_at-started_at)))))/duration)*100)>10;


--2.	По каждой операционной системе и названию книги выведите количество пользователей, сумму прослушивания в часах, не учитывая тестовые прослушивания. 
select l.os_name,title,count(ac.user_id),sum((round(extract(epoch from (finished_at-started_at))))/3600) FROM audiobooks a
JOIN audio_cards ac ON ac.audiobook_uuid = a.uuid
JOIN listenings l ON l.audiobook_uuid = a.uuid
where l.is_test<>'1'
group by l.os_name,title

--3.	Найдите книгу, которую слушает больше всего людей
select title,count(ac.user_id) as count_user FROM audiobooks a
JOIN audio_cards ac ON ac.audiobook_uuid = a.uuid
JOIN listenings l ON l.audiobook_uuid = a.uuid
group by title
order by count_user desc
limit 1 

--4.	Найдите книгу, которую чаще всего дослушивают до конца.
select title FROM audiobooks a
JOIN audio_cards ac ON ac.audiobook_uuid = a.uuid
JOIN listenings l ON l.audiobook_uuid = a.uuid
where state='finished'
group by title 