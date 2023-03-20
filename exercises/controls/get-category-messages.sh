function get-category-messages {
  local category=$1

  ./psql.sh -f exercises/controls/get-category-messages.sql \
    --variable category="$category"
}
