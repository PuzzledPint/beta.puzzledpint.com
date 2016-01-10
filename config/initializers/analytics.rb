require 'segment/analytics'

Analytics = Segment::Analytics.new({
    write_key: ENV['SEGMENT_IO_KEY'],
    on_error: Proc.new { |status, msg| print msg }
})
