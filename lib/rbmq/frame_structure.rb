require 'frame_structure/body'
require 'frame_structure/header'

#
# Frame format
#   COMMAND
#   header1:value1
#   header2:value2
#
#   Body^@
module Rbmq
  module FrameStructure
    class Frame

      attr_accessor :command, :headers, :body

      def initialize command, header_entries, body
	@command = command
	create_headers_by header_entries
	@body = Body.new body
      end

      private
      def create_headers_by header_entries
	@headers = header_entries.map { |entry| Header.new(entry) }
      end
    end
  end
end
