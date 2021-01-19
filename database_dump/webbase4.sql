-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Янв 19 2021 г., 19:29
-- Версия сервера: 10.3.25-MariaDB-0ubuntu0.20.04.1
-- Версия PHP: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `webbase4`
--

-- --------------------------------------------------------

--
-- Структура таблицы `wb4_config`
--

CREATE TABLE `wb4_config` (
  `wb4_id` int(11) NOT NULL,
  `wb4_name` varchar(128) DEFAULT NULL,
  `wb4_tag` varchar(128) DEFAULT NULL,
  `wb4_value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `wb4_config`
--

INSERT INTO `wb4_config` (`wb4_id`, `wb4_name`, `wb4_tag`, `wb4_value`) VALUES
(1, 'Заголовок', 'sitetitle', 'Webbase 4'),
(2, 'Текст кнопки назад', 'btn_back', 'Назад'),
(3, 'Текст кнопки создать', 'btn_create', 'Создать'),
(4, 'Текст кнопки копировать', 'btn_copy', 'Копировать'),
(5, 'Текст кнопки изменить', 'btn_edit', 'Изменить'),
(6, 'Текст кнопки удалить', 'btn_delete', 'Удалить'),
(7, 'Текст кнопки модули', 'btn_mods', 'Модули'),
(8, 'Текст кнопки помощь', 'btn_help', ''),
(9, 'Текст кнопки выход', 'btn_logout', ''),
(10, 'Текст кнопки вход', 'btn_login', 'Вход'),
(11, 'Текст Имя входа', 'label_login', 'Логин'),
(12, 'Текст Пароль входа', 'label_pass', 'Пароль '),
(13, 'Сервер обновлений', 'update_server', 'https://munexul.host/'),
(14, 'Ключ для выполнения CRON', 'mod_cronkey', '22632486-2a15-4cde-8be6-73cd44c7421f');

-- --------------------------------------------------------

--
-- Структура таблицы `wb4_libs`
--

CREATE TABLE `wb4_libs` (
  `wb4_id` int(11) NOT NULL,
  `wb4_url` varchar(512) DEFAULT NULL,
  `wb4_order` int(11) DEFAULT NULL,
  `wb4_type` varchar(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `wb4_libs`
--

INSERT INTO `wb4_libs` (`wb4_id`, `wb4_url`, `wb4_order`, `wb4_type`) VALUES
(1, '/libs/ckeditor/ckeditor.js', 1, 'js'),
(5, '/libs/ckeditor/config.js', 2, 'js'),
(6, '/libs/datepicker/datepicker.js', 3, 'js'),
(7, '/libs/datepicker/datepicker.css', 4, 'css'),
(8, 'https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/js/select2.min.js', 5, 'js'),
(9, 'https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/css/select2.min.css', 6, 'css');

-- --------------------------------------------------------

--
-- Структура таблицы `wb4_menu`
--

CREATE TABLE `wb4_menu` (
  `wb4_id` int(11) NOT NULL,
  `wb4_title` varchar(128) DEFAULT NULL,
  `wb4_link` varchar(512) DEFAULT NULL,
  `wb4_parent` int(11) DEFAULT NULL,
  `wb4_scheme_id` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `wb4_menu`
--

INSERT INTO `wb4_menu` (`wb4_id`, `wb4_title`, `wb4_link`, `wb4_parent`, `wb4_scheme_id`) VALUES
(4, 'Редактор меню', '?r=scheme/show&schemeid=3', 15, 3),
(5, 'Группы схем', '?r=scheme/show&schemeid=17', 14, 1),
(7, 'Связи схем', '?r=scheme/show&schemeid=4', 14, 4),
(8, 'Плагины', '?r=scheme/show&schemeid=5', 16, 5),
(9, 'Пользователи', '?r=scheme/show&schemeid=8', 12, 8),
(10, 'Группы пользователей', '?r=scheme/show&schemeid=9', 12, 9),
(11, 'Конструктор', '#', NULL, 0),
(12, 'Доступы', '#', 11, 0),
(14, 'Архитектор', '#', 11, 0),
(15, 'Интерфейс', '#', 11, 0),
(16, 'Дополнения', '#', 11, 0),
(17, 'Модули', '?r=scheme/show&schemeid=12', 16, 12),
(18, 'Библиотеки', '?r=scheme/show&schemeid=15', 16, 15),
(19, 'Настройки', '?r=scheme/show&schemeid=18', 15, 18);

-- --------------------------------------------------------

--
-- Структура таблицы `wb4_module`
--

CREATE TABLE `wb4_module` (
  `wb4_id` int(11) NOT NULL,
  `wb4_title` varchar(128) NOT NULL,
  `wb4_folder` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `wb4_module`
--

INSERT INTO `wb4_module` (`wb4_id`, `wb4_title`, `wb4_folder`) VALUES
(1, 'Генерация схемы', 'mod_scheme_generator'),
(2, 'Импорт из excel', 'mod_import_xls');

-- --------------------------------------------------------

--
-- Структура таблицы `wb4_module_rights`
--

CREATE TABLE `wb4_module_rights` (
  `wb4_id` int(11) NOT NULL,
  `wb4_module_id` int(11) NOT NULL,
  `wb4_user_group_id` int(11) NOT NULL,
  `wb4_allow` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `wb4_module_rights`
--

INSERT INTO `wb4_module_rights` (`wb4_id`, `wb4_module_id`, `wb4_user_group_id`, `wb4_allow`) VALUES
(1, 1, 1, 1),
(2, 2, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `wb4_plugin`
--

CREATE TABLE `wb4_plugin` (
  `wb4_id` int(11) NOT NULL,
  `wb4_plugin_group_id` int(11) NOT NULL,
  `wb4_title` varchar(128) NOT NULL,
  `wb4_file` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `wb4_plugin`
--

INSERT INTO `wb4_plugin` (`wb4_id`, `wb4_plugin_group_id`, `wb4_title`, `wb4_file`) VALUES
(1, 2, 'Ссылка (вид)', 'wb4_view_link'),
(2, 2, 'fontawesome   (вид)', 'wb4_view_fa'),
(3, 2, 'Связанные поля   (вид)', 'wb4_view_linkedfield'),
(4, 2, 'Отметка  (вид)', 'wb4_view_checkbox'),
(5, 2, 'Иконка fa  (вид)', 'wb4_view_ico'),
(6, 1, 'Строка (ввод - по умолчанию)', 'wb4_input_string'),
(7, 1, 'Текст (ввод)', 'wb4_input_text'),
(8, 1, 'Select2 (ввод)', 'wb4_input_select2'),
(9, 1, 'Отметка (ввод)', 'wb4_input_checkbox'),
(13, 2, 'Пароль (вид)', 'wb4_view_password'),
(14, 1, 'Пароль (ввод)', 'wb4_input_password'),
(15, 1, 'CKEditor (Ввод)', 'wb4_input_ckeditor'),
(16, 2, 'Путь связанного поля (вид)', 'wb4_view_fieldpath'),
(17, 1, 'Select2 запрос SQL (Ввод)', 'wb4_input_select2_query'),
(18, 2, 'Поле SQL (Вид)', 'wb4_view_field_query'),
(19, 1, 'Дата-время (Ввод)', 'wb4_input_datetime'),
(20, 1, 'Text-CKEditor (Ввод)', 'wb4_input_ck_txt');

-- --------------------------------------------------------

--
-- Структура таблицы `wb4_plugin_group`
--

CREATE TABLE `wb4_plugin_group` (
  `wb4_id` int(11) NOT NULL,
  `wb4_title` varchar(128) NOT NULL,
  `wb4_type` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `wb4_plugin_group`
--

INSERT INTO `wb4_plugin_group` (`wb4_id`, `wb4_title`, `wb4_type`) VALUES
(1, 'Плагины ввода', 'input'),
(2, 'Плагины отображения', 'view');

-- --------------------------------------------------------

--
-- Структура таблицы `wb4_scheme`
--

CREATE TABLE `wb4_scheme` (
  `wb4_id` int(11) NOT NULL,
  `wb4_title` varchar(64) DEFAULT NULL,
  `wb4_ico` varchar(128) DEFAULT NULL,
  `wb4_scheme_group` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `wb4_scheme`
--

INSERT INTO `wb4_scheme` (`wb4_id`, `wb4_title`, `wb4_ico`, `wb4_scheme_group`) VALUES
(1, 'Схемы', 'fas fa-th-large', 1),
(2, 'Поля схем', 'fas fa-th', 1),
(3, 'Меню', 'fas fa-ellipsis-v', 1),
(4, 'Связи схем', 'fas fa-link', 1),
(5, 'Группы плагинов', 'fas fa-plug', 1),
(6, 'Связи плагин-поле', 'fas fa-plug', 1),
(7, 'Плагины', 'fas fa-plug', 1),
(8, 'Пользователи', 'fas fa-user', 1),
(9, 'Группы пользователей', 'fas fa-user', 1),
(10, 'Связь пользователь-группа', 'fas fa-user', 1),
(11, 'Права схем', 'fas fa-user', 1),
(12, 'Модули', 'fas fa-puzzle-piece', 1),
(13, 'Связь схема-модуль', 'fas fa-puzzle-piece', 1),
(14, 'Права модулей', 'fas fa-user', 1),
(15, 'Библиотеки', 'fas fa-puzzle-piece', 1),
(17, 'Группы схем', 'fas fa-square', 1),
(18, 'Настройки', 'fas fa-cog', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `wb4_scheme_fields`
--

CREATE TABLE `wb4_scheme_fields` (
  `wb4_id` int(11) NOT NULL,
  `wb4_scheme_id` int(11) DEFAULT NULL,
  `wb4_title` varchar(128) DEFAULT NULL,
  `wb4_base` varchar(128) DEFAULT NULL,
  `wb4_table` varchar(128) DEFAULT NULL,
  `wb4_field` varchar(128) DEFAULT NULL,
  `wb4_key` tinyint(1) DEFAULT 0,
  `wb4_order` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `wb4_scheme_fields`
--

INSERT INTO `wb4_scheme_fields` (`wb4_id`, `wb4_scheme_id`, `wb4_title`, `wb4_base`, `wb4_table`, `wb4_field`, `wb4_key`, `wb4_order`) VALUES
(1, 1, '#', NULL, 'wb4_scheme', 'wb4_id', 1, 0),
(2, 1, 'Имя схемы', NULL, 'wb4_scheme', 'wb4_title', 0, 3),
(3, 2, '#', NULL, 'wb4_scheme_fields', 'wb4_id', 1, 0),
(4, 2, 'Схема', NULL, 'wb4_scheme_fields', 'wb4_scheme_id', 0, 0),
(5, 2, 'Заголовок', NULL, 'wb4_scheme_fields', 'wb4_title', 0, 0),
(6, 2, 'База', NULL, 'wb4_scheme_fields', 'wb4_base', 0, 0),
(7, 2, 'Таблица', NULL, 'wb4_scheme_fields', 'wb4_table', 0, 0),
(8, 2, 'Поле', NULL, 'wb4_scheme_fields', 'wb4_field', 0, 0),
(9, 2, 'Ключ', NULL, 'wb4_scheme_fields', 'wb4_key', 0, 0),
(10, 3, '#', NULL, 'wb4_menu', 'wb4_id', 1, 0),
(11, 3, 'Заголовок', NULL, 'wb4_menu', 'wb4_title', 0, 0),
(12, 3, 'Ссылка', NULL, 'wb4_menu', 'wb4_link', 0, 0),
(13, 4, '#', NULL, 'wb4_scheme_links', 'wb4_id', 1, 0),
(14, 4, 'Схема', NULL, 'wb4_scheme_links', 'wb4_master_field', 0, 0),
(15, 4, 'Связанная схема', NULL, 'wb4_scheme_links', 'wb4_slave_field', 0, 0),
(16, 4, 'Заголовок', NULL, 'wb4_scheme_links', 'wb4_title', 0, 0),
(17, 5, '#', NULL, 'wb4_plugin_group', 'wb4_id', 1, 0),
(18, 5, 'Заголовок', NULL, 'wb4_plugin_group', 'wb4_title', 0, 0),
(19, 6, '#', NULL, 'wb4_scheme_fields_plugins', 'wb4_id', 1, 0),
(20, 6, 'Поле схемы', NULL, 'wb4_scheme_fields_plugins', 'wb4_field_id', 0, 0),
(21, 6, 'Плагин', NULL, 'wb4_scheme_fields_plugins', 'wb4_plugin_id', 0, 0),
(22, 5, 'Ключ группы', NULL, 'wb4_plugin_group', 'wb4_type', 0, 0),
(23, 7, '#', NULL, 'wb4_plugin', 'wb4_id', 1, 0),
(24, 7, 'Группа', NULL, 'wb4_plugin', 'wb4_plugin_group_id', 0, 0),
(25, 7, 'Заголовок', NULL, 'wb4_plugin', 'wb4_title', 0, 0),
(26, 7, 'Файл', NULL, 'wb4_plugin', 'wb4_file', 0, 0),
(27, 1, 'Иконка', NULL, 'wb4_scheme', 'wb4_ico', 0, 1),
(28, 2, 'Порядок', NULL, 'wb4_scheme_fields', 'wb4_order', 0, 0),
(29, 6, 'Конфигурация', NULL, 'wb4_scheme_fields_plugins', 'wb4_config', 0, 0),
(30, 4, 'Иконка', NULL, 'wb4_scheme_links', 'wb4_ico', 0, 0),
(31, 8, '#', NULL, 'wb4_user', 'wb4_id', 1, 0),
(32, 8, 'Имя', NULL, 'wb4_user', 'wb4_name', 0, 0),
(33, 8, 'Пароль', NULL, 'wb4_user', 'wb4_password', 0, 0),
(34, 8, 'Активен', NULL, 'wb4_user', 'wb4_active', 0, 0),
(35, 9, '#', NULL, 'wb4_user_group', 'wb4_id', 1, 0),
(36, 9, 'Заголовок', NULL, 'wb4_user_group', 'wb4_title', 0, 0),
(37, 10, '#', NULL, 'wb4_user_map', 'wb4_id', 1, 0),
(38, 10, 'Группа', NULL, 'wb4_user_map', 'wb4_user_group_id', 0, 0),
(39, 10, 'Пользователь', NULL, 'wb4_user_map', 'wb4_user_id', 0, 0),
(40, 3, 'Потомок', NULL, 'wb4_menu', 'wb4_parent', 0, 0),
(41, 11, '#', NULL, 'wb4_scheme_rights', 'wb4_id', 1, 0),
(42, 11, 'Схема', NULL, 'wb4_scheme_rights', 'wb4_scheme_id', 0, 0),
(43, 11, 'Группа пользователя', NULL, 'wb4_scheme_rights', 'wb4_user_group_id', 0, 0),
(44, 11, 'Чтение', NULL, 'wb4_scheme_rights', 'wb4_r', 0, 0),
(45, 11, 'Запись', NULL, 'wb4_scheme_rights', 'wb4_w', 0, 0),
(46, 11, 'Удаление', NULL, 'wb4_scheme_rights', 'wb4_x', 0, 0),
(47, 3, 'Схема', NULL, 'wb4_menu', 'wb4_scheme_id', 0, 0),
(48, 12, '#', NULL, 'wb4_module', 'wb4_id', 1, 0),
(49, 12, 'Заголовок', NULL, 'wb4_module', 'wb4_title', 0, 0),
(50, 12, 'Папка', NULL, 'wb4_module', 'wb4_folder', 0, 0),
(51, 13, '#', NULL, 'wb4_scheme_module', 'wb4_id', 1, 0),
(52, 13, 'Схема', NULL, 'wb4_scheme_module', 'wb4_scheme_id', 0, 0),
(53, 13, 'Модуль', NULL, 'wb4_scheme_module', 'wb4_module_id', 0, 0),
(54, 13, 'Заголовок', NULL, 'wb4_scheme_module', 'wb4_module_title', 0, 0),
(55, 14, '#', NULL, 'wb4_module_rights', 'wb4_id', 1, 0),
(56, 14, 'Модуль', NULL, 'wb4_module_rights', 'wb4_module_id', 0, 1),
(57, 14, 'Группа пользователя', NULL, 'wb4_module_rights', 'wb4_user_group_id', 0, 2),
(58, 14, 'Разрешить', NULL, 'wb4_module_rights', 'wb4_allow', 0, 3),
(59, 15, '#', NULL, 'wb4_libs', 'wb4_id', 1, 0),
(60, 15, 'Ссылка', NULL, 'wb4_libs', 'wb4_url', 0, 1),
(61, 15, 'Порядок', NULL, 'wb4_libs', 'wb4_order', 0, 2),
(62, 1, 'Группа схем', NULL, 'wb4_scheme', 'wb4_scheme_group', 0, 2),
(63, 17, '#', NULL, 'wb4_scheme_group', 'wb4_id', 1, 0),
(64, 17, 'Название', NULL, 'wb4_scheme_group', 'wb4_title', 0, 1),
(65, 15, 'Тип', NULL, 'wb4_libs', 'wb4_type', 0, 2),
(66, 18, '#', '', 'wb4_config', 'wb4_id', 1, 0),
(67, 18, 'Название', '', 'wb4_config', 'wb4_name', 0, 1),
(68, 18, 'Тег', '', 'wb4_config', 'wb4_tag', 0, 2),
(69, 18, 'Значение', '', 'wb4_config', 'wb4_value', 0, 3),
(80, 13, 'Конфигурация', NULL, 'wb4_scheme_module', 'wb4_config', 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `wb4_scheme_fields_plugins`
--

CREATE TABLE `wb4_scheme_fields_plugins` (
  `wb4_id` int(11) NOT NULL,
  `wb4_field_id` int(11) NOT NULL,
  `wb4_plugin_id` int(11) NOT NULL,
  `wb4_config` varchar(1024) DEFAULT '[]'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `wb4_scheme_fields_plugins`
--

INSERT INTO `wb4_scheme_fields_plugins` (`wb4_id`, `wb4_field_id`, `wb4_plugin_id`, `wb4_config`) VALUES
(1, 12, 1, '[]'),
(2, 27, 2, '[]'),
(3, 24, 3, '{\"table\":\"wb4_plugin_group\",\"keyfield\":\"wb4_id\",\"titlefield\":\"wb4_title\"}'),
(4, 21, 3, '{\"table\":\"wb4_plugin\",\"keyfield\":\"wb4_id\",\"titlefield\":\"wb4_title\"}'),
(5, 30, 2, '[]'),
(6, 9, 4, '[]'),
(7, 29, 5, '{\"ico\":\"fas fa-cogs\"}'),
(8, 2, 6, '[]'),
(9, 29, 7, '[]'),
(10, 24, 8, '{\"table\":\"wb4_plugin_group\",\"keyfield\":\"wb4_id\",\"titlefield\":\"wb4_title\"}'),
(11, 21, 8, '{\"table\":\"wb4_plugin\",\"keyfield\":\"wb4_id\",\"titlefield\":\"wb4_title\"}'),
(12, 4, 3, '{\"table\":\"wb4_scheme\",\"keyfield\":\"wb4_id\",\"titlefield\":\"wb4_title\"}'),
(13, 4, 8, '{\"table\":\"wb4_scheme\",\"keyfield\":\"wb4_id\",\"titlefield\":\"wb4_title\"}'),
(14, 9, 9, '[]'),
(15, 34, 4, '[]'),
(16, 34, 9, '[]'),
(17, 33, 13, '[]'),
(18, 33, 14, '[]'),
(19, 38, 3, '{\"table\":\"wb4_user_group\",\"keyfield\":\"wb4_id\",\"titlefield\":\"wb4_title\"}'),
(20, 38, 8, '{\"table\":\"wb4_user_group\",\"keyfield\":\"wb4_id\",\"titlefield\":\"wb4_title\"}'),
(21, 39, 3, '{\"table\":\"wb4_user\",\"keyfield\":\"wb4_id\",\"titlefield\":\"wb4_name\"}'),
(22, 39, 8, '{\"table\":\"wb4_user\",\"keyfield\":\"wb4_id\",\"titlefield\":\"wb4_name\"}'),
(23, 40, 18, '{\"query\":\" SELECT\r\n             ifnull(concat(w4m1.wb4_title,\' > \',w4m.wb4_title),w4m.wb4_title)\r\n            FROM\r\n              wb4_menu as w4m\r\n              LEFT JOIN wb4_menu w4m1 on (w4m.wb4_parent=w4m1.wb4_id)\r\n            WHERE\r\n               w4m.wb4_id=[currentId]\",\r\n\"ico\":\"fas fa-database\",\r\n\"badge\":\"Y\"\r\n}'),
(24, 40, 17, '{\"query\":\" \r\n            SELECT\r\n               w4m.wb4_id as id,\r\n               ifnull(concat(w4m1.wb4_title,\' > \',w4m.wb4_title),w4m.wb4_title) as text\r\n            FROM\r\n               wb4_menu as w4m\r\n               LEFT JOIN wb4_menu w4m1 on (w4m.wb4_parent=w4m1.wb4_id) \r\n\",\r\n  \"search\":\" where (w4m.wb4_title like \'%[searchValue]%\' or w4m.wb4_id like \'%[searchValue]%\')  LIMIT 25\",\r\n  \"current\":\" where w4m.wb4_id =[currentId]\"     \r\n}\r\n'),
(25, 46, 4, '[]'),
(26, 46, 9, '[]'),
(27, 45, 4, '[]'),
(28, 45, 9, '[]'),
(29, 44, 4, '[]'),
(30, 44, 9, '[]'),
(31, 43, 3, '{\"table\":\"wb4_user_group\",\"keyfield\":\"wb4_id\",\"titlefield\":\"wb4_title\"}'),
(32, 43, 8, '{\"table\":\"wb4_user_group\",\"keyfield\":\"wb4_id\",\"titlefield\":\"wb4_title\"}'),
(33, 42, 18, '{\"query\":\"\r\n             SELECT        \r\n              concat(w4sg.wb4_title,\' > \',w4s.wb4_title) as text\r\n            FROM   \r\n               wb4_scheme as w4s,\r\n               wb4_scheme_group as w4sg\r\n            WHERE\r\n               w4sg.wb4_id=w4s.wb4_scheme_group\r\n            AND\r\n              w4s .wb4_id=[currentId]\r\n\",\r\n\"ico\":\"fas fa-database\",\r\n\"badge\":\"Y\"}'),
(34, 42, 17, '{\"query\":\"\r\n             SELECT\r\n               w4s .wb4_id as id,\r\n              concat(\'(\',w4s .wb4_id,\') \',w4sg.wb4_title,\' > \',w4s.wb4_title) as text\r\n            FROM   \r\n               wb4_scheme as w4s,\r\n               wb4_scheme_group as w4sg\r\n            WHERE\r\n               w4sg.wb4_id=w4s.wb4_scheme_group\",\r\n\"search\":\" and (w4s.wb4_title like \'%[searchValue]%\' or w4s.wb4_id like \'%[searchValue]%\')  LIMIT 25\",\r\n\"current\":\" and w4s.wb4_id =[currentId]\"}'),
(35, 54, 7, '[]'),
(36, 52, 3, '{\"table\":\"wb4_scheme\",\"keyfield\":\"wb4_id\",\"titlefield\":\"wb4_title\"}'),
(37, 52, 8, '{\"table\":\"wb4_scheme\",\"keyfield\":\"wb4_id\",\"titlefield\":\"wb4_title\"}'),
(38, 53, 3, '{\"table\":\"wb4_module\",\"keyfield\":\"wb4_id\",\"titlefield\":\"wb4_title\"}'),
(39, 53, 8, '{\"table\":\"wb4_module\",\"keyfield\":\"wb4_id\",\"titlefield\":\"wb4_title\"}'),
(40, 56, 3, '{\"table\":\"wb4_module\",\"keyfield\":\"wb4_id\",\"titlefield\":\"wb4_title\"}'),
(41, 56, 8, '{\"table\":\"wb4_module\",\"keyfield\":\"wb4_id\",\"titlefield\":\"wb4_title\"}'),
(42, 57, 3, '{\"table\":\"wb4_user_group\",\"keyfield\":\"wb4_id\",\"titlefield\":\"wb4_title\"}'),
(43, 57, 8, '{\"table\":\"wb4_user_group\",\"keyfield\":\"wb4_id\",\"titlefield\":\"wb4_title\"}'),
(44, 58, 4, '[]'),
(45, 58, 9, '[]'),
(47, 62, 8, '{\"table\":\"wb4_scheme_group\",\"keyfield\":\"wb4_id\",\"titlefield\":\"wb4_title\"}'),
(48, 62, 3, '{\"table\":\"wb4_scheme_group\",\"keyfield\":\"wb4_id\",\"titlefield\":\"wb4_title\"}'),
(49, 14, 18, '{\"query\":\" SELECT\r\n              concat(w4s.wb4_title,\' > \',w4sf.wb4_title)\r\n            FROM\r\n               wb4_scheme_fields as w4sf,\r\n               wb4_scheme as w4s  \r\n            WHERE\r\n               w4s.wb4_id=w4sf.wb4_scheme_id\r\n            AND\r\n               w4sf.wb4_id=[currentId]\",\r\n\"ico\":\"fas fa-database\",\r\n\"badge\":\"Y\"\r\n}'),
(51, 14, 17, '{\"query\":\"\r\n             SELECT\r\n               w4sf.wb4_id as id,\r\n              concat(\'(\',w4sf.wb4_id,\') \',w4s.wb4_title,\' > \',w4sf.wb4_title) as text\r\n            FROM\r\n               wb4_scheme_fields as w4sf,\r\n               wb4_scheme as w4s  \r\n            WHERE\r\n               w4s.wb4_id=w4sf.wb4_scheme_id\",\r\n\"search\":\" and (w4sf.wb4_title like \'%[searchValue]%\' or w4sf.wb4_id like \'%[searchValue]%\')  LIMIT 25\",\r\n\"current\":\" and w4sf.wb4_id =[currentId]\"}'),
(53, 15, 18, '{\"query\":\" SELECT\r\n              concat(w4s.wb4_title,\' > \',w4sf.wb4_title)\r\n            FROM\r\n               wb4_scheme_fields as w4sf,\r\n               wb4_scheme as w4s  \r\n            WHERE\r\n               w4s.wb4_id=w4sf.wb4_scheme_id\r\n            AND\r\n               w4sf.wb4_id=[currentId]\",\r\n\"ico\":\"fas fa-database\",\r\n\"badge\":\"Y\"\r\n}'),
(54, 15, 17, '{\"query\":\"\r\n             SELECT\r\n               w4sf.wb4_id as id,\r\n              concat(\'(\',w4sf.wb4_id,\') \',w4s.wb4_title,\' > \',w4sf.wb4_title) as text\r\n            FROM\r\n               wb4_scheme_fields as w4sf,\r\n               wb4_scheme as w4s  \r\n            WHERE\r\n               w4s.wb4_id=w4sf.wb4_scheme_id\",\r\n\"search\":\" and (w4sf.wb4_title like \'%[searchValue]%\' or w4sf.wb4_id like \'%[searchValue]%\')  LIMIT 25\",\r\n\"current\":\" and w4sf.wb4_id =[currentId]\"}');

-- --------------------------------------------------------

--
-- Структура таблицы `wb4_scheme_group`
--

CREATE TABLE `wb4_scheme_group` (
  `wb4_id` int(11) NOT NULL,
  `wb4_title` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `wb4_scheme_group`
--

INSERT INTO `wb4_scheme_group` (`wb4_id`, `wb4_title`) VALUES
(1, 'Конструктор');

-- --------------------------------------------------------

--
-- Структура таблицы `wb4_scheme_links`
--

CREATE TABLE `wb4_scheme_links` (
  `wb4_id` int(11) NOT NULL,
  `wb4_master_field` int(11) DEFAULT NULL,
  `wb4_slave_field` int(11) DEFAULT NULL,
  `wb4_title` varchar(128) DEFAULT NULL,
  `wb4_ico` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `wb4_scheme_links`
--

INSERT INTO `wb4_scheme_links` (`wb4_id`, `wb4_master_field`, `wb4_slave_field`, `wb4_title`, `wb4_ico`) VALUES
(1, 1, 4, 'Поля схем', 'fas fa-th'),
(2, 3, 20, 'Плагины поля', 'fas fa-plug'),
(3, 17, 24, 'Плагины', 'fas fa-plug'),
(4, 31, 39, 'Группа пользователя', 'fas fa-user'),
(5, 35, 43, 'Права схем', 'fas fa-user'),
(6, 1, 52, 'Модули', 'fas fa-puzzle-piece'),
(7, 35, 57, 'Права модулей', 'fas fa-user'),
(8, 63, 62, 'Схемы', 'fas fa-th-large');

-- --------------------------------------------------------

--
-- Структура таблицы `wb4_scheme_module`
--

CREATE TABLE `wb4_scheme_module` (
  `wb4_id` int(11) NOT NULL,
  `wb4_scheme_id` int(11) NOT NULL,
  `wb4_module_id` int(11) NOT NULL,
  `wb4_module_title` varchar(128) NOT NULL,
  `wb4_config` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `wb4_scheme_module`
--

INSERT INTO `wb4_scheme_module` (`wb4_id`, `wb4_scheme_id`, `wb4_module_id`, `wb4_module_title`, `wb4_config`) VALUES
(1, 2, 1, '', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `wb4_scheme_rights`
--

CREATE TABLE `wb4_scheme_rights` (
  `wb4_id` int(11) NOT NULL,
  `wb4_scheme_id` int(11) NOT NULL,
  `wb4_user_group_id` int(11) NOT NULL,
  `wb4_r` int(11) NOT NULL,
  `wb4_w` int(11) NOT NULL,
  `wb4_x` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `wb4_scheme_rights`
--

INSERT INTO `wb4_scheme_rights` (`wb4_id`, `wb4_scheme_id`, `wb4_user_group_id`, `wb4_r`, `wb4_w`, `wb4_x`) VALUES
(1, 1, 1, 1, 1, 1),
(2, 2, 1, 1, 1, 1),
(3, 3, 1, 1, 1, 1),
(4, 4, 1, 1, 1, 1),
(5, 5, 1, 1, 1, 1),
(6, 7, 1, 1, 1, 1),
(7, 8, 1, 1, 1, 1),
(8, 9, 1, 1, 1, 1),
(9, 10, 1, 1, 1, 1),
(10, 11, 1, 1, 1, 1),
(12, 3, 3, 1, 0, 0),
(13, 12, 1, 1, 1, 1),
(14, 13, 1, 1, 1, 1),
(15, 6, 1, 1, 1, 1),
(16, 14, 1, 1, 1, 1),
(17, 15, 1, 1, 1, 1),
(18, 17, 1, 1, 1, 1),
(19, 18, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `wb4_user`
--

CREATE TABLE `wb4_user` (
  `wb4_id` int(11) NOT NULL,
  `wb4_name` varchar(128) DEFAULT NULL,
  `wb4_password` varchar(128) DEFAULT NULL,
  `wb4_active` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `wb4_user`
--

INSERT INTO `wb4_user` (`wb4_id`, `wb4_name`, `wb4_password`, `wb4_active`) VALUES
(1, 'admin', 'demo', 1),
(2, 'user', 'demo', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `wb4_user_group`
--

CREATE TABLE `wb4_user_group` (
  `wb4_id` int(11) NOT NULL,
  `wb4_title` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `wb4_user_group`
--

INSERT INTO `wb4_user_group` (`wb4_id`, `wb4_title`) VALUES
(1, 'Администраторы'),
(3, 'Редакторы');

-- --------------------------------------------------------

--
-- Структура таблицы `wb4_user_map`
--

CREATE TABLE `wb4_user_map` (
  `wb4_id` int(11) NOT NULL,
  `wb4_user_id` int(11) NOT NULL,
  `wb4_user_group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `wb4_user_map`
--

INSERT INTO `wb4_user_map` (`wb4_id`, `wb4_user_id`, `wb4_user_group_id`) VALUES
(1, 1, 1),
(2, 2, 3);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `wb4_config`
--
ALTER TABLE `wb4_config`
  ADD PRIMARY KEY (`wb4_id`);

--
-- Индексы таблицы `wb4_libs`
--
ALTER TABLE `wb4_libs`
  ADD PRIMARY KEY (`wb4_id`);

--
-- Индексы таблицы `wb4_menu`
--
ALTER TABLE `wb4_menu`
  ADD PRIMARY KEY (`wb4_id`),
  ADD KEY `wb4_parent` (`wb4_parent`);

--
-- Индексы таблицы `wb4_module`
--
ALTER TABLE `wb4_module`
  ADD PRIMARY KEY (`wb4_id`);

--
-- Индексы таблицы `wb4_module_rights`
--
ALTER TABLE `wb4_module_rights`
  ADD PRIMARY KEY (`wb4_id`),
  ADD KEY `wb4_module_id` (`wb4_module_id`),
  ADD KEY `wb4_user_group_id` (`wb4_user_group_id`);

--
-- Индексы таблицы `wb4_plugin`
--
ALTER TABLE `wb4_plugin`
  ADD PRIMARY KEY (`wb4_id`),
  ADD KEY `wb4_plugin_group_id` (`wb4_plugin_group_id`);

--
-- Индексы таблицы `wb4_plugin_group`
--
ALTER TABLE `wb4_plugin_group`
  ADD PRIMARY KEY (`wb4_id`);

--
-- Индексы таблицы `wb4_scheme`
--
ALTER TABLE `wb4_scheme`
  ADD PRIMARY KEY (`wb4_id`),
  ADD KEY `wb4_scheme_group` (`wb4_scheme_group`);

--
-- Индексы таблицы `wb4_scheme_fields`
--
ALTER TABLE `wb4_scheme_fields`
  ADD PRIMARY KEY (`wb4_id`),
  ADD KEY `wb4_scheme_id` (`wb4_scheme_id`);

--
-- Индексы таблицы `wb4_scheme_fields_plugins`
--
ALTER TABLE `wb4_scheme_fields_plugins`
  ADD PRIMARY KEY (`wb4_id`),
  ADD KEY `wb4_field_id` (`wb4_field_id`),
  ADD KEY `wb4_plugin_id` (`wb4_plugin_id`);

--
-- Индексы таблицы `wb4_scheme_group`
--
ALTER TABLE `wb4_scheme_group`
  ADD PRIMARY KEY (`wb4_id`),
  ADD KEY `wb4_id` (`wb4_id`);

--
-- Индексы таблицы `wb4_scheme_links`
--
ALTER TABLE `wb4_scheme_links`
  ADD PRIMARY KEY (`wb4_id`),
  ADD KEY `wb4_master_field` (`wb4_master_field`),
  ADD KEY `wb4_slave_field` (`wb4_slave_field`);

--
-- Индексы таблицы `wb4_scheme_module`
--
ALTER TABLE `wb4_scheme_module`
  ADD PRIMARY KEY (`wb4_id`),
  ADD KEY `wb4_scheme_id` (`wb4_scheme_id`),
  ADD KEY `wb4_module_id` (`wb4_module_id`);

--
-- Индексы таблицы `wb4_scheme_rights`
--
ALTER TABLE `wb4_scheme_rights`
  ADD PRIMARY KEY (`wb4_id`),
  ADD KEY `wb4_scheme_id` (`wb4_scheme_id`),
  ADD KEY `wb4_user_group_id` (`wb4_user_group_id`);

--
-- Индексы таблицы `wb4_user`
--
ALTER TABLE `wb4_user`
  ADD PRIMARY KEY (`wb4_id`);

--
-- Индексы таблицы `wb4_user_group`
--
ALTER TABLE `wb4_user_group`
  ADD PRIMARY KEY (`wb4_id`);

--
-- Индексы таблицы `wb4_user_map`
--
ALTER TABLE `wb4_user_map`
  ADD PRIMARY KEY (`wb4_id`),
  ADD KEY `wb4_user_id` (`wb4_user_id`),
  ADD KEY `wb4_user_group_id` (`wb4_user_group_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `wb4_config`
--
ALTER TABLE `wb4_config`
  MODIFY `wb4_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблицы `wb4_libs`
--
ALTER TABLE `wb4_libs`
  MODIFY `wb4_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `wb4_menu`
--
ALTER TABLE `wb4_menu`
  MODIFY `wb4_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT для таблицы `wb4_module`
--
ALTER TABLE `wb4_module`
  MODIFY `wb4_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `wb4_module_rights`
--
ALTER TABLE `wb4_module_rights`
  MODIFY `wb4_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `wb4_plugin`
--
ALTER TABLE `wb4_plugin`
  MODIFY `wb4_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT для таблицы `wb4_plugin_group`
--
ALTER TABLE `wb4_plugin_group`
  MODIFY `wb4_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `wb4_scheme`
--
ALTER TABLE `wb4_scheme`
  MODIFY `wb4_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT для таблицы `wb4_scheme_fields`
--
ALTER TABLE `wb4_scheme_fields`
  MODIFY `wb4_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT для таблицы `wb4_scheme_fields_plugins`
--
ALTER TABLE `wb4_scheme_fields_plugins`
  MODIFY `wb4_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT для таблицы `wb4_scheme_group`
--
ALTER TABLE `wb4_scheme_group`
  MODIFY `wb4_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `wb4_scheme_links`
--
ALTER TABLE `wb4_scheme_links`
  MODIFY `wb4_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `wb4_scheme_module`
--
ALTER TABLE `wb4_scheme_module`
  MODIFY `wb4_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `wb4_scheme_rights`
--
ALTER TABLE `wb4_scheme_rights`
  MODIFY `wb4_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT для таблицы `wb4_user`
--
ALTER TABLE `wb4_user`
  MODIFY `wb4_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `wb4_user_group`
--
ALTER TABLE `wb4_user_group`
  MODIFY `wb4_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `wb4_user_map`
--
ALTER TABLE `wb4_user_map`
  MODIFY `wb4_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `wb4_module_rights`
--
ALTER TABLE `wb4_module_rights`
  ADD CONSTRAINT `wb4_module_rights_ibfk_1` FOREIGN KEY (`wb4_module_id`) REFERENCES `wb4_module` (`wb4_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `wb4_module_rights_ibfk_2` FOREIGN KEY (`wb4_user_group_id`) REFERENCES `wb4_user_group` (`wb4_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `wb4_plugin`
--
ALTER TABLE `wb4_plugin`
  ADD CONSTRAINT `wb4_plugin_ibfk_1` FOREIGN KEY (`wb4_plugin_group_id`) REFERENCES `wb4_plugin_group` (`wb4_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `wb4_scheme`
--
ALTER TABLE `wb4_scheme`
  ADD CONSTRAINT `wb4_scheme_ibfk_1` FOREIGN KEY (`wb4_scheme_group`) REFERENCES `wb4_scheme_group` (`wb4_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `wb4_scheme_fields`
--
ALTER TABLE `wb4_scheme_fields`
  ADD CONSTRAINT `wb4_scheme_fields_ibfk_1` FOREIGN KEY (`wb4_scheme_id`) REFERENCES `wb4_scheme` (`wb4_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `wb4_scheme_fields_plugins`
--
ALTER TABLE `wb4_scheme_fields_plugins`
  ADD CONSTRAINT `wb4_scheme_fields_plugins_ibfk_1` FOREIGN KEY (`wb4_field_id`) REFERENCES `wb4_scheme_fields` (`wb4_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `wb4_scheme_fields_plugins_ibfk_2` FOREIGN KEY (`wb4_plugin_id`) REFERENCES `wb4_plugin` (`wb4_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `wb4_scheme_links`
--
ALTER TABLE `wb4_scheme_links`
  ADD CONSTRAINT `wb4_scheme_links_ibfk_1` FOREIGN KEY (`wb4_master_field`) REFERENCES `wb4_scheme_fields` (`wb4_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `wb4_scheme_links_ibfk_2` FOREIGN KEY (`wb4_slave_field`) REFERENCES `wb4_scheme_fields` (`wb4_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `wb4_scheme_module`
--
ALTER TABLE `wb4_scheme_module`
  ADD CONSTRAINT `wb4_scheme_module_ibfk_1` FOREIGN KEY (`wb4_module_id`) REFERENCES `wb4_module` (`wb4_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `wb4_scheme_module_ibfk_2` FOREIGN KEY (`wb4_scheme_id`) REFERENCES `wb4_scheme` (`wb4_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `wb4_scheme_rights`
--
ALTER TABLE `wb4_scheme_rights`
  ADD CONSTRAINT `wb4_scheme_rights_ibfk_1` FOREIGN KEY (`wb4_scheme_id`) REFERENCES `wb4_scheme` (`wb4_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `wb4_scheme_rights_ibfk_2` FOREIGN KEY (`wb4_user_group_id`) REFERENCES `wb4_user_group` (`wb4_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `wb4_user_map`
--
ALTER TABLE `wb4_user_map`
  ADD CONSTRAINT `wb4_user_map_ibfk_1` FOREIGN KEY (`wb4_user_group_id`) REFERENCES `wb4_user_group` (`wb4_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `wb4_user_map_ibfk_2` FOREIGN KEY (`wb4_user_id`) REFERENCES `wb4_user` (`wb4_id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
