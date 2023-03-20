SELECT
  *
FROM
  messages
WHERE
  metadata->>'someMetaAttribute' = :'some_meta_attribute_value';
