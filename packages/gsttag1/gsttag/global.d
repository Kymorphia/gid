/// Global functions for gsttag1 library
module gsttag.global;

import gid.gid;
import gst.buffer;
import gst.sample;
import gst.tag_list;
import gsttag.c.functions;
import gsttag.c.types;
import gsttag.types;


/**
    Check if a given string contains a known ISO 639 language code.
    
    This is useful in situations where it's not clear whether a given
    string is a language code (which should be put into a #GST_TAG_LANGUAGE_CODE
    tag) or a free-form language name descriptor (which should be put into a
    #GST_TAG_LANGUAGE_NAME tag instead).

    Params:
      langCode = ISO-639 language code (e.g. "deu" or "ger" or "de")
    Returns: TRUE if the two- or three-letter language code in lang_code
          is a valid ISO-639 language code.
*/
bool tagCheckLanguageCode(string langCode)
{
  bool _retval;
  const(char)* _langCode = langCode.toCString(No.Alloc);
  _retval = gst_tag_check_language_code(_langCode);
  return _retval;
}

/**
    Convenience function to read a string with unknown character encoding. If
    the string is already in UTF-8 encoding, it will be returned right away.
    If not it tries to detect byte-order-mark for UTF-16/32 cases and use that.
    Otherwise, the environment will be searched for a number of environment
    variables (whose names are specified in the NULL-terminated string array
    env_vars) containing a list of character encodings to try/use. If none
    are specified, the current locale will be tried. If that also doesn't work,
    WINDOWS-1252/ISO-8859-1 is assumed (which will almost always succeed).

    Params:
      data = string data
      envVars = a NULL-terminated string array of environment variable names, or NULL
    Returns: a newly-allocated string in UTF-8 encoding, or NULL
*/
string tagFreeformStringToUtf8(string data, string[] envVars)
{
  char* _cretval;
  int _size;
  if (data)
    _size = cast(int)data.length;

  auto _data = cast(const(char)*)data.ptr;
  char*[] _tmpenvVars;
  foreach (s; envVars)
    _tmpenvVars ~= s.toCString(No.Alloc);
  _tmpenvVars ~= null;
  const(char*)* _envVars = _tmpenvVars.ptr;
  _cretval = gst_tag_freeform_string_to_utf8(_data, _size, _envVars);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Looks up the GStreamer tag for a ID3v2 tag.

    Params:
      id3Tag = ID3v2 tag to convert to GStreamer tag
    Returns: The corresponding GStreamer tag or NULL if none exists.
*/
string tagFromId3Tag(string id3Tag)
{
  const(char)* _cretval;
  const(char)* _id3Tag = id3Tag.toCString(No.Alloc);
  _cretval = gst_tag_from_id3_tag(_id3Tag);
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/**
    Looks up the GStreamer tag for an ID3v2 user tag (e.g. description in
    TXXX frame or owner in UFID frame).

    Params:
      type = the type of ID3v2 user tag (e.g. "TXXX" or "UDIF")
      id3UserTag = ID3v2 user tag to convert to GStreamer tag
    Returns: The corresponding GStreamer tag or NULL if none exists.
*/
string tagFromId3UserTag(string type, string id3UserTag)
{
  const(char)* _cretval;
  const(char)* _type = type.toCString(No.Alloc);
  const(char)* _id3UserTag = id3UserTag.toCString(No.Alloc);
  _cretval = gst_tag_from_id3_user_tag(_type, _id3UserTag);
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/**
    Looks up the GStreamer tag for a vorbiscomment tag.

    Params:
      vorbisTag = vorbiscomment tag to convert to GStreamer tag
    Returns: The corresponding GStreamer tag or NULL if none exists.
*/
string tagFromVorbisTag(string vorbisTag)
{
  const(char)* _cretval;
  const(char)* _vorbisTag = vorbisTag.toCString(No.Alloc);
  _cretval = gst_tag_from_vorbis_tag(_vorbisTag);
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/**
    Determines size of an ID3v2 tag on buffer containing at least ID3v2 header,
    i.e. at least #GST_TAG_ID3V2_HEADER_SIZE (10) bytes;

    Params:
      buffer = buffer holding ID3v2 tag (or at least the start of one)
    Returns: Size of tag, or 0 if header is invalid or too small.
*/
uint tagGetId3v2TagSize(gst.buffer.Buffer buffer)
{
  uint _retval;
  _retval = gst_tag_get_id3v2_tag_size(buffer ? cast(GstBuffer*)buffer._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Returns two-letter ISO-639-1 language code given a three-letter ISO-639-2
    language code or two-letter ISO-639-1 language code (both are accepted for
    convenience).
    
    Language codes are case-sensitive and expected to be lower case.

    Params:
      langCode = ISO-639 language code (e.g. "deu" or "ger" or "de")
    Returns: two-letter ISO-639-1 language code string that maps to lang_code,
          or NULL if no mapping is known. The returned string must not be
          modified or freed.
*/
string tagGetLanguageCodeIso6391(string langCode)
{
  const(char)* _cretval;
  const(char)* _langCode = langCode.toCString(No.Alloc);
  _cretval = gst_tag_get_language_code_iso_639_1(_langCode);
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/**
    Returns three-letter ISO-639-2 "bibliographic" language code given a
    two-letter ISO-639-1 language code or a three-letter ISO-639-2 language
    code (both are accepted for convenience).
    
    The "bibliographic" code is derived from the English name of the language
    (e.g. "ger" for German instead of "de" or "deu"). In most scenarios, the
    "terminological" codes are preferred.
    
    Language codes are case-sensitive and expected to be lower case.

    Params:
      langCode = ISO-639 language code (e.g. "deu" or "ger" or "de")
    Returns: three-letter ISO-639-2 language code string that maps to lang_code,
          or NULL if no mapping is known. The returned string must not be
          modified or freed.
*/
string tagGetLanguageCodeIso6392B(string langCode)
{
  const(char)* _cretval;
  const(char)* _langCode = langCode.toCString(No.Alloc);
  _cretval = gst_tag_get_language_code_iso_639_2B(_langCode);
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/**
    Returns three-letter ISO-639-2 "terminological" language code given a
    two-letter ISO-639-1 language code or a three-letter ISO-639-2 language
    code (both are accepted for convenience).
    
    The "terminological" code is derived from the local name of the language
    (e.g. "deu" for German instead of "ger"). In most scenarios, the
    "terminological" codes are preferred over the "bibliographic" ones.
    
    Language codes are case-sensitive and expected to be lower case.

    Params:
      langCode = ISO-639 language code (e.g. "deu" or "ger" or "de")
    Returns: three-letter ISO-639-2 language code string that maps to lang_code,
          or NULL if no mapping is known. The returned string must not be
          modified or freed.
*/
string tagGetLanguageCodeIso6392T(string langCode)
{
  const(char)* _cretval;
  const(char)* _langCode = langCode.toCString(No.Alloc);
  _cretval = gst_tag_get_language_code_iso_639_2T(_langCode);
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/**
    Returns a list of known language codes (in form of two-letter ISO-639-1
    codes). This is useful for UIs to build a list of available languages for
    tagging purposes (e.g. to tag an audio track appropriately in a video or
    audio editor).
    Returns: NULL-terminated string array with two-letter
          language codes. Free with [glib.global.strfreev] when no longer needed.
*/
string[] tagGetLanguageCodes()
{
  char** _cretval;
  _cretval = gst_tag_get_language_codes();
  string[] _retval;

  if (_cretval)
  {
    uint _cretlength;
    for (; _cretval[_cretlength] !is null; _cretlength++)
      break;
    _retval = new string[_cretlength];
    foreach (i; 0 .. _cretlength)
      _retval[i] = _cretval[i].fromCString(Yes.Free);
    gFree(cast(void*)_cretval);
  }
  return _retval;
}

/**
    Returns the name of the language given an ISO-639 language code as
    found in a GST_TAG_LANGUAGE_CODE tag. The name will be translated
    according to the current locale (if the library was built against the
    iso-codes package, otherwise the English name will be returned).
    
    Language codes are case-sensitive and expected to be lower case.

    Params:
      languageCode = two or three-letter ISO-639 language code
    Returns: language name in UTF-8 format, or NULL if language_code could
          not be mapped to a language name. The returned string must not be
          modified and does not need to freed; it will stay valid until the
          application is terminated.
*/
string tagGetLanguageName(string languageCode)
{
  const(char)* _cretval;
  const(char)* _languageCode = languageCode.toCString(No.Alloc);
  _cretval = gst_tag_get_language_name(_languageCode);
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/**
    Get the description of a license, which is a translated description
    of the license's main features.

    Params:
      licenseRef = a license reference string in form of a URI,
            e.g. "http://creativecommons.org/licenses/by-nc-nd/2.0/"
    Returns: the description of the license, or NULL if the license is unknown
         or a description is not available.
*/
string tagGetLicenseDescription(string licenseRef)
{
  const(char)* _cretval;
  const(char)* _licenseRef = licenseRef.toCString(No.Alloc);
  _cretval = gst_tag_get_license_description(_licenseRef);
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/**
    Get the flags of a license, which describe most of the features of
    a license in their most general form.

    Params:
      licenseRef = a license reference string in form of a URI,
            e.g. "http://creativecommons.org/licenses/by-nc-nd/2.0/"
    Returns: the flags of the license, or 0 if the license is unknown
*/
gsttag.types.TagLicenseFlags tagGetLicenseFlags(string licenseRef)
{
  GstTagLicenseFlags _cretval;
  const(char)* _licenseRef = licenseRef.toCString(No.Alloc);
  _cretval = gst_tag_get_license_flags(_licenseRef);
  gsttag.types.TagLicenseFlags _retval = cast(gsttag.types.TagLicenseFlags)_cretval;
  return _retval;
}

/**
    Get the jurisdiction code of a license. This is usually a two-letter
    ISO 3166-1 alpha-2 code, but there is also the special case of Scotland,
    for which no code exists and which is thus represented as "scotland".
    
    Known jurisdictions: ar, at, au, be, bg, br, ca, ch, cl, cn, co, de,
    dk, es, fi, fr, hr, hu, il, in, it, jp, kr, mk, mt, mx, my, nl, pe, pl,
    pt, scotland, se, si, tw, uk, us, za.

    Params:
      licenseRef = a license reference string in form of a URI,
            e.g. "http://creativecommons.org/licenses/by-nc-nd/2.0/"
    Returns: the jurisdiction code of the license, or NULL if the license is
         unknown or is not specific to a particular jurisdiction.
*/
string tagGetLicenseJurisdiction(string licenseRef)
{
  const(char)* _cretval;
  const(char)* _licenseRef = licenseRef.toCString(No.Alloc);
  _cretval = gst_tag_get_license_jurisdiction(_licenseRef);
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/**
    Get the nick name of a license, which is a short (untranslated) string
    such as e.g. "CC BY-NC-ND 2.0 UK".

    Params:
      licenseRef = a license reference string in form of a URI,
            e.g. "http://creativecommons.org/licenses/by-nc-nd/2.0/"
    Returns: the nick name of the license, or NULL if the license is unknown
*/
string tagGetLicenseNick(string licenseRef)
{
  const(char)* _cretval;
  const(char)* _licenseRef = licenseRef.toCString(No.Alloc);
  _cretval = gst_tag_get_license_nick(_licenseRef);
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/**
    Get the title of a license, which is a short translated description
    of the license's features (generally not very pretty though).

    Params:
      licenseRef = a license reference string in form of a URI,
            e.g. "http://creativecommons.org/licenses/by-nc-nd/2.0/"
    Returns: the title of the license, or NULL if the license is unknown or
         no title is available.
*/
string tagGetLicenseTitle(string licenseRef)
{
  const(char)* _cretval;
  const(char)* _licenseRef = licenseRef.toCString(No.Alloc);
  _cretval = gst_tag_get_license_title(_licenseRef);
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/**
    Get the version of a license.

    Params:
      licenseRef = a license reference string in form of a URI,
            e.g. "http://creativecommons.org/licenses/by-nc-nd/2.0/"
    Returns: the version of the license, or NULL if the license is not known or
         has no version
*/
string tagGetLicenseVersion(string licenseRef)
{
  const(char)* _cretval;
  const(char)* _licenseRef = licenseRef.toCString(No.Alloc);
  _cretval = gst_tag_get_license_version(_licenseRef);
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/**
    Returns a list of known license references (in form of URIs). This is
    useful for UIs to build a list of available licenses for tagging purposes
    (e.g. to tag an audio track appropriately in a video or audio editor, or
    an image in a camera application).
    Returns: NULL-terminated array of license strings. Free
          with [glib.global.strfreev] when no longer needed.
*/
string[] tagGetLicenses()
{
  char** _cretval;
  _cretval = gst_tag_get_licenses();
  string[] _retval;

  if (_cretval)
  {
    uint _cretlength;
    for (; _cretval[_cretlength] !is null; _cretlength++)
      break;
    _retval = new string[_cretlength];
    foreach (i; 0 .. _cretlength)
      _retval[i] = _cretval[i].fromCString(Yes.Free);
    gFree(cast(void*)_cretval);
  }
  return _retval;
}

/**
    Gets the number of ID3v1 genres that can be identified. Winamp genres are
    included.
    Returns: the number of ID3v1 genres that can be identified
*/
uint tagId3GenreCount()
{
  uint _retval;
  _retval = gst_tag_id3_genre_count();
  return _retval;
}

/**
    Gets the ID3v1 genre name for a given ID.

    Params:
      id = ID of genre to query
    Returns: the genre or NULL if no genre is associated with that ID.
*/
string tagId3GenreGet(uint id)
{
  const(char)* _cretval;
  _cretval = gst_tag_id3_genre_get(id);
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/**
    Helper function for tag-reading plugins to create a #GstSample suitable to
    add to a #GstTagList as an image tag (such as #GST_TAG_IMAGE or
    #GST_TAG_PREVIEW_IMAGE) from the encoded image data and an (optional) image
    type.
    
    Background: cover art and other images in tags are usually stored as a
    blob of binary image data, often accompanied by a MIME type or some other
    content type string (e.g. 'png', 'jpeg', 'jpg'). Sometimes there is also an
    'image type' to indicate what kind of image this is (e.g. front cover,
    back cover, artist, etc.). The image data may also be an URI to the image
    rather than the image itself.
    
    In GStreamer, image tags are #GstSample<!-- -->s containing the raw image
    data, with the sample caps describing the content type of the image
    (e.g. image/jpeg, image/png, text/uri-list). The sample info may contain
    an additional 'image-type' field of #GstTagImageType to describe
    the type of image (front cover, back cover etc.). #GST_TAG_PREVIEW_IMAGE
    tags should not carry an image type, their type is already indicated via
    the special tag name.
    
    This function will do various checks and typefind the encoded image
    data (we can't trust the declared mime type).

    Params:
      imageData = the (encoded) image
      imageType = type of the image, or #GST_TAG_IMAGE_TYPE_UNDEFINED. Pass
            #GST_TAG_IMAGE_TYPE_NONE if no image type should be set at all (e.g.
            for preview images)
    Returns: a newly-allocated image sample for use in tag lists, or NULL
*/
gst.sample.Sample tagImageDataToImageSample(ubyte[] imageData, gsttag.types.TagImageType imageType)
{
  GstSample* _cretval;
  uint _imageDataLen;
  if (imageData)
    _imageDataLen = cast(uint)imageData.length;

  auto _imageData = cast(const(ubyte)*)imageData.ptr;
  _cretval = gst_tag_image_data_to_image_sample(_imageData, _imageDataLen, imageType);
  auto _retval = _cretval ? new gst.sample.Sample(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Adds an image from an ID3 APIC frame (or similar, such as used in FLAC)
    to the given tag list. Also see [gsttag.global.tagImageDataToImageSample] for
    more information on image tags in GStreamer.

    Params:
      tagList = a tag list
      imageData = the (encoded) image
      id3PictureType = picture type as per the ID3 (v2.4.0) specification for
           the APIC frame (0 = unknown/other)
    Returns: true if the image was processed, otherwise false
*/
bool tagListAddId3Image(gst.tag_list.TagList tagList, ubyte[] imageData, uint id3PictureType)
{
  bool _retval;
  uint _imageDataLen;
  if (imageData)
    _imageDataLen = cast(uint)imageData.length;

  auto _imageData = cast(const(ubyte)*)imageData.ptr;
  _retval = gst_tag_list_add_id3_image(tagList ? cast(GstTagList*)tagList._cPtr(No.Dup) : null, _imageData, _imageDataLen, id3PictureType);
  return _retval;
}

/**
    Parses the IFD and IFD tags data contained in the buffer and puts it
    on a taglist. The base_offset is used to subtract from the offset in
    the tag entries and be able to get the offset relative to the buffer
    start

    Params:
      buffer = The exif buffer
      byteOrder = byte order of the data
      baseOffset = Offset from the tiff header to this buffer
    Returns: The parsed taglist
*/
gst.tag_list.TagList tagListFromExifBuffer(gst.buffer.Buffer buffer, int byteOrder, uint baseOffset)
{
  GstTagList* _cretval;
  _cretval = gst_tag_list_from_exif_buffer(buffer ? cast(GstBuffer*)buffer._cPtr(No.Dup) : null, byteOrder, baseOffset);
  auto _retval = _cretval ? new gst.tag_list.TagList(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Parses the exif tags starting with a tiff header structure.

    Params:
      buffer = The exif buffer
    Returns: The taglist
*/
gst.tag_list.TagList tagListFromExifBufferWithTiffHeader(gst.buffer.Buffer buffer)
{
  GstTagList* _cretval;
  _cretval = gst_tag_list_from_exif_buffer_with_tiff_header(buffer ? cast(GstBuffer*)buffer._cPtr(No.Dup) : null);
  auto _retval = _cretval ? new gst.tag_list.TagList(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Creates a new tag list that contains the information parsed out of a
    ID3 tag.

    Params:
      buffer = buffer to convert
    Returns: A new #GstTagList with all tags that could be extracted from the
               given vorbiscomment buffer or NULL on error.
*/
gst.tag_list.TagList tagListFromId3v2Tag(gst.buffer.Buffer buffer)
{
  GstTagList* _cretval;
  _cretval = gst_tag_list_from_id3v2_tag(buffer ? cast(GstBuffer*)buffer._cPtr(No.Dup) : null);
  auto _retval = _cretval ? new gst.tag_list.TagList(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Creates a new tag list that contains the information parsed out of a
    vorbiscomment packet.

    Params:
      data = data to convert
      idData = identification data at start of stream
      vendorString = pointer to a string that should take the
            vendor string of this vorbis comment or NULL if you don't need it.
    Returns: A new #GstTagList with all tags that could be extracted from the
               given vorbiscomment buffer or NULL on error.
*/
gst.tag_list.TagList tagListFromVorbiscomment(ubyte[] data, ubyte[] idData, out string vendorString)
{
  GstTagList* _cretval;
  size_t _size;
  if (data)
    _size = cast(size_t)data.length;

  auto _data = cast(const(ubyte)*)data.ptr;
  uint _idDataLength;
  if (idData)
    _idDataLength = cast(uint)idData.length;

  auto _idData = cast(const(ubyte)*)idData.ptr;
  char* _vendorString;
  _cretval = gst_tag_list_from_vorbiscomment(_data, _size, _idData, _idDataLength, &_vendorString);
  auto _retval = _cretval ? new gst.tag_list.TagList(cast(void*)_cretval, Yes.Take) : null;
  vendorString = _vendorString.fromCString(Yes.Free);
  return _retval;
}

/**
    Creates a new tag list that contains the information parsed out of a
    vorbiscomment packet.

    Params:
      buffer = buffer to convert
      idData = identification data at start of stream
      vendorString = pointer to a string that should take the
            vendor string of this vorbis comment or NULL if you don't need it.
    Returns: A new #GstTagList with all tags that could be extracted from the
               given vorbiscomment buffer or NULL on error.
*/
gst.tag_list.TagList tagListFromVorbiscommentBuffer(gst.buffer.Buffer buffer, ubyte[] idData, out string vendorString)
{
  GstTagList* _cretval;
  uint _idDataLength;
  if (idData)
    _idDataLength = cast(uint)idData.length;

  auto _idData = cast(const(ubyte)*)idData.ptr;
  char* _vendorString;
  _cretval = gst_tag_list_from_vorbiscomment_buffer(buffer ? cast(GstBuffer*)buffer._cPtr(No.Dup) : null, _idData, _idDataLength, &_vendorString);
  auto _retval = _cretval ? new gst.tag_list.TagList(cast(void*)_cretval, Yes.Take) : null;
  vendorString = _vendorString.fromCString(Yes.Free);
  return _retval;
}

/**
    Parse a xmp packet into a taglist.

    Params:
      buffer = buffer
    Returns: new taglist or null, free the list when done
*/
gst.tag_list.TagList tagListFromXmpBuffer(gst.buffer.Buffer buffer)
{
  GstTagList* _cretval;
  _cretval = gst_tag_list_from_xmp_buffer(buffer ? cast(GstBuffer*)buffer._cPtr(No.Dup) : null);
  auto _retval = _cretval ? new gst.tag_list.TagList(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Parses the data containing an ID3v1 tag and returns a #GstTagList from the
    parsed data.

    Params:
      data = 128 bytes of data containing the ID3v1 tag
    Returns: A new tag list or NULL if the data was not an ID3v1 tag.
*/
gst.tag_list.TagList tagListNewFromId3v1(ubyte[] data)
{
  GstTagList* _cretval;
  assert(!data || data.length == 128);
  auto _data = cast(const(ubyte)*)data.ptr;
  _cretval = gst_tag_list_new_from_id3v1(_data);
  auto _retval = _cretval ? new gst.tag_list.TagList(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Formats the tags in taglist on exif format. The resulting buffer contains
    the tags IFD and is followed by the data pointed by the tag entries.

    Params:
      taglist = The taglist
      byteOrder = byte order used in writing (G_LITTLE_ENDIAN or G_BIG_ENDIAN)
      baseOffset = Offset from the tiff header first byte
    Returns: A GstBuffer containing the tag entries followed by the tag data
*/
gst.buffer.Buffer tagListToExifBuffer(gst.tag_list.TagList taglist, int byteOrder, uint baseOffset)
{
  GstBuffer* _cretval;
  _cretval = gst_tag_list_to_exif_buffer(taglist ? cast(const(GstTagList)*)taglist._cPtr(No.Dup) : null, byteOrder, baseOffset);
  auto _retval = _cretval ? new gst.buffer.Buffer(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Formats the tags in taglist into exif structure, a tiff header
    is put in the beginning of the buffer.

    Params:
      taglist = The taglist
    Returns: A GstBuffer containing the data
*/
gst.buffer.Buffer tagListToExifBufferWithTiffHeader(gst.tag_list.TagList taglist)
{
  GstBuffer* _cretval;
  _cretval = gst_tag_list_to_exif_buffer_with_tiff_header(taglist ? cast(const(GstTagList)*)taglist._cPtr(No.Dup) : null);
  auto _retval = _cretval ? new gst.buffer.Buffer(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Creates a new vorbiscomment buffer from a tag list.

    Params:
      list = tag list to convert
      idData = identification data at start of stream
      vendorString = string that describes the vendor string or NULL
    Returns: A new #GstBuffer containing a vorbiscomment buffer with all tags
               that could be converted from the given tag list.
*/
gst.buffer.Buffer tagListToVorbiscommentBuffer(gst.tag_list.TagList list, ubyte[] idData, string vendorString = null)
{
  GstBuffer* _cretval;
  uint _idDataLength;
  if (idData)
    _idDataLength = cast(uint)idData.length;

  auto _idData = cast(const(ubyte)*)idData.ptr;
  const(char)* _vendorString = vendorString.toCString(No.Alloc);
  _cretval = gst_tag_list_to_vorbiscomment_buffer(list ? cast(const(GstTagList)*)list._cPtr(No.Dup) : null, _idData, _idDataLength, _vendorString);
  auto _retval = _cretval ? new gst.buffer.Buffer(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Formats a taglist as a xmp packet using only the selected
    schemas. An empty list (null) means that all schemas should
    be used

    Params:
      list = tags
      readOnly = does the container forbid inplace editing
      schemas = null terminated array of schemas to be used on serialization
    Returns: new buffer or null, unref the buffer when done
*/
gst.buffer.Buffer tagListToXmpBuffer(gst.tag_list.TagList list, bool readOnly, string[] schemas)
{
  GstBuffer* _cretval;
  char*[] _tmpschemas;
  foreach (s; schemas)
    _tmpschemas ~= s.toCString(No.Alloc);
  _tmpschemas ~= null;
  const(char*)* _schemas = _tmpschemas.ptr;
  _cretval = gst_tag_list_to_xmp_buffer(list ? cast(const(GstTagList)*)list._cPtr(No.Dup) : null, readOnly, _schemas);
  auto _retval = _cretval ? new gst.buffer.Buffer(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Convenience function to parse a GST_TAG_EXTENDED_COMMENT string and
    separate it into its components.
    
    If successful, key, lang and/or value will be set to newly allocated
    strings that you need to free with [glib.global.gfree] when done. key and lang
    may also be set to NULL by this function if there is no key or no language
    code in the extended comment string.

    Params:
      extComment = an extended comment string, see #GST_TAG_EXTENDED_COMMENT
      key = return location for the comment description key, or NULL
      lang = return location for the comment ISO-639 language code, or NULL
      value = return location for the actual comment string, or NULL
      failIfNoKey = whether to fail if strings are not in key=value form
    Returns: TRUE if the string could be parsed, otherwise FALSE
*/
bool tagParseExtendedComment(string extComment, out string key, out string lang, out string value, bool failIfNoKey)
{
  bool _retval;
  const(char)* _extComment = extComment.toCString(No.Alloc);
  char* _key;
  char* _lang;
  char* _value;
  _retval = gst_tag_parse_extended_comment(_extComment, &_key, &_lang, &_value, failIfNoKey);
  key = _key.fromCString(Yes.Free);
  lang = _lang.fromCString(Yes.Free);
  value = _value.fromCString(Yes.Free);
  return _retval;
}

/**
    Registers additional musicbrainz-specific tags with the GStreamer tag
    system. Plugins and applications that use these tags should call this
    function before using them. Can be called multiple times.
*/
void tagRegisterMusicbrainzTags()
{
  gst_tag_register_musicbrainz_tags();
}

/**
    Looks up the ID3v2 tag for a GStreamer tag.

    Params:
      gstTag = GStreamer tag to convert to vorbiscomment tag
    Returns: The corresponding ID3v2 tag or NULL if none exists.
*/
string tagToId3Tag(string gstTag)
{
  const(char)* _cretval;
  const(char)* _gstTag = gstTag.toCString(No.Alloc);
  _cretval = gst_tag_to_id3_tag(_gstTag);
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/**
    Creates a new tag list that contains the information parsed out of a
    vorbiscomment packet.

    Params:
      list = a #GstTagList
      tag = a GStreamer tag identifier, such as #GST_TAG_ARTIST
    Returns: A #GList of newly-allocated
          key=value strings. Free with g_list_foreach (list, (GFunc) g_free, NULL)
          plus g_list_free (list)
*/
string[] tagToVorbisComments(gst.tag_list.TagList list, string tag)
{
  GList* _cretval;
  const(char)* _tag = tag.toCString(No.Alloc);
  _cretval = gst_tag_to_vorbis_comments(list ? cast(const(GstTagList)*)list._cPtr(No.Dup) : null, _tag);
  auto _retval = gListToD!(string, GidOwnership.Full)(cast(GList*)_cretval);
  return _retval;
}

/**
    Looks up the vorbiscomment tag for a GStreamer tag.

    Params:
      gstTag = GStreamer tag to convert to vorbiscomment tag
    Returns: The corresponding vorbiscomment tag or NULL if none exists.
*/
string tagToVorbisTag(string gstTag)
{
  const(char)* _cretval;
  const(char)* _gstTag = gstTag.toCString(No.Alloc);
  _cretval = gst_tag_to_vorbis_tag(_gstTag);
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/**
    Gets the list of supported schemas in the xmp lib
    Returns: a null terminated array of strings with the
          schema names
*/
string[] tagXmpListSchemas()
{
  const(char*)* _cretval;
  _cretval = gst_tag_xmp_list_schemas();
  string[] _retval;

  if (_cretval)
  {
    uint _cretlength;
    for (; _cretval[_cretlength] !is null; _cretlength++)
      break;
    _retval = new string[_cretlength];
    foreach (i; 0 .. _cretlength)
      _retval[i] = _cretval[i].fromCString(No.Free);
  }
  return _retval;
}

/**
    Convenience function using [gsttag.global.tagFromVorbisTag], parsing
    a vorbis comment string into the right type and adding it to the
    given taglist list.
    
    Unknown vorbiscomment tags will be added to the tag list in form
    of a #GST_TAG_EXTENDED_COMMENT.

    Params:
      list = a #GstTagList
      tag = a vorbiscomment tag string (key in key=value), must be valid UTF-8
      value = a vorbiscomment value string (value in key=value), must be valid UTF-8
*/
void vorbisTagAdd(gst.tag_list.TagList list, string tag, string value)
{
  const(char)* _tag = tag.toCString(No.Alloc);
  const(char)* _value = value.toCString(No.Alloc);
  gst_vorbis_tag_add(list ? cast(GstTagList*)list._cPtr(No.Dup) : null, _tag, _value);
}
