require 'ffi'

module FFI
  module EXIF
    extend FFI::Library

    ffi_lib 'exif'

    enum :exif_format, [
      :exif_format_byte, 1,
      :exif_format_ascii, 2,
      :exif_format_short, 3,
      :exif_format_long, 4,
      :exif_format_rational, 5,
      :exif_format_sbyte, 6,
      :exif_format_undefined, 7,
      :exif_format_sshort, 8,
      :exif_format_slong, 9,
      :exif_format_srational, 10,
      :exif_format_float, 11,
      :exif_format_double, 12
    ]

    attach_function :exif_format_get_name, [:exif_format], :pointer
    attach_function :exif_format_get_size, [:exif_format], :uchar
  end
end
