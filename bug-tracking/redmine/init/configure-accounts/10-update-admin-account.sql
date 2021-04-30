UPDATE
  users
SET
  login = 'admin_ohmewae5ahyo',
  firstname = 'admin',
  lastname = 'ohmewae5ahyo',
  must_change_passwd = false
WHERE
  id = 1;

UPDATE
  email_addresses
SET
  address = 'admin_ohmewae5ahyo@backpack.test'
WHERE
  id = 1;
