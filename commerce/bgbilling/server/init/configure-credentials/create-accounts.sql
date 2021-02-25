-- Сервис -> Администрирование -> Пользователи и права -> Пользователи

ALTER TABLE `user` auto_increment = 200;

INSERT INTO `user`(id, login, pswd, email, gr, crm_user_id, dt, `name`, descr, config) VALUES
  ( 42, 'installer_gaedeerei4wi', upper(md5('ai6is1tae3ya')), '', 0, 0, now(), 'Инсталлятор',   '', ''),
  (100, 'api_fah4iew1idie',       upper(md5('iepec4jee2lo')), '', 0, 0, now(), 'API',           'It''s Okay to say "I don''t know!" There''s no shame in that! The only shame is to pretend that we know everything.', ''),
  (101, 'admin_fu4aixied1eo',     upper(md5('ufumeing4aic')), '', 0, 0, now(), 'Администратор', 'Bluetooth Ninja', '');
