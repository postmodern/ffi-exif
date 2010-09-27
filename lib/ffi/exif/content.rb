module FFI
  module EXIF
    class Content < FFI::Struct

      layout :entries, :pointer,
             :count, :uint,
             :parent, :pointer,
             :priv, :pointer

    end
  end
end
