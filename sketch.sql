insert into messages (id, stream_name, position, type, data) values (
  uuid('00000001-ffff-ffff-ffff-ffffffffffff'),
  'someStreamName',
  1,
  'SomeMessageType',
  '{"attribute": "some value"}'
);
