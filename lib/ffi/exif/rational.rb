require 'ffi/exif/types'

module FFI
  module EXIF
    class Rational < FFI::Struct

      layout :numerator, :exif_long,
             :denominator, :exif_long

    end
  end
end
