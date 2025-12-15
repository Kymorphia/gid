/// C functions for gsttag1 library
module gsttag.c.functions;

public import gid.basictypes;
import gid.loader;
import gsttag.c.types;
public import gst.c.types;
public import gstbase.c.types;

version(Windows)
  private immutable LIBS = ["libgsttag-1.0-0.dll;gsttag-1.0-0.dll;gsttag-1.dll"];
else version(OSX)
  private immutable LIBS = ["libgsttag-1.0.0.dylib"];
else
  private immutable LIBS = ["libgsttag-1.0.so.0"];

__gshared extern(C)
{
  // TagDemux
  GType function() c_gst_tag_demux_get_type; ///

  // TagMux
  GType function() c_gst_tag_mux_get_type; ///

  // TagXmpWriter
  GType function() c_gst_tag_xmp_writer_get_type; ///
  void function(GstTagXmpWriter* config) c_gst_tag_xmp_writer_add_all_schemas; ///
  void function(GstTagXmpWriter* config, const(char)* schema) c_gst_tag_xmp_writer_add_schema; ///
  gboolean function(GstTagXmpWriter* config, const(char)* schema) c_gst_tag_xmp_writer_has_schema; ///
  void function(GstTagXmpWriter* config) c_gst_tag_xmp_writer_remove_all_schemas; ///
  void function(GstTagXmpWriter* config, const(char)* schema) c_gst_tag_xmp_writer_remove_schema; ///
  GstBuffer* function(GstTagXmpWriter* config, const(GstTagList)* taglist, gboolean readOnly) c_gst_tag_xmp_writer_tag_list_to_xmp_buffer; ///

  // global
  gboolean function(const(char)* langCode) c_gst_tag_check_language_code; ///
  char* function(const(char)* data, int size, const(char*)* envVars) c_gst_tag_freeform_string_to_utf8; ///
  const(char)* function(const(char)* id3Tag) c_gst_tag_from_id3_tag; ///
  const(char)* function(const(char)* type, const(char)* id3UserTag) c_gst_tag_from_id3_user_tag; ///
  const(char)* function(const(char)* vorbisTag) c_gst_tag_from_vorbis_tag; ///
  uint function(GstBuffer* buffer) c_gst_tag_get_id3v2_tag_size; ///
  const(char)* function(const(char)* langCode) c_gst_tag_get_language_code_iso_639_1; ///
  const(char)* function(const(char)* langCode) c_gst_tag_get_language_code_iso_639_2B; ///
  const(char)* function(const(char)* langCode) c_gst_tag_get_language_code_iso_639_2T; ///
  char** function() c_gst_tag_get_language_codes; ///
  const(char)* function(const(char)* languageCode) c_gst_tag_get_language_name; ///
  const(char)* function(const(char)* licenseRef) c_gst_tag_get_license_description; ///
  GstTagLicenseFlags function(const(char)* licenseRef) c_gst_tag_get_license_flags; ///
  const(char)* function(const(char)* licenseRef) c_gst_tag_get_license_jurisdiction; ///
  const(char)* function(const(char)* licenseRef) c_gst_tag_get_license_nick; ///
  const(char)* function(const(char)* licenseRef) c_gst_tag_get_license_title; ///
  const(char)* function(const(char)* licenseRef) c_gst_tag_get_license_version; ///
  char** function() c_gst_tag_get_licenses; ///
  uint function() c_gst_tag_id3_genre_count; ///
  const(char)* function(uint id) c_gst_tag_id3_genre_get; ///
  GstSample* function(const(ubyte)* imageData, uint imageDataLen, GstTagImageType imageType) c_gst_tag_image_data_to_image_sample; ///
  gboolean function(GstTagList* tagList, const(ubyte)* imageData, uint imageDataLen, uint id3PictureType) c_gst_tag_list_add_id3_image; ///
  GstTagList* function(GstBuffer* buffer, int byteOrder, uint baseOffset) c_gst_tag_list_from_exif_buffer; ///
  GstTagList* function(GstBuffer* buffer) c_gst_tag_list_from_exif_buffer_with_tiff_header; ///
  GstTagList* function(GstBuffer* buffer) c_gst_tag_list_from_id3v2_tag; ///
  GstTagList* function(const(ubyte)* data, size_t size, const(ubyte)* idData, uint idDataLength, char** vendorString) c_gst_tag_list_from_vorbiscomment; ///
  GstTagList* function(GstBuffer* buffer, const(ubyte)* idData, uint idDataLength, char** vendorString) c_gst_tag_list_from_vorbiscomment_buffer; ///
  GstTagList* function(GstBuffer* buffer) c_gst_tag_list_from_xmp_buffer; ///
  GstTagList* function(const(ubyte)* data) c_gst_tag_list_new_from_id3v1; ///
  GstBuffer* function(const(GstTagList)* taglist, int byteOrder, uint baseOffset) c_gst_tag_list_to_exif_buffer; ///
  GstBuffer* function(const(GstTagList)* taglist) c_gst_tag_list_to_exif_buffer_with_tiff_header; ///
  GstBuffer* function(const(GstTagList)* list, const(ubyte)* idData, uint idDataLength, const(char)* vendorString) c_gst_tag_list_to_vorbiscomment_buffer; ///
  GstBuffer* function(const(GstTagList)* list, gboolean readOnly, const(char*)* schemas) c_gst_tag_list_to_xmp_buffer; ///
  gboolean function(const(char)* extComment, char** key, char** lang, char** value, gboolean failIfNoKey) c_gst_tag_parse_extended_comment; ///
  void function() c_gst_tag_register_musicbrainz_tags; ///
  const(char)* function(const(char)* gstTag) c_gst_tag_to_id3_tag; ///
  GList* function(const(GstTagList)* list, const(char)* tag) c_gst_tag_to_vorbis_comments; ///
  const(char)* function(const(char)* gstTag) c_gst_tag_to_vorbis_tag; ///
  const(char*)* function() c_gst_tag_xmp_list_schemas; ///
  void function(GstTagList* list, const(char)* tag, const(char)* value) c_gst_vorbis_tag_add; ///
}

// TagDemux

/** */
alias gst_tag_demux_get_type = c_gst_tag_demux_get_type;

// TagMux

/** */
alias gst_tag_mux_get_type = c_gst_tag_mux_get_type;

// TagXmpWriter

/** */
alias gst_tag_xmp_writer_get_type = c_gst_tag_xmp_writer_get_type;

/** */
alias gst_tag_xmp_writer_add_all_schemas = c_gst_tag_xmp_writer_add_all_schemas;

/** */
alias gst_tag_xmp_writer_add_schema = c_gst_tag_xmp_writer_add_schema;

/** */
alias gst_tag_xmp_writer_has_schema = c_gst_tag_xmp_writer_has_schema;

/** */
alias gst_tag_xmp_writer_remove_all_schemas = c_gst_tag_xmp_writer_remove_all_schemas;

/** */
alias gst_tag_xmp_writer_remove_schema = c_gst_tag_xmp_writer_remove_schema;

/** */
alias gst_tag_xmp_writer_tag_list_to_xmp_buffer = c_gst_tag_xmp_writer_tag_list_to_xmp_buffer;

// global

/** */
alias gst_tag_check_language_code = c_gst_tag_check_language_code;

/** */
alias gst_tag_freeform_string_to_utf8 = c_gst_tag_freeform_string_to_utf8;

/** */
alias gst_tag_from_id3_tag = c_gst_tag_from_id3_tag;

/** */
alias gst_tag_from_id3_user_tag = c_gst_tag_from_id3_user_tag;

/** */
alias gst_tag_from_vorbis_tag = c_gst_tag_from_vorbis_tag;

/** */
alias gst_tag_get_id3v2_tag_size = c_gst_tag_get_id3v2_tag_size;

/** */
alias gst_tag_get_language_code_iso_639_1 = c_gst_tag_get_language_code_iso_639_1;

/** */
alias gst_tag_get_language_code_iso_639_2B = c_gst_tag_get_language_code_iso_639_2B;

/** */
alias gst_tag_get_language_code_iso_639_2T = c_gst_tag_get_language_code_iso_639_2T;

/** */
alias gst_tag_get_language_codes = c_gst_tag_get_language_codes;

/** */
alias gst_tag_get_language_name = c_gst_tag_get_language_name;

/** */
alias gst_tag_get_license_description = c_gst_tag_get_license_description;

/** */
alias gst_tag_get_license_flags = c_gst_tag_get_license_flags;

/** */
alias gst_tag_get_license_jurisdiction = c_gst_tag_get_license_jurisdiction;

/** */
alias gst_tag_get_license_nick = c_gst_tag_get_license_nick;

/** */
alias gst_tag_get_license_title = c_gst_tag_get_license_title;

/** */
alias gst_tag_get_license_version = c_gst_tag_get_license_version;

/** */
alias gst_tag_get_licenses = c_gst_tag_get_licenses;

/** */
alias gst_tag_id3_genre_count = c_gst_tag_id3_genre_count;

/** */
alias gst_tag_id3_genre_get = c_gst_tag_id3_genre_get;

/** */
alias gst_tag_image_data_to_image_sample = c_gst_tag_image_data_to_image_sample;

/** */
alias gst_tag_list_add_id3_image = c_gst_tag_list_add_id3_image;

/** */
alias gst_tag_list_from_exif_buffer = c_gst_tag_list_from_exif_buffer;

/** */
alias gst_tag_list_from_exif_buffer_with_tiff_header = c_gst_tag_list_from_exif_buffer_with_tiff_header;

/** */
alias gst_tag_list_from_id3v2_tag = c_gst_tag_list_from_id3v2_tag;

/** */
alias gst_tag_list_from_vorbiscomment = c_gst_tag_list_from_vorbiscomment;

/** */
alias gst_tag_list_from_vorbiscomment_buffer = c_gst_tag_list_from_vorbiscomment_buffer;

/** */
alias gst_tag_list_from_xmp_buffer = c_gst_tag_list_from_xmp_buffer;

/** */
alias gst_tag_list_new_from_id3v1 = c_gst_tag_list_new_from_id3v1;

/** */
alias gst_tag_list_to_exif_buffer = c_gst_tag_list_to_exif_buffer;

/** */
alias gst_tag_list_to_exif_buffer_with_tiff_header = c_gst_tag_list_to_exif_buffer_with_tiff_header;

/** */
alias gst_tag_list_to_vorbiscomment_buffer = c_gst_tag_list_to_vorbiscomment_buffer;

/** */
alias gst_tag_list_to_xmp_buffer = c_gst_tag_list_to_xmp_buffer;

/** */
alias gst_tag_parse_extended_comment = c_gst_tag_parse_extended_comment;

/** */
alias gst_tag_register_musicbrainz_tags = c_gst_tag_register_musicbrainz_tags;

/** */
alias gst_tag_to_id3_tag = c_gst_tag_to_id3_tag;

/** */
alias gst_tag_to_vorbis_comments = c_gst_tag_to_vorbis_comments;

/** */
alias gst_tag_to_vorbis_tag = c_gst_tag_to_vorbis_tag;

/** */
alias gst_tag_xmp_list_schemas = c_gst_tag_xmp_list_schemas;

/** */
alias gst_vorbis_tag_add = c_gst_vorbis_tag_add;

shared static this()
{
  auto libs = gidResolveLibs(LIBS);

  // TagDemux
  gidLink(cast(void**)&gst_tag_demux_get_type, "gst_tag_demux_get_type", libs);

  // TagMux
  gidLink(cast(void**)&gst_tag_mux_get_type, "gst_tag_mux_get_type", libs);

  // TagXmpWriter
  gidLink(cast(void**)&gst_tag_xmp_writer_get_type, "gst_tag_xmp_writer_get_type", libs);
  gidLink(cast(void**)&gst_tag_xmp_writer_add_all_schemas, "gst_tag_xmp_writer_add_all_schemas", libs);
  gidLink(cast(void**)&gst_tag_xmp_writer_add_schema, "gst_tag_xmp_writer_add_schema", libs);
  gidLink(cast(void**)&gst_tag_xmp_writer_has_schema, "gst_tag_xmp_writer_has_schema", libs);
  gidLink(cast(void**)&gst_tag_xmp_writer_remove_all_schemas, "gst_tag_xmp_writer_remove_all_schemas", libs);
  gidLink(cast(void**)&gst_tag_xmp_writer_remove_schema, "gst_tag_xmp_writer_remove_schema", libs);
  gidLink(cast(void**)&gst_tag_xmp_writer_tag_list_to_xmp_buffer, "gst_tag_xmp_writer_tag_list_to_xmp_buffer", libs);

  // global
  gidLink(cast(void**)&gst_tag_check_language_code, "gst_tag_check_language_code", libs);
  gidLink(cast(void**)&gst_tag_freeform_string_to_utf8, "gst_tag_freeform_string_to_utf8", libs);
  gidLink(cast(void**)&gst_tag_from_id3_tag, "gst_tag_from_id3_tag", libs);
  gidLink(cast(void**)&gst_tag_from_id3_user_tag, "gst_tag_from_id3_user_tag", libs);
  gidLink(cast(void**)&gst_tag_from_vorbis_tag, "gst_tag_from_vorbis_tag", libs);
  gidLink(cast(void**)&gst_tag_get_id3v2_tag_size, "gst_tag_get_id3v2_tag_size", libs);
  gidLink(cast(void**)&gst_tag_get_language_code_iso_639_1, "gst_tag_get_language_code_iso_639_1", libs);
  gidLink(cast(void**)&gst_tag_get_language_code_iso_639_2B, "gst_tag_get_language_code_iso_639_2B", libs);
  gidLink(cast(void**)&gst_tag_get_language_code_iso_639_2T, "gst_tag_get_language_code_iso_639_2T", libs);
  gidLink(cast(void**)&gst_tag_get_language_codes, "gst_tag_get_language_codes", libs);
  gidLink(cast(void**)&gst_tag_get_language_name, "gst_tag_get_language_name", libs);
  gidLink(cast(void**)&gst_tag_get_license_description, "gst_tag_get_license_description", libs);
  gidLink(cast(void**)&gst_tag_get_license_flags, "gst_tag_get_license_flags", libs);
  gidLink(cast(void**)&gst_tag_get_license_jurisdiction, "gst_tag_get_license_jurisdiction", libs);
  gidLink(cast(void**)&gst_tag_get_license_nick, "gst_tag_get_license_nick", libs);
  gidLink(cast(void**)&gst_tag_get_license_title, "gst_tag_get_license_title", libs);
  gidLink(cast(void**)&gst_tag_get_license_version, "gst_tag_get_license_version", libs);
  gidLink(cast(void**)&gst_tag_get_licenses, "gst_tag_get_licenses", libs);
  gidLink(cast(void**)&gst_tag_id3_genre_count, "gst_tag_id3_genre_count", libs);
  gidLink(cast(void**)&gst_tag_id3_genre_get, "gst_tag_id3_genre_get", libs);
  gidLink(cast(void**)&gst_tag_image_data_to_image_sample, "gst_tag_image_data_to_image_sample", libs);
  gidLink(cast(void**)&gst_tag_list_add_id3_image, "gst_tag_list_add_id3_image", libs);
  gidLink(cast(void**)&gst_tag_list_from_exif_buffer, "gst_tag_list_from_exif_buffer", libs);
  gidLink(cast(void**)&gst_tag_list_from_exif_buffer_with_tiff_header, "gst_tag_list_from_exif_buffer_with_tiff_header", libs);
  gidLink(cast(void**)&gst_tag_list_from_id3v2_tag, "gst_tag_list_from_id3v2_tag", libs);
  gidLink(cast(void**)&gst_tag_list_from_vorbiscomment, "gst_tag_list_from_vorbiscomment", libs);
  gidLink(cast(void**)&gst_tag_list_from_vorbiscomment_buffer, "gst_tag_list_from_vorbiscomment_buffer", libs);
  gidLink(cast(void**)&gst_tag_list_from_xmp_buffer, "gst_tag_list_from_xmp_buffer", libs);
  gidLink(cast(void**)&gst_tag_list_new_from_id3v1, "gst_tag_list_new_from_id3v1", libs);
  gidLink(cast(void**)&gst_tag_list_to_exif_buffer, "gst_tag_list_to_exif_buffer", libs);
  gidLink(cast(void**)&gst_tag_list_to_exif_buffer_with_tiff_header, "gst_tag_list_to_exif_buffer_with_tiff_header", libs);
  gidLink(cast(void**)&gst_tag_list_to_vorbiscomment_buffer, "gst_tag_list_to_vorbiscomment_buffer", libs);
  gidLink(cast(void**)&gst_tag_list_to_xmp_buffer, "gst_tag_list_to_xmp_buffer", libs);
  gidLink(cast(void**)&gst_tag_parse_extended_comment, "gst_tag_parse_extended_comment", libs);
  gidLink(cast(void**)&gst_tag_register_musicbrainz_tags, "gst_tag_register_musicbrainz_tags", libs);
  gidLink(cast(void**)&gst_tag_to_id3_tag, "gst_tag_to_id3_tag", libs);
  gidLink(cast(void**)&gst_tag_to_vorbis_comments, "gst_tag_to_vorbis_comments", libs);
  gidLink(cast(void**)&gst_tag_to_vorbis_tag, "gst_tag_to_vorbis_tag", libs);
  gidLink(cast(void**)&gst_tag_xmp_list_schemas, "gst_tag_xmp_list_schemas", libs);
  gidLink(cast(void**)&gst_vorbis_tag_add, "gst_vorbis_tag_add", libs);
}
