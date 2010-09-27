require 'ffi/exif/types'
require 'ffi/exif/maker_note'
require 'ffi/exif/content'

module FFI
  module EXIF
    class Data < FFI::Struct

      include Enumerable

      layout :ifd, [:pointer, EXIF.enum_type(:exif_ifd)[:count]],
             :data, :pointer,
             :size, :uint,
             :priv, :pointer

      def fix!
        EXIF.exif_data_fix(self)
      end

      #
      # The byte order of the EXIF data.
      #
      # @return [Symbol]
      #   The byte order (`:intel` or `:motorola`).
      #
      def byte_order
        EXIF.exif_data_get_byte_order(self)
      end

      #
      # Sets the byte order of the EXIF data.
      #
      # @param [Symbol] new_order
      #   The new byte order for the EXIF data.
      #
      # @return [Symbol]
      #   The byte order of the EXIF data.
      #
      # @example
      #   data.byte_order = :intel
      #   data.byte_order = :motorol
      #
      def byte_order=(new_order)
        EXIF.exif_data_set_byte_order(self,new_order)
        return new_order
      end

      def data_type
        EXIF.exif_data_get_data_type(self)
      end

      def data_type=(new_type)
        EXIF.exif_data_set_data_type(self,new_type)
        return new_type
      end

      #
      # The maker note of the data.
      #
      # @return [MakerNote]
      #   The maker note for the data.
      #
      def maker_note
        @maker_note ||= MakerNote.new(EXIF.exif_data_get_mnote_data(self))
      end

      def each
        return enum_for unless block_given?

        content_callback = proc { |ptr| yield Content.new(ptr) }
        EXIF.exif_data_foreach_content(self,content_callback,nil)

        return nil
      end

      def dump
        EXIF.exif_data_dump(self)
      end

    end
  end
end
