require 'ffi/exif/exif'
require 'ffi/exif/data'

module FFI
  module EXIF
    class Loader

      include Enumerable

      #
      # Initializes the new loader.
      #
      def initialize
        @ptr = EXIF.exif_loader_new
      end

      #
      # Creates a new loader and reads data from a file.
      #
      # @param [String] path
      #   The path of the file to read in.
      #
      # @return [Loader]
      #   The new loader.
      #
      # @see #open
      #
      def self.open(path)
        loader = self.new
        loader.open(path)

        return loader
      end

      #
      # Reads data in from a file.
      #
      # @param [String] path
      #   The path of the file to read.
      #
      # @return [Loader]
      #   The loader.
      #
      def open(path)
        unless File.exists?(path)
          raise(Errno::ENOENT,"No such file or directory - #{path}",caller)
        end

        EXIF.exif_loader_write_file(self,path)
        return self
      end

      #
      # Writes data into the loader.
      #
      # @param [String] data
      #   The data to write in.
      #
      # @return [Loader]
      #   The loader.
      #
      def <<(data)
        EXIF.exif_loader_write(self,data,data.length)
        return self
      end

      #
      # Iterates over each piece of EXIF data in the loader.
      #
      # @yield [data]
      #   The given block will be passed each decoded piece of EXIF data.
      #
      # @yieldparam [Data] data
      #   Decoded EXIF data.
      #
      # @return [Enumerator]
      #   If no block is given, an enumerator object will be returned.
      #
      def each
        return enum_for unless block_given?

        loop do
          data = EXIF.exif_loader_get_data(self)

          if data.null?
            break
          end

          yield Data.new(data)
        end
      end

      #
      # Unreferences and close the loader.
      #
      def close
        EXIF.exif_loader_unref(self)
        return nil
      end

      #
      # Converts the loader to a FFI pointer.
      #
      # @return [FFI::MemoryPointer]
      #   The FFI pointer for the loader.
      #
      def to_ptr
        @ptr
      end

    end
  end
end
