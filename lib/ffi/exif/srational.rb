require 'ffi/exif/types'

module FFI
  module EXIF
    class SRational < FFI::Struct

      layout :numerator, :exif_slong,
             :denominator, :exif_slong

    end
  end
end
