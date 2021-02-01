insert into management_profile(name, protocol, configuration) values
  ('SNMPv2 public', 1, '{"write": false, "version": "2", "community": "public"}'),
  ('SNMPv2 private', 1, '{"write": true, "version": "2", "community": "private"}');
