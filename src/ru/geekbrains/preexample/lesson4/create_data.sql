INSERT INTO `cinema`.`cinema`(`id`,`name`)VALUES
(1,'Родина'),
(2,'Победа'),
(3,'Нева');

INSERT INTO `cinema`.`films` (`id`, `name`, `duration`) VALUES
(1, 'Лето', 30 ),
(2, 'Война и Мир', 120 ),
(3, 'Пираты', 60 );


INSERT INTO `cinema`.`film_session`(`id`,`time`,`cinema_id`,`films_id`)VALUES
(1,'09:00:00',1,1), 
(2,'09:00:00',2,1), 
(3,'09:00:00',3,1), 
(4,'10:15:00',1,2), 
(5,'10:15:00',2,2), 
(6,'10:15:00',3,2), 
(7,'11:00:00',1,3), 
(8,'11:00:00',2,3), 
(9,'11:00:00',3,3);

INSERT INTO `cinema`.`tickets` (`id`,`price`)VALUES
(1,100),
(2,300),
(3,150),
(4,103),
(5,170),
(6,108),
(7,140),
(8,105),
(9,190),
(10,10),
(11,90),
(12,107);

INSERT INTO `cinema`.`film_session_has_tickets` (`film_session_id`,`tickets_id`)VALUES
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(8,8),
(9,9),
(9,10),
(8,11),
(7,12);
