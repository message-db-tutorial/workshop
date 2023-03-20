function write-message-with-metadata {
  local stream_name=${1:-$(stream-name)}
  local message_type=${2:-$(stream-name)}
  local data=${3:-'{"someAttribute": "some value"}'}

  message_id=$(echo $(uuidgen) | tr '[:upper:]' '[:lower:]')

  ./psql.sh -f exercises/controls/write-message-with-metadata.sql \
    --variable message_id="$message_id" \
    --variable stream_name="$stream_name" \
    --variable message_type="$message_type" \
    --variable data="$data" \
    --variable metadata="$metadata"
}
