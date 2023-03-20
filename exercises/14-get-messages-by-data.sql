SELECT
  *
FROM
  messages
WHERE
  data->>'someAttribute' = :'some_attribute_value';
