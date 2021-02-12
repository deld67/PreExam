/*●	Сделать запросы, считающие и выводящие в понятном виде:
○	ошибки в расписании (фильмы накладываются друг на друга), отсортированные по возрастанию времени. 
Выводить надо колонки:
	«фильм 1», «время начала», «длительность», «фильм 2», «время начала», «длительность»;
○	перерывы 30 минут и более между фильмами — выводить по уменьшению длительности перерыва. 
	Колонки «фильм 1», «время начала», «длительность», «время начала второго фильма», «длительность перерыва»;
○	список фильмов, для каждого — с указанием общего числа посетителей за все время, среднего числа зрителей за сеанс и общей суммы сборов по каждому 
*/

/*ошибки в расписании*/

select c1.name as cinema,  f1.name as film1, fs1.time as begin_time,  f1.duration,  f2.name as film2, fs2.time as begin_time2, f2.duration
from film_session fs1
inner join cinema c1 on c1.id = fs1.cinema_id
inner join films f1 on f1.id = fs1.films_id, 
film_session fs2
inner join films f2 on f2.id = fs2.films_id 
where fs1.cinema_id = fs2.cinema_id and fs2.id != fs1.id 
	and fs2.time >= fs1.time and fs2.time <= date_add(fs1.time, INTERVAL f1.duration MINUTE)
order by cinema,  begin_time;


/*перерывы 30 минут и более между фильмами*/

select  c1.name as cinema,  f1.name as film1, fs1.time as begin_time,  f1.duration, 
 fs2.time, (time_to_sec(fs2.time) - time_to_sec(date_add(fs1.time, INTERVAL f1.duration MINUTE)))/60 as pause
from film_session fs1
inner join cinema c1 on c1.id = fs1.cinema_id
inner join films f1 on f1.id = fs1.films_id, 
film_session fs2
inner join films f2 on f2.id = fs2.films_id
where fs1.cinema_id = fs2.cinema_id 
	and fs1.id !=  fs2.id
    and fs2.time > date_add(fs1.time, INTERVAL f1.duration+30 MINUTE) 
    and not exists 
		(select 1 from film_session fs3 
			where fs3.cinema_id = fs2.cinema_id 
				and fs3.time >= date_add(fs1.time, INTERVAL f1.duration+30 MINUTE) 
					and  fs3.time <= fs2.time and fs3.id != fs2.id and fs3.id != fs1.id )
order by cinema,  pause desc


/*список фильмов, для каждого — с указанием общего числа посетителей за все время
, среднего числа зрителей за сеанс и 
общей суммы сборов по каждому */
select sel.film_name as film, sum(count_person_sess) as all_person, sum(count_person_sess)/count(1), sum(summa_sbor_sess) sbor
from ( select f.name film_name,  fs.id sess_id,  
		sum(t.price) as summa_sbor_sess,
		count(1) as count_person_sess
		from tickets t, film_session_has_tickets ft, film_session fs, films f
		where t.id = ft.tickets_id and fs.id = ft.film_session_id and f.id = fs.films_id
	group by f.name, sess_id
    ) sel
group by sel.film_name   