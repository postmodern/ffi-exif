require 'ffi/exif/types'

module FFI
  module EXIF
    class Entry < FFI::Struct

      MAX_VALUE_LENGTH = 4096

      layout :tag, :exif_tag,
             :format, :exif_format,
             :components, :ulong,
             :data, :pointer,
             :size, :uint,
             :parent, :pointer,
             :priv, :pointer

      def fix!
        EXIF.exif_entry_fix(self)
      end

      def value
        unless @value
          MemoryPointer.new(:char,MAX_VALUE_LENGTH) do |buffer|
            unless EXIF.exif_entry_get_value(self,buffer,MAX_VALUE_LENGTH).null?
              @value = buffer.get_string(MAX_VALUE_LENGTH)
            end
          end
        end

        return @value
      end

      def dump(indent=0)
        EXIF.exif_entry_dump(self,indent)
      end

    end
  end
end
