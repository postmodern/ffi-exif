require 'ffi/exif/types'

module FFI
  module EXIF
    class Data < FFI::Struct

      layout :ifd, [:pointer, EXIF.enum_type(:exif_ifd)[:count]],
             :data, :pointer,
             :size, :uint,
             :priv, :pointer

    end
  end
end
