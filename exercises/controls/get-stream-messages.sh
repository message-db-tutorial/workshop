function get-stream-messages {
  local stream_name=$1

  ./psql.sh -f exercises/controls/get-stream-messages.sql \
    --variable stream_name="$stream_name"
}
