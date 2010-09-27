require 'ffi/exif/entry'

module FFI
  module EXIF
    class Content < FFI::Struct

      include Enumerable

      layout :entries, :pointer,
             :count, :uint,
             :parent, :pointer,
             :priv, :pointer

      def fix!
        EXIF.exif_content_fix(self)
      end

      def ifd
        EXIF.exif_content_get_ifd(self)
      end

      def each
        return enum_for unless block_given?

        entry_callback = proc { |ptr| yield Entry.new(ptr) }
        EXIF.exif_content_foreach_entry(self,entry_callback,nil)

        return nil
      end

      def dump(indent=0)
        EXIF.exif_content_dump(self,indent)
      end

    end
  end
end
