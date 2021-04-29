UPDATE
  users
SET
  login = 'admin_ohmewae5ahyo',
  hashed_password = 'a650bb89e39f24dbece650ab56f629255a23d9e9',
  salt = 'd35cc06732ff90d6e5b16046c827bf52',
  must_change_passwd = false,
  firstname = 'admin',
  lastname = 'ohmewae5ahyo'
WHERE
  id = 1;

UPDATE
  email_addresses
SET
  address = 'admin_ohmewae5ahyo@backpack.test'
WHERE
  id = 1;
