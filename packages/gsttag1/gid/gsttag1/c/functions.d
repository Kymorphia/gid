/// C functions for gsttag1 library
module gid.gsttag1.c.functions;

public import gid.core.basictypes;
import gid.core.loader;
import gid.gsttag1.c.types;
static import gid.gsttag1.c._gidlib_GstTag;
public import gid.gst1.c.types;
public import gid.gstbase1.c.types;

private immutable LIBS = ["gsttag-1.0_0"];

private __gshared immutable(bool)* _gidLibMarker = &gid.gsttag1.c._gidlib_GstTag.gidLibLinked;

// TagDemux
private alias c_gst_tag_demux_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_tag_demux_get_typeFn c_gst_tag_demux_get_type; ///

// TagMux
private alias c_gst_tag_mux_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_tag_mux_get_typeFn c_gst_tag_mux_get_type; ///

// TagXmpWriter
private alias c_gst_tag_xmp_writer_get_typeFn = extern(C) GType function() nothrow;
__gshared c_gst_tag_xmp_writer_get_typeFn c_gst_tag_xmp_writer_get_type; ///
private alias c_gst_tag_xmp_writer_add_all_schemasFn = extern(C) void function(GstTagXmpWriter* config) nothrow;
__gshared c_gst_tag_xmp_writer_add_all_schemasFn c_gst_tag_xmp_writer_add_all_schemas; ///
private alias c_gst_tag_xmp_writer_add_schemaFn = extern(C) void function(GstTagXmpWriter* config, const(char)* schema) nothrow;
__gshared c_gst_tag_xmp_writer_add_schemaFn c_gst_tag_xmp_writer_add_schema; ///
private alias c_gst_tag_xmp_writer_has_schemaFn = extern(C) gboolean function(GstTagXmpWriter* config, const(char)* schema) nothrow;
__gshared c_gst_tag_xmp_writer_has_schemaFn c_gst_tag_xmp_writer_has_schema; ///
private alias c_gst_tag_xmp_writer_remove_all_schemasFn = extern(C) void function(GstTagXmpWriter* config) nothrow;
__gshared c_gst_tag_xmp_writer_remove_all_schemasFn c_gst_tag_xmp_writer_remove_all_schemas; ///
private alias c_gst_tag_xmp_writer_remove_schemaFn = extern(C) void function(GstTagXmpWriter* config, const(char)* schema) nothrow;
__gshared c_gst_tag_xmp_writer_remove_schemaFn c_gst_tag_xmp_writer_remove_schema; ///
private alias c_gst_tag_xmp_writer_tag_list_to_xmp_bufferFn = extern(C) GstBuffer* function(GstTagXmpWriter* config, const(GstTagList)* taglist, gboolean readOnly) nothrow;
__gshared c_gst_tag_xmp_writer_tag_list_to_xmp_bufferFn c_gst_tag_xmp_writer_tag_list_to_xmp_buffer; ///

// global
private alias c_gst_tag_check_language_codeFn = extern(C) gboolean function(const(char)* langCode) nothrow;
__gshared c_gst_tag_check_language_codeFn c_gst_tag_check_language_code; ///
private alias c_gst_tag_freeform_string_to_utf8Fn = extern(C) char* function(const(char)* data, int size, const(char*)* envVars) nothrow;
__gshared c_gst_tag_freeform_string_to_utf8Fn c_gst_tag_freeform_string_to_utf8; ///
private alias c_gst_tag_from_id3_tagFn = extern(C) const(char)* function(const(char)* id3Tag) nothrow;
__gshared c_gst_tag_from_id3_tagFn c_gst_tag_from_id3_tag; ///
private alias c_gst_tag_from_id3_user_tagFn = extern(C) const(char)* function(const(char)* type, const(char)* id3UserTag) nothrow;
__gshared c_gst_tag_from_id3_user_tagFn c_gst_tag_from_id3_user_tag; ///
private alias c_gst_tag_from_vorbis_tagFn = extern(C) const(char)* function(const(char)* vorbisTag) nothrow;
__gshared c_gst_tag_from_vorbis_tagFn c_gst_tag_from_vorbis_tag; ///
private alias c_gst_tag_get_id3v2_tag_sizeFn = extern(C) uint function(GstBuffer* buffer) nothrow;
__gshared c_gst_tag_get_id3v2_tag_sizeFn c_gst_tag_get_id3v2_tag_size; ///
private alias c_gst_tag_get_language_code_iso_639_1Fn = extern(C) const(char)* function(const(char)* langCode) nothrow;
__gshared c_gst_tag_get_language_code_iso_639_1Fn c_gst_tag_get_language_code_iso_639_1; ///
private alias c_gst_tag_get_language_code_iso_639_2BFn = extern(C) const(char)* function(const(char)* langCode) nothrow;
__gshared c_gst_tag_get_language_code_iso_639_2BFn c_gst_tag_get_language_code_iso_639_2B; ///
private alias c_gst_tag_get_language_code_iso_639_2TFn = extern(C) const(char)* function(const(char)* langCode) nothrow;
__gshared c_gst_tag_get_language_code_iso_639_2TFn c_gst_tag_get_language_code_iso_639_2T; ///
private alias c_gst_tag_get_language_codesFn = extern(C) char** function() nothrow;
__gshared c_gst_tag_get_language_codesFn c_gst_tag_get_language_codes; ///
private alias c_gst_tag_get_language_nameFn = extern(C) const(char)* function(const(char)* languageCode) nothrow;
__gshared c_gst_tag_get_language_nameFn c_gst_tag_get_language_name; ///
private alias c_gst_tag_get_license_descriptionFn = extern(C) const(char)* function(const(char)* licenseRef) nothrow;
__gshared c_gst_tag_get_license_descriptionFn c_gst_tag_get_license_description; ///
private alias c_gst_tag_get_license_flagsFn = extern(C) GstTagLicenseFlags function(const(char)* licenseRef) nothrow;
__gshared c_gst_tag_get_license_flagsFn c_gst_tag_get_license_flags; ///
private alias c_gst_tag_get_license_jurisdictionFn = extern(C) const(char)* function(const(char)* licenseRef) nothrow;
__gshared c_gst_tag_get_license_jurisdictionFn c_gst_tag_get_license_jurisdiction; ///
private alias c_gst_tag_get_license_nickFn = extern(C) const(char)* function(const(char)* licenseRef) nothrow;
__gshared c_gst_tag_get_license_nickFn c_gst_tag_get_license_nick; ///
private alias c_gst_tag_get_license_titleFn = extern(C) const(char)* function(const(char)* licenseRef) nothrow;
__gshared c_gst_tag_get_license_titleFn c_gst_tag_get_license_title; ///
private alias c_gst_tag_get_license_versionFn = extern(C) const(char)* function(const(char)* licenseRef) nothrow;
__gshared c_gst_tag_get_license_versionFn c_gst_tag_get_license_version; ///
private alias c_gst_tag_get_licensesFn = extern(C) char** function() nothrow;
__gshared c_gst_tag_get_licensesFn c_gst_tag_get_licenses; ///
private alias c_gst_tag_id3_genre_countFn = extern(C) uint function() nothrow;
__gshared c_gst_tag_id3_genre_countFn c_gst_tag_id3_genre_count; ///
private alias c_gst_tag_id3_genre_getFn = extern(C) const(char)* function(uint id) nothrow;
__gshared c_gst_tag_id3_genre_getFn c_gst_tag_id3_genre_get; ///
private alias c_gst_tag_image_data_to_image_sampleFn = extern(C) GstSample* function(const(ubyte)* imageData, uint imageDataLen, GstTagImageType imageType) nothrow;
__gshared c_gst_tag_image_data_to_image_sampleFn c_gst_tag_image_data_to_image_sample; ///
private alias c_gst_tag_list_add_id3_imageFn = extern(C) gboolean function(GstTagList* tagList, const(ubyte)* imageData, uint imageDataLen, uint id3PictureType) nothrow;
__gshared c_gst_tag_list_add_id3_imageFn c_gst_tag_list_add_id3_image; ///
private alias c_gst_tag_list_from_exif_bufferFn = extern(C) GstTagList* function(GstBuffer* buffer, int byteOrder, uint baseOffset) nothrow;
__gshared c_gst_tag_list_from_exif_bufferFn c_gst_tag_list_from_exif_buffer; ///
private alias c_gst_tag_list_from_exif_buffer_with_tiff_headerFn = extern(C) GstTagList* function(GstBuffer* buffer) nothrow;
__gshared c_gst_tag_list_from_exif_buffer_with_tiff_headerFn c_gst_tag_list_from_exif_buffer_with_tiff_header; ///
private alias c_gst_tag_list_from_id3v2_tagFn = extern(C) GstTagList* function(GstBuffer* buffer) nothrow;
__gshared c_gst_tag_list_from_id3v2_tagFn c_gst_tag_list_from_id3v2_tag; ///
private alias c_gst_tag_list_from_vorbiscommentFn = extern(C) GstTagList* function(const(ubyte)* data, size_t size, const(ubyte)* idData, uint idDataLength, char** vendorString) nothrow;
__gshared c_gst_tag_list_from_vorbiscommentFn c_gst_tag_list_from_vorbiscomment; ///
private alias c_gst_tag_list_from_vorbiscomment_bufferFn = extern(C) GstTagList* function(GstBuffer* buffer, const(ubyte)* idData, uint idDataLength, char** vendorString) nothrow;
__gshared c_gst_tag_list_from_vorbiscomment_bufferFn c_gst_tag_list_from_vorbiscomment_buffer; ///
private alias c_gst_tag_list_from_xmp_bufferFn = extern(C) GstTagList* function(GstBuffer* buffer) nothrow;
__gshared c_gst_tag_list_from_xmp_bufferFn c_gst_tag_list_from_xmp_buffer; ///
private alias c_gst_tag_list_new_from_id3v1Fn = extern(C) GstTagList* function(const(ubyte)* data) nothrow;
__gshared c_gst_tag_list_new_from_id3v1Fn c_gst_tag_list_new_from_id3v1; ///
private alias c_gst_tag_list_to_exif_bufferFn = extern(C) GstBuffer* function(const(GstTagList)* taglist, int byteOrder, uint baseOffset) nothrow;
__gshared c_gst_tag_list_to_exif_bufferFn c_gst_tag_list_to_exif_buffer; ///
private alias c_gst_tag_list_to_exif_buffer_with_tiff_headerFn = extern(C) GstBuffer* function(const(GstTagList)* taglist) nothrow;
__gshared c_gst_tag_list_to_exif_buffer_with_tiff_headerFn c_gst_tag_list_to_exif_buffer_with_tiff_header; ///
private alias c_gst_tag_list_to_vorbiscomment_bufferFn = extern(C) GstBuffer* function(const(GstTagList)* list, const(ubyte)* idData, uint idDataLength, const(char)* vendorString) nothrow;
__gshared c_gst_tag_list_to_vorbiscomment_bufferFn c_gst_tag_list_to_vorbiscomment_buffer; ///
private alias c_gst_tag_list_to_xmp_bufferFn = extern(C) GstBuffer* function(const(GstTagList)* list, gboolean readOnly, const(char*)* schemas) nothrow;
__gshared c_gst_tag_list_to_xmp_bufferFn c_gst_tag_list_to_xmp_buffer; ///
private alias c_gst_tag_parse_extended_commentFn = extern(C) gboolean function(const(char)* extComment, char** key, char** lang, char** value, gboolean failIfNoKey) nothrow;
__gshared c_gst_tag_parse_extended_commentFn c_gst_tag_parse_extended_comment; ///
private alias c_gst_tag_register_musicbrainz_tagsFn = extern(C) void function() nothrow;
__gshared c_gst_tag_register_musicbrainz_tagsFn c_gst_tag_register_musicbrainz_tags; ///
private alias c_gst_tag_to_id3_tagFn = extern(C) const(char)* function(const(char)* gstTag) nothrow;
__gshared c_gst_tag_to_id3_tagFn c_gst_tag_to_id3_tag; ///
private alias c_gst_tag_to_vorbis_commentsFn = extern(C) GList* function(const(GstTagList)* list, const(char)* tag) nothrow;
__gshared c_gst_tag_to_vorbis_commentsFn c_gst_tag_to_vorbis_comments; ///
private alias c_gst_tag_to_vorbis_tagFn = extern(C) const(char)* function(const(char)* gstTag) nothrow;
__gshared c_gst_tag_to_vorbis_tagFn c_gst_tag_to_vorbis_tag; ///
private alias c_gst_tag_xmp_list_schemasFn = extern(C) const(char*)* function() nothrow;
__gshared c_gst_tag_xmp_list_schemasFn c_gst_tag_xmp_list_schemas; ///
private alias c_gst_vorbis_tag_addFn = extern(C) void function(GstTagList* list, const(char)* tag, const(char)* value) nothrow;
__gshared c_gst_vorbis_tag_addFn c_gst_vorbis_tag_add; ///

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
  auto libs = gidResolveLibs(LIBS, "gid.gsttag1", "GstTag");

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
