SELECT write_message(
  gen_random_uuid()::varchar,
  'someStreamName',
  'SomeMessageType',
  '{"some_attribute": "some value"}'
);
