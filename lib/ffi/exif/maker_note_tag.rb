module FFI
  module EXIF
    class MakerNoteTag

      MAX_VALUE_LENGTH = 4096

      attr_reader :maker_note

      attr_reader :index

      def initialize(maker_note,index)
        @maker_note = maker_note
        @index = index
      end

      def id
        @id ||= EXIF.exif_mnote_data_get_id(@maker_note,@index)
      end

      def name
        @name ||= EXIF.exif_mnote_data_get_name(@maker_note,@index)
      end

      def title
        @title ||= EXIF.exif_mnote_data_get_title(@maker_note,@index)
      end

      def description
        @description ||= EXIF.exif_mnote_data_get_description(@maker_note,@index)
      end

      def value
        unless @value
          MemoryPointer.new(:char,MAX_VALUE_LENGTH) do |buffer|
            unless EXIF.exif_mnote_data_get_value(@maker_note,@index,buffer,MAX_VALUE_LENGTH).null?
              @value = buffer.get_string(MAX_VALUE_LENGTH)
            end
          end
        end

        return @value
      end

      def inspect
        "#<#{self.class}: #{name}: #{value.inspect}>"
      end

    end
  end
end
