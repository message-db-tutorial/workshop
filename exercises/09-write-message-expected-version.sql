SELECT write_message(
  :'message_id',
  :'stream_name',
  'SomeMessageType',
  '{"some_attribute": "some value"}',
  '{}',
  :'expected_version'
);
