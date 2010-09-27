require 'ffi/exif/types'
require 'ffi/exif/rational'
require 'ffi/exif/srational'

require 'ffi'

module FFI
  module EXIF
    extend FFI::Library

    ffi_lib 'exif'

    attach_function :exif_format_get_name, [:exif_format], :string
    attach_function :exif_format_get_size, [:exif_format], :uchar

    attach_function :exif_ifd_get_name, [:exif_ifd], :pointer

    attach_function :exif_data_new, [], :pointer
    attach_function :exif_data_new_mem, [:pointer], :pointer
    attach_function :exif_data_new_from_file, [:string], :pointer
    attach_function :exif_data_new_from_data, [:pointer, :uint], :pointer
    attach_function :exif_data_load_data, [:pointer, :pointer, :uint], :void
    attach_function :exif_data_save_data, [:pointer, :pointer, :pointer], :void
    attach_function :exif_data_ref, [:pointer], :void
    attach_function :exif_data_unref, [:pointer], :void
    attach_function :exif_data_free, [:pointer], :void
    attach_function :exif_data_get_byte_order, [:pointer], :exif_byte_order
    attach_function :exif_data_set_byte_order, [:pointer, :exif_byte_order], :void
    attach_function :exif_data_get_mnote_data, [:pointer], :pointer
    attach_function :exif_data_fix, [:pointer], :void
    attach_function :exif_data_foreach_content, [:pointer, :exif_data_foreach_content_func, :pointer], :void
    attach_function :exif_data_option_get_name, [:exif_data_option], :string
    attach_function :exif_data_option_get_description, [:exif_data_option], :string
    attach_function :exif_data_set_option, [:pointer, :exif_data_option], :void
    attach_function :exif_data_unset_option, [:pointer, :exif_data_option], :void
    attach_function :exif_data_set_data_type, [:pointer, :exif_data_type], :void
    attach_function :exif_data_get_data_type, [:pointer], :exif_data_type
    attach_function :exif_data_dump, [:pointer], :void
    attach_function :exif_data_log, [:pointer, :pointer], :void

    attach_function :exif_content_new, [], :pointer
    attach_function :exif_content_new_mem, [:pointer], :pointer
    attach_function :exif_content_ref, [:pointer], :void
    attach_function :exif_content_unref, [:pointer], :void
    attach_function :exif_content_free, [:pointer], :void
    attach_function :exif_content_add_entry, [:pointer, :pointer], :void
    attach_function :exif_content_remove_entry, [:pointer, :pointer], :void
    attach_function :exif_content_get_entry, [:pointer, :exif_tag], :pointer
    attach_function :exif_content_fix, [:pointer], :void
    attach_function :exif_content_foreach_entry, [:pointer, :exif_content_foreach_entry_func, :pointer], :void
    attach_function :exif_content_get_ifd, [:pointer], :exif_ifd
    attach_function :exif_content_dump, [:pointer, :uint], :void
    attach_function :exif_content_log, [:pointer, :pointer], :void

    attach_function :exif_entry_new, [], :pointer
    attach_function :exif_entry_new_mem, [:pointer], :pointer
    attach_function :exif_entry_ref, [:pointer], :void
    attach_function :exif_entry_unref, [:pointer], :void
    attach_function :exif_entry_free, [:pointer], :void
    attach_function :exif_entry_initialize, [:pointer, :exif_tag], :void
    attach_function :exif_entry_fix, [:pointer], :void
    attach_function :exif_entry_get_value, [:pointer, :pointer, :uint], :string
    attach_function :exif_entry_dump, [:pointer, :uint], :void

    attach_function :exif_tag_from_name, [:string], :exif_tag
    attach_function :exif_tag_get_name_in_ifd, [:exif_tag, :exif_ifd], :string
    attach_function :exif_tag_get_title_in_ifd, [:exif_tag, :exif_ifd], :string
    attach_function :exif_tag_get_description_in_ifd, [:exif_tag, :exif_ifd], :string
    attach_function :exif_tag_get_support_level_in_ifd, [:exif_tag, :exif_ifd, :exif_data_type], :exif_support_level
    attach_function :exif_tag_get_name, [:exif_tag], :string
    attach_function :exif_tag_get_title, [:exif_tag], :string
    attach_function :exif_tag_get_description, [:exif_tag], :string
    attach_function :exif_tag_table_get_tag, [:uint], :exif_tag
    attach_function :exif_tag_table_get_name, [:uint], :string
    attach_function :exif_tag_table_count, [], :uint

    attach_function :exif_mnote_data_ref, [:pointer], :void
    attach_function :exif_mnote_data_unref, [:pointer], :void
    attach_function :exif_mnote_data_load, [:pointer, :pointer, :uint], :void
    attach_function :exif_mnote_data_save, [:pointer, :pointer, :pointer], :void
    attach_function :exif_mnote_data_count, [:pointer], :uint
    attach_function :exif_mnote_data_get_id, [:pointer, :uint], :uint
    attach_function :exif_mnote_data_get_name, [:pointer, :uint], :uint
    attach_function :exif_mnote_data_get_title, [:pointer, :uint], :uint
    attach_function :exif_mnote_data_get_description, [:pointer, :uint], :string
    attach_function :exif_mnote_data_get_value, [:pointer, :uint, :pointer, :uint], :pointer
    attach_function :exif_mnote_data_log, [:pointer, :pointer], :void

    attach_function :exif_loader_new, [], :pointer
    attach_function :exif_loader_new_mem, [:pointer], :pointer
    attach_function :exif_loader_ref, [:pointer], :void
    attach_function :exif_loader_unref, [:pointer], :void
    attach_function :exif_loader_write_file, [:pointer, :string], :void
    attach_function :exif_loader_write, [:pointer, :pointer, :uint], :uchar
    attach_function :exif_loader_reset, [:pointer], :void
    attach_function :exif_loader_get_data, [:pointer], :pointer
    attach_function :exif_loader_get_buf, [:pointer, :pointer, :pointer], :void
    attach_function :exif_loader_log, [:pointer, :pointer], :void

    attach_function :exif_log_new, [], :pointer
    attach_function :exif_log_new_mem, [:pointer], :pointer
    attach_function :exif_log_ref, [:pointer], :void
    attach_function :exif_log_unref, [:pointer], :void
    attach_function :exif_log_free, [:pointer], :void
    attach_function :exif_log_code_get_title, [:exif_log_code], :string
    attach_function :exif_log_code_get_message, [:exif_log_code], :string
    attach_function :exif_log_set_func, [:pointer, :exif_log_func, :pointer], :void

    begin
      attach_function :exif_log, [:pointer, :exif_log_code, :string, :string, :varargs], :void
    rescue TypeError
      def EXIF.exif_log(*arguments)
      end
    end

    attach_function :exif_mem_new, [:exif_mem_alloc_func, :exif_mem_realloc_func, :exif_mem_free_func], :pointer
    attach_function :exif_mem_ref, [:pointer], :void
    attach_function :exif_mem_unref, [:pointer], :void
    attach_function :exif_mem_alloc, [:pointer, :exif_long], :pointer
    attach_function :exif_mem_realloc, [:pointer, :pointer, :exif_long], :pointer
    attach_function :exif_mem_free, [:pointer, :pointer], :void
    attach_function :exif_mem_new_default, [], :pointer

    attach_function :exif_get_short, [:pointer, :exif_byte_order], :exif_short
    attach_function :exif_get_sshort, [:pointer, :exif_byte_order], :exif_sshort
    attach_function :exif_get_long, [:pointer, :exif_byte_order], :exif_long
    attach_function :exif_get_slong, [:pointer, :exif_byte_order], :exif_slong
    attach_function :exif_get_rational, [:pointer, :exif_byte_order], Rational
    attach_function :exif_get_srational, [:pointer, :exif_byte_order], SRational

    attach_function :exif_set_short, [:pointer, :exif_byte_order, :exif_short], :void
    attach_function :exif_set_sshort, [:pointer, :exif_byte_order, :exif_sshort], :void
    attach_function :exif_set_long, [:pointer, :exif_byte_order, :exif_long], :void
    attach_function :exif_set_slong, [:pointer, :exif_byte_order, :exif_slong], :void
    attach_function :exif_set_rational, [:pointer, :exif_byte_order, Rational], :void
    attach_function :exif_set_srational, [:pointer, :exif_byte_order, SRational], :void
  end
end
