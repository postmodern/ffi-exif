require 'ffi/exif/types'

module FFI
  module EXIF
    class Data < FFI::Struct

      layout :ifd, [:pointer, EXIF.enum_type(:exif_ifd)[:count]],
             :data, :pointer,
             :size, :uint,
             :priv, :pointer

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

    end
  end
end
