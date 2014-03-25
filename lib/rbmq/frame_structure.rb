require_relative 'frame_structure/body'
require_relative 'frame_structure/header'
require_relative 'frame_structure/command'

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

      def to_s
        command.to_s + "\n" + inspect_headers + "\n\n" + @body.to_s
      end

      def inspect_headers
        headers.map(&:to_s).join('\n')
      end

      private
      def create_headers_by header_entries
        @headers = header_entries.map { |entry| Header.new(entry[0], entry[1]) }
      end
    end
  end
end
