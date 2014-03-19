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

      # provide remove_header by key
      #
      # provide add_header by key and value
      #
      # Maybe header consists of key and value

      private
      def create_headers_by header_entries
        @headers = header_entries.map { |entry| Header.new(entry) }
      end
    end
  end
end
