#!/usr/bin/env ruby

puts <<~TEXT

Write Messages
= = =

TEXT

instances = ENV.fetch('INSTANCES', 9).to_i
puts "INSTANCES: #{instances}#{' (default)' if not ENV.key?('INSTANCES')}"

streams = ENV.fetch('STREAMS', 9).to_i
puts "STREAMS: #{streams}#{' (default)' if not ENV.key?('STREAMS')}"

puts

system("./clear-messages.sh", exception: true)

categories = [
  "someCategory",
  "someOtherCategory",
  "yetAnotherCategory"
].cycle

instances_per_stream, remainder = instances.divmod(streams)

(1..streams).each do |stream_index|
  stream_id = stream_index.to_s.rjust(8, '0')

  stream_id = "#{stream_id}-ffff-ffff-ffff-ffffffffffff"

  category = categories.next

  stream_name = "#{category}-#{stream_id}"

  if stream_index <= remainder
    instances = instances_per_stream + 1
  else
    instances = instances_per_stream
  end

  env = {
    'STREAM_NAME' => stream_name,
    'INSTANCES' => instances.to_s
  }

  system(env, "./write-message.sh", exception: true)
end

system("./print-messages.sh", exception: true)
