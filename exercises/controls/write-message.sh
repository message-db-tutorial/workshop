function write-message {
  local stream_name=${1:-$(stream-name)}
  local message_type=${2:-$(message_type)}
  local data=${3:-$(data)}

  message_id=$(echo $(uuidgen) | tr '[:upper:]' '[:lower:]')

  ./psql.sh -f exercises/controls/write-message.sql \
    --variable message_id="$message_id" \
    --variable stream_name="$stream_name" \
    --variable message_type="$message_type" \
    --variable data="$data"
}
