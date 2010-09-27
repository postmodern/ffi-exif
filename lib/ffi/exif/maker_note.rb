require 'ffi/exif/exif'
require 'ffi/exif/maker_note_tag'

module FFI
  module EXIF
    class MakerNote

      include Enumerable

      attr_reader :tags

      def initialize(ptr)
        @ptr = ptr

        @tags = Hash.new do |hash,key|
          if key < self.tag_count
            hash[key] = MakerNoteTag.new(self,key)
          end
        end
      end

      def free
        EXIF.exif_mnote_data_unref(self)
      end

      def tag_count
        EXIF.exif_mnote_data_count(self)
      end

      def each
        return enum_for unless block_given?

        (0...tag_count).each do |index|
          yield tags[index]
        end

        return nil
      end

      def to_ptr
        @ptr
      end

    end
  end
end
