-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Июн 01 2023 г., 04:53
-- Версия сервера: 10.4.27-MariaDB
-- Версия PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `visual_novel`
--

-- --------------------------------------------------------

--
-- Структура таблицы `characters`
--

CREATE TABLE `characters` (
  `character_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `emotion` varchar(5) NOT NULL,
  `img` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `characters`
--

INSERT INTO `characters` (`character_id`, `name`, `emotion`, `img`) VALUES
(1, 'kiki', 'usual', 'img/kiki.png'),
(2, 'volker', 'usual', 'img/volker.png'),
(3, 'stranger', 'usual', 'img/old_woman.png'),
(4, 'stranger_m', 'usual', 'img/stranger_man.png'),
(5, 'stranger_g', 'usual', 'img/stranger_girl.png'),
(6, 'stranger_grandpa', 'usual', 'img/stranger_grandpa.png'),
(7, 'madam_lira', '', 'img/madam_lira.png'),
(8, 'matias', 'usual', 'img/matias.png'),
(9, 'madam_jen', 'usual', 'img/madam_jen.png'),
(10, 'stranger_grandma', 'usual', 'img/stranger_grandma.png'),
(11, 'stranger_girl_leafs', 'usual', 'img/stranger_girl_leafs.png');

-- --------------------------------------------------------

--
-- Структура таблицы `choices`
--

CREATE TABLE `choices` (
  `choice_id` int(11) NOT NULL,
  `dialogue_id` int(11) NOT NULL,
  `text` text NOT NULL,
  `next_dialogue_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `choices`
--

INSERT INTO `choices` (`choice_id`, `dialogue_id`, `text`, `next_dialogue_id`) VALUES
(1, 1, 'Как такое может быть? Магия и SQL?', 2),
(2, 2, 'И как мы будем учиться?', 3),
(3, 3, 'Звучит интересно! Но я никогда не учил SQL.', 4),
(4, 4, 'Я готов начать! ', 5),
(5, 4, 'А что если выбрать неправильный вариант?', 6),
(6, 4, 'А что если я застрял на определенном уровне?', 7),
(7, 5, 'Вперед!', 10),
(8, 6, 'Я готов начать!', 5),
(9, 6, 'А что если я застрял на определенном уровне?', 8),
(10, 7, 'Я готов начать! ', 5),
(11, 8, 'Ясно, спасибо за помощь. Давайте начнем игру!', 10),
(13, 7, 'А что если выбрать неправильный вариант?', 9),
(14, 9, 'Ясно, спасибо за помощь. Давайте начнем игру!\r\n', 10),
(15, 10, 'Вот так, сегодня у нас школьная церемония. Но я совсем новенькая в этом городе и не знаю, как добраться до школы.', 11),
(16, 11, 'Ладно, не нужно нервничать, я просто спрошу дорогу у местных жителей, они наверняка уже все тут знают', 12),
(17, 12, 'Хорошо, осталось выбрать наряд и отправляться на школьную церемонию', 13),
(18, 13, 'Ну что же, осталось найти прохожих, которые смогут мне помочь', 14),
(19, 14, 'Пойти направо', 15),
(20, 14, 'Пойти налево', 83),
(21, 14, 'Пойти прямо', 84),
(22, 15, '(Эта бабушка выглядит доброжелательной. Может быть она подскажет мне как добраться в школу магов)', 16),
(23, 16, 'Здравствуйте! Извините, Вы не подскажите как добраться до школы магов?', 17),
(24, 16, 'Здаров, бабуль! Где здесь школа магов?', 17),
(25, 17, 'Я хотела узнать у Вас не знаете ли Вы как добраться до школы магов?', 18),
(26, 17, 'Чего не расслышала? Говорю как до школы магов добрать?', 25),
(27, 18, 'Правда? А Вы не помните как до туда добраться? Я только приехала сюда и не знаю дорогу', 19),
(28, 19, 'CREATE? Это же одно из основных заклинаний той школы', 20),
(29, 20, '...', 21),
(30, 21, 'Ого! Это очень необычно.. Думаю, я смогу их все запомнить, пока добираюсь до школы!', 22),
(38, 22, 'А Вы не подскажите какие станции следуют после CREATE?', 23),
(39, 23, 'Ничего страшного, не переживайте! Спасибо Вам за помощь!', 24),
(40, 24, 'Спасибо!', 26),
(41, 26, '(Какая милая бабушка! Ну что ж, тогда нужно разузнать еще у кого-нибудь дальнейшую дорогу в школу.)', 27),
(42, 27, 'Пойти вперед', 28),
(43, 27, 'Вернуться назад', 29),
(44, 28, 'Вернуться назад', 27),
(46, 29, 'Пойти направо', 27),
(47, 29, 'Пойти налево', 111),
(48, 29, 'Пойти прямо', 30),
(49, 30, 'Пойти направо', 31),
(50, 30, 'Вернуться назад', 29),
(51, 31, '(О, думаю, этот парень может мне помочь)', 32),
(52, 32, 'Э.. Да, извини, ты не подскажешь как добраться до школы магов? Я знаю что сначала нужно отправиться на станцию CREATE, но дальше мне путь неизвестен.', 33),
(53, 33, 'Так ты подскажешь как туда добраться?', 34),
(54, 34, 'О, я слышала про это заклинание, оно очень часто используется среди магов!', 35),
(55, 35, 'Как интересно! А как его используют на практике?', 36),
(56, 36, 'Так...', 37),
(57, 37, 'О! Это так удобно!', 38),
(58, 38, 'Стой, а какие следующие ста...', 39),
(59, 39, '(Он ушел...)', 40),
(60, 40, '(Что ж, теперь я знаю две станции, чтобы добраться до школы. Первая - это CREATE, а после нее следует SELECT. Нужно пойти дальше и поискать других прохожих)', 41),
(61, 41, 'Вернуться назад', 42),
(62, 42, 'Пойти направо', 41),
(63, 42, 'Вернуться назад', 43),
(64, 43, '(Ой, кажется ей нужна помощь)', 44),
(65, 44, 'Извини, тебе помочь?', 45),
(66, 45, 'Готово!', 46),
(67, 46, 'Пожалуйста! А что случилось?', 47),
(68, 47, 'О.. понятно. А можно у тебя кое-что узнать? ', 48),
(69, 48, 'Ты же знаешь школу магов?', 49),
(70, 49, 'О, круто! А ты не знаешь как туда добраться? Я узнала от других людей только две станции, которые ведут в эту школу - CREATE и SELECT.', 50),
(71, 50, 'О, спасибо большое! Я знаю, что станции названы в честь главных заклинаний в этой школе. Но о DELETE ни разу не слышала.', 51),
(72, 51, 'Правда? То есть оно помогает что то убрать?', 52),
(73, 52, 'Ааа, вон оно как! Это очень интересное и полезное заклинание!', 53),
(74, 53, 'А... Стой!', 54),
(75, 54, 'Сегодня всем что ли нужно куда то бежать...', 55),
(76, 55, '(Так, насколько я помню всего этих заклинаний 4, поэтому осталось узнать последнюю станцию!)', 56),
(77, 56, 'Пойти направо', 59),
(78, 56, 'Пойти налево', 61),
(79, 56, 'Пойти вперед', 57),
(80, 57, 'Пойти направо', 58),
(81, 57, 'Вернуться назад', 56),
(82, 58, 'Вернуться назад', 57),
(83, 59, 'Пойти прямо', 60),
(84, 59, 'Вернуться назад', 56),
(85, 60, 'Вернуться назад', 59),
(86, 61, '(Что за странный старичок...)', 62),
(87, 62, '(Обойду-ка я его стороной...)', 63),
(88, 63, '(О, Боже, кажется, он меня заметил...)', 64),
(89, 64, 'Что? Откуда Вы знаете?', 65),
(90, 65, '(Кажется, он проигнорировал мой вопрос...)', 66),
(91, 66, 'Эээ... Ясно. (Какой-же он странный...)', 67),
(92, 67, 'Ээ... Ну, давайте, у вас есть кисточка?', 68),
(93, 68, '(Он меня только что высмеял?..)', 69),
(94, 69, 'Как Вы это сделали? Вы что маг?!', 70),
(95, 70, 'Но почему Вы...', 71),
(96, 71, '(Он не дает мне и слова вставить...)', 72),
(97, 72, 'А, точно! Нужно торопиться!', 73),
(98, 73, 'Спасибо!', 74),
(99, 74, 'Он исчез... До чего же странный старик...', 75),
(100, 75, '(Так, у нас нет времени на лишние размышления, нужно спешить на школьную церемонию! На какие станции нужно идти?)', 76),
(101, 77, '(Кажется, я даже не опоздала)', 78),
(102, 78, '(О, это же тот самый старик!)', 79),
(103, 79, '(А это всеми известная мадам Лира! Хотела бы я стать таким же сильным магом как она...)', 80),
(104, 80, '(А этот мужчина выглядит очень жутко...)', 81),
(105, 81, '...', 82),
(106, 82, '(Завершить эпизод)', 112),
(107, 83, 'Вернуться назад', 14),
(108, 84, 'Пойти направо', 85),
(109, 84, 'Вернуться назад', 14),
(110, 85, 'Вернуться назад', 84),
(111, 25, '...', 86),
(112, 86, '(Кажется, нужно было быть повежливее...)', 87),
(113, 87, '(Нужно догнать ее и извиниться)', 88),
(114, 88, 'Пойти вперед', 93),
(115, 88, 'Вернуться назад', 89),
(116, 89, 'Пойти направо', 88),
(117, 89, 'Пойти налево', 90),
(118, 90, 'Вернуться назад', 89),
(119, 89, 'Пойти прямо', 91),
(120, 91, 'Пойти направо', 92),
(121, 91, 'Вернуться назад', 89),
(122, 92, 'Вернуться назад', 91),
(123, 93, '(Вот она, нужно скорее извиниться и попросить помощи)', 94),
(124, 94, 'Бабушка, извините, меня, пожалуйста, за то что нагрубила Вам.', 95),
(125, 95, 'Я хотела узнать у вас дорогу...', 96),
(126, 96, '...', 97),
(127, 97, '(Так стыдно)', 98),
(128, 98, 'Извините, что так получилось!', 99),
(129, 99, '...', 100),
(130, 100, 'Я только приехала в этот город и не знаю как добраться до школы магов, сможете ли Вы мне помочь?', 101),
(131, 101, 'Да, я только поступила, и сегодня у нас школьная церемония.', 102),
(132, 102, 'Кажется, я где то слышала такое название...', 103),
(133, 103, 'Правда? Так интересно! А что делает это заклинание?', 104),
(134, 104, 'Надеюсь, я скоро освою его. А какие следующие станции?', 105),
(135, 105, '...', 106),
(136, 106, 'Как жалко... Но спасибо Вам за помощь!', 107),
(137, 107, '(Очень неловко)', 108),
(138, 108, 'Спасибо Вам!', 109),
(139, 109, 'Спасибо!', 110),
(140, 110, '(Ну что ж, тогда нужно разузнать еще у кого-нибудь дальнейшую дорогу в школу)', 28),
(141, 111, 'Вернуться назад', 29);

-- --------------------------------------------------------

--
-- Структура таблицы `dialogues`
--

CREATE TABLE `dialogues` (
  `dialogue_id` int(11) NOT NULL,
  `scene_id` int(11) NOT NULL,
  `character_id` int(11) DEFAULT NULL,
  `text` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `dialogues`
--

INSERT INTO `dialogues` (`dialogue_id`, `scene_id`, `character_id`, `text`) VALUES
(1, 2, 2, 'Добро пожаловать в мир магии и SQL запросов! Я буду вашим гидом в этом увлекательном путешествии.'),
(2, 2, 2, 'В этом мире, все существа и объекты имеют свои атрибуты и свойства, которые можно изучить и использовать с помощью SQL запросов. Например, вы можете узнать, какими заклинаниями владеет конкретный маг, или какова мощность магического артефакта.'),
(3, 2, 2, 'Мы будем использовать визуальную новеллу, где вы будете играть роль молодого волшебника, который только что поступил в школу магов, где собирается изучить все про SQL-запросе и стать самым сильным выпускником. В ходе игры, вы будете выполнять различные задания и решать головоломки, используя SQL запросы.'),
(4, 2, 2, 'Не волнуйтесь, я буду объяснять вам каждый SQL запрос и помогу вам понять, как он работает. Главное, что вам нужно знать, это то, что SQL - это язык структурированных запросов, который позволяет работать с базами данных.'),
(5, 2, 2, 'Тогда давайте начнем наше путешествие и выучим SQL запросы вместе!'),
(6, 2, 2, 'Не беспокойтесь, выбор неправильного варианта не повлияет на ваше продвижение в игре. Вы сможете попробовать еще раз и выбрать правильный ответ.'),
(7, 2, 2, 'Если вы застряли на каком-то уровне, то мы можем провести дополнительное обучение и попробовать пройти уровень вместе. Мы можем обсудить, какие запросы и техники нужны для решения задач на этом уровне, и я помогу вам разобраться с ними.'),
(8, 2, 2, 'Если вы застряли на каком-то уровне, то мы можем провести дополнительное обучение и попробовать пройти уровень вместе. Мы можем обсудить, какие запросы и техники нужны для решения задач на этом уровне, и я помогу вам разобраться с ними.'),
(9, 2, 2, 'Не беспокойтесь, выбор неправильного варианта приведет к небольшим наказаниям, но это не повлияет на ваше продвижение в игре. Вы сможете попробовать еще раз и выбрать правильный вариант.'),
(10, 1, NULL, NULL),
(11, 1, NULL, NULL),
(12, 1, NULL, NULL),
(13, 3, NULL, NULL),
(14, 3, NULL, NULL),
(15, 4, 3, '...'),
(16, 4, 3, '...'),
(17, 4, 3, 'Ой, юная леди, простите, я не расслышала вас. Что вы сказали?'),
(18, 4, 3, 'Школу магов?... О, да-да! Конечно, я помню эту школу. Правда, это было очень давно, когда я ходила туда...'),
(19, 4, 3, 'Хмм... Кажется, Вам, юная леди, нужно отправиться сначала на станцию CREATE.. А потом... '),
(20, 4, 3, 'А, да! Станции до школы названы в честь главных заклинаний, которым вам предстоит научиться. И CREATE - это одно из самых важных заклинаний, которое позволяет создавать что-то новое. '),
(21, 4, 3, 'В школе волшебников она используется для создания новых предметов или существ с помощью магии.'),
(22, 4, 3, 'Верно, детка! Ваше путешествие будет незабываемым, и я уверена, что вы справитесь со всеми испытаниями. Удачи вам в школе волшебников!'),
(23, 4, 3, 'Ох... Это было так давно, я совсем не помню куда там дальше идти'),
(24, 4, 3, 'Пожалуйста, юная леди! Удачи Вам на школьной церемонии!'),
(25, 4, 3, 'Какая невоспитанная юная леди! Боюсь я ничем не могу Вам помочь!'),
(26, 4, NULL, NULL),
(27, 4, NULL, NULL),
(28, 5, NULL, NULL),
(29, 3, NULL, NULL),
(30, 6, NULL, NULL),
(31, 7, 4, '...'),
(32, 7, 4, 'Ты что-то хотела?'),
(33, 7, 4, 'О, школа магов... В этом году так много новых учеников.'),
(34, 7, 4, 'А, да, конечно. После CREATE  идет станция SELECT.'),
(35, 7, 4, 'Да, SELECT очень важное заклинание. Заклинание SELECT - это магическая сила, позволяющая магам находить то, что они ищут в море информации.'),
(36, 7, 4, 'Ну, например, в школе магии есть огромная библиотека с тысячами книг. Заклинание SELECT дает тебе возможность выбирать книги на основе различных критериев.'),
(37, 7, 4, 'Например, ты можешь сказать: \"SELECT книги, написанные великими магами\" или \"SELECT книги по истории волшебства\". И тогда эти книги сразу появятся прямо перед тобой.'),
(38, 7, 4, 'Ой, я совсем с тобой заговорился! Я сейчас очень спешу, и мне нужно скорее бежать. Удачи тебе в школе магов!'),
(39, 7, NULL, ''),
(40, 7, NULL, NULL),
(41, 7, NULL, NULL),
(42, 6, NULL, NULL),
(43, 3, 11, '...'),
(44, 3, 11, '...'),
(45, 3, 11, 'Ой, да, было бы неплохо. Помоги, пожалуйста, стряхнуть все эти листья.'),
(46, 3, 5, 'Спасибо тебе! '),
(47, 3, 5, 'А, я лазила на дерево за своим котенком, но он убежал быстрее чем я залезла. Поэтому котенка я не поймала, а листья все собрала.'),
(48, 3, 5, 'Да, конечно! Чем я я могу тебе помочь?'),
(49, 3, 5, 'Школу магов? Да, конечно, я хочу поступать туда в следующем году!'),
(50, 3, 5, 'Да, как до туда добраться знают все в нашей деревне. Следующая станция, на которую тебе нужно будет отправиться называется DELETE.'),
(51, 3, 5, 'То, что ты мне сейчас помогла убрать листья полностью описывает суть этого заклинания! '),
(52, 3, 5, 'Заклинание DELETE позволяет нам указать цель для удаления. Например, умея пользоваться данным заклинанием, ты могла бы сказать: \"DELETE все листья\", и они сразу бы все убрались.'),
(53, 3, 5, 'Согласна! Ой, там мой котик пробежал, мне нужно его догнать!'),
(54, 3, NULL, NULL),
(55, 3, NULL, NULL),
(56, 3, NULL, NULL),
(57, 6, NULL, NULL),
(58, 7, NULL, NULL),
(59, 4, NULL, NULL),
(60, 5, NULL, NULL),
(61, 11, 6, 'Ту-ту-ту-пиду'),
(62, 11, 6, 'Падам-пиду-Пу!'),
(63, 11, 6, 'О! Девица красавица!'),
(64, 11, 6, 'Это же ты ищешь дорогу в школу магов, хе-хе...'),
(65, 11, 6, 'Даа... Школа магов... Замечательное место! Хе-хех'),
(66, 11, 6, 'А я тут как раз размешиваю краску для обновления цвета моего забора! Ту-ту-ту'),
(67, 11, 6, 'Краска готова! Кхехех, поможешь мне юная девица?'),
(68, 11, 6, 'Кисточка???? Ахахаах, тебе еще многому предстоит научиться!'),
(69, 11, 6, 'UPDATE краску на заборе в синий цвет! Хе-хе-хе-хе'),
(70, 12, 6, 'Еще какой! Это, юная девица, последняя твоя станция, замечательное заклинание UPDATE! Хе-хех'),
(71, 12, 6, 'UPDATE позволяет поменять вещи вокруг тебя! Оно так упрощает мне жизнь...'),
(72, 12, 6, 'Вы не забыли, что Ваша школьная церемония уже скоро начнется? А Вы все еще стоите тут!'),
(73, 12, 6, 'Не буду Вас больше задерживать! Удачи на школьной церемонии!'),
(74, 12, NULL, NULL),
(75, 12, NULL, NULL),
(76, 9, NULL, NULL),
(77, 10, NULL, NULL),
(78, 10, 6, 'Уважаемые ученики, учителя и почетные гости!\r\nСегодня мы собрались здесь, чтобы отпраздновать особый момент в жизни наших юных волшебников. '),
(79, 10, 7, 'Это школьная церемония, в которой мы вместе отмечаем достижения и потенциал каждого из нас. Это момент, когда мы единодушно говорим \"Да!\" новым знаниям, дружбе и приключениям, которые ожидают нас впереди.'),
(80, 10, 8, '...'),
(81, 10, 9, 'Пусть ваше путешествие в \"Magic SQooL\" станет источником вдохновения и невероятных открытий, и пусть магия всегда пребывает в ваших сердцах!'),
(82, 10, 9, 'Добро пожаловать в мир магии и SQL-запросов!'),
(83, 8, NULL, NULL),
(84, 6, NULL, NULL),
(85, 7, NULL, NULL),
(86, 4, NULL, NULL),
(87, 4, NULL, NULL),
(88, 4, NULL, NULL),
(89, 3, NULL, NULL),
(90, 8, NULL, NULL),
(91, 6, NULL, NULL),
(92, 7, NULL, NULL),
(93, 5, 3, '...'),
(94, 5, 3, '...'),
(95, 5, 3, 'Да, да, ты хотела что-то еще?'),
(96, 5, 10, 'Это та самая девчушка, о которой ты только что рассказывала?'),
(97, 5, 3, 'Да, та самая юная леди'),
(98, 5, 10, 'Дааа... Молодежь она всегда такая, совсем не уважает старших.'),
(99, 5, 3, 'Согласна с тобой. Но все же нужно им помогать, вырастут, поймут какого это быть старенькими.'),
(100, 5, 3, 'Напомни, пожалуйста, куда ты держишь дорогу?'),
(101, 5, 10, 'Ооо, да Вы юная волшебница! Мало в нашем городке таких.'),
(102, 5, 3, 'Первая станция, на которую тебе нужно будет отправиться, называется CREATE.'),
(103, 5, 10, 'Так все станции, ведущие в школу, названы в честь самых главных заклинаний этой школы.'),
(104, 5, 3, 'Это заклинание используется для создания новых предметов или существ с помощью магии.'),
(105, 5, 3, 'Ой, я совсем не помню куда нужно двигаться дальше. А ты как, Мадам Глориза?'),
(106, 5, 10, 'Ой, я и первую станцию не помню уж.'),
(107, 5, 3, 'Пожалуйста, юная леди. Надеюсь, в следующий раз вы будете помнить о манерах!'),
(108, 5, 3, 'Удачи тебе на школьной церемонии!'),
(109, 5, 10, 'Да, удачи тебе! Этому городку нужны юные талантливые маги!'),
(110, 5, NULL, NULL),
(111, 8, NULL, NULL),
(112, 10, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `episodes`
--

CREATE TABLE `episodes` (
  `episode_id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `cover` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `episodes`
--

INSERT INTO `episodes` (`episode_id`, `title`, `description`, `cover`) VALUES
(1, 'Основные элементы', 'В этом эпизоде главной героине необходимо попасть на школьную церемонию. Но есть одна проблема, она совсем не знает город и как добраться до школы. Придется просить помощи у жителей городка, чтобы найти дорогу и не опоздать на церемонию.', 'img/wallpaper_episode1.png');

-- --------------------------------------------------------

--
-- Структура таблицы `posters`
--

CREATE TABLE `posters` (
  `poster_id` int(11) NOT NULL,
  `episode_id` int(11) NOT NULL,
  `poster` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `posters`
--

INSERT INTO `posters` (`poster_id`, `episode_id`, `poster`) VALUES
(1, 1, 'img/lovely_grandma.png'),
(2, 1, 'img/student_school.png');

-- --------------------------------------------------------

--
-- Структура таблицы `posters_user`
--

CREATE TABLE `posters_user` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `poster_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `posters_user`
--

INSERT INTO `posters_user` (`id`, `user_id`, `poster_id`) VALUES
(1, 22, 1),
(2, 20, 1),
(10, 20, 2),
(19, 23, 1),
(20, 23, 2),
(21, 22, 2),
(22, 24, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `progress_user`
--

CREATE TABLE `progress_user` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `dialogue_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `progress_user`
--

INSERT INTO `progress_user` (`id`, `user_id`, `dialogue_id`) VALUES
(1, 22, 82),
(2, 20, 82),
(3, 23, 82),
(4, 24, 76);

-- --------------------------------------------------------

--
-- Структура таблицы `scenes`
--

CREATE TABLE `scenes` (
  `scene_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `scenes`
--

INSERT INTO `scenes` (`scene_id`, `name`, `img`) VALUES
(1, 'Комната', 'img/room.png'),
(2, 'Зал заклинаний', 'img/spells_holl.png'),
(3, 'Улица первая', 'img/street1.png'),
(4, 'Улица направо', 'img/street_right.png'),
(5, 'Улица направо-прямо', 'img/street_right_straight.png'),
(6, 'улица прямо', 'img/street_straight.png'),
(7, 'Улица прямо-направо', 'img/street_straight_right.png'),
(8, 'Улица-налево', 'img/street_left.png'),
(9, 'Карта с руками', 'img/map.png'),
(10, 'Актовый зал', 'img/main_holl.png'),
(11, 'fence', 'img/street_left_fence.png'),
(12, 'fence_blue', 'img/street_left_fence_blue.png');

-- --------------------------------------------------------

--
-- Структура таблицы `tokens`
--

CREATE TABLE `tokens` (
  `id` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `refreshToken` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `tokens`
--

INSERT INTO `tokens` (`id`, `user`, `refreshToken`) VALUES
(1, 17, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJsb2dpbiI6IkxlIiwiaWQiOjE3LCJpYXQiOjE2ODU0NTQ1ODUsImV4cCI6MTY'),
(2, 18, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJsb2dpbiI6IiIsImlkIjoxOCwiaWF0IjoxNjg1NDU5ODUxLCJleHAiOjE2ODg'),
(3, 19, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJsb2dpbiI6IiIsImlkIjoxOSwiaWF0IjoxNjg1NDU5OTUxLCJleHAiOjE2ODg'),
(19, 24, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJsb2dpbiI6InRlc3QiLCJpZCI6MjQsImlhdCI6MTY4NTU4NDQyOCwiZXhwIjoxNjg4MTc2NDI4fQ.tEo9Ub4l1IULGrpNgwe_4ZrJ_9oZW2ivxKp3Z3-P9a4');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `login` varchar(15) NOT NULL,
  `password` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `login`, `password`) VALUES
(1, 'help', '$2b$07$nWF/sNkNGlq.wPNBbZDYZuI.l5K42tEj8IF3eP.ebwSWc4LzH0/Y6'),
(2, 'helppp', '$2b$07$3sjOJRI.vyY4Wh7ydr.ezOeVRKXyTSM8jzRWsaYmHmwhLQNbRL7TC'),
(3, 'helpp', '$2b$07$ZsFOwZ9wA.lXbv7KDnY12.uBuTrJgCAQZfY3bacUYtZ8TRDMb3EVa'),
(4, 'hellpp', '$2b$07$XR743QtO3uH3jMb9jVGOOOiS2uTbfgWpSS77.SzQyUE8perLiV20i'),
(5, 'hellppppp', '$2b$07$5G3AeQ2TX91zHmtKvZa0/OlH4nBRUZWLokHqttGobBs3K.MHa.g3.'),
(6, 'hellpppp', '$2b$07$lrGfPMEA.FgskucxAWVKoOmdXnXYg9vTDnVl6vEMKTZII.x.xwJMi'),
(7, 'hellpplppp', '$2b$07$04PU0utq3FuFkcgXeqMnf.OTc1XrOt3JCRizHJFjfcvc3cg4zWIQi'),
(8, 'hellpplpp', '$2b$07$cFMb4IYsL7S6r/nPCY6Vu.duazSwbbzFN5.VTsYntOKMI8Rv2HXqa'),
(9, 'hellpplp', '$2b$07$q7l1zzjr7M8bOeDJB.WTFu/h5imAB0VD7gGYswZkfW.Qq29GoVDMa'),
(10, 'hellppl', '$2b$07$PbDX7aWzOIx6n4YiKOqL2uFP3X73TTxMJdiabHWZT9dt8vYGH0dqG'),
(11, 'helppl', '$2b$07$RejdHTxAL3NNlMQ7.SAPJuvV1j7YKW4xhbW2c3EMkiRkazAVn1Ciy'),
(12, 'elppl', '$2b$07$/243jFOCAO7wbQIIQAQoSu9LuXDxk75XfE6i/NtwvU6DfMboVx4ry'),
(13, 'elpl', '$2b$07$X/Xo73vwvyowx3jNtMtdU.hJ4gVDzJWs/lJQA6.BkdIz49CL1Yd1q'),
(14, 'ell', '$2b$07$W2RQsv54.zqUhaqtZz2wtu.Qdk2D2c.t0.BIq2jUfnVh4zvVNYv7m'),
(15, 'el', '$2b$07$KFpD.YKmEKBM3921nqNPeu.aJZ95wXkhEFi.UErKLG6Hho4YU7UJ.'),
(16, 'e', '$2b$07$jaj6FmTFXXvpl9CrNG.BfessIe.b.ze0rIesNVQNbMC0DRVJzrAbu'),
(17, 'Le', '$2b$07$Ew4Lud1Cg9ologT7E2WRIOBvv6LnWQ6qmehDtCr/Ttma5.i4IToWm'),
(18, 's', '$2b$07$IXnMkrDa7pKJrAVSlgi8/O0UpZB05p6Q5G844EZgBa.Xeo92ldTcm'),
(19, '', '$2b$07$2xTFddkllIR1Rs2uTlznxeLXPYoBl5geW4ZUyVuRQ5.y4H/xnGdGG'),
(20, 'f', '$2b$07$k6Rh64LpHjKjIt65/mvfjOrcx3nJYCK0Wi83jjrMHyCT7YXmeiT6C'),
(21, 'fas', '$2b$07$Au9512dEdln4suPA7dbi4O2CJ3dx0qd3v/vYeIkj2FROLQ3WHz37C'),
(22, 'marina', '$2b$07$uQ.49hJQjscxPSxUL9taBOfsqyj/TvEkIjdOGqTO5hMxv9i4kdKPi'),
(23, 'mmm', '$2b$07$Ooorr8bHddACAoFEoU6uzuRO77pOEyWL6arGsuQ3JJDd18vg43ciC'),
(24, 'test', '$2b$07$GoiIiphEv.TUVG582n55vefKugbjX53Z361saRAXxSgfh6ABkxKc6');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `characters`
--
ALTER TABLE `characters`
  ADD PRIMARY KEY (`character_id`);

--
-- Индексы таблицы `choices`
--
ALTER TABLE `choices`
  ADD PRIMARY KEY (`choice_id`),
  ADD KEY `dialogue_id` (`dialogue_id`),
  ADD KEY `next_dialogue_id` (`next_dialogue_id`);

--
-- Индексы таблицы `dialogues`
--
ALTER TABLE `dialogues`
  ADD PRIMARY KEY (`dialogue_id`),
  ADD KEY `scene_id` (`scene_id`),
  ADD KEY `character_id` (`character_id`);

--
-- Индексы таблицы `episodes`
--
ALTER TABLE `episodes`
  ADD PRIMARY KEY (`episode_id`);

--
-- Индексы таблицы `posters`
--
ALTER TABLE `posters`
  ADD PRIMARY KEY (`poster_id`),
  ADD KEY `episode_id` (`episode_id`);

--
-- Индексы таблицы `posters_user`
--
ALTER TABLE `posters_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `poster_id` (`poster_id`);

--
-- Индексы таблицы `progress_user`
--
ALTER TABLE `progress_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `dialogue_id` (`dialogue_id`);

--
-- Индексы таблицы `scenes`
--
ALTER TABLE `scenes`
  ADD PRIMARY KEY (`scene_id`);

--
-- Индексы таблицы `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user` (`user`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `characters`
--
ALTER TABLE `characters`
  MODIFY `character_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `choices`
--
ALTER TABLE `choices`
  MODIFY `choice_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;

--
-- AUTO_INCREMENT для таблицы `dialogues`
--
ALTER TABLE `dialogues`
  MODIFY `dialogue_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

--
-- AUTO_INCREMENT для таблицы `episodes`
--
ALTER TABLE `episodes`
  MODIFY `episode_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `posters`
--
ALTER TABLE `posters`
  MODIFY `poster_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `posters_user`
--
ALTER TABLE `posters_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT для таблицы `progress_user`
--
ALTER TABLE `progress_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `scenes`
--
ALTER TABLE `scenes`
  MODIFY `scene_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `choices`
--
ALTER TABLE `choices`
  ADD CONSTRAINT `choices_ibfk_1` FOREIGN KEY (`dialogue_id`) REFERENCES `dialogues` (`dialogue_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `choices_ibfk_2` FOREIGN KEY (`next_dialogue_id`) REFERENCES `dialogues` (`dialogue_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `dialogues`
--
ALTER TABLE `dialogues`
  ADD CONSTRAINT `dialogues_ibfk_1` FOREIGN KEY (`scene_id`) REFERENCES `scenes` (`scene_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `dialogues_ibfk_2` FOREIGN KEY (`character_id`) REFERENCES `characters` (`character_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `posters`
--
ALTER TABLE `posters`
  ADD CONSTRAINT `posters_ibfk_1` FOREIGN KEY (`episode_id`) REFERENCES `episodes` (`episode_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `posters_user`
--
ALTER TABLE `posters_user`
  ADD CONSTRAINT `posters_user_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `posters_user_ibfk_2` FOREIGN KEY (`poster_id`) REFERENCES `posters` (`poster_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `progress_user`
--
ALTER TABLE `progress_user`
  ADD CONSTRAINT `progress_user_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `progress_user_ibfk_2` FOREIGN KEY (`dialogue_id`) REFERENCES `dialogues` (`dialogue_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `tokens`
--
ALTER TABLE `tokens`
  ADD CONSTRAINT `tokens_ibfk_1` FOREIGN KEY (`user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
