require 'ffi'

module FFI
  module EXIF
    extend FFI::Library

    typedef :uchar, :exif_byte
    typedef :char, :exif_sbyte
    typedef :pointer, :exif_ascii
    typedef :uint16, :exif_short
    typedef :int16, :exif_sshort
    typedef :uint32, :exif_long
    typedef :int32, :exif_slong
    typedef :char, :exif_undefined

    enum :exif_format, [
      :byte, 1,
      :ascii, 2,
      :short, 3,
      :long, 4,
      :rational, 5,
      :sbyte, 6,
      :undefined, 7,
      :sshort, 8,
      :slong, 9,
      :srational, 10,
      :float, 11,
      :double, 12
    ]

    enum :exif_data_type, [
      :uncompressed_chunky, 0,
      :uncompressed_planar, 1,
      :uncompressed_ycc, 2,
      :compressed, 3,
      :count, 4,
      :unknown, 4
    ]

    enum :exif_ifd, [
      :zero, 0,
      :one, 1,
      :exif, 2,
      :gps, 3,
      :interoperability, 4,
      :count, 5
    ]

    enum :exif_byte_order, [
      :motorola,
      :intel
    ]

    callback :exif_data_foreach_content_func, [:pointer, :pointer], :void

    enum :exif_data_option, [
      :ignore_unknown_tags, 1 << 0,
      :follow_specification, 1 << 1,
      :dont_change_maker_note, 1 << 2
    ]

    callback :exif_content_foreach_entry_func, [:pointer, :pointer], :void

    enum :exif_tag, [
      :interoperability_index, 0x0001,
      :interoperability_version, 0x0002,
      :new_subfile_type, 0x00fe,
      :image_width, 0x0100,
      :image_length, 0x0101,
      :bits_per_sample, 0x0102,
      :compression, 0x0103,
      :photometric_interpretation, 0x0106,
      :fill_order, 0x010a,
      :document_name, 0x010d,
      :image_description, 0x010e,
      :make, 0x010f,
      :model, 0x0110,
      :strip_offsets, 0x0111,
      :orientation, 0x0112,
      :samples_per_pixel, 0x0115,
      :rows_per_strip, 0x0116,
      :strip_byte_counts, 0x0117,
      :x_resolution, 0x011a,
      :y_resolution, 0x011b,
      :planar_configuration, 0x011c,
      :resolution_unit, 0x0128,
      :transfer_function, 0x012d,
      :software, 0x0131,
      :date_time, 0x0132,
      :artist, 0x013b,
      :white_point, 0x013e,
      :primary_chromaticities, 0x013f,
      :sub_ifds, 0x014a,
      :transfer_range, 0x0156,
      :jpeg_proc, 0x0200,
      :jpeg_interchange_format, 0x0201,
      :jpeg_interchange_format_length, 0x0202,
      :ycbcr_coefficients, 0x0211,
      :ycbcr_sub_sampling, 0x0212,
      :ycbcr_positioning, 0x0213,
      :reference_black_white, 0x0214,
      :xml_packet, 0x02bc,
      :related_image_file_format, 0x1000,
      :related_image_width, 0x1001,
      :related_image_length, 0x1002,
      :cfa_repeat_pattern_dim, 0x828d,
      :cfa_pattern, 0x828e,
      :battery_level, 0x828f,
      :copyright, 0x8298,
      :exposure_time, 0x829a,
      :fnumber, 0x829d,
      :iptc_naa, 0x83bb,
      :image_resources, 0x8649,
      :exif_ifd_pointer, 0x8769,
      :inter_color_profile, 0x8773,
      :exposure_program, 0x8822,
      :spectral_sensitivity, 0x8824,
      :gps_info_ifd_pointer, 0x8825,
      :iso_speed_ratings, 0x8827,
      :oecf, 0x8828,
      :time_zone_offset, 0x882a,
      :exif_version, 0x9000,
      :date_time_original, 0x9003,
      :date_time_digitized, 0x9004,
      :components_configuration, 0x9101,
      :compressed_bits_per_pixel, 0x9102,
      :shutter_speed_value, 0x9201,
      :aperture_value, 0x9202,
      :brightness_value, 0x9203,
      :exposure_bias_value, 0x9204,
      :max_aperture_value, 0x9205,
      :subject_distance, 0x9206,
      :metering_mode, 0x9207,
      :light_source, 0x9208,
      :flash, 0x9209,
      :focal_length, 0x920a,
      :subject_area, 0x9214,
      :tiff_ep_standard_id, 0x9216,
      :maker_note, 0x927c,
      :user_comment, 0x9286,
      :sub_sec_time, 0x9290,
      :sub_sec_time_original, 0x9291,
      :sub_sec_time_digitized, 0x9292,
      :xp_title, 0x9c9b,
      :xp_comment, 0x9c9c,
      :xp_author, 0x9c9d,
      :xp_keywords, 0x9c9e,
      :xp_subject, 0x9c9f,
      :flash_pix_version, 0xa000,
      :color_space, 0xa001,
      :pixel_x_dimension, 0xa002,
      :pixel_y_dimension, 0xa003,
      :related_sound_file, 0xa004,
      :interoperability_ifd_pointer, 0xa005,
      :flash_energy, 0xa20b,
      :spatial_frequency_response, 0xa20c,
      :focal_plane_x_resolution, 0xa20e,
      :focal_plane_y_resolution, 0xa20f,
      :focal_plane_resolution_unit, 0xa210,
      :subject_location, 0xa214,
      :exposure_index, 0xa215,
      :sensing_method, 0xa217,
      :file_source, 0xa300,
      :scene_type, 0xa301,
      :new_cfa_pattern, 0xa302,
      :custom_rendered, 0xa401,
      :exposure_mode, 0xa402,
      :white_balance, 0xa403,
      :digital_zoom_ratio, 0xa404,
      :focal_length_in_35mm_film, 0xa405,
      :scene_capture_type, 0xa406,
      :gain_control, 0xa407,
      :contrast, 0xa408,
      :saturation, 0xa409,
      :sharpness, 0xa40a,
      :device_setting_description, 0xa40b,
      :subject_distance_range, 0xa40c,
      :image_unique_id, 0xa420,
      :gamma, 0xa500,
      :print_image_matching, 0xc4a5
    ]

    TAG_GPS_VERSION_ID = 0x0000
    TAG_GPS_LATITUDE_REF = 0x0001
    TAG_GPS_LATITUDE = 0x0002
    TAG_GPS_LONGITUDE_REF = 0x0003
    TAG_GPS_LONGITUDE = 0x0004
    TAG_GPS_ALTITUDE_REF = 0x0005
    TAG_GPS_ALTITUDE = 0x0006
    TAG_GPS_TIME_STAMP = 0x0007
    TAG_GPS_SATELLITES = 0x0008
    TAG_GPS_STATUS = 0x0009
    TAG_GPS_MEASURE_MODE = 0x000a
    TAG_GPS_DOP = 0x000b
    TAG_GPS_SPEED_REF = 0x000c
    TAG_GPS_SPEED = 0x000d
    TAG_GPS_TRACK_REF = 0x000e
    TAG_GPS_TRACK = 0x000f
    TAG_GPS_IMG_DIRECTION_REF = 0x0010
    TAG_GPS_IMG_DIRECTION = 0x0011
    TAG_GPS_MAP_DATUM = 0x0012
    TAG_GPS_DEST_LATITUDE_REF = 0x0013
    TAG_GPS_DEST_LATITUDE = 0x0014
    TAG_GPS_DEST_LONGITUDE_REF = 0x0015
    TAG_GPS_DEST_LONGITUDE = 0x0016
    TAG_GPS_DEST_BEARING_REF = 0x0017
    TAG_GPS_DEST_BEARING = 0x0018
    TAG_GPS_DEST_DISTANCE_REF = 0x0019
    TAG_GPS_DEST_DISTANCE = 0x001a
    TAG_GPS_PROCESSING_METHOD = 0x001b
    TAG_GPS_AREA_INFORMATION = 0x001c
    TAG_GPS_DATE_STAMP = 0x001d
    TAG_GPS_DIFFERENTIAL = 0x001e

    enum :exif_support_level, [
      :unknown, 0,
      :not_recorded, 1,
      :mandatory, 2,
      :optional, 3
    ]

    enum :exif_log_code, [
      :none,
      :debug,
      :no_memory,
      :corrupt_data
    ]

    callback :exif_log_func, [:pointer, :exif_log_code, :pointer, :pointer, :varargs, :pointer], :void

    callback :exif_mem_alloc_func, [:exif_long], :pointer
    callback :exif_mem_realloc_func, [:pointer, :exif_long], :pointer
    callback :exif_mem_free_func, [:pointer], :void
  end
end
