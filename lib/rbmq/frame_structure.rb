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

      include Utils::Convertor

      attr_accessor :command, :headers, :body

      def initialize command, header_entries, body
        @command = command
        @headers = header_entries
        # => create_headers_by header_entries
        @body = Body.new body
      end

      def to_str
        command.to_s + "\n" + inspect_headers + "\n\n" + @body.to_s
      end

      private
      def create_headers_by header_entries
        @headers = header_entries.map { |entry| Header.new(entry[0], entry[1]) }
      end

      def inspect_headers
        to_ary_of(headers).map(&:to_s).join("\n")
      end
    end
  end
end
