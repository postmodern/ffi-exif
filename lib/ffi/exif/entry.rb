require 'ffi/exif/types'

module FFI
  module EXIF
    class Entry < FFI::Struct

      layout :tag, :exif_tag,
             :format, :exif_format,
             :components, :ulong,
             :data, :pointer,
             :size, :uint,
             :parent, :pointer,
             :priv, :pointer

    end
  end
end
