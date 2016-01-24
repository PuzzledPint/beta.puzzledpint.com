require 'segment/analytics'

opts = {
  write_key: ENV['SEGMENT_IO_KEY'],
  on_error: Proc.new { |_, msg| Rails.logger.error(msg) }
}

opts.merge(stub: true) unless Rails.env.production?

Analytics = Segment::Analytics.new(opts)
