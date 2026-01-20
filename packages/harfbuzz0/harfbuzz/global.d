/// Global functions for harfbuzz0 library
module harfbuzz.global;

import freetype2.types;
import gid.gid;
import glib.bytes;
import glib.types;
import harfbuzz.blob;
import harfbuzz.buffer;
import harfbuzz.c.functions;
import harfbuzz.c.types;
import harfbuzz.draw_funcs;
import harfbuzz.draw_state;
import harfbuzz.face;
import harfbuzz.feature;
import harfbuzz.font;
import harfbuzz.font_funcs;
import harfbuzz.glyph_info;
import harfbuzz.glyph_position;
import harfbuzz.map;
import harfbuzz.paint_funcs;
import harfbuzz.segment_properties;
import harfbuzz.set;
import harfbuzz.shape_plan;
import harfbuzz.types;
import harfbuzz.unicode_funcs;
import harfbuzz.variation;


/**
    Fetches the name identifier of the specified feature type in the face's `name` table.

    Params:
      face = #hb_face_t to work upon
      featureType = The #hb_aat_layout_feature_type_t of the requested feature type
    Returns: Name identifier of the requested feature type
*/
harfbuzz.types.OtNameId aatLayoutFeatureTypeGetNameId(harfbuzz.face.Face face, harfbuzz.types.AatLayoutFeatureType featureType)
{
  harfbuzz.types.OtNameId _retval;
  _retval = hb_aat_layout_feature_type_get_name_id(face ? cast(hb_face_t*)face._cPtr(No.Dup) : null, featureType);
  return _retval;
}

/**
    Fetches a list of the selectors available for the specified feature in the given face.
    
    If upon return, default_index is set to #HB_AAT_LAYOUT_NO_SELECTOR_INDEX, then
    the feature type is non-exclusive.  Otherwise, default_index is the index of
    the selector that is selected by default.

    Params:
      face = #hb_face_t to work upon
      featureType = The #hb_aat_layout_feature_type_t of the requested feature type
      startOffset = offset of the first feature type to retrieve
      selectors = A buffer pointer. The selectors available for the feature type queries.
      defaultIndex = The index of the feature's default selector, if any
    Returns: Number of all available feature selectors
*/
uint aatLayoutFeatureTypeGetSelectorInfos(harfbuzz.face.Face face, harfbuzz.types.AatLayoutFeatureType featureType, uint startOffset, ref harfbuzz.types.AatLayoutFeatureSelectorInfo[] selectors, out uint defaultIndex)
{
  uint _retval;
  uint _selectorCount;
  _selectorCount = cast(uint)selectors.length;
  _retval = hb_aat_layout_feature_type_get_selector_infos(face ? cast(hb_face_t*)face._cPtr(No.Dup) : null, featureType, startOffset, &_selectorCount, selectors.ptr, cast(uint*)&defaultIndex);
  return _retval;
}

/**
    Fetches a list of the AAT feature types included in the specified face.

    Params:
      face = #hb_face_t to work upon
      startOffset = offset of the first feature type to retrieve
      features = Array of feature types found
    Returns: Number of all available feature types.
*/
uint aatLayoutGetFeatureTypes(harfbuzz.face.Face face, uint startOffset, ref harfbuzz.types.AatLayoutFeatureType[] features)
{
  uint _retval;
  uint _featureCount;
  _featureCount = cast(uint)features.length;
  _retval = hb_aat_layout_get_feature_types(face ? cast(hb_face_t*)face._cPtr(No.Dup) : null, startOffset, &_featureCount, features.ptr);
  return _retval;
}

/**
    Tests whether the specified face includes any positioning information
    in the `kerx` table.
    
    <note>Note: does not examine the `GPOS` table.</note>

    Params:
      face = #hb_face_t to work upon
    Returns: `true` if data found, `false` otherwise
*/
harfbuzz.types.Bool aatLayoutHasPositioning(harfbuzz.face.Face face)
{
  harfbuzz.types.Bool _retval;
  _retval = hb_aat_layout_has_positioning(face ? cast(hb_face_t*)face._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Tests whether the specified face includes any substitutions in the
    `morx` or `mort` tables.
    
    <note>Note: does not examine the `GSUB` table.</note>

    Params:
      face = #hb_face_t to work upon
    Returns: `true` if data found, `false` otherwise
*/
harfbuzz.types.Bool aatLayoutHasSubstitution(harfbuzz.face.Face face)
{
  harfbuzz.types.Bool _retval;
  _retval = hb_aat_layout_has_substitution(face ? cast(hb_face_t*)face._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Tests whether the specified face includes any tracking information
    in the `trak` table.

    Params:
      face = #hb_face_t to work upon
    Returns: `true` if data found, `false` otherwise
*/
harfbuzz.types.Bool aatLayoutHasTracking(harfbuzz.face.Face face)
{
  harfbuzz.types.Bool _retval;
  _retval = hb_aat_layout_has_tracking(face ? cast(hb_face_t*)face._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Makes a writable copy of blob.

    Params:
      blob = A blob.
    Returns: The new blob, or nullptr if allocation failed
*/
harfbuzz.blob.Blob blobCopyWritableOrFail(harfbuzz.blob.Blob blob)
{
  hb_blob_t* _cretval;
  _cretval = hb_blob_copy_writable_or_fail(blob ? cast(hb_blob_t*)blob._cPtr(No.Dup) : null);
  auto _retval = _cretval ? new harfbuzz.blob.Blob(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Creates a new blob containing the data from the
    specified binary font file.

    Params:
      fileName = A font filename
    Returns: An #hb_blob_t pointer with the content of the file,
      or [harfbuzz.global.blobGetEmpty] if failed.
*/
harfbuzz.blob.Blob blobCreateFromFile(string fileName)
{
  hb_blob_t* _cretval;
  const(char)* _fileName = fileName.toCString(No.Alloc);
  _cretval = hb_blob_create_from_file(_fileName);
  auto _retval = _cretval ? new harfbuzz.blob.Blob(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Creates a new blob containing the data from the
    specified binary font file.

    Params:
      fileName = A font filename
    Returns: An #hb_blob_t pointer with the content of the file,
      or `NULL` if failed.
*/
harfbuzz.blob.Blob blobCreateFromFileOrFail(string fileName)
{
  hb_blob_t* _cretval;
  const(char)* _fileName = fileName.toCString(No.Alloc);
  _cretval = hb_blob_create_from_file_or_fail(_fileName);
  auto _retval = _cretval ? new harfbuzz.blob.Blob(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Returns a blob that represents a range of bytes in parent.  The new
    blob is always created with #HB_MEMORY_MODE_READONLY, meaning that it
    will never modify data in the parent blob.  The parent data is not
    expected to be modified, and will result in undefined behavior if it
    is.
    
    Makes parent immutable.

    Params:
      parent = Parent blob.
      offset = Start offset of sub-blob within parent, in bytes.
      length = Length of sub-blob.
    Returns: New blob, or the empty blob if something failed or if
      length is zero or offset is beyond the end of parent's data.  Destroy
      with [harfbuzz.global.blobDestroy].
*/
harfbuzz.blob.Blob blobCreateSubBlob(harfbuzz.blob.Blob parent, uint offset, uint length)
{
  hb_blob_t* _cretval;
  _cretval = hb_blob_create_sub_blob(parent ? cast(hb_blob_t*)parent._cPtr(No.Dup) : null, offset, length);
  auto _retval = _cretval ? new harfbuzz.blob.Blob(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Fetches the data from a blob.

    Params:
      blob = a blob.
    Returns: the byte data of blob.
*/
string blobGetData(harfbuzz.blob.Blob blob)
{
  const(char)* _cretval;
  uint _cretlength;
  _cretval = hb_blob_get_data(blob ? cast(hb_blob_t*)blob._cPtr(No.Dup) : null, &_cretlength);
  string _retval;

  if (_cretval)
  {
    _retval = cast(string)_cretval[0 .. _cretlength].dup;
  }
  return _retval;
}

/**
    Tries to make blob data writable (possibly copying it) and
    return pointer to data.
    
    Fails if blob has been made immutable, or if memory allocation
    fails.

    Params:
      blob = a blob.
    Returns: Writable blob data,
      or `NULL` if failed.
*/
string blobGetDataWritable(harfbuzz.blob.Blob blob)
{
  char* _cretval;
  uint _cretlength;
  _cretval = hb_blob_get_data_writable(blob ? cast(hb_blob_t*)blob._cPtr(No.Dup) : null, &_cretlength);
  string _retval;

  if (_cretval)
  {
    _retval = cast(string)_cretval[0 .. _cretlength].dup;
  }
  return _retval;
}

/**
    Returns the singleton empty blob.
    
    See TODO:link object types for more information.
    Returns: The empty blob.
*/
harfbuzz.blob.Blob blobGetEmpty()
{
  hb_blob_t* _cretval;
  _cretval = hb_blob_get_empty();
  auto _retval = _cretval ? new harfbuzz.blob.Blob(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Fetches the length of a blob's data.

    Params:
      blob = a blob.
    Returns: the length of blob data in bytes.
*/
uint blobGetLength(harfbuzz.blob.Blob blob)
{
  uint _retval;
  _retval = hb_blob_get_length(blob ? cast(hb_blob_t*)blob._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Tests whether a blob is immutable.

    Params:
      blob = a blob.
    Returns: `true` if blob is immutable, `false` otherwise
*/
harfbuzz.types.Bool blobIsImmutable(harfbuzz.blob.Blob blob)
{
  harfbuzz.types.Bool _retval;
  _retval = hb_blob_is_immutable(blob ? cast(hb_blob_t*)blob._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Makes a blob immutable.

    Params:
      blob = a blob
*/
void blobMakeImmutable(harfbuzz.blob.Blob blob)
{
  hb_blob_make_immutable(blob ? cast(hb_blob_t*)blob._cPtr(No.Dup) : null);
}

/**
    Appends a character with the Unicode value of codepoint to buffer, and
    gives it the initial cluster value of cluster. Clusters can be any thing
    the client wants, they are usually used to refer to the index of the
    character in the input text stream and are output in
    #hb_glyph_info_t.cluster field.
    
    This function does not check the validity of codepoint, it is up to the
    caller to ensure it is a valid Unicode code point.

    Params:
      buffer = An #hb_buffer_t
      codepoint = A Unicode code point.
      cluster = The cluster value of codepoint.
*/
void bufferAdd(harfbuzz.buffer.Buffer buffer, harfbuzz.types.Codepoint codepoint, uint cluster)
{
  hb_buffer_add(buffer ? cast(hb_buffer_t*)buffer._cPtr(No.Dup) : null, codepoint, cluster);
}

/**
    Appends characters from text array to buffer. The item_offset is the
    position of the first character from text that will be appended, and
    item_length is the number of character. When shaping part of a larger text
    (e.g. a run of text from a paragraph), instead of passing just the substring
    corresponding to the run, it is preferable to pass the whole
    paragraph and specify the run start and length as item_offset and
    item_length, respectively, to give HarfBuzz the full context to be able,
    for example, to do cross-run Arabic shaping or properly handle combining
    marks at stat of run.
    
    This function does not check the validity of text, it is up to the caller
    to ensure it contains a valid Unicode scalar values.  In contrast,
    [harfbuzz.global.bufferAddUtf32] can be used that takes similar input but performs
    sanity-check on the input.

    Params:
      buffer = a #hb_buffer_t to append characters to.
      text = an array of Unicode code points to append.
      itemOffset = the offset of the first code point to add to the buffer.
      itemLength = the number of code points to add to the buffer, or -1 for the
                      end of text (assuming it is `NULL` terminated).
*/
void bufferAddCodepoints(harfbuzz.buffer.Buffer buffer, harfbuzz.types.Codepoint[] text, uint itemOffset, int itemLength)
{
  int _textLength;
  if (text)
    _textLength = cast(int)text.length;

  auto _text = cast(const(hb_codepoint_t)*)text.ptr;
  hb_buffer_add_codepoints(buffer ? cast(hb_buffer_t*)buffer._cPtr(No.Dup) : null, _text, _textLength, itemOffset, itemLength);
}

/**
    Similar to [harfbuzz.global.bufferAddCodepoints], but allows only access to first 256
    Unicode code points that can fit in 8-bit strings.
    
    <note>Has nothing to do with non-Unicode Latin-1 encoding.</note>

    Params:
      buffer = An #hb_buffer_t
      text = an array of UTF-8
                      characters to append
      itemOffset = the offset of the first character to add to the buffer
      itemLength = the number of characters to add to the buffer, or -1 for the
                      end of text (assuming it is `NULL` terminated)
*/
void bufferAddLatin1(harfbuzz.buffer.Buffer buffer, ubyte[] text, uint itemOffset, int itemLength)
{
  int _textLength;
  if (text)
    _textLength = cast(int)text.length;

  auto _text = cast(const(ubyte)*)text.ptr;
  hb_buffer_add_latin1(buffer ? cast(hb_buffer_t*)buffer._cPtr(No.Dup) : null, _text, _textLength, itemOffset, itemLength);
}

/**
    See [harfbuzz.global.bufferAddCodepoints].
    
    Replaces invalid UTF-16 characters with the buffer replacement code point,
    see [harfbuzz.global.bufferSetReplacementCodepoint].

    Params:
      buffer = An #hb_buffer_t
      text = An array of UTF-16 characters to append
      itemOffset = The offset of the first character to add to the buffer
      itemLength = The number of characters to add to the buffer, or -1 for the
                      end of text (assuming it is `NULL` terminated)
*/
void bufferAddUtf16(harfbuzz.buffer.Buffer buffer, ushort[] text, uint itemOffset, int itemLength)
{
  int _textLength;
  if (text)
    _textLength = cast(int)text.length;

  auto _text = cast(const(ushort)*)text.ptr;
  hb_buffer_add_utf16(buffer ? cast(hb_buffer_t*)buffer._cPtr(No.Dup) : null, _text, _textLength, itemOffset, itemLength);
}

/**
    See [harfbuzz.global.bufferAddCodepoints].
    
    Replaces invalid UTF-32 characters with the buffer replacement code point,
    see [harfbuzz.global.bufferSetReplacementCodepoint].

    Params:
      buffer = An #hb_buffer_t
      text = An array of UTF-32 characters to append
      itemOffset = The offset of the first character to add to the buffer
      itemLength = The number of characters to add to the buffer, or -1 for the
                      end of text (assuming it is `NULL` terminated)
*/
void bufferAddUtf32(harfbuzz.buffer.Buffer buffer, uint[] text, uint itemOffset, int itemLength)
{
  int _textLength;
  if (text)
    _textLength = cast(int)text.length;

  auto _text = cast(const(uint)*)text.ptr;
  hb_buffer_add_utf32(buffer ? cast(hb_buffer_t*)buffer._cPtr(No.Dup) : null, _text, _textLength, itemOffset, itemLength);
}

/**
    See [harfbuzz.global.bufferAddCodepoints].
    
    Replaces invalid UTF-8 characters with the buffer replacement code point,
    see [harfbuzz.global.bufferSetReplacementCodepoint].

    Params:
      buffer = An #hb_buffer_t
      text = An array of UTF-8
                      characters to append.
      itemOffset = The offset of the first character to add to the buffer.
      itemLength = The number of characters to add to the buffer, or -1 for the
                      end of text (assuming it is `NULL` terminated).
*/
void bufferAddUtf8(harfbuzz.buffer.Buffer buffer, ubyte[] text, uint itemOffset, int itemLength)
{
  int _textLength;
  if (text)
    _textLength = cast(int)text.length;

  auto _text = cast(const(ubyte)*)text.ptr;
  hb_buffer_add_utf8(buffer ? cast(hb_buffer_t*)buffer._cPtr(No.Dup) : null, _text, _textLength, itemOffset, itemLength);
}

/**
    Check if allocating memory for the buffer succeeded.

    Params:
      buffer = An #hb_buffer_t
    Returns: `true` if buffer memory allocation succeeded, `false` otherwise.
*/
harfbuzz.types.Bool bufferAllocationSuccessful(harfbuzz.buffer.Buffer buffer)
{
  harfbuzz.types.Bool _retval;
  _retval = hb_buffer_allocation_successful(buffer ? cast(hb_buffer_t*)buffer._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Append (part of) contents of another buffer to this buffer.

    Params:
      buffer = An #hb_buffer_t
      source = source #hb_buffer_t
      start = start index into source buffer to copy.  Use 0 to copy from start of buffer.
      end = end index into source buffer to copy.  Use HB_FEATURE_GLOBAL_END to copy to end of buffer.
*/
void bufferAppend(harfbuzz.buffer.Buffer buffer, harfbuzz.buffer.Buffer source, uint start, uint end)
{
  hb_buffer_append(buffer ? cast(hb_buffer_t*)buffer._cPtr(No.Dup) : null, source ? cast(const(hb_buffer_t)*)source._cPtr(No.Dup) : null, start, end);
}

/**
    Similar to [harfbuzz.global.bufferReset], but does not clear the Unicode functions and
    the replacement code point.

    Params:
      buffer = An #hb_buffer_t
*/
void bufferClearContents(harfbuzz.buffer.Buffer buffer)
{
  hb_buffer_clear_contents(buffer ? cast(hb_buffer_t*)buffer._cPtr(No.Dup) : null);
}

/**
    Creates a new #hb_buffer_t with all properties to defaults.
    Returns: A newly allocated #hb_buffer_t with a reference count of 1. The initial
      reference count should be released with [harfbuzz.global.bufferDestroy] when you are done
      using the #hb_buffer_t. This function never returns `NULL`. If memory cannot
      be allocated, a special #hb_buffer_t object will be returned on which
      [harfbuzz.global.bufferAllocationSuccessful] returns `false`.
*/
harfbuzz.buffer.Buffer bufferCreate()
{
  hb_buffer_t* _cretval;
  _cretval = hb_buffer_create();
  auto _retval = _cretval ? new harfbuzz.buffer.Buffer(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Creates a new #hb_buffer_t, similar to [harfbuzz.global.bufferCreate]. The only
    difference is that the buffer is configured similarly to src.

    Params:
      src = An #hb_buffer_t
    Returns: A newly allocated #hb_buffer_t, similar to [harfbuzz.global.bufferCreate].
*/
harfbuzz.buffer.Buffer bufferCreateSimilar(harfbuzz.buffer.Buffer src)
{
  hb_buffer_t* _cretval;
  _cretval = hb_buffer_create_similar(src ? cast(const(hb_buffer_t)*)src._cPtr(No.Dup) : null);
  auto _retval = _cretval ? new harfbuzz.buffer.Buffer(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Deserializes glyphs buffer from textual representation in the format
    produced by [harfbuzz.global.bufferSerializeGlyphs].

    Params:
      buffer = an #hb_buffer_t buffer.
      buf = string to deserialize
      endPtr = output pointer to the character after last
                                      consumed one.
      font = font for getting glyph IDs
      format = the #hb_buffer_serialize_format_t of the input buf
    Returns: `true` if parse was successful, `false` if an error
      occurred.
*/
harfbuzz.types.Bool bufferDeserializeGlyphs(harfbuzz.buffer.Buffer buffer, string buf, out string endPtr, harfbuzz.font.Font font, harfbuzz.types.BufferSerializeFormat format)
{
  harfbuzz.types.Bool _retval;
  int _bufLen;
  if (buf)
    _bufLen = cast(int)buf.length;

  auto _buf = cast(const(char)*)buf.ptr;
  char* _endPtr;
  _retval = hb_buffer_deserialize_glyphs(buffer ? cast(hb_buffer_t*)buffer._cPtr(No.Dup) : null, _buf, _bufLen, &_endPtr, font ? cast(hb_font_t*)font._cPtr(No.Dup) : null, format);
  endPtr = _endPtr.fromCString(Yes.Free);
  return _retval;
}

/**
    Deserializes Unicode buffer from textual representation in the format
    produced by [harfbuzz.global.bufferSerializeUnicode].

    Params:
      buffer = an #hb_buffer_t buffer.
      buf = string to deserialize
      endPtr = output pointer to the character after last
                                      consumed one.
      format = the #hb_buffer_serialize_format_t of the input buf
    Returns: `true` if parse was successful, `false` if an error
      occurred.
*/
harfbuzz.types.Bool bufferDeserializeUnicode(harfbuzz.buffer.Buffer buffer, string buf, out string endPtr, harfbuzz.types.BufferSerializeFormat format)
{
  harfbuzz.types.Bool _retval;
  int _bufLen;
  if (buf)
    _bufLen = cast(int)buf.length;

  auto _buf = cast(const(char)*)buf.ptr;
  char* _endPtr;
  _retval = hb_buffer_deserialize_unicode(buffer ? cast(hb_buffer_t*)buffer._cPtr(No.Dup) : null, _buf, _bufLen, &_endPtr, format);
  endPtr = _endPtr.fromCString(Yes.Free);
  return _retval;
}

/**
    If dottedcircle_glyph is (hb_codepoint_t) -1 then #HB_BUFFER_DIFF_FLAG_DOTTED_CIRCLE_PRESENT
    and #HB_BUFFER_DIFF_FLAG_NOTDEF_PRESENT are never returned.  This should be used by most
    callers if just comparing two buffers is needed.

    Params:
      buffer = a buffer.
      reference = other buffer to compare to.
      dottedcircleGlyph = glyph id of U+25CC DOTTED CIRCLE, or (hb_codepoint_t) -1.
      positionFuzz = allowed absolute difference in position values.
    Returns: 
*/
harfbuzz.types.BufferDiffFlags bufferDiff(harfbuzz.buffer.Buffer buffer, harfbuzz.buffer.Buffer reference, harfbuzz.types.Codepoint dottedcircleGlyph, uint positionFuzz)
{
  hb_buffer_diff_flags_t _cretval;
  _cretval = hb_buffer_diff(buffer ? cast(hb_buffer_t*)buffer._cPtr(No.Dup) : null, reference ? cast(hb_buffer_t*)reference._cPtr(No.Dup) : null, dottedcircleGlyph, positionFuzz);
  harfbuzz.types.BufferDiffFlags _retval = cast(harfbuzz.types.BufferDiffFlags)_cretval;
  return _retval;
}

/**
    Fetches the cluster level of a buffer. The #hb_buffer_cluster_level_t
    dictates one aspect of how HarfBuzz will treat non-base characters
    during shaping.

    Params:
      buffer = An #hb_buffer_t
    Returns: The cluster level of buffer
*/
harfbuzz.types.BufferClusterLevel bufferGetClusterLevel(harfbuzz.buffer.Buffer buffer)
{
  hb_buffer_cluster_level_t _cretval;
  _cretval = hb_buffer_get_cluster_level(buffer ? cast(const(hb_buffer_t)*)buffer._cPtr(No.Dup) : null);
  harfbuzz.types.BufferClusterLevel _retval = cast(harfbuzz.types.BufferClusterLevel)_cretval;
  return _retval;
}

/**
    Fetches the type of buffer contents. Buffers are either empty, contain
    characters (before shaping), or contain glyphs (the result of shaping).

    Params:
      buffer = An #hb_buffer_t
    Returns: The type of buffer contents
*/
harfbuzz.types.BufferContentType bufferGetContentType(harfbuzz.buffer.Buffer buffer)
{
  hb_buffer_content_type_t _cretval;
  _cretval = hb_buffer_get_content_type(buffer ? cast(const(hb_buffer_t)*)buffer._cPtr(No.Dup) : null);
  harfbuzz.types.BufferContentType _retval = cast(harfbuzz.types.BufferContentType)_cretval;
  return _retval;
}

/**
    See [harfbuzz.global.bufferSetDirection]

    Params:
      buffer = An #hb_buffer_t
    Returns: The direction of the buffer.
*/
harfbuzz.types.Direction bufferGetDirection(harfbuzz.buffer.Buffer buffer)
{
  hb_direction_t _cretval;
  _cretval = hb_buffer_get_direction(buffer ? cast(const(hb_buffer_t)*)buffer._cPtr(No.Dup) : null);
  harfbuzz.types.Direction _retval = cast(harfbuzz.types.Direction)_cretval;
  return _retval;
}

/**
    Fetches an empty #hb_buffer_t.
    Returns: The empty buffer
*/
harfbuzz.buffer.Buffer bufferGetEmpty()
{
  hb_buffer_t* _cretval;
  _cretval = hb_buffer_get_empty();
  auto _retval = _cretval ? new harfbuzz.buffer.Buffer(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Fetches the #hb_buffer_flags_t of buffer.

    Params:
      buffer = An #hb_buffer_t
    Returns: The buffer flags
*/
harfbuzz.types.BufferFlags bufferGetFlags(harfbuzz.buffer.Buffer buffer)
{
  hb_buffer_flags_t _cretval;
  _cretval = hb_buffer_get_flags(buffer ? cast(const(hb_buffer_t)*)buffer._cPtr(No.Dup) : null);
  harfbuzz.types.BufferFlags _retval = cast(harfbuzz.types.BufferFlags)_cretval;
  return _retval;
}

/**
    Returns buffer glyph information array.  Returned pointer
    is valid as long as buffer contents are not modified.

    Params:
      buffer = An #hb_buffer_t
    Returns: The buffer glyph information array.
      The value valid as long as buffer has not been modified.
*/
harfbuzz.glyph_info.GlyphInfo[] bufferGetGlyphInfos(harfbuzz.buffer.Buffer buffer)
{
  hb_glyph_info_t* _cretval;
  uint _cretlength;
  _cretval = hb_buffer_get_glyph_infos(buffer ? cast(hb_buffer_t*)buffer._cPtr(No.Dup) : null, &_cretlength);
  harfbuzz.glyph_info.GlyphInfo[] _retval;

  if (_cretval)
  {
    _retval = new harfbuzz.glyph_info.GlyphInfo[_cretlength];
    foreach (i; 0 .. _cretlength)
      _retval[i] = new harfbuzz.glyph_info.GlyphInfo(cast(void*)&_cretval[i], No.Take);
  }
  return _retval;
}

/**
    Returns buffer glyph position array.  Returned pointer
    is valid as long as buffer contents are not modified.
    
    If buffer did not have positions before, the positions will be
    initialized to zeros, unless this function is called from
    within a buffer message callback (see [harfbuzz.global.bufferSetMessageFunc]),
    in which case `NULL` is returned.

    Params:
      buffer = An #hb_buffer_t
    Returns: The buffer glyph position array.
      The value valid as long as buffer has not been modified.
*/
harfbuzz.glyph_position.GlyphPosition[] bufferGetGlyphPositions(harfbuzz.buffer.Buffer buffer)
{
  hb_glyph_position_t* _cretval;
  uint _cretlength;
  _cretval = hb_buffer_get_glyph_positions(buffer ? cast(hb_buffer_t*)buffer._cPtr(No.Dup) : null, &_cretlength);
  harfbuzz.glyph_position.GlyphPosition[] _retval;

  if (_cretval)
  {
    _retval = new harfbuzz.glyph_position.GlyphPosition[_cretlength];
    foreach (i; 0 .. _cretlength)
      _retval[i] = new harfbuzz.glyph_position.GlyphPosition(cast(void*)&_cretval[i], No.Take);
  }
  return _retval;
}

/**
    See [harfbuzz.global.bufferSetInvisibleGlyph].

    Params:
      buffer = An #hb_buffer_t
    Returns: The buffer invisible #hb_codepoint_t
*/
harfbuzz.types.Codepoint bufferGetInvisibleGlyph(harfbuzz.buffer.Buffer buffer)
{
  harfbuzz.types.Codepoint _retval;
  _retval = hb_buffer_get_invisible_glyph(buffer ? cast(const(hb_buffer_t)*)buffer._cPtr(No.Dup) : null);
  return _retval;
}

/**
    See [harfbuzz.global.bufferSetLanguage].

    Params:
      buffer = An #hb_buffer_t
    Returns: The #hb_language_t of the buffer. Must not be freed by the caller.
*/
harfbuzz.types.Language bufferGetLanguage(harfbuzz.buffer.Buffer buffer)
{
  auto _retval = hb_buffer_get_language(buffer ? cast(const(hb_buffer_t)*)buffer._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Returns the number of items in the buffer.

    Params:
      buffer = An #hb_buffer_t
    Returns: The buffer length.
      The value valid as long as buffer has not been modified.
*/
uint bufferGetLength(harfbuzz.buffer.Buffer buffer)
{
  uint _retval;
  _retval = hb_buffer_get_length(buffer ? cast(const(hb_buffer_t)*)buffer._cPtr(No.Dup) : null);
  return _retval;
}

/**
    See [harfbuzz.global.bufferSetNotFoundGlyph].

    Params:
      buffer = An #hb_buffer_t
    Returns: The buffer not-found #hb_codepoint_t
*/
harfbuzz.types.Codepoint bufferGetNotFoundGlyph(harfbuzz.buffer.Buffer buffer)
{
  harfbuzz.types.Codepoint _retval;
  _retval = hb_buffer_get_not_found_glyph(buffer ? cast(const(hb_buffer_t)*)buffer._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Fetches the #hb_codepoint_t that replaces invalid entries for a given encoding
    when adding text to buffer.

    Params:
      buffer = An #hb_buffer_t
    Returns: The buffer replacement #hb_codepoint_t
*/
harfbuzz.types.Codepoint bufferGetReplacementCodepoint(harfbuzz.buffer.Buffer buffer)
{
  harfbuzz.types.Codepoint _retval;
  _retval = hb_buffer_get_replacement_codepoint(buffer ? cast(const(hb_buffer_t)*)buffer._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Fetches the script of buffer.

    Params:
      buffer = An #hb_buffer_t
    Returns: The #hb_script_t of the buffer
*/
harfbuzz.types.Script bufferGetScript(harfbuzz.buffer.Buffer buffer)
{
  hb_script_t _cretval;
  _cretval = hb_buffer_get_script(buffer ? cast(const(hb_buffer_t)*)buffer._cPtr(No.Dup) : null);
  harfbuzz.types.Script _retval = cast(harfbuzz.types.Script)_cretval;
  return _retval;
}

/**
    Sets props to the #hb_segment_properties_t of buffer.

    Params:
      buffer = An #hb_buffer_t
      props = The output #hb_segment_properties_t
*/
void bufferGetSegmentProperties(harfbuzz.buffer.Buffer buffer, out harfbuzz.segment_properties.SegmentProperties props)
{
  hb_segment_properties_t _props;
  hb_buffer_get_segment_properties(buffer ? cast(const(hb_buffer_t)*)buffer._cPtr(No.Dup) : null, &_props);
  props = new harfbuzz.segment_properties.SegmentProperties(cast(void*)&_props, No.Take);
}

/**
    Fetches the Unicode-functions structure of a buffer.

    Params:
      buffer = An #hb_buffer_t
    Returns: The Unicode-functions structure
*/
harfbuzz.unicode_funcs.UnicodeFuncs bufferGetUnicodeFuncs(harfbuzz.buffer.Buffer buffer)
{
  hb_unicode_funcs_t* _cretval;
  _cretval = hb_buffer_get_unicode_funcs(buffer ? cast(const(hb_buffer_t)*)buffer._cPtr(No.Dup) : null);
  auto _retval = _cretval ? new harfbuzz.unicode_funcs.UnicodeFuncs(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Sets unset buffer segment properties based on buffer Unicode
    contents.  If buffer is not empty, it must have content type
    #HB_BUFFER_CONTENT_TYPE_UNICODE.
    
    If buffer script is not set (ie. is #HB_SCRIPT_INVALID), it
    will be set to the Unicode script of the first character in
    the buffer that has a script other than #HB_SCRIPT_COMMON,
    #HB_SCRIPT_INHERITED, and #HB_SCRIPT_UNKNOWN.
    
    Next, if buffer direction is not set (ie. is #HB_DIRECTION_INVALID),
    it will be set to the natural horizontal direction of the
    buffer script as returned by [harfbuzz.global.scriptGetHorizontalDirection].
    If [harfbuzz.global.scriptGetHorizontalDirection] returns #HB_DIRECTION_INVALID,
    then #HB_DIRECTION_LTR is used.
    
    Finally, if buffer language is not set (ie. is #HB_LANGUAGE_INVALID),
    it will be set to the process's default language as returned by
    [harfbuzz.global.languageGetDefault].  This may change in the future by
    taking buffer script into consideration when choosing a language.
    Note that [harfbuzz.global.languageGetDefault] is NOT threadsafe the first time
    it is called.  See documentation for that function for details.

    Params:
      buffer = An #hb_buffer_t
*/
void bufferGuessSegmentProperties(harfbuzz.buffer.Buffer buffer)
{
  hb_buffer_guess_segment_properties(buffer ? cast(hb_buffer_t*)buffer._cPtr(No.Dup) : null);
}

/**
    Returns whether buffer has glyph position data.
    A buffer gains position data when [harfbuzz.global.bufferGetGlyphPositions] is called on it,
    and cleared of position data when [harfbuzz.global.bufferClearContents] is called.

    Params:
      buffer = an #hb_buffer_t.
    Returns: `true` if the buffer has position array, `false` otherwise.
*/
harfbuzz.types.Bool bufferHasPositions(harfbuzz.buffer.Buffer buffer)
{
  harfbuzz.types.Bool _retval;
  _retval = hb_buffer_has_positions(buffer ? cast(hb_buffer_t*)buffer._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Reorders a glyph buffer to have canonical in-cluster glyph order / position.
    The resulting clusters should behave identical to pre-reordering clusters.
    
    <note>This has nothing to do with Unicode normalization.</note>

    Params:
      buffer = An #hb_buffer_t
*/
void bufferNormalizeGlyphs(harfbuzz.buffer.Buffer buffer)
{
  hb_buffer_normalize_glyphs(buffer ? cast(hb_buffer_t*)buffer._cPtr(No.Dup) : null);
}

/**
    Pre allocates memory for buffer to fit at least size number of items.

    Params:
      buffer = An #hb_buffer_t
      size = Number of items to pre allocate.
    Returns: `true` if buffer memory allocation succeeded, `false` otherwise
*/
harfbuzz.types.Bool bufferPreAllocate(harfbuzz.buffer.Buffer buffer, uint size)
{
  harfbuzz.types.Bool _retval;
  _retval = hb_buffer_pre_allocate(buffer ? cast(hb_buffer_t*)buffer._cPtr(No.Dup) : null, size);
  return _retval;
}

/**
    Resets the buffer to its initial status, as if it was just newly created
    with [harfbuzz.global.bufferCreate].

    Params:
      buffer = An #hb_buffer_t
*/
void bufferReset(harfbuzz.buffer.Buffer buffer)
{
  hb_buffer_reset(buffer ? cast(hb_buffer_t*)buffer._cPtr(No.Dup) : null);
}

/**
    Reverses buffer contents.

    Params:
      buffer = An #hb_buffer_t
*/
void bufferReverse(harfbuzz.buffer.Buffer buffer)
{
  hb_buffer_reverse(buffer ? cast(hb_buffer_t*)buffer._cPtr(No.Dup) : null);
}

/**
    Reverses buffer clusters.  That is, the buffer contents are
    reversed, then each cluster (consecutive items having the
    same cluster number) are reversed again.

    Params:
      buffer = An #hb_buffer_t
*/
void bufferReverseClusters(harfbuzz.buffer.Buffer buffer)
{
  hb_buffer_reverse_clusters(buffer ? cast(hb_buffer_t*)buffer._cPtr(No.Dup) : null);
}

/**
    Reverses buffer contents between start and end.

    Params:
      buffer = An #hb_buffer_t
      start = start index
      end = end index
*/
void bufferReverseRange(harfbuzz.buffer.Buffer buffer, uint start, uint end)
{
  hb_buffer_reverse_range(buffer ? cast(hb_buffer_t*)buffer._cPtr(No.Dup) : null, start, end);
}

/**
    Parses a string into an #hb_buffer_serialize_format_t. Does not check if
    str is a valid buffer serialization format, use
    [harfbuzz.global.bufferSerializeListFormats] to get the list of supported formats.

    Params:
      str = a string to parse
    Returns: The parsed #hb_buffer_serialize_format_t.
*/
harfbuzz.types.BufferSerializeFormat bufferSerializeFormatFromString(ubyte[] str)
{
  hb_buffer_serialize_format_t _cretval;
  int _len;
  if (str)
    _len = cast(int)str.length;

  auto _str = cast(const(ubyte)*)str.ptr;
  _cretval = hb_buffer_serialize_format_from_string(_str, _len);
  harfbuzz.types.BufferSerializeFormat _retval = cast(harfbuzz.types.BufferSerializeFormat)_cretval;
  return _retval;
}

/**
    Converts format to the string corresponding it, or `NULL` if it is not a valid
    #hb_buffer_serialize_format_t.

    Params:
      format = an #hb_buffer_serialize_format_t to convert.
    Returns: A `NULL` terminated string corresponding to format. Should not be freed.
*/
string bufferSerializeFormatToString(harfbuzz.types.BufferSerializeFormat format)
{
  const(char)* _cretval;
  _cretval = hb_buffer_serialize_format_to_string(format);
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/**
    Returns a list of supported buffer serialization formats.
    Returns: A string array of buffer serialization formats. Should not be freed.
*/
string[] bufferSerializeListFormats()
{
  const(char*)* _cretval;
  _cretval = hb_buffer_serialize_list_formats();
  string[] _retval;

  if (_cretval)
  {
    uint _cretlength;
    while (_cretval[_cretlength] !is null)
      _cretlength++;
    _retval = new string[_cretlength];
    foreach (i; 0 .. _cretlength)
      _retval[i] = _cretval[i].fromCString(No.Free);
  }
  return _retval;
}

/**
    Sets the cluster level of a buffer. The #hb_buffer_cluster_level_t
    dictates one aspect of how HarfBuzz will treat non-base characters
    during shaping.

    Params:
      buffer = An #hb_buffer_t
      clusterLevel = The cluster level to set on the buffer
*/
void bufferSetClusterLevel(harfbuzz.buffer.Buffer buffer, harfbuzz.types.BufferClusterLevel clusterLevel)
{
  hb_buffer_set_cluster_level(buffer ? cast(hb_buffer_t*)buffer._cPtr(No.Dup) : null, clusterLevel);
}

/**
    Sets the type of buffer contents. Buffers are either empty, contain
    characters (before shaping), or contain glyphs (the result of shaping).
    
    You rarely need to call this function, since a number of other
    functions transition the content type for you. Namely:
    
    $(LIST
      * A newly created buffer starts with content type
        [harfbuzz.types.BufferContentType.Invalid]. Calling [harfbuzz.global.bufferReset],
        [harfbuzz.global.bufferClearContents], as well as calling [harfbuzz.global.bufferSetLength]
        with an argument of zero all set the buffer content type to invalid
        as well.
      
      * Calling [harfbuzz.global.bufferAddUtf8], [harfbuzz.global.bufferAddUtf16],
        [harfbuzz.global.bufferAddUtf32], [harfbuzz.global.bufferAddCodepoints] and
        [harfbuzz.global.bufferAddLatin1] expect that buffer is either empty and
        have a content type of invalid, or that buffer content type is
        [harfbuzz.types.BufferContentType.Unicode], and they also set the content
        type to Unicode if they added anything to an empty buffer.
      
      * Finally [harfbuzz.global.shape] and [harfbuzz.global.shapeFull] expect that the buffer
        is either empty and have content type of invalid, or that buffer
        content type is [harfbuzz.types.BufferContentType.Unicode], and upon
        success they set the buffer content type to
        [harfbuzz.types.BufferContentType.Glyphs].
    )
      
    The above transitions are designed such that one can use a buffer
    in a loop of "reset : add-text : shape" without needing to ever
    modify the content type manually.

    Params:
      buffer = An #hb_buffer_t
      contentType = The type of buffer contents to set
*/
void bufferSetContentType(harfbuzz.buffer.Buffer buffer, harfbuzz.types.BufferContentType contentType)
{
  hb_buffer_set_content_type(buffer ? cast(hb_buffer_t*)buffer._cPtr(No.Dup) : null, contentType);
}

/**
    Set the text flow direction of the buffer. No shaping can happen without
    setting buffer direction, and it controls the visual direction for the
    output glyphs; for RTL direction the glyphs will be reversed. Many layout
    features depend on the proper setting of the direction, for example,
    reversing RTL text before shaping, then shaping with LTR direction is not
    the same as keeping the text in logical order and shaping with RTL
    direction.

    Params:
      buffer = An #hb_buffer_t
      direction = the #hb_direction_t of the buffer
*/
void bufferSetDirection(harfbuzz.buffer.Buffer buffer, harfbuzz.types.Direction direction)
{
  hb_buffer_set_direction(buffer ? cast(hb_buffer_t*)buffer._cPtr(No.Dup) : null, direction);
}

/**
    Sets buffer flags to flags. See #hb_buffer_flags_t.

    Params:
      buffer = An #hb_buffer_t
      flags = The buffer flags to set
*/
void bufferSetFlags(harfbuzz.buffer.Buffer buffer, harfbuzz.types.BufferFlags flags)
{
  hb_buffer_set_flags(buffer ? cast(hb_buffer_t*)buffer._cPtr(No.Dup) : null, flags);
}

/**
    Sets the #hb_codepoint_t that replaces invisible characters in
    the shaping result.  If set to zero (default), the glyph for the
    U+0020 SPACE character is used.  Otherwise, this value is used
    verbatim.

    Params:
      buffer = An #hb_buffer_t
      invisible = the invisible #hb_codepoint_t
*/
void bufferSetInvisibleGlyph(harfbuzz.buffer.Buffer buffer, harfbuzz.types.Codepoint invisible)
{
  hb_buffer_set_invisible_glyph(buffer ? cast(hb_buffer_t*)buffer._cPtr(No.Dup) : null, invisible);
}

/**
    Sets the language of buffer to language.
    
    Languages are crucial for selecting which OpenType feature to apply to the
    buffer which can result in applying language-specific behaviour. Languages
    are orthogonal to the scripts, and though they are related, they are
    different concepts and should not be confused with each other.
    
    Use [harfbuzz.global.languageFromString] to convert from BCP 47 language tags to
    #hb_language_t.

    Params:
      buffer = An #hb_buffer_t
      language = An hb_language_t to set
*/
void bufferSetLanguage(harfbuzz.buffer.Buffer buffer, harfbuzz.types.Language language)
{
  hb_buffer_set_language(buffer ? cast(hb_buffer_t*)buffer._cPtr(No.Dup) : null, language);
}

/**
    Similar to [harfbuzz.global.bufferPreAllocate], but clears any new items added at the
    end.

    Params:
      buffer = An #hb_buffer_t
      length = The new length of buffer
    Returns: `true` if buffer memory allocation succeeded, `false` otherwise.
*/
harfbuzz.types.Bool bufferSetLength(harfbuzz.buffer.Buffer buffer, uint length)
{
  harfbuzz.types.Bool _retval;
  _retval = hb_buffer_set_length(buffer ? cast(hb_buffer_t*)buffer._cPtr(No.Dup) : null, length);
  return _retval;
}

/**
    Sets the implementation function for #hb_buffer_message_func_t.

    Params:
      buffer = An #hb_buffer_t
      func = Callback function
*/
void bufferSetMessageFunc(harfbuzz.buffer.Buffer buffer, harfbuzz.types.BufferMessageFunc func)
{
  extern(C) hb_bool_t _funcCallback(hb_buffer_t* buffer, hb_font_t* font, const(char)* message, void* userData)
  {
    harfbuzz.types.Bool _dretval;
    auto _dlg = cast(harfbuzz.types.BufferMessageFunc*)userData;
    string _message = message.fromCString(No.Free);

    _dretval = (*_dlg)(buffer ? new harfbuzz.buffer.Buffer(cast(void*)buffer, No.Take) : null, font ? new harfbuzz.font.Font(cast(void*)font, No.Take) : null, _message);
    auto _retval = cast(hb_bool_t)_dretval;

    return _retval;
  }
  auto _funcCB = func ? &_funcCallback : null;
  auto _func = func ? freezeDelegate(cast(void*)&func) : null;
  GDestroyNotify _funcDestroyCB = func ? &thawDelegate : null;
  hb_buffer_set_message_func(buffer ? cast(hb_buffer_t*)buffer._cPtr(No.Dup) : null, _funcCB, _func, _funcDestroyCB);
}

/**
    Sets the #hb_codepoint_t that replaces characters not found in
    the font during shaping.
    
    The not-found glyph defaults to zero, sometimes known as the
    ".notdef" glyph.  This API allows for differentiating the two.

    Params:
      buffer = An #hb_buffer_t
      notFound = the not-found #hb_codepoint_t
*/
void bufferSetNotFoundGlyph(harfbuzz.buffer.Buffer buffer, harfbuzz.types.Codepoint notFound)
{
  hb_buffer_set_not_found_glyph(buffer ? cast(hb_buffer_t*)buffer._cPtr(No.Dup) : null, notFound);
}

/**
    Sets the #hb_codepoint_t that replaces invalid entries for a given encoding
    when adding text to buffer.
    
    Default is #HB_BUFFER_REPLACEMENT_CODEPOINT_DEFAULT.

    Params:
      buffer = An #hb_buffer_t
      replacement = the replacement #hb_codepoint_t
*/
void bufferSetReplacementCodepoint(harfbuzz.buffer.Buffer buffer, harfbuzz.types.Codepoint replacement)
{
  hb_buffer_set_replacement_codepoint(buffer ? cast(hb_buffer_t*)buffer._cPtr(No.Dup) : null, replacement);
}

/**
    Sets the script of buffer to script.
    
    Script is crucial for choosing the proper shaping behaviour for scripts that
    require it (e.g. Arabic) and the which OpenType features defined in the font
    to be applied.
    
    You can pass one of the predefined #hb_script_t values, or use
    [harfbuzz.global.scriptFromString] or [harfbuzz.global.scriptFromIso15924Tag] to get the
    corresponding script from an ISO 15924 script tag.

    Params:
      buffer = An #hb_buffer_t
      script = An #hb_script_t to set.
*/
void bufferSetScript(harfbuzz.buffer.Buffer buffer, harfbuzz.types.Script script)
{
  hb_buffer_set_script(buffer ? cast(hb_buffer_t*)buffer._cPtr(No.Dup) : null, script);
}

/**
    Sets the segment properties of the buffer, a shortcut for calling
    [harfbuzz.global.bufferSetDirection], [harfbuzz.global.bufferSetScript] and
    [harfbuzz.global.bufferSetLanguage] individually.

    Params:
      buffer = An #hb_buffer_t
      props = An #hb_segment_properties_t to use
*/
void bufferSetSegmentProperties(harfbuzz.buffer.Buffer buffer, harfbuzz.segment_properties.SegmentProperties props)
{
  hb_buffer_set_segment_properties(buffer ? cast(hb_buffer_t*)buffer._cPtr(No.Dup) : null, props ? cast(const(hb_segment_properties_t)*)props._cPtr(No.Dup) : null);
}

/**
    Sets the Unicode-functions structure of a buffer to
    unicode_funcs.

    Params:
      buffer = An #hb_buffer_t
      unicodeFuncs = The Unicode-functions structure
*/
void bufferSetUnicodeFuncs(harfbuzz.buffer.Buffer buffer, harfbuzz.unicode_funcs.UnicodeFuncs unicodeFuncs)
{
  hb_buffer_set_unicode_funcs(buffer ? cast(hb_buffer_t*)buffer._cPtr(No.Dup) : null, unicodeFuncs ? cast(hb_unicode_funcs_t*)unicodeFuncs._cPtr(No.Dup) : null);
}

/**
    Fetches the alpha channel of the given color.

    Params:
      color = an #hb_color_t we are interested in its channels.
    Returns: Alpha channel value
*/
ubyte colorGetAlpha(harfbuzz.types.Color color)
{
  ubyte _retval;
  _retval = hb_color_get_alpha(color);
  return _retval;
}

/**
    Fetches the blue channel of the given color.

    Params:
      color = an #hb_color_t we are interested in its channels.
    Returns: Blue channel value
*/
ubyte colorGetBlue(harfbuzz.types.Color color)
{
  ubyte _retval;
  _retval = hb_color_get_blue(color);
  return _retval;
}

/**
    Fetches the green channel of the given color.

    Params:
      color = an #hb_color_t we are interested in its channels.
    Returns: Green channel value
*/
ubyte colorGetGreen(harfbuzz.types.Color color)
{
  ubyte _retval;
  _retval = hb_color_get_green(color);
  return _retval;
}

/**
    Fetches the red channel of the given color.

    Params:
      color = an #hb_color_t we are interested in its channels.
    Returns: Red channel value
*/
ubyte colorGetRed(harfbuzz.types.Color color)
{
  ubyte _retval;
  _retval = hb_color_get_red(color);
  return _retval;
}

/**
    Fetches a list of color stops from the given color line object.
    
    Note that due to variations being applied, the returned color stops
    may be out of order. It is the callers responsibility to ensure that
    color stops are sorted by their offset before they are used.

    Params:
      colorLine = a #hb_color_line_t object
      start = the index of the first color stop to return
      colorStops = Array of #hb_color_stop_t to populate
    Returns: the total number of color stops in color_line
*/
uint colorLineGetColorStops(harfbuzz.types.ColorLine colorLine, uint start, ref harfbuzz.types.ColorStop[] colorStops)
{
  uint _retval;
  uint _count;
  _count = cast(uint)colorStops.length;
  _retval = hb_color_line_get_color_stops(&colorLine, start, &_count, colorStops.ptr);
  return _retval;
}

/**
    Fetches the extend mode of the color line object.

    Params:
      colorLine = a #hb_color_line_t object
    Returns: the extend mode of color_line
*/
harfbuzz.types.PaintExtend colorLineGetExtend(harfbuzz.types.ColorLine colorLine)
{
  hb_paint_extend_t _cretval;
  _cretval = hb_color_line_get_extend(&colorLine);
  harfbuzz.types.PaintExtend _retval = cast(harfbuzz.types.PaintExtend)_cretval;
  return _retval;
}

/**
    Converts a string to an #hb_direction_t.
    
    Matching is loose and applies only to the first letter. For
    examples, "LTR" and "left-to-right" will both return #HB_DIRECTION_LTR.
    
    Unmatched strings will return #HB_DIRECTION_INVALID.

    Params:
      str = String to convert
    Returns: The #hb_direction_t matching str
*/
harfbuzz.types.Direction directionFromString(ubyte[] str)
{
  hb_direction_t _cretval;
  int _len;
  if (str)
    _len = cast(int)str.length;

  auto _str = cast(const(ubyte)*)str.ptr;
  _cretval = hb_direction_from_string(_str, _len);
  harfbuzz.types.Direction _retval = cast(harfbuzz.types.Direction)_cretval;
  return _retval;
}

/**
    Converts an #hb_direction_t to a string.

    Params:
      direction = The #hb_direction_t to convert
    Returns: The string corresponding to direction
*/
string directionToString(harfbuzz.types.Direction direction)
{
  const(char)* _cretval;
  _cretval = hb_direction_to_string(direction);
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/**
    Perform a "close-path" draw operation.

    Params:
      dfuncs = draw functions
      drawData = associated draw data passed by the caller
      st = current draw state
*/
void drawClosePath(harfbuzz.draw_funcs.DrawFuncs dfuncs, void* drawData, harfbuzz.draw_state.DrawState st)
{
  hb_draw_close_path(dfuncs ? cast(hb_draw_funcs_t*)dfuncs._cPtr(No.Dup) : null, drawData, st ? cast(hb_draw_state_t*)st._cPtr(No.Dup) : null);
}

/**
    Perform a "cubic-to" draw operation.

    Params:
      dfuncs = draw functions
      drawData = associated draw data passed by the caller
      st = current draw state
      control1X = X component of first control point
      control1Y = Y component of first control point
      control2X = X component of second control point
      control2Y = Y component of second control point
      toX = X component of target point
      toY = Y component of target point
*/
void drawCubicTo(harfbuzz.draw_funcs.DrawFuncs dfuncs, void* drawData, harfbuzz.draw_state.DrawState st, float control1X, float control1Y, float control2X, float control2Y, float toX, float toY)
{
  hb_draw_cubic_to(dfuncs ? cast(hb_draw_funcs_t*)dfuncs._cPtr(No.Dup) : null, drawData, st ? cast(hb_draw_state_t*)st._cPtr(No.Dup) : null, control1X, control1Y, control2X, control2Y, toX, toY);
}

/**
    Creates a new draw callbacks object.
    Returns: A newly allocated #hb_draw_funcs_t with a reference count of 1. The initial
      reference count should be released with hb_draw_funcs_destroy when you are
      done using the #hb_draw_funcs_t. This function never returns `NULL`. If
      memory cannot be allocated, a special singleton #hb_draw_funcs_t object will
      be returned.
*/
harfbuzz.draw_funcs.DrawFuncs drawFuncsCreate()
{
  hb_draw_funcs_t* _cretval;
  _cretval = hb_draw_funcs_create();
  auto _retval = _cretval ? new harfbuzz.draw_funcs.DrawFuncs(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Fetches the singleton empty draw-functions structure.
    Returns: The empty draw-functions structure
*/
harfbuzz.draw_funcs.DrawFuncs drawFuncsGetEmpty()
{
  hb_draw_funcs_t* _cretval;
  _cretval = hb_draw_funcs_get_empty();
  auto _retval = _cretval ? new harfbuzz.draw_funcs.DrawFuncs(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Checks whether dfuncs is immutable.

    Params:
      dfuncs = draw functions
    Returns: `true` if dfuncs is immutable, `false` otherwise
*/
harfbuzz.types.Bool drawFuncsIsImmutable(harfbuzz.draw_funcs.DrawFuncs dfuncs)
{
  harfbuzz.types.Bool _retval;
  _retval = hb_draw_funcs_is_immutable(dfuncs ? cast(hb_draw_funcs_t*)dfuncs._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Makes dfuncs object immutable.

    Params:
      dfuncs = draw functions
*/
void drawFuncsMakeImmutable(harfbuzz.draw_funcs.DrawFuncs dfuncs)
{
  hb_draw_funcs_make_immutable(dfuncs ? cast(hb_draw_funcs_t*)dfuncs._cPtr(No.Dup) : null);
}

/**
    Sets close-path callback to the draw functions object.

    Params:
      dfuncs = draw functions object
      func = close-path callback
*/
void drawFuncsSetClosePathFunc(harfbuzz.draw_funcs.DrawFuncs dfuncs, harfbuzz.types.DrawClosePathFunc func)
{
  extern(C) void _funcCallback(hb_draw_funcs_t* dfuncs, void* drawData, hb_draw_state_t* st, void* userData)
  {
    auto _dlg = cast(harfbuzz.types.DrawClosePathFunc*)userData;

    (*_dlg)(dfuncs ? new harfbuzz.draw_funcs.DrawFuncs(cast(void*)dfuncs, No.Take) : null, drawData, st ? new harfbuzz.draw_state.DrawState(cast(void*)st, No.Take) : null);
  }
  auto _funcCB = func ? &_funcCallback : null;
  auto _func = func ? freezeDelegate(cast(void*)&func) : null;
  GDestroyNotify _funcDestroyCB = func ? &thawDelegate : null;
  hb_draw_funcs_set_close_path_func(dfuncs ? cast(hb_draw_funcs_t*)dfuncs._cPtr(No.Dup) : null, _funcCB, _func, _funcDestroyCB);
}

/**
    Sets cubic-to callback to the draw functions object.

    Params:
      dfuncs = draw functions
      func = cubic-to callback
*/
void drawFuncsSetCubicToFunc(harfbuzz.draw_funcs.DrawFuncs dfuncs, harfbuzz.types.DrawCubicToFunc func)
{
  extern(C) void _funcCallback(hb_draw_funcs_t* dfuncs, void* drawData, hb_draw_state_t* st, float control1X, float control1Y, float control2X, float control2Y, float toX, float toY, void* userData)
  {
    auto _dlg = cast(harfbuzz.types.DrawCubicToFunc*)userData;

    (*_dlg)(dfuncs ? new harfbuzz.draw_funcs.DrawFuncs(cast(void*)dfuncs, No.Take) : null, drawData, st ? new harfbuzz.draw_state.DrawState(cast(void*)st, No.Take) : null, control1X, control1Y, control2X, control2Y, toX, toY);
  }
  auto _funcCB = func ? &_funcCallback : null;
  auto _func = func ? freezeDelegate(cast(void*)&func) : null;
  GDestroyNotify _funcDestroyCB = func ? &thawDelegate : null;
  hb_draw_funcs_set_cubic_to_func(dfuncs ? cast(hb_draw_funcs_t*)dfuncs._cPtr(No.Dup) : null, _funcCB, _func, _funcDestroyCB);
}

/**
    Sets line-to callback to the draw functions object.

    Params:
      dfuncs = draw functions object
      func = line-to callback
*/
void drawFuncsSetLineToFunc(harfbuzz.draw_funcs.DrawFuncs dfuncs, harfbuzz.types.DrawLineToFunc func)
{
  extern(C) void _funcCallback(hb_draw_funcs_t* dfuncs, void* drawData, hb_draw_state_t* st, float toX, float toY, void* userData)
  {
    auto _dlg = cast(harfbuzz.types.DrawLineToFunc*)userData;

    (*_dlg)(dfuncs ? new harfbuzz.draw_funcs.DrawFuncs(cast(void*)dfuncs, No.Take) : null, drawData, st ? new harfbuzz.draw_state.DrawState(cast(void*)st, No.Take) : null, toX, toY);
  }
  auto _funcCB = func ? &_funcCallback : null;
  auto _func = func ? freezeDelegate(cast(void*)&func) : null;
  GDestroyNotify _funcDestroyCB = func ? &thawDelegate : null;
  hb_draw_funcs_set_line_to_func(dfuncs ? cast(hb_draw_funcs_t*)dfuncs._cPtr(No.Dup) : null, _funcCB, _func, _funcDestroyCB);
}

/**
    Sets move-to callback to the draw functions object.

    Params:
      dfuncs = draw functions object
      func = move-to callback
*/
void drawFuncsSetMoveToFunc(harfbuzz.draw_funcs.DrawFuncs dfuncs, harfbuzz.types.DrawMoveToFunc func)
{
  extern(C) void _funcCallback(hb_draw_funcs_t* dfuncs, void* drawData, hb_draw_state_t* st, float toX, float toY, void* userData)
  {
    auto _dlg = cast(harfbuzz.types.DrawMoveToFunc*)userData;

    (*_dlg)(dfuncs ? new harfbuzz.draw_funcs.DrawFuncs(cast(void*)dfuncs, No.Take) : null, drawData, st ? new harfbuzz.draw_state.DrawState(cast(void*)st, No.Take) : null, toX, toY);
  }
  auto _funcCB = func ? &_funcCallback : null;
  auto _func = func ? freezeDelegate(cast(void*)&func) : null;
  GDestroyNotify _funcDestroyCB = func ? &thawDelegate : null;
  hb_draw_funcs_set_move_to_func(dfuncs ? cast(hb_draw_funcs_t*)dfuncs._cPtr(No.Dup) : null, _funcCB, _func, _funcDestroyCB);
}

/**
    Sets quadratic-to callback to the draw functions object.

    Params:
      dfuncs = draw functions object
      func = quadratic-to callback
*/
void drawFuncsSetQuadraticToFunc(harfbuzz.draw_funcs.DrawFuncs dfuncs, harfbuzz.types.DrawQuadraticToFunc func)
{
  extern(C) void _funcCallback(hb_draw_funcs_t* dfuncs, void* drawData, hb_draw_state_t* st, float controlX, float controlY, float toX, float toY, void* userData)
  {
    auto _dlg = cast(harfbuzz.types.DrawQuadraticToFunc*)userData;

    (*_dlg)(dfuncs ? new harfbuzz.draw_funcs.DrawFuncs(cast(void*)dfuncs, No.Take) : null, drawData, st ? new harfbuzz.draw_state.DrawState(cast(void*)st, No.Take) : null, controlX, controlY, toX, toY);
  }
  auto _funcCB = func ? &_funcCallback : null;
  auto _func = func ? freezeDelegate(cast(void*)&func) : null;
  GDestroyNotify _funcDestroyCB = func ? &thawDelegate : null;
  hb_draw_funcs_set_quadratic_to_func(dfuncs ? cast(hb_draw_funcs_t*)dfuncs._cPtr(No.Dup) : null, _funcCB, _func, _funcDestroyCB);
}

/**
    Perform a "line-to" draw operation.

    Params:
      dfuncs = draw functions
      drawData = associated draw data passed by the caller
      st = current draw state
      toX = X component of target point
      toY = Y component of target point
*/
void drawLineTo(harfbuzz.draw_funcs.DrawFuncs dfuncs, void* drawData, harfbuzz.draw_state.DrawState st, float toX, float toY)
{
  hb_draw_line_to(dfuncs ? cast(hb_draw_funcs_t*)dfuncs._cPtr(No.Dup) : null, drawData, st ? cast(hb_draw_state_t*)st._cPtr(No.Dup) : null, toX, toY);
}

/**
    Perform a "move-to" draw operation.

    Params:
      dfuncs = draw functions
      drawData = associated draw data passed by the caller
      st = current draw state
      toX = X component of target point
      toY = Y component of target point
*/
void drawMoveTo(harfbuzz.draw_funcs.DrawFuncs dfuncs, void* drawData, harfbuzz.draw_state.DrawState st, float toX, float toY)
{
  hb_draw_move_to(dfuncs ? cast(hb_draw_funcs_t*)dfuncs._cPtr(No.Dup) : null, drawData, st ? cast(hb_draw_state_t*)st._cPtr(No.Dup) : null, toX, toY);
}

/**
    Perform a "quadratic-to" draw operation.

    Params:
      dfuncs = draw functions
      drawData = associated draw data passed by the caller
      st = current draw state
      controlX = X component of control point
      controlY = Y component of control point
      toX = X component of target point
      toY = Y component of target point
*/
void drawQuadraticTo(harfbuzz.draw_funcs.DrawFuncs dfuncs, void* drawData, harfbuzz.draw_state.DrawState st, float controlX, float controlY, float toX, float toY)
{
  hb_draw_quadratic_to(dfuncs ? cast(hb_draw_funcs_t*)dfuncs._cPtr(No.Dup) : null, drawData, st ? cast(hb_draw_state_t*)st._cPtr(No.Dup) : null, controlX, controlY, toX, toY);
}

/**
    Add table for tag with data provided by blob to the face.  face must
    be created using [harfbuzz.global.faceBuilderCreate].

    Params:
      face = A face object created with [harfbuzz.global.faceBuilderCreate]
      tag = The #hb_tag_t of the table to add
      blob = The blob containing the table data to add
    Returns: 
*/
harfbuzz.types.Bool faceBuilderAddTable(harfbuzz.face.Face face, harfbuzz.types.Tag tag, harfbuzz.blob.Blob blob)
{
  harfbuzz.types.Bool _retval;
  _retval = hb_face_builder_add_table(face ? cast(hb_face_t*)face._cPtr(No.Dup) : null, tag, blob ? cast(hb_blob_t*)blob._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Creates a #hb_face_t that can be used with [harfbuzz.global.faceBuilderAddTable].
    After tables are added to the face, it can be compiled to a binary
    font file by calling [harfbuzz.global.faceReferenceBlob].
    Returns: New face.
*/
harfbuzz.face.Face faceBuilderCreate()
{
  hb_face_t* _cretval;
  _cretval = hb_face_builder_create();
  auto _retval = _cretval ? new harfbuzz.face.Face(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Set the ordering of tables for serialization. Any tables not
    specified in the tags list will be ordered after the tables in
    tags, ordered by the default sort ordering.

    Params:
      face = A face object created with [harfbuzz.global.faceBuilderCreate]
      tags = ordered list of table tags terminated by
          `HB_TAG_NONE`
*/
void faceBuilderSortTables(harfbuzz.face.Face face, harfbuzz.types.Tag[] tags)
{
  auto _tags = cast(const(hb_tag_t)*)(tags ~ hb_tag_t.init).ptr;
  hb_face_builder_sort_tables(face ? cast(hb_face_t*)face._cPtr(No.Dup) : null, _tags);
}

/**
    Fetches the number of faces in a blob.

    Params:
      blob = a blob.
    Returns: Number of faces in blob
*/
uint faceCount(harfbuzz.blob.Blob blob)
{
  uint _retval;
  _retval = hb_face_count(blob ? cast(hb_blob_t*)blob._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Constructs a new face object from the specified blob and
    a face index into that blob.
    
    The face index is used for blobs of file formats such as TTC and
    DFont that can contain more than one face.  Face indices within
    such collections are zero-based.
    
    <note>Note: If the blob font format is not a collection, index
    is ignored.  Otherwise, only the lower 16-bits of index are used.
    The unmodified index can be accessed via [harfbuzz.global.faceGetIndex].</note>
    
    <note>Note: The high 16-bits of index, if non-zero, are used by
    [harfbuzz.global.fontCreate] to load named-instances in variable fonts.  See
    [harfbuzz.global.fontCreate] for details.</note>

    Params:
      blob = #hb_blob_t to work upon
      index = The index of the face within blob
    Returns: The new face object
*/
harfbuzz.face.Face faceCreate(harfbuzz.blob.Blob blob, uint index)
{
  hb_face_t* _cretval;
  _cretval = hb_face_create(blob ? cast(hb_blob_t*)blob._cPtr(No.Dup) : null, index);
  auto _retval = _cretval ? new harfbuzz.face.Face(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Variant of [harfbuzz.global.faceCreate], built for those cases where it is more
    convenient to provide data for individual tables instead of the whole font
    data. With the caveat that [harfbuzz.global.faceGetTableTags] does not currently work
    with faces created this way.
    
    Creates a new face object from the specified user_data and reference_table_func,
    with the destroy callback.

    Params:
      referenceTableFunc = Table-referencing function
    Returns: The new face object
*/
harfbuzz.face.Face faceCreateForTables(harfbuzz.types.ReferenceTableFunc referenceTableFunc)
{
  extern(C) hb_blob_t* _referenceTableFuncCallback(hb_face_t* face, hb_tag_t tag, void* userData)
  {
    harfbuzz.blob.Blob _dretval;
    auto _dlg = cast(harfbuzz.types.ReferenceTableFunc*)userData;

    _dretval = (*_dlg)(face ? new harfbuzz.face.Face(cast(void*)face, No.Take) : null, tag);
    auto _retval = cast(hb_blob_t*)_dretval._cPtr(Yes.Dup);

    return _retval;
  }
  auto _referenceTableFuncCB = referenceTableFunc ? &_referenceTableFuncCallback : null;
  hb_face_t* _cretval;
  auto _referenceTableFunc = referenceTableFunc ? freezeDelegate(cast(void*)&referenceTableFunc) : null;
  GDestroyNotify _referenceTableFuncDestroyCB = referenceTableFunc ? &thawDelegate : null;
  _cretval = hb_face_create_for_tables(_referenceTableFuncCB, _referenceTableFunc, _referenceTableFuncDestroyCB);
  auto _retval = _cretval ? new harfbuzz.face.Face(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Fetches the singleton empty face object.
    Returns: The empty face object
*/
harfbuzz.face.Face faceGetEmpty()
{
  hb_face_t* _cretval;
  _cretval = hb_face_get_empty();
  auto _retval = _cretval ? new harfbuzz.face.Face(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Fetches the glyph-count value of the specified face object.

    Params:
      face = A face object
    Returns: The glyph-count value of face
*/
uint faceGetGlyphCount(harfbuzz.face.Face face)
{
  uint _retval;
  _retval = hb_face_get_glyph_count(face ? cast(const(hb_face_t)*)face._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Fetches the face-index corresponding to the given face.
    
    <note>Note: face indices within a collection are zero-based.</note>

    Params:
      face = A face object
    Returns: The index of face.
*/
uint faceGetIndex(harfbuzz.face.Face face)
{
  uint _retval;
  _retval = hb_face_get_index(face ? cast(const(hb_face_t)*)face._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Fetches a list of all table tags for a face, if possible. The list returned will
    begin at the offset provided

    Params:
      face = A face object
      startOffset = The index of first table tag to retrieve
      tableTags = The array of table tags found
    Returns: Total number of tables, or zero if it is not possible to list
*/
uint faceGetTableTags(harfbuzz.face.Face face, uint startOffset, ref harfbuzz.types.Tag[] tableTags)
{
  uint _retval;
  uint _tableCount;
  _tableCount = cast(uint)tableTags.length;
  _retval = hb_face_get_table_tags(face ? cast(const(hb_face_t)*)face._cPtr(No.Dup) : null, startOffset, &_tableCount, tableTags.ptr);
  return _retval;
}

/**
    Fetches the units-per-em (UPEM) value of the specified face object.
    
    Typical UPEM values for fonts are 1000, or 2048, but any value
    in between 16 and 16,384 is allowed for OpenType fonts.

    Params:
      face = A face object
    Returns: The upem value of face
*/
uint faceGetUpem(harfbuzz.face.Face face)
{
  uint _retval;
  _retval = hb_face_get_upem(face ? cast(const(hb_face_t)*)face._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Tests whether the given face object is immutable.

    Params:
      face = A face object
    Returns: `true` is face is immutable, `false` otherwise
*/
harfbuzz.types.Bool faceIsImmutable(harfbuzz.face.Face face)
{
  harfbuzz.types.Bool _retval;
  _retval = hb_face_is_immutable(face ? cast(const(hb_face_t)*)face._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Makes the given face object immutable.

    Params:
      face = A face object
*/
void faceMakeImmutable(harfbuzz.face.Face face)
{
  hb_face_make_immutable(face ? cast(hb_face_t*)face._cPtr(No.Dup) : null);
}

/**
    Fetches a pointer to the binary blob that contains the
    specified face. Returns an empty blob if referencing face data is not
    possible.

    Params:
      face = A face object
    Returns: A pointer to the blob for face
*/
harfbuzz.blob.Blob faceReferenceBlob(harfbuzz.face.Face face)
{
  hb_blob_t* _cretval;
  _cretval = hb_face_reference_blob(face ? cast(hb_face_t*)face._cPtr(No.Dup) : null);
  auto _retval = _cretval ? new harfbuzz.blob.Blob(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Fetches a reference to the specified table within
    the specified face.

    Params:
      face = A face object
      tag = The #hb_tag_t of the table to query
    Returns: A pointer to the tag table within face
*/
harfbuzz.blob.Blob faceReferenceTable(harfbuzz.face.Face face, harfbuzz.types.Tag tag)
{
  hb_blob_t* _cretval;
  _cretval = hb_face_reference_table(face ? cast(const(hb_face_t)*)face._cPtr(No.Dup) : null, tag);
  auto _retval = _cretval ? new harfbuzz.blob.Blob(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Sets the glyph count for a face object to the specified value.
    
    This API is used in rare circumstances.

    Params:
      face = A face object
      glyphCount = The glyph-count value to assign
*/
void faceSetGlyphCount(harfbuzz.face.Face face, uint glyphCount)
{
  hb_face_set_glyph_count(face ? cast(hb_face_t*)face._cPtr(No.Dup) : null, glyphCount);
}

/**
    Assigns the specified face-index to face. Fails if the
    face is immutable.
    
    <note>Note: changing the index has no effect on the face itself
    This only changes the value returned by [harfbuzz.global.faceGetIndex].</note>

    Params:
      face = A face object
      index = The index to assign
*/
void faceSetIndex(harfbuzz.face.Face face, uint index)
{
  hb_face_set_index(face ? cast(hb_face_t*)face._cPtr(No.Dup) : null, index);
}

/**
    Sets the units-per-em (upem) for a face object to the specified value.
    
    This API is used in rare circumstances.

    Params:
      face = A face object
      upem = The units-per-em value to assign
*/
void faceSetUpem(harfbuzz.face.Face face, uint upem)
{
  hb_face_set_upem(face ? cast(hb_face_t*)face._cPtr(No.Dup) : null, upem);
}

/**
    Parses a string into a #hb_feature_t.
    
    The format for specifying feature strings follows. All valid CSS
    font-feature-settings values other than 'normal' and the global values are
    also accepted, though not documented below. CSS string escapes are not
    supported.
    
    The range indices refer to the positions between Unicode characters. The
    position before the first character is always 0.
    
    The format is Python-esque.  Here is how it all works:
    
    <informaltable pgwide='1' align='left' frame='none'>
    <tgroup cols='5'>
    <thead>
    <row><entry>Syntax</entry>    <entry>Value</entry> <entry>Start</entry> <entry>End</entry></row>
    </thead>
    <tbody>
    <row><entry>Setting value:</entry></row>
    <row><entry>kern</entry>      <entry>1</entry>     <entry>0</entry>      <entry>∞</entry>   <entry>Turn feature on</entry></row>
    <row><entry>+kern</entry>     <entry>1</entry>     <entry>0</entry>      <entry>∞</entry>   <entry>Turn feature on</entry></row>
    <row><entry>-kern</entry>     <entry>0</entry>     <entry>0</entry>      <entry>∞</entry>   <entry>Turn feature off</entry></row>
    <row><entry>kern=0</entry>    <entry>0</entry>     <entry>0</entry>      <entry>∞</entry>   <entry>Turn feature off</entry></row>
    <row><entry>kern=1</entry>    <entry>1</entry>     <entry>0</entry>      <entry>∞</entry>   <entry>Turn feature on</entry></row>
    <row><entry>aalt=2</entry>    <entry>2</entry>     <entry>0</entry>      <entry>∞</entry>   <entry>Choose 2nd alternate</entry></row>
    <row><entry>Setting index:</entry></row>
    <row><entry>kern[]</entry>    <entry>1</entry>     <entry>0</entry>      <entry>∞</entry>   <entry>Turn feature on</entry></row>
    <row><entry>kern[:]</entry>   <entry>1</entry>     <entry>0</entry>      <entry>∞</entry>   <entry>Turn feature on</entry></row>
    <row><entry>kern[5:]</entry>  <entry>1</entry>     <entry>5</entry>      <entry>∞</entry>   <entry>Turn feature on, partial</entry></row>
    <row><entry>kern[:5]</entry>  <entry>1</entry>     <entry>0</entry>      <entry>5</entry>   <entry>Turn feature on, partial</entry></row>
    <row><entry>kern[3:5]</entry> <entry>1</entry>     <entry>3</entry>      <entry>5</entry>   <entry>Turn feature on, range</entry></row>
    <row><entry>kern[3]</entry>   <entry>1</entry>     <entry>3</entry>      <entry>3+1</entry> <entry>Turn feature on, single char</entry></row>
    <row><entry>Mixing it all:</entry></row>
    <row><entry>aalt[3:5]=2</entry> <entry>2</entry>   <entry>3</entry>      <entry>5</entry>   <entry>Turn 2nd alternate on for range</entry></row>
    </tbody>
    </tgroup>
    </informaltable>

    Params:
      str = a string to parse
      feature = the #hb_feature_t to initialize with the parsed values
    Returns: `true` if str is successfully parsed, `false` otherwise
*/
harfbuzz.types.Bool featureFromString(ubyte[] str, out harfbuzz.feature.Feature feature)
{
  harfbuzz.types.Bool _retval;
  int _len;
  if (str)
    _len = cast(int)str.length;

  auto _str = cast(const(ubyte)*)str.ptr;
  _retval = hb_feature_from_string(_str, _len, cast(hb_feature_t*)&feature);
  return _retval;
}

/**
    Adds the origin coordinates to an (X,Y) point coordinate, in
    the specified glyph ID in the specified font.
    
    Calls the appropriate direction-specific variant (horizontal
    or vertical) depending on the value of direction.

    Params:
      font = #hb_font_t to work upon
      glyph = The glyph ID to query
      direction = The direction of the text segment
      x = Input = The original X coordinate
            Output = The X coordinate plus the X-coordinate of the origin
      y = Input = The original Y coordinate
            Output = The Y coordinate plus the Y-coordinate of the origin
*/
void fontAddGlyphOriginForDirection(harfbuzz.font.Font font, harfbuzz.types.Codepoint glyph, harfbuzz.types.Direction direction, ref harfbuzz.types.Position x, ref harfbuzz.types.Position y)
{
  hb_font_add_glyph_origin_for_direction(font ? cast(hb_font_t*)font._cPtr(No.Dup) : null, glyph, direction, cast(hb_position_t*)&x, cast(hb_position_t*)&y);
}

/**
    Notifies the font that underlying font data has changed.
    This has the effect of increasing the serial as returned
    by [harfbuzz.global.fontGetSerial], which invalidates internal caches.

    Params:
      font = #hb_font_t to work upon
*/
void fontChanged(harfbuzz.font.Font font)
{
  hb_font_changed(font ? cast(hb_font_t*)font._cPtr(No.Dup) : null);
}

/**
    Constructs a new font object from the specified face.
    
    <note>Note: If face's index value (as passed to [harfbuzz.global.faceCreate]
    has non-zero top 16-bits, those bits minus one are passed to
    [harfbuzz.global.fontSetVarNamedInstance], effectively loading a named-instance
    of a variable font, instead of the default-instance.  This allows
    specifying which named-instance to load by default when creating the
    face.</note>

    Params:
      face = a face.
    Returns: The new font object
*/
harfbuzz.font.Font fontCreate(harfbuzz.face.Face face)
{
  hb_font_t* _cretval;
  _cretval = hb_font_create(face ? cast(hb_face_t*)face._cPtr(No.Dup) : null);
  auto _retval = _cretval ? new harfbuzz.font.Font(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Constructs a sub-font font object from the specified parent font,
    replicating the parent's properties.

    Params:
      parent = The parent font object
    Returns: The new sub-font font object
*/
harfbuzz.font.Font fontCreateSubFont(harfbuzz.font.Font parent)
{
  hb_font_t* _cretval;
  _cretval = hb_font_create_sub_font(parent ? cast(hb_font_t*)parent._cPtr(No.Dup) : null);
  auto _retval = _cretval ? new harfbuzz.font.Font(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Draws the outline that corresponds to a glyph in the specified font.
    
    The outline is returned by way of calls to the callbacks of the dfuncs
    objects, with draw_data passed to them.

    Params:
      font = #hb_font_t to work upon
      glyph = The glyph ID
      dfuncs = #hb_draw_funcs_t to draw to
      drawData = User data to pass to draw callbacks
*/
void fontDrawGlyph(harfbuzz.font.Font font, harfbuzz.types.Codepoint glyph, harfbuzz.draw_funcs.DrawFuncs dfuncs, void* drawData = null)
{
  hb_font_draw_glyph(font ? cast(hb_font_t*)font._cPtr(No.Dup) : null, glyph, dfuncs ? cast(hb_draw_funcs_t*)dfuncs._cPtr(No.Dup) : null, drawData);
}

/**
    Creates a new #hb_font_funcs_t structure of font functions.
    Returns: The font-functions structure
*/
harfbuzz.font_funcs.FontFuncs fontFuncsCreate()
{
  hb_font_funcs_t* _cretval;
  _cretval = hb_font_funcs_create();
  auto _retval = _cretval ? new harfbuzz.font_funcs.FontFuncs(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Fetches an empty font-functions structure.
    Returns: The font-functions structure
*/
harfbuzz.font_funcs.FontFuncs fontFuncsGetEmpty()
{
  hb_font_funcs_t* _cretval;
  _cretval = hb_font_funcs_get_empty();
  auto _retval = _cretval ? new harfbuzz.font_funcs.FontFuncs(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Tests whether a font-functions structure is immutable.

    Params:
      ffuncs = The font-functions structure
    Returns: `true` if ffuncs is immutable, `false` otherwise
*/
harfbuzz.types.Bool fontFuncsIsImmutable(harfbuzz.font_funcs.FontFuncs ffuncs)
{
  harfbuzz.types.Bool _retval;
  _retval = hb_font_funcs_is_immutable(ffuncs ? cast(hb_font_funcs_t*)ffuncs._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Makes a font-functions structure immutable.

    Params:
      ffuncs = The font-functions structure
*/
void fontFuncsMakeImmutable(harfbuzz.font_funcs.FontFuncs ffuncs)
{
  hb_font_funcs_make_immutable(ffuncs ? cast(hb_font_funcs_t*)ffuncs._cPtr(No.Dup) : null);
}

/**
    Sets the implementation function for #hb_font_draw_glyph_func_t.

    Params:
      ffuncs = A font-function structure
      func = The callback function to assign
*/
void fontFuncsSetDrawGlyphFunc(harfbuzz.font_funcs.FontFuncs ffuncs, harfbuzz.types.FontDrawGlyphFunc func)
{
  extern(C) void _funcCallback(hb_font_t* font, void* fontData, hb_codepoint_t glyph, hb_draw_funcs_t* drawFuncs, void* drawData, void* userData)
  {
    auto _dlg = cast(harfbuzz.types.FontDrawGlyphFunc*)userData;

    (*_dlg)(font ? new harfbuzz.font.Font(cast(void*)font, No.Take) : null, fontData, glyph, drawFuncs ? new harfbuzz.draw_funcs.DrawFuncs(cast(void*)drawFuncs, No.Take) : null, drawData);
  }
  auto _funcCB = func ? &_funcCallback : null;
  auto _func = func ? freezeDelegate(cast(void*)&func) : null;
  GDestroyNotify _funcDestroyCB = func ? &thawDelegate : null;
  hb_font_funcs_set_draw_glyph_func(ffuncs ? cast(hb_font_funcs_t*)ffuncs._cPtr(No.Dup) : null, _funcCB, _func, _funcDestroyCB);
}

/**
    Sets the implementation function for #hb_font_get_font_h_extents_func_t.

    Params:
      ffuncs = A font-function structure
      func = The callback function to assign
*/
void fontFuncsSetFontHExtentsFunc(harfbuzz.font_funcs.FontFuncs ffuncs, harfbuzz.types.FontGetFontHExtentsFunc func)
{
  extern(C) hb_bool_t _funcCallback(hb_font_t* font, void* fontData, hb_font_extents_t* extents, void* userData)
  {
    harfbuzz.types.Bool _dretval;
    auto _dlg = cast(harfbuzz.types.FontGetFontHExtentsFunc*)userData;

    _dretval = (*_dlg)(font ? new harfbuzz.font.Font(cast(void*)font, No.Take) : null, fontData, *cast(harfbuzz.types.FontExtents*)extents);
    auto _retval = cast(hb_bool_t)_dretval;

    return _retval;
  }
  auto _funcCB = func ? &_funcCallback : null;
  auto _func = func ? freezeDelegate(cast(void*)&func) : null;
  GDestroyNotify _funcDestroyCB = func ? &thawDelegate : null;
  hb_font_funcs_set_font_h_extents_func(ffuncs ? cast(hb_font_funcs_t*)ffuncs._cPtr(No.Dup) : null, _funcCB, _func, _funcDestroyCB);
}

/**
    Sets the implementation function for #hb_font_get_font_v_extents_func_t.

    Params:
      ffuncs = A font-function structure
      func = The callback function to assign
*/
void fontFuncsSetFontVExtentsFunc(harfbuzz.font_funcs.FontFuncs ffuncs, harfbuzz.types.FontGetFontVExtentsFunc func)
{
  extern(C) hb_bool_t _funcCallback(hb_font_t* font, void* fontData, hb_font_extents_t* extents, void* userData)
  {
    harfbuzz.types.Bool _dretval;
    auto _dlg = cast(harfbuzz.types.FontGetFontVExtentsFunc*)userData;

    _dretval = (*_dlg)(font ? new harfbuzz.font.Font(cast(void*)font, No.Take) : null, fontData, *cast(harfbuzz.types.FontExtents*)extents);
    auto _retval = cast(hb_bool_t)_dretval;

    return _retval;
  }
  auto _funcCB = func ? &_funcCallback : null;
  auto _func = func ? freezeDelegate(cast(void*)&func) : null;
  GDestroyNotify _funcDestroyCB = func ? &thawDelegate : null;
  hb_font_funcs_set_font_v_extents_func(ffuncs ? cast(hb_font_funcs_t*)ffuncs._cPtr(No.Dup) : null, _funcCB, _func, _funcDestroyCB);
}

/**
    Sets the implementation function for #hb_font_get_glyph_contour_point_func_t.

    Params:
      ffuncs = A font-function structure
      func = The callback function to assign
*/
void fontFuncsSetGlyphContourPointFunc(harfbuzz.font_funcs.FontFuncs ffuncs, harfbuzz.types.FontGetGlyphContourPointFunc func)
{
  extern(C) hb_bool_t _funcCallback(hb_font_t* font, void* fontData, hb_codepoint_t glyph, uint pointIndex, hb_position_t* x, hb_position_t* y, void* userData)
  {
    harfbuzz.types.Bool _dretval;
    auto _dlg = cast(harfbuzz.types.FontGetGlyphContourPointFunc*)userData;

    _dretval = (*_dlg)(font ? new harfbuzz.font.Font(cast(void*)font, No.Take) : null, fontData, glyph, pointIndex, *x, *y);
    auto _retval = cast(hb_bool_t)_dretval;

    return _retval;
  }
  auto _funcCB = func ? &_funcCallback : null;
  auto _func = func ? freezeDelegate(cast(void*)&func) : null;
  GDestroyNotify _funcDestroyCB = func ? &thawDelegate : null;
  hb_font_funcs_set_glyph_contour_point_func(ffuncs ? cast(hb_font_funcs_t*)ffuncs._cPtr(No.Dup) : null, _funcCB, _func, _funcDestroyCB);
}

/**
    Sets the implementation function for #hb_font_get_glyph_extents_func_t.

    Params:
      ffuncs = A font-function structure
      func = The callback function to assign
*/
void fontFuncsSetGlyphExtentsFunc(harfbuzz.font_funcs.FontFuncs ffuncs, harfbuzz.types.FontGetGlyphExtentsFunc func)
{
  extern(C) hb_bool_t _funcCallback(hb_font_t* font, void* fontData, hb_codepoint_t glyph, hb_glyph_extents_t* extents, void* userData)
  {
    harfbuzz.types.Bool _dretval;
    auto _dlg = cast(harfbuzz.types.FontGetGlyphExtentsFunc*)userData;

    _dretval = (*_dlg)(font ? new harfbuzz.font.Font(cast(void*)font, No.Take) : null, fontData, glyph, *cast(harfbuzz.types.GlyphExtents*)extents);
    auto _retval = cast(hb_bool_t)_dretval;

    return _retval;
  }
  auto _funcCB = func ? &_funcCallback : null;
  auto _func = func ? freezeDelegate(cast(void*)&func) : null;
  GDestroyNotify _funcDestroyCB = func ? &thawDelegate : null;
  hb_font_funcs_set_glyph_extents_func(ffuncs ? cast(hb_font_funcs_t*)ffuncs._cPtr(No.Dup) : null, _funcCB, _func, _funcDestroyCB);
}

/**
    Sets the implementation function for #hb_font_get_glyph_from_name_func_t.

    Params:
      ffuncs = A font-function structure
      func = The callback function to assign
*/
void fontFuncsSetGlyphFromNameFunc(harfbuzz.font_funcs.FontFuncs ffuncs, harfbuzz.types.FontGetGlyphFromNameFunc func)
{
  extern(C) hb_bool_t _funcCallback(hb_font_t* font, void* fontData, const(char)* name, int len, hb_codepoint_t* glyph, void* userData)
  {
    harfbuzz.types.Bool _dretval;
    auto _dlg = cast(harfbuzz.types.FontGetGlyphFromNameFunc*)userData;
    char[] _name;
    _name.length = len;
    _name[0 .. len] = name[0 .. len];

    _dretval = (*_dlg)(font ? new harfbuzz.font.Font(cast(void*)font, No.Take) : null, fontData, _name, *glyph);
    auto _retval = cast(hb_bool_t)_dretval;

    return _retval;
  }
  auto _funcCB = func ? &_funcCallback : null;
  auto _func = func ? freezeDelegate(cast(void*)&func) : null;
  GDestroyNotify _funcDestroyCB = func ? &thawDelegate : null;
  hb_font_funcs_set_glyph_from_name_func(ffuncs ? cast(hb_font_funcs_t*)ffuncs._cPtr(No.Dup) : null, _funcCB, _func, _funcDestroyCB);
}

/**
    Deprecated.  Use [harfbuzz.global.fontFuncsSetNominalGlyphFunc] and
    [harfbuzz.global.fontFuncsSetVariationGlyphFunc] instead.

    Params:
      ffuncs = The font-functions structure
      func = callback function
*/
void fontFuncsSetGlyphFunc(harfbuzz.font_funcs.FontFuncs ffuncs, harfbuzz.types.FontGetGlyphFunc func)
{
  extern(C) hb_bool_t _funcCallback(hb_font_t* font, void* fontData, hb_codepoint_t unicode, hb_codepoint_t variationSelector, hb_codepoint_t* glyph, void* userData)
  {
    harfbuzz.types.Bool _dretval;
    auto _dlg = cast(harfbuzz.types.FontGetGlyphFunc*)userData;

    _dretval = (*_dlg)(font ? new harfbuzz.font.Font(cast(void*)font, No.Take) : null, fontData, unicode, variationSelector, *glyph);
    auto _retval = cast(hb_bool_t)_dretval;

    return _retval;
  }
  auto _funcCB = func ? &_funcCallback : null;
  auto _func = func ? freezeDelegate(cast(void*)&func) : null;
  GDestroyNotify _funcDestroyCB = func ? &thawDelegate : null;
  hb_font_funcs_set_glyph_func(ffuncs ? cast(hb_font_funcs_t*)ffuncs._cPtr(No.Dup) : null, _funcCB, _func, _funcDestroyCB);
}

/**
    Sets the implementation function for #hb_font_get_glyph_h_advance_func_t.

    Params:
      ffuncs = A font-function structure
      func = The callback function to assign
*/
void fontFuncsSetGlyphHAdvanceFunc(harfbuzz.font_funcs.FontFuncs ffuncs, harfbuzz.types.FontGetGlyphHAdvanceFunc func)
{
  extern(C) hb_position_t _funcCallback(hb_font_t* font, void* fontData, hb_codepoint_t glyph, void* userData)
  {
    harfbuzz.types.Position _dretval;
    auto _dlg = cast(harfbuzz.types.FontGetGlyphHAdvanceFunc*)userData;

    _dretval = (*_dlg)(font ? new harfbuzz.font.Font(cast(void*)font, No.Take) : null, fontData, glyph);
    auto _retval = cast(hb_position_t)_dretval;

    return _retval;
  }
  auto _funcCB = func ? &_funcCallback : null;
  auto _func = func ? freezeDelegate(cast(void*)&func) : null;
  GDestroyNotify _funcDestroyCB = func ? &thawDelegate : null;
  hb_font_funcs_set_glyph_h_advance_func(ffuncs ? cast(hb_font_funcs_t*)ffuncs._cPtr(No.Dup) : null, _funcCB, _func, _funcDestroyCB);
}

/**
    Sets the implementation function for #hb_font_get_glyph_h_kerning_func_t.

    Params:
      ffuncs = A font-function structure
      func = The callback function to assign
*/
void fontFuncsSetGlyphHKerningFunc(harfbuzz.font_funcs.FontFuncs ffuncs, harfbuzz.types.FontGetGlyphHKerningFunc func)
{
  extern(C) hb_position_t _funcCallback(hb_font_t* font, void* fontData, hb_codepoint_t firstGlyph, hb_codepoint_t secondGlyph, void* userData)
  {
    harfbuzz.types.Position _dretval;
    auto _dlg = cast(harfbuzz.types.FontGetGlyphHKerningFunc*)userData;

    _dretval = (*_dlg)(font ? new harfbuzz.font.Font(cast(void*)font, No.Take) : null, fontData, firstGlyph, secondGlyph);
    auto _retval = cast(hb_position_t)_dretval;

    return _retval;
  }
  auto _funcCB = func ? &_funcCallback : null;
  auto _func = func ? freezeDelegate(cast(void*)&func) : null;
  GDestroyNotify _funcDestroyCB = func ? &thawDelegate : null;
  hb_font_funcs_set_glyph_h_kerning_func(ffuncs ? cast(hb_font_funcs_t*)ffuncs._cPtr(No.Dup) : null, _funcCB, _func, _funcDestroyCB);
}

/**
    Sets the implementation function for #hb_font_get_glyph_h_origin_func_t.

    Params:
      ffuncs = A font-function structure
      func = The callback function to assign
*/
void fontFuncsSetGlyphHOriginFunc(harfbuzz.font_funcs.FontFuncs ffuncs, harfbuzz.types.FontGetGlyphHOriginFunc func)
{
  extern(C) hb_bool_t _funcCallback(hb_font_t* font, void* fontData, hb_codepoint_t glyph, hb_position_t* x, hb_position_t* y, void* userData)
  {
    harfbuzz.types.Bool _dretval;
    auto _dlg = cast(harfbuzz.types.FontGetGlyphHOriginFunc*)userData;

    _dretval = (*_dlg)(font ? new harfbuzz.font.Font(cast(void*)font, No.Take) : null, fontData, glyph, *x, *y);
    auto _retval = cast(hb_bool_t)_dretval;

    return _retval;
  }
  auto _funcCB = func ? &_funcCallback : null;
  auto _func = func ? freezeDelegate(cast(void*)&func) : null;
  GDestroyNotify _funcDestroyCB = func ? &thawDelegate : null;
  hb_font_funcs_set_glyph_h_origin_func(ffuncs ? cast(hb_font_funcs_t*)ffuncs._cPtr(No.Dup) : null, _funcCB, _func, _funcDestroyCB);
}

/**
    Sets the implementation function for #hb_font_get_glyph_name_func_t.

    Params:
      ffuncs = A font-function structure
      func = The callback function to assign
*/
void fontFuncsSetGlyphNameFunc(harfbuzz.font_funcs.FontFuncs ffuncs, harfbuzz.types.FontGetGlyphNameFunc func)
{
  extern(C) hb_bool_t _funcCallback(hb_font_t* font, void* fontData, hb_codepoint_t glyph, char* name, uint size, void* userData)
  {
    harfbuzz.types.Bool _dretval;
    auto _dlg = cast(harfbuzz.types.FontGetGlyphNameFunc*)userData;
    char[] _name;

    _dretval = (*_dlg)(font ? new harfbuzz.font.Font(cast(void*)font, No.Take) : null, fontData, glyph, _name);
    auto _retval = cast(hb_bool_t)_dretval;
    size = cast(uint)_name.length;
    name = arrayDtoC!(char, Yes.Alloc, No.ZeroTerm)(_name);

    return _retval;
  }
  auto _funcCB = func ? &_funcCallback : null;
  auto _func = func ? freezeDelegate(cast(void*)&func) : null;
  GDestroyNotify _funcDestroyCB = func ? &thawDelegate : null;
  hb_font_funcs_set_glyph_name_func(ffuncs ? cast(hb_font_funcs_t*)ffuncs._cPtr(No.Dup) : null, _funcCB, _func, _funcDestroyCB);
}

/**
    Sets the implementation function for #hb_font_get_glyph_shape_func_t,
    which is the same as #hb_font_draw_glyph_func_t.

    Params:
      ffuncs = A font-function structure
      func = The callback function to assign

    Deprecated: Use [harfbuzz.global.fontFuncsSetDrawGlyphFunc] instead
*/
void fontFuncsSetGlyphShapeFunc(harfbuzz.font_funcs.FontFuncs ffuncs, harfbuzz.types.FontGetGlyphShapeFunc func)
{
  extern(C) void _funcCallback(hb_font_t* font, void* fontData, hb_codepoint_t glyph, hb_draw_funcs_t* drawFuncs, void* drawData, void* userData)
  {
    auto _dlg = cast(harfbuzz.types.FontGetGlyphShapeFunc*)userData;

    (*_dlg)(font ? new harfbuzz.font.Font(cast(void*)font, No.Take) : null, fontData, glyph, drawFuncs ? new harfbuzz.draw_funcs.DrawFuncs(cast(void*)drawFuncs, No.Take) : null, drawData);
  }
  auto _funcCB = func ? &_funcCallback : null;
  auto _func = func ? freezeDelegate(cast(void*)&func) : null;
  GDestroyNotify _funcDestroyCB = func ? &thawDelegate : null;
  hb_font_funcs_set_glyph_shape_func(ffuncs ? cast(hb_font_funcs_t*)ffuncs._cPtr(No.Dup) : null, _funcCB, _func, _funcDestroyCB);
}

/**
    Sets the implementation function for #hb_font_get_glyph_v_advance_func_t.

    Params:
      ffuncs = A font-function structure
      func = The callback function to assign
*/
void fontFuncsSetGlyphVAdvanceFunc(harfbuzz.font_funcs.FontFuncs ffuncs, harfbuzz.types.FontGetGlyphVAdvanceFunc func)
{
  extern(C) hb_position_t _funcCallback(hb_font_t* font, void* fontData, hb_codepoint_t glyph, void* userData)
  {
    harfbuzz.types.Position _dretval;
    auto _dlg = cast(harfbuzz.types.FontGetGlyphVAdvanceFunc*)userData;

    _dretval = (*_dlg)(font ? new harfbuzz.font.Font(cast(void*)font, No.Take) : null, fontData, glyph);
    auto _retval = cast(hb_position_t)_dretval;

    return _retval;
  }
  auto _funcCB = func ? &_funcCallback : null;
  auto _func = func ? freezeDelegate(cast(void*)&func) : null;
  GDestroyNotify _funcDestroyCB = func ? &thawDelegate : null;
  hb_font_funcs_set_glyph_v_advance_func(ffuncs ? cast(hb_font_funcs_t*)ffuncs._cPtr(No.Dup) : null, _funcCB, _func, _funcDestroyCB);
}

/**
    Sets the implementation function for #hb_font_get_glyph_v_kerning_func_t.

    Params:
      ffuncs = A font-function structure
      func = The callback function to assign
*/
void fontFuncsSetGlyphVKerningFunc(harfbuzz.font_funcs.FontFuncs ffuncs, harfbuzz.types.FontGetGlyphVKerningFunc func)
{
  extern(C) hb_position_t _funcCallback(hb_font_t* font, void* fontData, hb_codepoint_t firstGlyph, hb_codepoint_t secondGlyph, void* userData)
  {
    harfbuzz.types.Position _dretval;
    auto _dlg = cast(harfbuzz.types.FontGetGlyphVKerningFunc*)userData;

    _dretval = (*_dlg)(font ? new harfbuzz.font.Font(cast(void*)font, No.Take) : null, fontData, firstGlyph, secondGlyph);
    auto _retval = cast(hb_position_t)_dretval;

    return _retval;
  }
  auto _funcCB = func ? &_funcCallback : null;
  auto _func = func ? freezeDelegate(cast(void*)&func) : null;
  GDestroyNotify _funcDestroyCB = func ? &thawDelegate : null;
  hb_font_funcs_set_glyph_v_kerning_func(ffuncs ? cast(hb_font_funcs_t*)ffuncs._cPtr(No.Dup) : null, _funcCB, _func, _funcDestroyCB);
}

/**
    Sets the implementation function for #hb_font_get_glyph_v_origin_func_t.

    Params:
      ffuncs = A font-function structure
      func = The callback function to assign
*/
void fontFuncsSetGlyphVOriginFunc(harfbuzz.font_funcs.FontFuncs ffuncs, harfbuzz.types.FontGetGlyphVOriginFunc func)
{
  extern(C) hb_bool_t _funcCallback(hb_font_t* font, void* fontData, hb_codepoint_t glyph, hb_position_t* x, hb_position_t* y, void* userData)
  {
    harfbuzz.types.Bool _dretval;
    auto _dlg = cast(harfbuzz.types.FontGetGlyphVOriginFunc*)userData;

    _dretval = (*_dlg)(font ? new harfbuzz.font.Font(cast(void*)font, No.Take) : null, fontData, glyph, *x, *y);
    auto _retval = cast(hb_bool_t)_dretval;

    return _retval;
  }
  auto _funcCB = func ? &_funcCallback : null;
  auto _func = func ? freezeDelegate(cast(void*)&func) : null;
  GDestroyNotify _funcDestroyCB = func ? &thawDelegate : null;
  hb_font_funcs_set_glyph_v_origin_func(ffuncs ? cast(hb_font_funcs_t*)ffuncs._cPtr(No.Dup) : null, _funcCB, _func, _funcDestroyCB);
}

/**
    Sets the implementation function for #hb_font_get_nominal_glyph_func_t.

    Params:
      ffuncs = A font-function structure
      func = The callback function to assign
*/
void fontFuncsSetNominalGlyphFunc(harfbuzz.font_funcs.FontFuncs ffuncs, harfbuzz.types.FontGetNominalGlyphFunc func)
{
  extern(C) hb_bool_t _funcCallback(hb_font_t* font, void* fontData, hb_codepoint_t unicode, hb_codepoint_t* glyph, void* userData)
  {
    harfbuzz.types.Bool _dretval;
    auto _dlg = cast(harfbuzz.types.FontGetNominalGlyphFunc*)userData;

    _dretval = (*_dlg)(font ? new harfbuzz.font.Font(cast(void*)font, No.Take) : null, fontData, unicode, *glyph);
    auto _retval = cast(hb_bool_t)_dretval;

    return _retval;
  }
  auto _funcCB = func ? &_funcCallback : null;
  auto _func = func ? freezeDelegate(cast(void*)&func) : null;
  GDestroyNotify _funcDestroyCB = func ? &thawDelegate : null;
  hb_font_funcs_set_nominal_glyph_func(ffuncs ? cast(hb_font_funcs_t*)ffuncs._cPtr(No.Dup) : null, _funcCB, _func, _funcDestroyCB);
}

/**
    Sets the implementation function for #hb_font_paint_glyph_func_t.

    Params:
      ffuncs = A font-function structure
      func = The callback function to assign
*/
void fontFuncsSetPaintGlyphFunc(harfbuzz.font_funcs.FontFuncs ffuncs, harfbuzz.types.FontPaintGlyphFunc func)
{
  extern(C) void _funcCallback(hb_font_t* font, void* fontData, hb_codepoint_t glyph, hb_paint_funcs_t* paintFuncs, void* paintData, uint paletteIndex, hb_color_t foreground, void* userData)
  {
    auto _dlg = cast(harfbuzz.types.FontPaintGlyphFunc*)userData;

    (*_dlg)(font ? new harfbuzz.font.Font(cast(void*)font, No.Take) : null, fontData, glyph, paintFuncs ? new harfbuzz.paint_funcs.PaintFuncs(cast(void*)paintFuncs, No.Take) : null, paintData, paletteIndex, foreground);
  }
  auto _funcCB = func ? &_funcCallback : null;
  auto _func = func ? freezeDelegate(cast(void*)&func) : null;
  GDestroyNotify _funcDestroyCB = func ? &thawDelegate : null;
  hb_font_funcs_set_paint_glyph_func(ffuncs ? cast(hb_font_funcs_t*)ffuncs._cPtr(No.Dup) : null, _funcCB, _func, _funcDestroyCB);
}

/**
    Sets the implementation function for #hb_font_get_variation_glyph_func_t.

    Params:
      ffuncs = A font-function structure
      func = The callback function to assign
*/
void fontFuncsSetVariationGlyphFunc(harfbuzz.font_funcs.FontFuncs ffuncs, harfbuzz.types.FontGetVariationGlyphFunc func)
{
  extern(C) hb_bool_t _funcCallback(hb_font_t* font, void* fontData, hb_codepoint_t unicode, hb_codepoint_t variationSelector, hb_codepoint_t* glyph, void* userData)
  {
    harfbuzz.types.Bool _dretval;
    auto _dlg = cast(harfbuzz.types.FontGetVariationGlyphFunc*)userData;

    _dretval = (*_dlg)(font ? new harfbuzz.font.Font(cast(void*)font, No.Take) : null, fontData, unicode, variationSelector, *glyph);
    auto _retval = cast(hb_bool_t)_dretval;

    return _retval;
  }
  auto _funcCB = func ? &_funcCallback : null;
  auto _func = func ? freezeDelegate(cast(void*)&func) : null;
  GDestroyNotify _funcDestroyCB = func ? &thawDelegate : null;
  hb_font_funcs_set_variation_glyph_func(ffuncs ? cast(hb_font_funcs_t*)ffuncs._cPtr(No.Dup) : null, _funcCB, _func, _funcDestroyCB);
}

/**
    Fetches the empty font object.
    Returns: The empty font object
*/
harfbuzz.font.Font fontGetEmpty()
{
  hb_font_t* _cretval;
  _cretval = hb_font_get_empty();
  auto _retval = _cretval ? new harfbuzz.font.Font(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Fetches the extents for a font in a text segment of the
    specified direction.
    
    Calls the appropriate direction-specific variant (horizontal
    or vertical) depending on the value of direction.

    Params:
      font = #hb_font_t to work upon
      direction = The direction of the text segment
      extents = The #hb_font_extents_t retrieved
*/
void fontGetExtentsForDirection(harfbuzz.font.Font font, harfbuzz.types.Direction direction, out harfbuzz.types.FontExtents extents)
{
  hb_font_get_extents_for_direction(font ? cast(hb_font_t*)font._cPtr(No.Dup) : null, direction, &extents);
}

/**
    Fetches the face associated with the specified font object.

    Params:
      font = #hb_font_t to work upon
    Returns: The #hb_face_t value
*/
harfbuzz.face.Face fontGetFace(harfbuzz.font.Font font)
{
  hb_face_t* _cretval;
  _cretval = hb_font_get_face(font ? cast(hb_font_t*)font._cPtr(No.Dup) : null);
  auto _retval = _cretval ? new harfbuzz.face.Face(cast(void*)_cretval, No.Take) : null;
  return _retval;
}

/**
    Fetches the glyph ID for a Unicode code point in the specified
    font, with an optional variation selector.
    
    If variation_selector is 0, calls [harfbuzz.global.fontGetNominalGlyph];
    otherwise calls [harfbuzz.global.fontGetVariationGlyph].

    Params:
      font = #hb_font_t to work upon
      unicode = The Unicode code point to query
      variationSelector = A variation-selector code point
      glyph = The glyph ID retrieved
    Returns: `true` if data found, `false` otherwise
*/
harfbuzz.types.Bool fontGetGlyph(harfbuzz.font.Font font, harfbuzz.types.Codepoint unicode, harfbuzz.types.Codepoint variationSelector, out harfbuzz.types.Codepoint glyph)
{
  harfbuzz.types.Bool _retval;
  _retval = hb_font_get_glyph(font ? cast(hb_font_t*)font._cPtr(No.Dup) : null, unicode, variationSelector, cast(hb_codepoint_t*)&glyph);
  return _retval;
}

/**
    Fetches the advance for a glyph ID from the specified font,
    in a text segment of the specified direction.
    
    Calls the appropriate direction-specific variant (horizontal
    or vertical) depending on the value of direction.

    Params:
      font = #hb_font_t to work upon
      glyph = The glyph ID to query
      direction = The direction of the text segment
      x = The horizontal advance retrieved
      y = The vertical advance retrieved
*/
void fontGetGlyphAdvanceForDirection(harfbuzz.font.Font font, harfbuzz.types.Codepoint glyph, harfbuzz.types.Direction direction, out harfbuzz.types.Position x, out harfbuzz.types.Position y)
{
  hb_font_get_glyph_advance_for_direction(font ? cast(hb_font_t*)font._cPtr(No.Dup) : null, glyph, direction, cast(hb_position_t*)&x, cast(hb_position_t*)&y);
}

/**
    Fetches the (x,y) coordinates of a specified contour-point index
    in the specified glyph, within the specified font.

    Params:
      font = #hb_font_t to work upon
      glyph = The glyph ID to query
      pointIndex = The contour-point index to query
      x = The X value retrieved for the contour point
      y = The Y value retrieved for the contour point
    Returns: `true` if data found, `false` otherwise
*/
harfbuzz.types.Bool fontGetGlyphContourPoint(harfbuzz.font.Font font, harfbuzz.types.Codepoint glyph, uint pointIndex, out harfbuzz.types.Position x, out harfbuzz.types.Position y)
{
  harfbuzz.types.Bool _retval;
  _retval = hb_font_get_glyph_contour_point(font ? cast(hb_font_t*)font._cPtr(No.Dup) : null, glyph, pointIndex, cast(hb_position_t*)&x, cast(hb_position_t*)&y);
  return _retval;
}

/**
    Fetches the (X,Y) coordinates of a specified contour-point index
    in the specified glyph ID in the specified font, with respect
    to the origin in a text segment in the specified direction.
    
    Calls the appropriate direction-specific variant (horizontal
    or vertical) depending on the value of direction.

    Params:
      font = #hb_font_t to work upon
      glyph = The glyph ID to query
      pointIndex = The contour-point index to query
      direction = The direction of the text segment
      x = The X value retrieved for the contour point
      y = The Y value retrieved for the contour point
    Returns: `true` if data found, `false` otherwise
*/
harfbuzz.types.Bool fontGetGlyphContourPointForOrigin(harfbuzz.font.Font font, harfbuzz.types.Codepoint glyph, uint pointIndex, harfbuzz.types.Direction direction, out harfbuzz.types.Position x, out harfbuzz.types.Position y)
{
  harfbuzz.types.Bool _retval;
  _retval = hb_font_get_glyph_contour_point_for_origin(font ? cast(hb_font_t*)font._cPtr(No.Dup) : null, glyph, pointIndex, direction, cast(hb_position_t*)&x, cast(hb_position_t*)&y);
  return _retval;
}

/**
    Fetches the #hb_glyph_extents_t data for a glyph ID
    in the specified font.

    Params:
      font = #hb_font_t to work upon
      glyph = The glyph ID to query
      extents = The #hb_glyph_extents_t retrieved
    Returns: `true` if data found, `false` otherwise
*/
harfbuzz.types.Bool fontGetGlyphExtents(harfbuzz.font.Font font, harfbuzz.types.Codepoint glyph, out harfbuzz.types.GlyphExtents extents)
{
  harfbuzz.types.Bool _retval;
  _retval = hb_font_get_glyph_extents(font ? cast(hb_font_t*)font._cPtr(No.Dup) : null, glyph, &extents);
  return _retval;
}

/**
    Fetches the #hb_glyph_extents_t data for a glyph ID
    in the specified font, with respect to the origin in
    a text segment in the specified direction.
    
    Calls the appropriate direction-specific variant (horizontal
    or vertical) depending on the value of direction.

    Params:
      font = #hb_font_t to work upon
      glyph = The glyph ID to query
      direction = The direction of the text segment
      extents = The #hb_glyph_extents_t retrieved
    Returns: `true` if data found, `false` otherwise
*/
harfbuzz.types.Bool fontGetGlyphExtentsForOrigin(harfbuzz.font.Font font, harfbuzz.types.Codepoint glyph, harfbuzz.types.Direction direction, out harfbuzz.types.GlyphExtents extents)
{
  harfbuzz.types.Bool _retval;
  _retval = hb_font_get_glyph_extents_for_origin(font ? cast(hb_font_t*)font._cPtr(No.Dup) : null, glyph, direction, &extents);
  return _retval;
}

/**
    Fetches the glyph ID that corresponds to a name string in the specified font.
    
    <note>Note: len == -1 means the name string is null-terminated.</note>

    Params:
      font = #hb_font_t to work upon
      name = The name string to query
      glyph = The glyph ID retrieved
    Returns: `true` if data found, `false` otherwise
*/
harfbuzz.types.Bool fontGetGlyphFromName(harfbuzz.font.Font font, string name, out harfbuzz.types.Codepoint glyph)
{
  harfbuzz.types.Bool _retval;
  int _len;
  if (name)
    _len = cast(int)name.length;

  auto _name = cast(const(char)*)name.ptr;
  _retval = hb_font_get_glyph_from_name(font ? cast(hb_font_t*)font._cPtr(No.Dup) : null, _name, _len, cast(hb_codepoint_t*)&glyph);
  return _retval;
}

/**
    Fetches the advance for a glyph ID in the specified font,
    for horizontal text segments.

    Params:
      font = #hb_font_t to work upon
      glyph = The glyph ID to query
    Returns: The advance of glyph within font
*/
harfbuzz.types.Position fontGetGlyphHAdvance(harfbuzz.font.Font font, harfbuzz.types.Codepoint glyph)
{
  harfbuzz.types.Position _retval;
  _retval = hb_font_get_glyph_h_advance(font ? cast(hb_font_t*)font._cPtr(No.Dup) : null, glyph);
  return _retval;
}

/**
    Fetches the kerning-adjustment value for a glyph-pair in
    the specified font, for horizontal text segments.
    
    <note>It handles legacy kerning only (as returned by the corresponding
    #hb_font_funcs_t function).</note>

    Params:
      font = #hb_font_t to work upon
      leftGlyph = The glyph ID of the left glyph in the glyph pair
      rightGlyph = The glyph ID of the right glyph in the glyph pair
    Returns: The kerning adjustment value
*/
harfbuzz.types.Position fontGetGlyphHKerning(harfbuzz.font.Font font, harfbuzz.types.Codepoint leftGlyph, harfbuzz.types.Codepoint rightGlyph)
{
  harfbuzz.types.Position _retval;
  _retval = hb_font_get_glyph_h_kerning(font ? cast(hb_font_t*)font._cPtr(No.Dup) : null, leftGlyph, rightGlyph);
  return _retval;
}

/**
    Fetches the (X,Y) coordinates of the origin for a glyph ID
    in the specified font, for horizontal text segments.

    Params:
      font = #hb_font_t to work upon
      glyph = The glyph ID to query
      x = The X coordinate of the origin
      y = The Y coordinate of the origin
    Returns: `true` if data found, `false` otherwise
*/
harfbuzz.types.Bool fontGetGlyphHOrigin(harfbuzz.font.Font font, harfbuzz.types.Codepoint glyph, out harfbuzz.types.Position x, out harfbuzz.types.Position y)
{
  harfbuzz.types.Bool _retval;
  _retval = hb_font_get_glyph_h_origin(font ? cast(hb_font_t*)font._cPtr(No.Dup) : null, glyph, cast(hb_position_t*)&x, cast(hb_position_t*)&y);
  return _retval;
}

/**
    Fetches the kerning-adjustment value for a glyph-pair in the specified font.
    
    Calls the appropriate direction-specific variant (horizontal
    or vertical) depending on the value of direction.

    Params:
      font = #hb_font_t to work upon
      firstGlyph = The glyph ID of the first glyph in the glyph pair to query
      secondGlyph = The glyph ID of the second glyph in the glyph pair to query
      direction = The direction of the text segment
      x = The horizontal kerning-adjustment value retrieved
      y = The vertical kerning-adjustment value retrieved
*/
void fontGetGlyphKerningForDirection(harfbuzz.font.Font font, harfbuzz.types.Codepoint firstGlyph, harfbuzz.types.Codepoint secondGlyph, harfbuzz.types.Direction direction, out harfbuzz.types.Position x, out harfbuzz.types.Position y)
{
  hb_font_get_glyph_kerning_for_direction(font ? cast(hb_font_t*)font._cPtr(No.Dup) : null, firstGlyph, secondGlyph, direction, cast(hb_position_t*)&x, cast(hb_position_t*)&y);
}

/**
    Fetches the (X,Y) coordinates of the origin for a glyph in
    the specified font.
    
    Calls the appropriate direction-specific variant (horizontal
    or vertical) depending on the value of direction.

    Params:
      font = #hb_font_t to work upon
      glyph = The glyph ID to query
      direction = The direction of the text segment
      x = The X coordinate retrieved for the origin
      y = The Y coordinate retrieved for the origin
*/
void fontGetGlyphOriginForDirection(harfbuzz.font.Font font, harfbuzz.types.Codepoint glyph, harfbuzz.types.Direction direction, out harfbuzz.types.Position x, out harfbuzz.types.Position y)
{
  hb_font_get_glyph_origin_for_direction(font ? cast(hb_font_t*)font._cPtr(No.Dup) : null, glyph, direction, cast(hb_position_t*)&x, cast(hb_position_t*)&y);
}

/**
    Fetches the glyph shape that corresponds to a glyph in the specified font.
    The shape is returned by way of calls to the callbacks of the dfuncs
    objects, with draw_data passed to them.

    Params:
      font = #hb_font_t to work upon
      glyph = The glyph ID
      dfuncs = #hb_draw_funcs_t to draw to
      drawData = User data to pass to draw callbacks

    Deprecated: Use [harfbuzz.global.fontDrawGlyph] instead
*/
void fontGetGlyphShape(harfbuzz.font.Font font, harfbuzz.types.Codepoint glyph, harfbuzz.draw_funcs.DrawFuncs dfuncs, void* drawData = null)
{
  hb_font_get_glyph_shape(font ? cast(hb_font_t*)font._cPtr(No.Dup) : null, glyph, dfuncs ? cast(hb_draw_funcs_t*)dfuncs._cPtr(No.Dup) : null, drawData);
}

/**
    Fetches the advance for a glyph ID in the specified font,
    for vertical text segments.

    Params:
      font = #hb_font_t to work upon
      glyph = The glyph ID to query
    Returns: The advance of glyph within font
*/
harfbuzz.types.Position fontGetGlyphVAdvance(harfbuzz.font.Font font, harfbuzz.types.Codepoint glyph)
{
  harfbuzz.types.Position _retval;
  _retval = hb_font_get_glyph_v_advance(font ? cast(hb_font_t*)font._cPtr(No.Dup) : null, glyph);
  return _retval;
}

/**
    Fetches the kerning-adjustment value for a glyph-pair in
    the specified font, for vertical text segments.
    
    <note>It handles legacy kerning only (as returned by the corresponding
    #hb_font_funcs_t function).</note>

    Params:
      font = #hb_font_t to work upon
      topGlyph = The glyph ID of the top glyph in the glyph pair
      bottomGlyph = The glyph ID of the bottom glyph in the glyph pair
    Returns: The kerning adjustment value
*/
harfbuzz.types.Position fontGetGlyphVKerning(harfbuzz.font.Font font, harfbuzz.types.Codepoint topGlyph, harfbuzz.types.Codepoint bottomGlyph)
{
  harfbuzz.types.Position _retval;
  _retval = hb_font_get_glyph_v_kerning(font ? cast(hb_font_t*)font._cPtr(No.Dup) : null, topGlyph, bottomGlyph);
  return _retval;
}

/**
    Fetches the (X,Y) coordinates of the origin for a glyph ID
    in the specified font, for vertical text segments.

    Params:
      font = #hb_font_t to work upon
      glyph = The glyph ID to query
      x = The X coordinate of the origin
      y = The Y coordinate of the origin
    Returns: `true` if data found, `false` otherwise
*/
harfbuzz.types.Bool fontGetGlyphVOrigin(harfbuzz.font.Font font, harfbuzz.types.Codepoint glyph, out harfbuzz.types.Position x, out harfbuzz.types.Position y)
{
  harfbuzz.types.Bool _retval;
  _retval = hb_font_get_glyph_v_origin(font ? cast(hb_font_t*)font._cPtr(No.Dup) : null, glyph, cast(hb_position_t*)&x, cast(hb_position_t*)&y);
  return _retval;
}

/**
    Fetches the extents for a specified font, for horizontal
    text segments.

    Params:
      font = #hb_font_t to work upon
      extents = The font extents retrieved
    Returns: `true` if data found, `false` otherwise
*/
harfbuzz.types.Bool fontGetHExtents(harfbuzz.font.Font font, out harfbuzz.types.FontExtents extents)
{
  harfbuzz.types.Bool _retval;
  _retval = hb_font_get_h_extents(font ? cast(hb_font_t*)font._cPtr(No.Dup) : null, &extents);
  return _retval;
}

/**
    Fetches the nominal glyph ID for a Unicode code point in the
    specified font.
    
    This version of the function should not be used to fetch glyph IDs
    for code points modified by variation selectors. For variation-selector
    support, user [harfbuzz.global.fontGetVariationGlyph] or use [harfbuzz.global.fontGetGlyph].

    Params:
      font = #hb_font_t to work upon
      unicode = The Unicode code point to query
      glyph = The glyph ID retrieved
    Returns: `true` if data found, `false` otherwise
*/
harfbuzz.types.Bool fontGetNominalGlyph(harfbuzz.font.Font font, harfbuzz.types.Codepoint unicode, out harfbuzz.types.Codepoint glyph)
{
  harfbuzz.types.Bool _retval;
  _retval = hb_font_get_nominal_glyph(font ? cast(hb_font_t*)font._cPtr(No.Dup) : null, unicode, cast(hb_codepoint_t*)&glyph);
  return _retval;
}

/**
    Fetches the parent font of font.

    Params:
      font = #hb_font_t to work upon
    Returns: The parent font object
*/
harfbuzz.font.Font fontGetParent(harfbuzz.font.Font font)
{
  hb_font_t* _cretval;
  _cretval = hb_font_get_parent(font ? cast(hb_font_t*)font._cPtr(No.Dup) : null);
  auto _retval = _cretval ? new harfbuzz.font.Font(cast(void*)_cretval, No.Take) : null;
  return _retval;
}

/**
    Fetches the horizontal and vertical points-per-em (ppem) of a font.

    Params:
      font = #hb_font_t to work upon
      xPpem = Horizontal ppem value
      yPpem = Vertical ppem value
*/
void fontGetPpem(harfbuzz.font.Font font, out uint xPpem, out uint yPpem)
{
  hb_font_get_ppem(font ? cast(hb_font_t*)font._cPtr(No.Dup) : null, cast(uint*)&xPpem, cast(uint*)&yPpem);
}

/**
    Fetches the "point size" of a font. Used in CoreText to
    implement optical sizing.

    Params:
      font = #hb_font_t to work upon
    Returns: Point size.  A value of zero means "not set."
*/
float fontGetPtem(harfbuzz.font.Font font)
{
  float _retval;
  _retval = hb_font_get_ptem(font ? cast(hb_font_t*)font._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Fetches the horizontal and vertical scale of a font.

    Params:
      font = #hb_font_t to work upon
      xScale = Horizontal scale value
      yScale = Vertical scale value
*/
void fontGetScale(harfbuzz.font.Font font, out int xScale, out int yScale)
{
  hb_font_get_scale(font ? cast(hb_font_t*)font._cPtr(No.Dup) : null, cast(int*)&xScale, cast(int*)&yScale);
}

/**
    Returns the internal serial number of the font. The serial
    number is increased every time a setting on the font is
    changed, using a setter function.

    Params:
      font = #hb_font_t to work upon
    Returns: serial number
*/
uint fontGetSerial(harfbuzz.font.Font font)
{
  uint _retval;
  _retval = hb_font_get_serial(font ? cast(hb_font_t*)font._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Fetches the "synthetic boldness" parameters of a font.

    Params:
      font = #hb_font_t to work upon
      xEmbolden = return location for horizontal value
      yEmbolden = return location for vertical value
      inPlace = return location for in-place value
*/
void fontGetSyntheticBold(harfbuzz.font.Font font, out float xEmbolden, out float yEmbolden, out harfbuzz.types.Bool inPlace)
{
  hb_font_get_synthetic_bold(font ? cast(hb_font_t*)font._cPtr(No.Dup) : null, cast(float*)&xEmbolden, cast(float*)&yEmbolden, cast(hb_bool_t*)&inPlace);
}

/**
    Fetches the "synthetic slant" of a font.

    Params:
      font = #hb_font_t to work upon
    Returns: Synthetic slant.  By default is zero.
*/
float fontGetSyntheticSlant(harfbuzz.font.Font font)
{
  float _retval;
  _retval = hb_font_get_synthetic_slant(font ? cast(hb_font_t*)font._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Fetches the extents for a specified font, for vertical
    text segments.

    Params:
      font = #hb_font_t to work upon
      extents = The font extents retrieved
    Returns: `true` if data found, `false` otherwise
*/
harfbuzz.types.Bool fontGetVExtents(harfbuzz.font.Font font, out harfbuzz.types.FontExtents extents)
{
  harfbuzz.types.Bool _retval;
  _retval = hb_font_get_v_extents(font ? cast(hb_font_t*)font._cPtr(No.Dup) : null, &extents);
  return _retval;
}

/**
    Fetches the list of variation coordinates (in design-space units) currently
    set on a font.
    
    Note that this returned array may only contain values for some
    (or none) of the axes; omitted axes effectively have their default
    values.
    
    Return value is valid as long as variation coordinates of the font
    are not modified.

    Params:
      font = #hb_font_t to work upon
    Returns: coordinates array
*/
float[] fontGetVarCoordsDesign(harfbuzz.font.Font font)
{
  const(float)* _cretval;
  uint _cretlength;
  _cretval = hb_font_get_var_coords_design(font ? cast(hb_font_t*)font._cPtr(No.Dup) : null, &_cretlength);
  float[] _retval;

  if (_cretval)
  {
    _retval = cast(float[])_cretval[0 .. _cretlength].dup;
  }
  return _retval;
}

/**
    Fetches the list of normalized variation coordinates currently
    set on a font.
    
    Note that this returned array may only contain values for some
    (or none) of the axes; omitted axes effectively have zero values.
    
    Return value is valid as long as variation coordinates of the font
    are not modified.

    Params:
      font = #hb_font_t to work upon
    Returns: coordinates array
*/
int[] fontGetVarCoordsNormalized(harfbuzz.font.Font font)
{
  const(int)* _cretval;
  uint _cretlength;
  _cretval = hb_font_get_var_coords_normalized(font ? cast(hb_font_t*)font._cPtr(No.Dup) : null, &_cretlength);
  int[] _retval;

  if (_cretval)
  {
    _retval = cast(int[])_cretval[0 .. _cretlength].dup;
  }
  return _retval;
}

/**
    Returns the currently-set named-instance index of the font.

    Params:
      font = a font.
    Returns: Named-instance index or `HB_FONT_NO_VAR_NAMED_INSTANCE`.
*/
uint fontGetVarNamedInstance(harfbuzz.font.Font font)
{
  uint _retval;
  _retval = hb_font_get_var_named_instance(font ? cast(hb_font_t*)font._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Fetches the glyph ID for a Unicode code point when followed by
    by the specified variation-selector code point, in the specified
    font.

    Params:
      font = #hb_font_t to work upon
      unicode = The Unicode code point to query
      variationSelector = The  variation-selector code point to query
      glyph = The glyph ID retrieved
    Returns: `true` if data found, `false` otherwise
*/
harfbuzz.types.Bool fontGetVariationGlyph(harfbuzz.font.Font font, harfbuzz.types.Codepoint unicode, harfbuzz.types.Codepoint variationSelector, out harfbuzz.types.Codepoint glyph)
{
  harfbuzz.types.Bool _retval;
  _retval = hb_font_get_variation_glyph(font ? cast(hb_font_t*)font._cPtr(No.Dup) : null, unicode, variationSelector, cast(hb_codepoint_t*)&glyph);
  return _retval;
}

/**
    Fetches the glyph ID from font that matches the specified string.
    Strings of the format `gidDDD` or `uniUUUU` are parsed automatically.
    
    <note>Note: len == -1 means the string is null-terminated.</note>

    Params:
      font = #hb_font_t to work upon
      s = string to query
      glyph = The glyph ID corresponding to the string requested
    Returns: `true` if data found, `false` otherwise
*/
harfbuzz.types.Bool fontGlyphFromString(harfbuzz.font.Font font, ubyte[] s, out harfbuzz.types.Codepoint glyph)
{
  harfbuzz.types.Bool _retval;
  int _len;
  if (s)
    _len = cast(int)s.length;

  auto _s = cast(const(ubyte)*)s.ptr;
  _retval = hb_font_glyph_from_string(font ? cast(hb_font_t*)font._cPtr(No.Dup) : null, _s, _len, cast(hb_codepoint_t*)&glyph);
  return _retval;
}

/**
    Tests whether a font object is immutable.

    Params:
      font = #hb_font_t to work upon
    Returns: `true` if font is immutable, `false` otherwise
*/
harfbuzz.types.Bool fontIsImmutable(harfbuzz.font.Font font)
{
  harfbuzz.types.Bool _retval;
  _retval = hb_font_is_immutable(font ? cast(hb_font_t*)font._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Makes font immutable.

    Params:
      font = #hb_font_t to work upon
*/
void fontMakeImmutable(harfbuzz.font.Font font)
{
  hb_font_make_immutable(font ? cast(hb_font_t*)font._cPtr(No.Dup) : null);
}

/**
    Paints the glyph.
    
    The painting instructions are returned by way of calls to
    the callbacks of the funcs object, with paint_data passed
    to them.
    
    If the font has color palettes (see [harfbuzz.global.otColorHasPalettes]),
    then palette_index selects the palette to use. If the font only
    has one palette, this will be 0.

    Params:
      font = #hb_font_t to work upon
      glyph = The glyph ID
      pfuncs = #hb_paint_funcs_t to paint with
      paintData = User data to pass to paint callbacks
      paletteIndex = The index of the font's color palette to use
      foreground = The foreground color, unpremultipled
*/
void fontPaintGlyph(harfbuzz.font.Font font, harfbuzz.types.Codepoint glyph, harfbuzz.paint_funcs.PaintFuncs pfuncs, void* paintData, uint paletteIndex, harfbuzz.types.Color foreground)
{
  hb_font_paint_glyph(font ? cast(hb_font_t*)font._cPtr(No.Dup) : null, glyph, pfuncs ? cast(hb_paint_funcs_t*)pfuncs._cPtr(No.Dup) : null, paintData, paletteIndex, foreground);
}

/**
    Sets face as the font-face value of font.

    Params:
      font = #hb_font_t to work upon
      face = The #hb_face_t to assign
*/
void fontSetFace(harfbuzz.font.Font font, harfbuzz.face.Face face)
{
  hb_font_set_face(font ? cast(hb_font_t*)font._cPtr(No.Dup) : null, face ? cast(hb_face_t*)face._cPtr(No.Dup) : null);
}

/**
    Sets the parent font of font.

    Params:
      font = #hb_font_t to work upon
      parent = The parent font object to assign
*/
void fontSetParent(harfbuzz.font.Font font, harfbuzz.font.Font parent)
{
  hb_font_set_parent(font ? cast(hb_font_t*)font._cPtr(No.Dup) : null, parent ? cast(hb_font_t*)parent._cPtr(No.Dup) : null);
}

/**
    Sets the horizontal and vertical pixels-per-em (PPEM) of a font.
    
    These values are used for pixel-size-specific adjustment to
    shaping and draw results, though for the most part they are
    unused and can be left unset.

    Params:
      font = #hb_font_t to work upon
      xPpem = Horizontal ppem value to assign
      yPpem = Vertical ppem value to assign
*/
void fontSetPpem(harfbuzz.font.Font font, uint xPpem, uint yPpem)
{
  hb_font_set_ppem(font ? cast(hb_font_t*)font._cPtr(No.Dup) : null, xPpem, yPpem);
}

/**
    Sets the "point size" of a font. Set to zero to unset.
    Used in CoreText to implement optical sizing.
    
    <note>Note: There are 72 points in an inch.</note>

    Params:
      font = #hb_font_t to work upon
      ptem = font size in points.
*/
void fontSetPtem(harfbuzz.font.Font font, float ptem)
{
  hb_font_set_ptem(font ? cast(hb_font_t*)font._cPtr(No.Dup) : null, ptem);
}

/**
    Sets the horizontal and vertical scale of a font.
    
    The font scale is a number related to, but not the same as,
    font size. Typically the client establishes a scale factor
    to be used between the two. For example, 64, or 256, which
    would be the fractional-precision part of the font scale.
    This is necessary because #hb_position_t values are integer
    types and you need to leave room for fractional values
    in there.
    
    For example, to set the font size to 20, with 64
    levels of fractional precision you would call
    `hb_font_set_scale(font, 20 * 64, 20 * 64)`.
    
    In the example above, even what font size 20 means is up to
    you. It might be 20 pixels, or 20 points, or 20 millimeters.
    HarfBuzz does not care about that.  You can set the point
    size of the font using [harfbuzz.global.fontSetPtem], and the pixel
    size using [harfbuzz.global.fontSetPpem].
    
    The choice of scale is yours but needs to be consistent between
    what you set here, and what you expect out of #hb_position_t
    as well has draw / paint API output values.
    
    Fonts default to a scale equal to the UPEM value of their face.
    A font with this setting is sometimes called an "unscaled" font.

    Params:
      font = #hb_font_t to work upon
      xScale = Horizontal scale value to assign
      yScale = Vertical scale value to assign
*/
void fontSetScale(harfbuzz.font.Font font, int xScale, int yScale)
{
  hb_font_set_scale(font ? cast(hb_font_t*)font._cPtr(No.Dup) : null, xScale, yScale);
}

/**
    Sets the "synthetic boldness" of a font.
    
    Positive values for x_embolden / y_embolden make a font
    bolder, negative values thinner. Typical values are in the
    0.01 to 0.05 range. The default value is zero.
    
    Synthetic boldness is applied by offsetting the contour
    points of the glyph shape.
    
    Synthetic boldness is applied when rendering a glyph via
    [harfbuzz.global.fontDrawGlyph].
    
    If in_place is `false`, then glyph advance-widths are also
    adjusted, otherwise they are not.  The in-place mode is
    useful for simulating [font grading](https://fonts.google.com/knowledge/glossary/grade).

    Params:
      font = #hb_font_t to work upon
      xEmbolden = the amount to embolden horizontally
      yEmbolden = the amount to embolden vertically
      inPlace = whether to embolden glyphs in-place
*/
void fontSetSyntheticBold(harfbuzz.font.Font font, float xEmbolden, float yEmbolden, harfbuzz.types.Bool inPlace)
{
  hb_font_set_synthetic_bold(font ? cast(hb_font_t*)font._cPtr(No.Dup) : null, xEmbolden, yEmbolden, inPlace);
}

/**
    Sets the "synthetic slant" of a font.  By default is zero.
    Synthetic slant is the graphical skew applied to the font
    at rendering time.
    
    HarfBuzz needs to know this value to adjust shaping results,
    metrics, and style values to match the slanted rendering.
    
    <note>Note: The glyph shape fetched via the [harfbuzz.global.fontDrawGlyph]
    function is slanted to reflect this value as well.</note>
    
    <note>Note: The slant value is a ratio.  For example, a
    20% slant would be represented as a 0.2 value.</note>

    Params:
      font = #hb_font_t to work upon
      slant = synthetic slant value.
*/
void fontSetSyntheticSlant(harfbuzz.font.Font font, float slant)
{
  hb_font_set_synthetic_slant(font ? cast(hb_font_t*)font._cPtr(No.Dup) : null, slant);
}

/**
    Applies a list of variation coordinates (in design-space units)
    to a font.
    
    Note that this overrides all existing variations set on font.
    Axes not included in coords will be effectively set to their
    default values.

    Params:
      font = #hb_font_t to work upon
      coords = Array of variation coordinates to apply
*/
void fontSetVarCoordsDesign(harfbuzz.font.Font font, float[] coords)
{
  uint _coordsLength;
  if (coords)
    _coordsLength = cast(uint)coords.length;

  auto _coords = cast(const(float)*)coords.ptr;
  hb_font_set_var_coords_design(font ? cast(hb_font_t*)font._cPtr(No.Dup) : null, _coords, _coordsLength);
}

/**
    Applies a list of variation coordinates (in normalized units)
    to a font.
    
    Note that this overrides all existing variations set on font.
    Axes not included in coords will be effectively set to their
    default values.
    
    <note>Note: Coordinates should be normalized to 2.14.</note>

    Params:
      font = #hb_font_t to work upon
      coords = Array of variation coordinates to apply
*/
void fontSetVarCoordsNormalized(harfbuzz.font.Font font, int[] coords)
{
  uint _coordsLength;
  if (coords)
    _coordsLength = cast(uint)coords.length;

  auto _coords = cast(const(int)*)coords.ptr;
  hb_font_set_var_coords_normalized(font ? cast(hb_font_t*)font._cPtr(No.Dup) : null, _coords, _coordsLength);
}

/**
    Sets design coords of a font from a named-instance index.

    Params:
      font = a font.
      instanceIndex = named instance index.
*/
void fontSetVarNamedInstance(harfbuzz.font.Font font, uint instanceIndex)
{
  hb_font_set_var_named_instance(font ? cast(hb_font_t*)font._cPtr(No.Dup) : null, instanceIndex);
}

/**
    Change the value of one variation axis on the font.
    
    Note: This function is expensive to be called repeatedly.
      If you want to set multiple variation axes at the same time,
      use [harfbuzz.global.fontSetVariations] instead.

    Params:
      font = #hb_font_t to work upon
      tag = The #hb_tag_t tag of the variation-axis name
      value = The value of the variation axis
*/
void fontSetVariation(harfbuzz.font.Font font, harfbuzz.types.Tag tag, float value)
{
  hb_font_set_variation(font ? cast(hb_font_t*)font._cPtr(No.Dup) : null, tag, value);
}

/**
    Applies a list of font-variation settings to a font.
    
    Note that this overrides all existing variations set on font.
    Axes not included in variations will be effectively set to their
    default values.

    Params:
      font = #hb_font_t to work upon
      variations = Array of variation settings to apply
*/
void fontSetVariations(harfbuzz.font.Font font, harfbuzz.variation.Variation[] variations)
{
  uint _variationsLength;
  if (variations)
    _variationsLength = cast(uint)variations.length;

  auto _variations = cast(const(hb_variation_t)*)variations.ptr;
  hb_font_set_variations(font ? cast(hb_font_t*)font._cPtr(No.Dup) : null, _variations, _variationsLength);
}

/**
    Subtracts the origin coordinates from an (X,Y) point coordinate,
    in the specified glyph ID in the specified font.
    
    Calls the appropriate direction-specific variant (horizontal
    or vertical) depending on the value of direction.

    Params:
      font = #hb_font_t to work upon
      glyph = The glyph ID to query
      direction = The direction of the text segment
      x = Input = The original X coordinate
            Output = The X coordinate minus the X-coordinate of the origin
      y = Input = The original Y coordinate
            Output = The Y coordinate minus the Y-coordinate of the origin
*/
void fontSubtractGlyphOriginForDirection(harfbuzz.font.Font font, harfbuzz.types.Codepoint glyph, harfbuzz.types.Direction direction, ref harfbuzz.types.Position x, ref harfbuzz.types.Position y)
{
  hb_font_subtract_glyph_origin_for_direction(font ? cast(hb_font_t*)font._cPtr(No.Dup) : null, glyph, direction, cast(hb_position_t*)&x, cast(hb_position_t*)&y);
}

/**
    Creates an #hb_face_t face object from the specified FT_Face.
    
    Note that this is using the FT_Face object just to get at the underlying
    font data, and fonts created from the returned #hb_face_t will use the native
    HarfBuzz font implementation, unless you call [harfbuzz.global.ftFontSetFuncs] on them.
    
    This variant of the function caches the newly created #hb_face_t
    face object, using the generic pointer of ft_face. Subsequent function
    calls that are passed the same ft_face parameter will have the same
    #hb_face_t returned to them, and that #hb_face_t will be correctly
    reference counted.
    
    However, client programs are still responsible for destroying
    ft_face after the last #hb_face_t face object has been destroyed.

    Params:
      ftFace = FT_Face to work upon
    Returns: the new #hb_face_t face object
*/
harfbuzz.face.Face ftFaceCreateCached(freetype2.types.Face ftFace)
{
  hb_face_t* _cretval;
  _cretval = hb_ft_face_create_cached(ftFace);
  auto _retval = _cretval ? new harfbuzz.face.Face(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Creates an #hb_face_t face object from the specified FT_Face.
    
    Note that this is using the FT_Face object just to get at the underlying
    font data, and fonts created from the returned #hb_face_t will use the native
    HarfBuzz font implementation, unless you call [harfbuzz.global.ftFontSetFuncs] on them.
    
    This is the preferred variant of the hb_ft_face_create*
    function family, because it calls FT_Reference_Face() on ft_face,
    ensuring that ft_face remains alive as long as the resulting
    #hb_face_t face object remains alive. Also calls FT_Done_Face()
    when the #hb_face_t face object is destroyed.
    
    Use this version unless you know you have good reasons not to.

    Params:
      ftFace = FT_Face to work upon
    Returns: the new #hb_face_t face object
*/
harfbuzz.face.Face ftFaceCreateReferenced(freetype2.types.Face ftFace)
{
  hb_face_t* _cretval;
  _cretval = hb_ft_face_create_referenced(ftFace);
  auto _retval = _cretval ? new harfbuzz.face.Face(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Refreshes the state of font when the underlying FT_Face has changed.
    This function should be called after changing the size or
    variation-axis settings on the FT_Face.

    Params:
      font = #hb_font_t to work upon
*/
void ftFontChanged(harfbuzz.font.Font font)
{
  hb_ft_font_changed(font ? cast(hb_font_t*)font._cPtr(No.Dup) : null);
}

/**
    Creates an #hb_font_t font object from the specified FT_Face.
    
    <note>Note: You must set the face size on ft_face before calling
    [harfbuzz.global.ftFontCreateReferenced] on it. HarfBuzz assumes size is always set
    and will access `size` member of FT_Face unconditionally.</note>
    
    This is the preferred variant of the hb_ft_font_create*
    function family, because it calls FT_Reference_Face() on ft_face,
    ensuring that ft_face remains alive as long as the resulting
    #hb_font_t font object remains alive.
    
    Use this version unless you know you have good reasons not to.

    Params:
      ftFace = FT_Face to work upon
    Returns: the new #hb_font_t font object
*/
harfbuzz.font.Font ftFontCreateReferenced(freetype2.types.Face ftFace)
{
  hb_font_t* _cretval;
  _cretval = hb_ft_font_create_referenced(ftFace);
  auto _retval = _cretval ? new harfbuzz.font.Font(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Fetches the FT_Load_Glyph load flags of the specified #hb_font_t.
    
    For more information, see
    <https://freetype.org/freetype2/docs/reference/ft2-glyph_retrieval.html#ft_load_xxx>
    
    This function works with #hb_font_t objects created by
    [harfbuzz.global.ftFontCreate] or [harfbuzz.global.ftFontCreateReferenced].

    Params:
      font = #hb_font_t to work upon
    Returns: FT_Load_Glyph flags found, or 0
*/
int ftFontGetLoadFlags(harfbuzz.font.Font font)
{
  int _retval;
  _retval = hb_ft_font_get_load_flags(font ? cast(hb_font_t*)font._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Configures the font-functions structure of the specified
    #hb_font_t font object to use FreeType font functions.
    
    In particular, you can use this function to configure an
    existing #hb_face_t face object for use with FreeType font
    functions even if that #hb_face_t face object was initially
    created with [harfbuzz.global.faceCreate], and therefore was not
    initially configured to use FreeType font functions.
    
    An #hb_font_t object created with [harfbuzz.global.ftFontCreate]
    is preconfigured for FreeType font functions and does not
    require this function to be used.
    
    Note that if you modify the underlying #hb_font_t after
    calling this function, you need to call [harfbuzz.global.ftHbFontChanged]
    to update the underlying FT_Face.
    
    <note>Note: Internally, this function creates an FT_Face.
    </note>

    Params:
      font = #hb_font_t to work upon
*/
void ftFontSetFuncs(harfbuzz.font.Font font)
{
  hb_ft_font_set_funcs(font ? cast(hb_font_t*)font._cPtr(No.Dup) : null);
}

/**
    Sets the FT_Load_Glyph load flags for the specified #hb_font_t.
    
    For more information, see
    <https://freetype.org/freetype2/docs/reference/ft2-glyph_retrieval.html#ft_load_xxx>
    
    This function works with #hb_font_t objects created by
    [harfbuzz.global.ftFontCreate] or [harfbuzz.global.ftFontCreateReferenced].

    Params:
      font = #hb_font_t to work upon
      loadFlags = The FreeType load flags to set
*/
void ftFontSetLoadFlags(harfbuzz.font.Font font, int loadFlags)
{
  hb_ft_font_set_load_flags(font ? cast(hb_font_t*)font._cPtr(No.Dup) : null, loadFlags);
}

/**
    Refreshes the state of the underlying FT_Face of font when the hb_font_t
    font has changed.
    This function should be called after changing the size or
    variation-axis settings on the font.
    This call is fast if nothing has changed on font.

    Params:
      font = #hb_font_t to work upon
    Returns: true if changed, false otherwise
*/
harfbuzz.types.Bool ftHbFontChanged(harfbuzz.font.Font font)
{
  harfbuzz.types.Bool _retval;
  _retval = hb_ft_hb_font_changed(font ? cast(hb_font_t*)font._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Creates an #hb_blob_t blob from the specified
    GBytes data structure.

    Params:
      gbytes = the GBytes structure to work upon
    Returns: the new #hb_blob_t blob object
*/
harfbuzz.blob.Blob glibBlobCreate(glib.bytes.Bytes gbytes)
{
  hb_blob_t* _cretval;
  _cretval = hb_glib_blob_create(gbytes ? cast(GBytes*)gbytes._cPtr(No.Dup) : null);
  auto _retval = _cretval ? new harfbuzz.blob.Blob(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Fetches a Unicode-functions structure that is populated
    with the appropriate GLib function for each method.
    Returns: a pointer to the #hb_unicode_funcs_t Unicode-functions structure
*/
harfbuzz.unicode_funcs.UnicodeFuncs glibGetUnicodeFuncs()
{
  hb_unicode_funcs_t* _cretval;
  _cretval = hb_glib_get_unicode_funcs();
  auto _retval = _cretval ? new harfbuzz.unicode_funcs.UnicodeFuncs(cast(void*)_cretval, No.Take) : null;
  return _retval;
}

/**
    Fetches the GUnicodeScript identifier that corresponds to the
    specified #hb_script_t script.

    Params:
      script = The #hb_script_t to query
    Returns: the GUnicodeScript identifier found
*/
glib.types.UnicodeScript glibScriptFromScript(harfbuzz.types.Script script)
{
  GUnicodeScript _cretval;
  _cretval = hb_glib_script_from_script(script);
  glib.types.UnicodeScript _retval = cast(glib.types.UnicodeScript)_cretval;
  return _retval;
}

/**
    Fetches the #hb_script_t script that corresponds to the
    specified GUnicodeScript identifier.

    Params:
      script = The GUnicodeScript identifier to query
    Returns: the #hb_script_t script found
*/
harfbuzz.types.Script glibScriptToScript(glib.types.UnicodeScript script)
{
  hb_script_t _cretval;
  _cretval = hb_glib_script_to_script(script);
  harfbuzz.types.Script _retval = cast(harfbuzz.types.Script)_cretval;
  return _retval;
}

/**
    Returns glyph flags encoded within a #hb_glyph_info_t.

    Params:
      info = a #hb_glyph_info_t
    Returns: The #hb_glyph_flags_t encoded within info
*/
harfbuzz.types.GlyphFlags glyphInfoGetGlyphFlags(harfbuzz.glyph_info.GlyphInfo info)
{
  hb_glyph_flags_t _cretval;
  _cretval = hb_glyph_info_get_glyph_flags(info ? cast(const(hb_glyph_info_t)*)info._cPtr(No.Dup) : null);
  harfbuzz.types.GlyphFlags _retval = cast(harfbuzz.types.GlyphFlags)_cretval;
  return _retval;
}

/**
    Converts str representing a BCP 47 language tag to the corresponding
    #hb_language_t.

    Params:
      str = a string representing
              a BCP 47 language tag
    Returns: The #hb_language_t corresponding to the BCP 47 language tag.
*/
harfbuzz.types.Language languageFromString(ubyte[] str)
{
  int _len;
  if (str)
    _len = cast(int)str.length;

  auto _str = cast(const(ubyte)*)str.ptr;
  auto _retval = hb_language_from_string(_str, _len);
  return _retval;
}

/**
    Fetch the default language from current locale.
    
    <note>Note that the first time this function is called, it calls
    "setlocale (LC_CTYPE, nullptr)" to fetch current locale.  The underlying
    setlocale function is, in many implementations, NOT threadsafe.  To avoid
    problems, call this function once before multiple threads can call it.
    This function is only used from [harfbuzz.global.bufferGuessSegmentProperties] by
    HarfBuzz itself.</note>
    Returns: The default language of the locale as
      an #hb_language_t
*/
harfbuzz.types.Language languageGetDefault()
{
  auto _retval = hb_language_get_default();
  return _retval;
}

/**
    Check whether a second language tag is the same or a more
    specific version of the provided language tag.  For example,
    "fa_IR.utf8" is a more specific tag for "fa" or for "fa_IR".

    Params:
      language = The #hb_language_t to work on
      specific = Another #hb_language_t
    Returns: `true` if languages match, `false` otherwise.
*/
harfbuzz.types.Bool languageMatches(harfbuzz.types.Language language, harfbuzz.types.Language specific)
{
  harfbuzz.types.Bool _retval;
  _retval = hb_language_matches(language, specific);
  return _retval;
}

/**
    Converts an #hb_language_t to a string.

    Params:
      language = The #hb_language_t to convert
    Returns: A `NULL`-terminated string representing the language. Must not be freed by
      the caller.
*/
string languageToString(harfbuzz.types.Language language)
{
  const(char)* _cretval;
  _cretval = hb_language_to_string(language);
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/**
    Tests whether memory allocation for a set was successful.

    Params:
      map = A map
    Returns: `true` if allocation succeeded, `false` otherwise
*/
harfbuzz.types.Bool mapAllocationSuccessful(harfbuzz.map.Map map)
{
  harfbuzz.types.Bool _retval;
  _retval = hb_map_allocation_successful(map ? cast(const(hb_map_t)*)map._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Clears out the contents of map.

    Params:
      map = A map
*/
void mapClear(harfbuzz.map.Map map)
{
  hb_map_clear(map ? cast(hb_map_t*)map._cPtr(No.Dup) : null);
}

/**
    Allocate a copy of map.

    Params:
      map = A map
    Returns: Newly-allocated map.
*/
harfbuzz.map.Map mapCopy(harfbuzz.map.Map map)
{
  hb_map_t* _cretval;
  _cretval = hb_map_copy(map ? cast(const(hb_map_t)*)map._cPtr(No.Dup) : null);
  auto _retval = _cretval ? new harfbuzz.map.Map(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Creates a new, initially empty map.
    Returns: The new #hb_map_t
*/
harfbuzz.map.Map mapCreate()
{
  hb_map_t* _cretval;
  _cretval = hb_map_create();
  auto _retval = _cretval ? new harfbuzz.map.Map(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Removes key and its stored value from map.

    Params:
      map = A map
      key = The key to delete
*/
void mapDel(harfbuzz.map.Map map, harfbuzz.types.Codepoint key)
{
  hb_map_del(map ? cast(hb_map_t*)map._cPtr(No.Dup) : null, key);
}

/**
    Fetches the value stored for key in map.

    Params:
      map = A map
      key = The key to query
    Returns: 
*/
harfbuzz.types.Codepoint mapGet(harfbuzz.map.Map map, harfbuzz.types.Codepoint key)
{
  harfbuzz.types.Codepoint _retval;
  _retval = hb_map_get(map ? cast(const(hb_map_t)*)map._cPtr(No.Dup) : null, key);
  return _retval;
}

/**
    Fetches the singleton empty #hb_map_t.
    Returns: The empty #hb_map_t
*/
harfbuzz.map.Map mapGetEmpty()
{
  hb_map_t* _cretval;
  _cretval = hb_map_get_empty();
  auto _retval = _cretval ? new harfbuzz.map.Map(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Returns the number of key-value pairs in the map.

    Params:
      map = A map
    Returns: The population of map
*/
uint mapGetPopulation(harfbuzz.map.Map map)
{
  uint _retval;
  _retval = hb_map_get_population(map ? cast(const(hb_map_t)*)map._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Tests whether key is an element of map.

    Params:
      map = A map
      key = The key to query
    Returns: `true` if key is found in map, `false` otherwise
*/
harfbuzz.types.Bool mapHas(harfbuzz.map.Map map, harfbuzz.types.Codepoint key)
{
  harfbuzz.types.Bool _retval;
  _retval = hb_map_has(map ? cast(const(hb_map_t)*)map._cPtr(No.Dup) : null, key);
  return _retval;
}

/**
    Creates a hash representing map.

    Params:
      map = A map
    Returns: A hash of map.
*/
uint mapHash(harfbuzz.map.Map map)
{
  uint _retval;
  _retval = hb_map_hash(map ? cast(const(hb_map_t)*)map._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Tests whether map is empty (contains no elements).

    Params:
      map = A map
    Returns: `true` if map is empty
*/
harfbuzz.types.Bool mapIsEmpty(harfbuzz.map.Map map)
{
  harfbuzz.types.Bool _retval;
  _retval = hb_map_is_empty(map ? cast(const(hb_map_t)*)map._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Tests whether map and other are equal (contain the same
    elements).

    Params:
      map = A map
      other = Another map
    Returns: `true` if the two maps are equal, `false` otherwise.
*/
harfbuzz.types.Bool mapIsEqual(harfbuzz.map.Map map, harfbuzz.map.Map other)
{
  harfbuzz.types.Bool _retval;
  _retval = hb_map_is_equal(map ? cast(const(hb_map_t)*)map._cPtr(No.Dup) : null, other ? cast(const(hb_map_t)*)other._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Add the keys of map to keys.

    Params:
      map = A map
      keys = A set
*/
void mapKeys(harfbuzz.map.Map map, harfbuzz.set.Set keys)
{
  hb_map_keys(map ? cast(const(hb_map_t)*)map._cPtr(No.Dup) : null, keys ? cast(hb_set_t*)keys._cPtr(No.Dup) : null);
}

/**
    Fetches the next key/value pair in map.
    
    Set idx to -1 to get started.
    
    If the map is modified during iteration, the behavior is undefined.
    
    The order in which the key/values are returned is undefined.

    Params:
      map = A map
      idx = Iterator internal state
      key = Key retrieved
      value = Value retrieved
    Returns: `true` if there was a next value, `false` otherwise
*/
harfbuzz.types.Bool mapNext(harfbuzz.map.Map map, ref int idx, out harfbuzz.types.Codepoint key, out harfbuzz.types.Codepoint value)
{
  harfbuzz.types.Bool _retval;
  _retval = hb_map_next(map ? cast(const(hb_map_t)*)map._cPtr(No.Dup) : null, cast(int*)&idx, cast(hb_codepoint_t*)&key, cast(hb_codepoint_t*)&value);
  return _retval;
}

/**
    Stores key:value in the map.

    Params:
      map = A map
      key = The key to store in the map
      value = The value to store for key
*/
void mapSet(harfbuzz.map.Map map, harfbuzz.types.Codepoint key, harfbuzz.types.Codepoint value)
{
  hb_map_set(map ? cast(hb_map_t*)map._cPtr(No.Dup) : null, key, value);
}

/**
    Add the contents of other to map.

    Params:
      map = A map
      other = Another map
*/
void mapUpdate(harfbuzz.map.Map map, harfbuzz.map.Map other)
{
  hb_map_update(map ? cast(hb_map_t*)map._cPtr(No.Dup) : null, other ? cast(const(hb_map_t)*)other._cPtr(No.Dup) : null);
}

/**
    Add the values of map to values.

    Params:
      map = A map
      values = A set
*/
void mapValues(harfbuzz.map.Map map, harfbuzz.set.Set values)
{
  hb_map_values(map ? cast(const(hb_map_t)*)map._cPtr(No.Dup) : null, values ? cast(hb_set_t*)values._cPtr(No.Dup) : null);
}

/**
    Fetches a list of all color layers for the specified glyph index in the specified
    face. The list returned will begin at the offset provided.

    Params:
      face = #hb_face_t to work upon
      glyph = The glyph index to query
      startOffset = offset of the first layer to retrieve
      layers = The array of layers found
    Returns: Total number of layers available for the glyph index queried
*/
uint otColorGlyphGetLayers(harfbuzz.face.Face face, harfbuzz.types.Codepoint glyph, uint startOffset, ref harfbuzz.types.OtColorLayer[] layers)
{
  uint _retval;
  uint _layerCount;
  _layerCount = cast(uint)layers.length;
  _retval = hb_ot_color_glyph_get_layers(face ? cast(hb_face_t*)face._cPtr(No.Dup) : null, glyph, startOffset, &_layerCount, layers.ptr);
  return _retval;
}

/**
    Tests where a face includes COLRv1 paint
    data for glyph.

    Params:
      face = #hb_face_t to work upon
      glyph = The glyph index to query
    Returns: `true` if data found, `false` otherwise
*/
harfbuzz.types.Bool otColorGlyphHasPaint(harfbuzz.face.Face face, harfbuzz.types.Codepoint glyph)
{
  harfbuzz.types.Bool _retval;
  _retval = hb_ot_color_glyph_has_paint(face ? cast(hb_face_t*)face._cPtr(No.Dup) : null, glyph);
  return _retval;
}

/**
    Fetches the PNG image for a glyph. This function takes a font object, not a face object,
    as input. To get an optimally sized PNG blob, the PPEM values must be set on the font
    object. If PPEM is unset, the blob returned will be the largest PNG available.
    
    If the glyph has no PNG image, the singleton empty blob is returned.

    Params:
      font = #hb_font_t to work upon
      glyph = a glyph index
    Returns: An #hb_blob_t containing the PNG image for the glyph, if available
*/
harfbuzz.blob.Blob otColorGlyphReferencePng(harfbuzz.font.Font font, harfbuzz.types.Codepoint glyph)
{
  hb_blob_t* _cretval;
  _cretval = hb_ot_color_glyph_reference_png(font ? cast(hb_font_t*)font._cPtr(No.Dup) : null, glyph);
  auto _retval = _cretval ? new harfbuzz.blob.Blob(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Fetches the SVG document for a glyph. The blob may be either plain text or gzip-encoded.
    
    If the glyph has no SVG document, the singleton empty blob is returned.

    Params:
      face = #hb_face_t to work upon
      glyph = a svg glyph index
    Returns: An #hb_blob_t containing the SVG document of the glyph, if available
*/
harfbuzz.blob.Blob otColorGlyphReferenceSvg(harfbuzz.face.Face face, harfbuzz.types.Codepoint glyph)
{
  hb_blob_t* _cretval;
  _cretval = hb_ot_color_glyph_reference_svg(face ? cast(hb_face_t*)face._cPtr(No.Dup) : null, glyph);
  auto _retval = _cretval ? new harfbuzz.blob.Blob(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Tests whether a face includes a `COLR` table
    with data according to COLRv0.

    Params:
      face = #hb_face_t to work upon
    Returns: `true` if data found, `false` otherwise
*/
harfbuzz.types.Bool otColorHasLayers(harfbuzz.face.Face face)
{
  harfbuzz.types.Bool _retval;
  _retval = hb_ot_color_has_layers(face ? cast(hb_face_t*)face._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Tests where a face includes a `COLR` table
    with data according to COLRv1.

    Params:
      face = #hb_face_t to work upon
    Returns: `true` if data found, `false` otherwise
*/
harfbuzz.types.Bool otColorHasPaint(harfbuzz.face.Face face)
{
  harfbuzz.types.Bool _retval;
  _retval = hb_ot_color_has_paint(face ? cast(hb_face_t*)face._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Tests whether a face includes a `CPAL` color-palette table.

    Params:
      face = #hb_face_t to work upon
    Returns: `true` if data found, `false` otherwise
*/
harfbuzz.types.Bool otColorHasPalettes(harfbuzz.face.Face face)
{
  harfbuzz.types.Bool _retval;
  _retval = hb_ot_color_has_palettes(face ? cast(hb_face_t*)face._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Tests whether a face has PNG glyph images (either in `CBDT` or `sbix` tables).

    Params:
      face = #hb_face_t to work upon
    Returns: `true` if data found, `false` otherwise
*/
harfbuzz.types.Bool otColorHasPng(harfbuzz.face.Face face)
{
  harfbuzz.types.Bool _retval;
  _retval = hb_ot_color_has_png(face ? cast(hb_face_t*)face._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Tests whether a face includes any `SVG` glyph images.

    Params:
      face = #hb_face_t to work upon.
    Returns: `true` if data found, `false` otherwise.
*/
harfbuzz.types.Bool otColorHasSvg(harfbuzz.face.Face face)
{
  harfbuzz.types.Bool _retval;
  _retval = hb_ot_color_has_svg(face ? cast(hb_face_t*)face._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Fetches the `name` table Name ID that provides display names for
    the specified color in a face's `CPAL` color palette.
    
    Display names can be generic (e.g., "Background") or specific
    (e.g., "Eye color").

    Params:
      face = #hb_face_t to work upon
      colorIndex = The index of the color
    Returns: the Name ID found for the color.
*/
harfbuzz.types.OtNameId otColorPaletteColorGetNameId(harfbuzz.face.Face face, uint colorIndex)
{
  harfbuzz.types.OtNameId _retval;
  _retval = hb_ot_color_palette_color_get_name_id(face ? cast(hb_face_t*)face._cPtr(No.Dup) : null, colorIndex);
  return _retval;
}

/**
    Fetches a list of the colors in a color palette.
    
    After calling this function, colors will be filled with the palette
    colors. If colors is NULL, the function will just return the number
    of total colors without storing any actual colors; this can be used
    for allocating a buffer of suitable size before calling
    [harfbuzz.global.otColorPaletteGetColors] a second time.
    
    The RGBA values in the palette are unpremultiplied. See the
    OpenType spec [CPAL](https://learn.microsoft.com/en-us/typography/opentype/spec/cpal)
    section for details.

    Params:
      face = #hb_face_t to work upon
      paletteIndex = the index of the color palette to query
      startOffset = offset of the first color to retrieve
      colors = The array of #hb_color_t records found
    Returns: the total number of colors in the palette
*/
uint otColorPaletteGetColors(harfbuzz.face.Face face, uint paletteIndex, uint startOffset, ref harfbuzz.types.Color[] colors)
{
  uint _retval;
  uint _colorCount;
  _colorCount = cast(uint)colors.length;
  _retval = hb_ot_color_palette_get_colors(face ? cast(hb_face_t*)face._cPtr(No.Dup) : null, paletteIndex, startOffset, &_colorCount, colors.ptr);
  return _retval;
}

/**
    Fetches the number of color palettes in a face.

    Params:
      face = #hb_face_t to work upon
    Returns: the number of palettes found
*/
uint otColorPaletteGetCount(harfbuzz.face.Face face)
{
  uint _retval;
  _retval = hb_ot_color_palette_get_count(face ? cast(hb_face_t*)face._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Fetches the flags defined for a color palette.

    Params:
      face = #hb_face_t to work upon
      paletteIndex = The index of the color palette
    Returns: the #hb_ot_color_palette_flags_t of the requested color palette
*/
harfbuzz.types.OtColorPaletteFlags otColorPaletteGetFlags(harfbuzz.face.Face face, uint paletteIndex)
{
  hb_ot_color_palette_flags_t _cretval;
  _cretval = hb_ot_color_palette_get_flags(face ? cast(hb_face_t*)face._cPtr(No.Dup) : null, paletteIndex);
  harfbuzz.types.OtColorPaletteFlags _retval = cast(harfbuzz.types.OtColorPaletteFlags)_cretval;
  return _retval;
}

/**
    Fetches the `name` table Name ID that provides display names for
    a `CPAL` color palette.
    
    Palette display names can be generic (e.g., "Default") or provide
    specific, themed names (e.g., "Spring", "Summer", "Fall", and "Winter").

    Params:
      face = #hb_face_t to work upon
      paletteIndex = The index of the color palette
    Returns: the Named ID found for the palette.
      If the requested palette has no name the result is #HB_OT_NAME_ID_INVALID.
*/
harfbuzz.types.OtNameId otColorPaletteGetNameId(harfbuzz.face.Face face, uint paletteIndex)
{
  harfbuzz.types.OtNameId _retval;
  _retval = hb_ot_color_palette_get_name_id(face ? cast(hb_face_t*)face._cPtr(No.Dup) : null, paletteIndex);
  return _retval;
}

/**
    Sets the font functions to use when working with font.

    Params:
      font = #hb_font_t to work upon
*/
void otFontSetFuncs(harfbuzz.font.Font font)
{
  hb_ot_font_set_funcs(font ? cast(hb_font_t*)font._cPtr(No.Dup) : null);
}

/**
    Fetches a list of the characters defined as having a variant under the specified
    "Character Variant" ("cvXX") feature tag.

    Params:
      face = #hb_face_t to work upon
      tableTag = table tag to query, "GSUB" or "GPOS".
      featureIndex = index of feature to query.
      startOffset = offset of the first character to retrieve
      characters = A buffer pointer.
                     The Unicode codepoints of the characters for which this feature provides
                      glyph variants.
    Returns: Number of total sample characters in the cvXX feature.
*/
uint otLayoutFeatureGetCharacters(harfbuzz.face.Face face, harfbuzz.types.Tag tableTag, uint featureIndex, uint startOffset, ref harfbuzz.types.Codepoint[] characters)
{
  uint _retval;
  uint _charCount;
  _charCount = cast(uint)characters.length;
  _retval = hb_ot_layout_feature_get_characters(face ? cast(hb_face_t*)face._cPtr(No.Dup) : null, tableTag, featureIndex, startOffset, &_charCount, characters.ptr);
  return _retval;
}

/**
    Fetches a list of all lookups enumerated for the specified feature, in
    the specified face's GSUB table or GPOS table. The list returned will
    begin at the offset provided.

    Params:
      face = #hb_face_t to work upon
      tableTag = #HB_OT_TAG_GSUB or #HB_OT_TAG_GPOS
      featureIndex = The index of the requested feature
      startOffset = offset of the first lookup to retrieve
      lookupIndexes = The array of lookup indexes found for the query
    Returns: Total number of lookups.
*/
uint otLayoutFeatureGetLookups(harfbuzz.face.Face face, harfbuzz.types.Tag tableTag, uint featureIndex, uint startOffset, ref uint[] lookupIndexes)
{
  uint _retval;
  uint _lookupCount;
  _lookupCount = cast(uint)lookupIndexes.length;
  _retval = hb_ot_layout_feature_get_lookups(face ? cast(hb_face_t*)face._cPtr(No.Dup) : null, tableTag, featureIndex, startOffset, &_lookupCount, lookupIndexes.ptr);
  return _retval;
}

/**
    Fetches name indices from feature parameters for "Stylistic Set" ('ssXX') or
    "Character Variant" ('cvXX') features.

    Params:
      face = #hb_face_t to work upon
      tableTag = table tag to query, "GSUB" or "GPOS".
      featureIndex = index of feature to query.
      labelId = The ‘name’ table name ID that specifies a string
                   for a user-interface label for this feature. (May be NULL.)
      tooltipId = The ‘name’ table name ID that specifies a string
                     that an application can use for tooltip text for this
                     feature. (May be NULL.)
      sampleId = The ‘name’ table name ID that specifies sample text
                    that illustrates the effect of this feature. (May be NULL.)
      numNamedParameters = Number of named parameters. (May be zero.)
      firstParamId = The first ‘name’ table name ID used to specify
                         strings for user-interface labels for the feature
                         parameters. (Must be zero if numParameters is zero.)
    Returns: `true` if data found, `false` otherwise
*/
harfbuzz.types.Bool otLayoutFeatureGetNameIds(harfbuzz.face.Face face, harfbuzz.types.Tag tableTag, uint featureIndex, out harfbuzz.types.OtNameId labelId, out harfbuzz.types.OtNameId tooltipId, out harfbuzz.types.OtNameId sampleId, out uint numNamedParameters, out harfbuzz.types.OtNameId firstParamId)
{
  harfbuzz.types.Bool _retval;
  _retval = hb_ot_layout_feature_get_name_ids(face ? cast(hb_face_t*)face._cPtr(No.Dup) : null, tableTag, featureIndex, cast(hb_ot_name_id_t*)&labelId, cast(hb_ot_name_id_t*)&tooltipId, cast(hb_ot_name_id_t*)&sampleId, cast(uint*)&numNamedParameters, cast(hb_ot_name_id_t*)&firstParamId);
  return _retval;
}

/**
    Fetches a list of all lookups enumerated for the specified feature, in
    the specified face's GSUB table or GPOS table, enabled at the specified
    variations index. The list returned will begin at the offset provided.

    Params:
      face = #hb_face_t to work upon
      tableTag = #HB_OT_TAG_GSUB or #HB_OT_TAG_GPOS
      featureIndex = The index of the feature to query
      variationsIndex = The index of the feature variation to query
      startOffset = offset of the first lookup to retrieve
      lookupIndexes = The array of lookups found for the query
    Returns: Total number of lookups.
*/
uint otLayoutFeatureWithVariationsGetLookups(harfbuzz.face.Face face, harfbuzz.types.Tag tableTag, uint featureIndex, uint variationsIndex, uint startOffset, ref uint[] lookupIndexes)
{
  uint _retval;
  uint _lookupCount;
  _lookupCount = cast(uint)lookupIndexes.length;
  _retval = hb_ot_layout_feature_with_variations_get_lookups(face ? cast(hb_face_t*)face._cPtr(No.Dup) : null, tableTag, featureIndex, variationsIndex, startOffset, &_lookupCount, lookupIndexes.ptr);
  return _retval;
}

/**
    Fetches a list of all attachment points for the specified glyph in the GDEF
    table of the face. The list returned will begin at the offset provided.
    
    Useful if the client program wishes to cache the list.

    Params:
      face = The #hb_face_t to work on
      glyph = The #hb_codepoint_t code point to query
      startOffset = offset of the first attachment point to retrieve
      pointArray = The array of attachment points found for the query
    Returns: Total number of attachment points for glyph.
*/
uint otLayoutGetAttachPoints(harfbuzz.face.Face face, harfbuzz.types.Codepoint glyph, uint startOffset, ref uint[] pointArray)
{
  uint _retval;
  uint _pointCount;
  _pointCount = cast(uint)pointArray.length;
  _retval = hb_ot_layout_get_attach_points(face ? cast(hb_face_t*)face._cPtr(No.Dup) : null, glyph, startOffset, &_pointCount, pointArray.ptr);
  return _retval;
}

/**
    Fetches a baseline value from the face.

    Params:
      font = a font
      baselineTag = a baseline tag
      direction = text direction.
      scriptTag = script tag.
      languageTag = language tag, currently unused.
      coord = baseline value if found.
    Returns: `true` if found baseline value in the font.
*/
harfbuzz.types.Bool otLayoutGetBaseline(harfbuzz.font.Font font, harfbuzz.types.OtLayoutBaselineTag baselineTag, harfbuzz.types.Direction direction, harfbuzz.types.Tag scriptTag, harfbuzz.types.Tag languageTag, out harfbuzz.types.Position coord)
{
  harfbuzz.types.Bool _retval;
  _retval = hb_ot_layout_get_baseline(font ? cast(hb_font_t*)font._cPtr(No.Dup) : null, baselineTag, direction, scriptTag, languageTag, cast(hb_position_t*)&coord);
  return _retval;
}

/**
    Fetches a baseline value from the face.
    
    This function is like [harfbuzz.global.otLayoutGetBaseline] but takes
    #hb_script_t and #hb_language_t instead of OpenType #hb_tag_t.

    Params:
      font = a font
      baselineTag = a baseline tag
      direction = text direction.
      script = script.
      language = language, currently unused.
      coord = baseline value if found.
    Returns: `true` if found baseline value in the font.
*/
harfbuzz.types.Bool otLayoutGetBaseline2(harfbuzz.font.Font font, harfbuzz.types.OtLayoutBaselineTag baselineTag, harfbuzz.types.Direction direction, harfbuzz.types.Script script, harfbuzz.types.Language language, out harfbuzz.types.Position coord)
{
  harfbuzz.types.Bool _retval;
  _retval = hb_ot_layout_get_baseline2(font ? cast(hb_font_t*)font._cPtr(No.Dup) : null, baselineTag, direction, script, language, cast(hb_position_t*)&coord);
  return _retval;
}

/**
    Fetches a baseline value from the face, and synthesizes
    it if the font does not have it.

    Params:
      font = a font
      baselineTag = a baseline tag
      direction = text direction.
      scriptTag = script tag.
      languageTag = language tag, currently unused.
      coord = baseline value if found.
*/
void otLayoutGetBaselineWithFallback(harfbuzz.font.Font font, harfbuzz.types.OtLayoutBaselineTag baselineTag, harfbuzz.types.Direction direction, harfbuzz.types.Tag scriptTag, harfbuzz.types.Tag languageTag, out harfbuzz.types.Position coord)
{
  hb_ot_layout_get_baseline_with_fallback(font ? cast(hb_font_t*)font._cPtr(No.Dup) : null, baselineTag, direction, scriptTag, languageTag, cast(hb_position_t*)&coord);
}

/**
    Fetches a baseline value from the face, and synthesizes
    it if the font does not have it.
    
    This function is like [harfbuzz.global.otLayoutGetBaselineWithFallback] but takes
    #hb_script_t and #hb_language_t instead of OpenType #hb_tag_t.

    Params:
      font = a font
      baselineTag = a baseline tag
      direction = text direction.
      script = script.
      language = language, currently unused.
      coord = baseline value if found.
*/
void otLayoutGetBaselineWithFallback2(harfbuzz.font.Font font, harfbuzz.types.OtLayoutBaselineTag baselineTag, harfbuzz.types.Direction direction, harfbuzz.types.Script script, harfbuzz.types.Language language, out harfbuzz.types.Position coord)
{
  hb_ot_layout_get_baseline_with_fallback2(font ? cast(hb_font_t*)font._cPtr(No.Dup) : null, baselineTag, direction, script, language, cast(hb_position_t*)&coord);
}

/**
    Fetches script/language-specific font extents.  These values are
    looked up in the `BASE` table's `MinMax` records.
    
    If no such extents are found, the default extents for the font are
    fetched. As such, the return value of this function can for the
    most part be ignored.  Note that the per-script/language extents
    do not have a line-gap value, and the line-gap is set to zero in
    that case.

    Params:
      font = a font
      direction = text direction.
      scriptTag = script tag.
      languageTag = language tag.
      extents = font extents if found.
    Returns: `true` if found script/language-specific font extents.
*/
harfbuzz.types.Bool otLayoutGetFontExtents(harfbuzz.font.Font font, harfbuzz.types.Direction direction, harfbuzz.types.Tag scriptTag, harfbuzz.types.Tag languageTag, out harfbuzz.types.FontExtents extents)
{
  harfbuzz.types.Bool _retval;
  _retval = hb_ot_layout_get_font_extents(font ? cast(hb_font_t*)font._cPtr(No.Dup) : null, direction, scriptTag, languageTag, &extents);
  return _retval;
}

/**
    Fetches script/language-specific font extents.  These values are
    looked up in the `BASE` table's `MinMax` records.
    
    If no such extents are found, the default extents for the font are
    fetched. As such, the return value of this function can for the
    most part be ignored.  Note that the per-script/language extents
    do not have a line-gap value, and the line-gap is set to zero in
    that case.
    
    This function is like [harfbuzz.global.otLayoutGetFontExtents] but takes
    #hb_script_t and #hb_language_t instead of OpenType #hb_tag_t.

    Params:
      font = a font
      direction = text direction.
      script = script.
      language = language.
      extents = font extents if found.
    Returns: `true` if found script/language-specific font extents.
*/
harfbuzz.types.Bool otLayoutGetFontExtents2(harfbuzz.font.Font font, harfbuzz.types.Direction direction, harfbuzz.types.Script script, harfbuzz.types.Language language, out harfbuzz.types.FontExtents extents)
{
  harfbuzz.types.Bool _retval;
  _retval = hb_ot_layout_get_font_extents2(font ? cast(hb_font_t*)font._cPtr(No.Dup) : null, direction, script, language, &extents);
  return _retval;
}

/**
    Fetches the GDEF class of the requested glyph in the specified face.

    Params:
      face = The #hb_face_t to work on
      glyph = The #hb_codepoint_t code point to query
    Returns: The #hb_ot_layout_glyph_class_t glyph class of the given code
      point in the GDEF table of the face.
*/
harfbuzz.types.OtLayoutGlyphClass otLayoutGetGlyphClass(harfbuzz.face.Face face, harfbuzz.types.Codepoint glyph)
{
  hb_ot_layout_glyph_class_t _cretval;
  _cretval = hb_ot_layout_get_glyph_class(face ? cast(hb_face_t*)face._cPtr(No.Dup) : null, glyph);
  harfbuzz.types.OtLayoutGlyphClass _retval = cast(harfbuzz.types.OtLayoutGlyphClass)_cretval;
  return _retval;
}

/**
    Fetches the dominant horizontal baseline tag used by script.

    Params:
      script = a script tag.
    Returns: dominant baseline tag for the script.
*/
harfbuzz.types.OtLayoutBaselineTag otLayoutGetHorizontalBaselineTagForScript(harfbuzz.types.Script script)
{
  hb_ot_layout_baseline_tag_t _cretval;
  _cretval = hb_ot_layout_get_horizontal_baseline_tag_for_script(script);
  harfbuzz.types.OtLayoutBaselineTag _retval = cast(harfbuzz.types.OtLayoutBaselineTag)_cretval;
  return _retval;
}

/**
    Fetches a list of the caret positions defined for a ligature glyph in the GDEF
    table of the font. The list returned will begin at the offset provided.
    
    Note that a ligature that is formed from n characters will have n-1
    caret positions. The first character is not represented in the array,
    since its caret position is the glyph position.
    
    The positions returned by this function are 'unshaped', and will have to
    be fixed up for kerning that may be applied to the ligature glyph.

    Params:
      font = The #hb_font_t to work on
      direction = The #hb_direction_t text direction to use
      glyph = The #hb_codepoint_t code point to query
      startOffset = offset of the first caret position to retrieve
      caretArray = The array of caret positions found for the query
    Returns: Total number of ligature caret positions for glyph.
*/
uint otLayoutGetLigatureCarets(harfbuzz.font.Font font, harfbuzz.types.Direction direction, harfbuzz.types.Codepoint glyph, uint startOffset, ref harfbuzz.types.Position[] caretArray)
{
  uint _retval;
  uint _caretCount;
  _caretCount = cast(uint)caretArray.length;
  _retval = hb_ot_layout_get_ligature_carets(font ? cast(hb_font_t*)font._cPtr(No.Dup) : null, direction, glyph, startOffset, &_caretCount, caretArray.ptr);
  return _retval;
}

/**
    Fetches optical-size feature data (i.e., the `size` feature from GPOS). Note that
    the subfamily_id and the subfamily name string (accessible via the subfamily_name_id)
    as used here are defined as pertaining only to fonts within a font family that differ
    specifically in their respective size ranges; other ways to differentiate fonts within
    a subfamily are not covered by the `size` feature.
    
    For more information on this distinction, see the [`size` feature documentation](
    https://docs.microsoft.com/en-us/typography/opentype/spec/features_pt#tag-size).

    Params:
      face = #hb_face_t to work upon
      designSize = The design size of the face
      subfamilyId = The identifier of the face within the font subfamily
      subfamilyNameId = The ‘name’ table name ID of the face within the font subfamily
      rangeStart = The minimum size of the recommended size range for the face
      rangeEnd = The maximum size of the recommended size range for the face
    Returns: `true` if data found, `false` otherwise
*/
harfbuzz.types.Bool otLayoutGetSizeParams(harfbuzz.face.Face face, out uint designSize, out uint subfamilyId, out harfbuzz.types.OtNameId subfamilyNameId, out uint rangeStart, out uint rangeEnd)
{
  harfbuzz.types.Bool _retval;
  _retval = hb_ot_layout_get_size_params(face ? cast(hb_face_t*)face._cPtr(No.Dup) : null, cast(uint*)&designSize, cast(uint*)&subfamilyId, cast(hb_ot_name_id_t*)&subfamilyNameId, cast(uint*)&rangeStart, cast(uint*)&rangeEnd);
  return _retval;
}

/**
    Tests whether a face has any glyph classes defined in its GDEF table.

    Params:
      face = #hb_face_t to work upon
    Returns: `true` if data found, `false` otherwise
*/
harfbuzz.types.Bool otLayoutHasGlyphClasses(harfbuzz.face.Face face)
{
  harfbuzz.types.Bool _retval;
  _retval = hb_ot_layout_has_glyph_classes(face ? cast(hb_face_t*)face._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Tests whether the specified face includes any GPOS positioning.

    Params:
      face = #hb_face_t to work upon
    Returns: `true` if the face has GPOS data, `false` otherwise
*/
harfbuzz.types.Bool otLayoutHasPositioning(harfbuzz.face.Face face)
{
  harfbuzz.types.Bool _retval;
  _retval = hb_ot_layout_has_positioning(face ? cast(hb_face_t*)face._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Tests whether the specified face includes any GSUB substitutions.

    Params:
      face = #hb_face_t to work upon
    Returns: `true` if data found, `false` otherwise
*/
harfbuzz.types.Bool otLayoutHasSubstitution(harfbuzz.face.Face face)
{
  harfbuzz.types.Bool _retval;
  _retval = hb_ot_layout_has_substitution(face ? cast(hb_face_t*)face._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Fetches the index of a given feature tag in the specified face's GSUB table
    or GPOS table, underneath the specified script and language.

    Params:
      face = #hb_face_t to work upon
      tableTag = #HB_OT_TAG_GSUB or #HB_OT_TAG_GPOS
      scriptIndex = The index of the requested script tag
      languageIndex = The index of the requested language tag
      featureTag = #hb_tag_t of the feature tag requested
      featureIndex = The index of the requested feature
    Returns: `true` if the feature is found, `false` otherwise
*/
harfbuzz.types.Bool otLayoutLanguageFindFeature(harfbuzz.face.Face face, harfbuzz.types.Tag tableTag, uint scriptIndex, uint languageIndex, harfbuzz.types.Tag featureTag, out uint featureIndex)
{
  harfbuzz.types.Bool _retval;
  _retval = hb_ot_layout_language_find_feature(face ? cast(hb_face_t*)face._cPtr(No.Dup) : null, tableTag, scriptIndex, languageIndex, featureTag, cast(uint*)&featureIndex);
  return _retval;
}

/**
    Fetches a list of all features in the specified face's GSUB table
    or GPOS table, underneath the specified script and language. The list
    returned will begin at the offset provided.

    Params:
      face = #hb_face_t to work upon
      tableTag = #HB_OT_TAG_GSUB or #HB_OT_TAG_GPOS
      scriptIndex = The index of the requested script tag
      languageIndex = The index of the requested language tag
      startOffset = offset of the first feature tag to retrieve
      featureIndexes = The array of feature indexes found for the query
    Returns: Total number of features.
*/
uint otLayoutLanguageGetFeatureIndexes(harfbuzz.face.Face face, harfbuzz.types.Tag tableTag, uint scriptIndex, uint languageIndex, uint startOffset, ref uint[] featureIndexes)
{
  uint _retval;
  uint _featureCount;
  _featureCount = cast(uint)featureIndexes.length;
  _retval = hb_ot_layout_language_get_feature_indexes(face ? cast(hb_face_t*)face._cPtr(No.Dup) : null, tableTag, scriptIndex, languageIndex, startOffset, &_featureCount, featureIndexes.ptr);
  return _retval;
}

/**
    Fetches a list of all features in the specified face's GSUB table
    or GPOS table, underneath the specified script and language. The list
    returned will begin at the offset provided.

    Params:
      face = #hb_face_t to work upon
      tableTag = #HB_OT_TAG_GSUB or #HB_OT_TAG_GPOS
      scriptIndex = The index of the requested script tag
      languageIndex = The index of the requested language tag
      startOffset = offset of the first feature tag to retrieve
      featureTags = The array of #hb_tag_t feature tags found for the query
    Returns: Total number of feature tags.
*/
uint otLayoutLanguageGetFeatureTags(harfbuzz.face.Face face, harfbuzz.types.Tag tableTag, uint scriptIndex, uint languageIndex, uint startOffset, ref harfbuzz.types.Tag[] featureTags)
{
  uint _retval;
  uint _featureCount;
  _featureCount = cast(uint)featureTags.length;
  _retval = hb_ot_layout_language_get_feature_tags(face ? cast(hb_face_t*)face._cPtr(No.Dup) : null, tableTag, scriptIndex, languageIndex, startOffset, &_featureCount, featureTags.ptr);
  return _retval;
}

/**
    Fetches the tag of a requested feature index in the given face's GSUB or GPOS table,
    underneath the specified script and language.

    Params:
      face = #hb_face_t to work upon
      tableTag = #HB_OT_TAG_GSUB or #HB_OT_TAG_GPOS
      scriptIndex = The index of the requested script tag
      languageIndex = The index of the requested language tag
      featureIndex = The index of the requested feature
      featureTag = The #hb_tag_t of the requested feature
    Returns: `true` if the feature is found, `false` otherwise
*/
harfbuzz.types.Bool otLayoutLanguageGetRequiredFeature(harfbuzz.face.Face face, harfbuzz.types.Tag tableTag, uint scriptIndex, uint languageIndex, out uint featureIndex, out harfbuzz.types.Tag featureTag)
{
  harfbuzz.types.Bool _retval;
  _retval = hb_ot_layout_language_get_required_feature(face ? cast(hb_face_t*)face._cPtr(No.Dup) : null, tableTag, scriptIndex, languageIndex, cast(uint*)&featureIndex, cast(hb_tag_t*)&featureTag);
  return _retval;
}

/**
    Fetches the index of a requested feature in the given face's GSUB or GPOS table,
    underneath the specified script and language.

    Params:
      face = #hb_face_t to work upon
      tableTag = #HB_OT_TAG_GSUB or #HB_OT_TAG_GPOS
      scriptIndex = The index of the requested script tag
      languageIndex = The index of the requested language tag
      featureIndex = The index of the requested feature
    Returns: `true` if the feature is found, `false` otherwise
*/
harfbuzz.types.Bool otLayoutLanguageGetRequiredFeatureIndex(harfbuzz.face.Face face, harfbuzz.types.Tag tableTag, uint scriptIndex, uint languageIndex, out uint featureIndex)
{
  harfbuzz.types.Bool _retval;
  _retval = hb_ot_layout_language_get_required_feature_index(face ? cast(hb_face_t*)face._cPtr(No.Dup) : null, tableTag, scriptIndex, languageIndex, cast(uint*)&featureIndex);
  return _retval;
}

/**
    Fetches alternates of a glyph from a given GSUB lookup index.

    Params:
      face = a face.
      lookupIndex = index of the feature lookup to query.
      glyph = a glyph id.
      startOffset = starting offset.
      alternateGlyphs = A glyphs buffer.
                           Alternate glyphs associated with the glyph id.
    Returns: Total number of alternates found in the specific lookup index for the given glyph id.
*/
uint otLayoutLookupGetGlyphAlternates(harfbuzz.face.Face face, uint lookupIndex, harfbuzz.types.Codepoint glyph, uint startOffset, ref harfbuzz.types.Codepoint[] alternateGlyphs)
{
  uint _retval;
  uint _alternateCount;
  _alternateCount = cast(uint)alternateGlyphs.length;
  _retval = hb_ot_layout_lookup_get_glyph_alternates(face ? cast(hb_face_t*)face._cPtr(No.Dup) : null, lookupIndex, glyph, startOffset, &_alternateCount, alternateGlyphs.ptr);
  return _retval;
}

/**
    Fetches the optical bound of a glyph positioned at the margin of text.
    The direction identifies which edge of the glyph to query.

    Params:
      font = a font.
      lookupIndex = index of the feature lookup to query.
      direction = edge of the glyph to query.
      glyph = a glyph id.
    Returns: Adjustment value. Negative values mean the glyph will stick out of the margin.
*/
harfbuzz.types.Position otLayoutLookupGetOpticalBound(harfbuzz.font.Font font, uint lookupIndex, harfbuzz.types.Direction direction, harfbuzz.types.Codepoint glyph)
{
  harfbuzz.types.Position _retval;
  _retval = hb_ot_layout_lookup_get_optical_bound(font ? cast(hb_font_t*)font._cPtr(No.Dup) : null, lookupIndex, direction, glyph);
  return _retval;
}

/**
    Tests whether a specified lookup in the specified face would
    trigger a substitution on the given glyph sequence.

    Params:
      face = #hb_face_t to work upon
      lookupIndex = The index of the lookup to query
      glyphs = The sequence of glyphs to query for substitution
      zeroContext = #hb_bool_t indicating whether pre-/post-context are disallowed
        in substitutions
    Returns: `true` if a substitution would be triggered, `false` otherwise
*/
harfbuzz.types.Bool otLayoutLookupWouldSubstitute(harfbuzz.face.Face face, uint lookupIndex, harfbuzz.types.Codepoint[] glyphs, harfbuzz.types.Bool zeroContext)
{
  harfbuzz.types.Bool _retval;
  uint _glyphsLength;
  if (glyphs)
    _glyphsLength = cast(uint)glyphs.length;

  auto _glyphs = cast(const(hb_codepoint_t)*)glyphs.ptr;
  _retval = hb_ot_layout_lookup_would_substitute(face ? cast(hb_face_t*)face._cPtr(No.Dup) : null, lookupIndex, _glyphs, _glyphsLength, zeroContext);
  return _retval;
}

/**
    Fetches the index of a given language tag in the specified face's GSUB table
    or GPOS table, underneath the specified script tag.

    Params:
      face = #hb_face_t to work upon
      tableTag = #HB_OT_TAG_GSUB or #HB_OT_TAG_GPOS
      scriptIndex = The index of the requested script tag
      languageTag = The #hb_tag_t of the requested language
      languageIndex = The index of the requested language
    Returns: `true` if the language tag is found, `false` otherwise
*/
harfbuzz.types.Bool otLayoutScriptFindLanguage(harfbuzz.face.Face face, harfbuzz.types.Tag tableTag, uint scriptIndex, harfbuzz.types.Tag languageTag, out uint languageIndex)
{
  harfbuzz.types.Bool _retval;
  _retval = hb_ot_layout_script_find_language(face ? cast(hb_face_t*)face._cPtr(No.Dup) : null, tableTag, scriptIndex, languageTag, cast(uint*)&languageIndex);
  return _retval;
}

/**
    Fetches a list of language tags in the given face's GSUB or GPOS table, underneath
    the specified script index. The list returned will begin at the offset provided.

    Params:
      face = #hb_face_t to work upon
      tableTag = #HB_OT_TAG_GSUB or #HB_OT_TAG_GPOS
      scriptIndex = The index of the requested script tag
      startOffset = offset of the first language tag to retrieve
      languageTags = Array of language tags found in the table
    Returns: Total number of language tags.
*/
uint otLayoutScriptGetLanguageTags(harfbuzz.face.Face face, harfbuzz.types.Tag tableTag, uint scriptIndex, uint startOffset, ref harfbuzz.types.Tag[] languageTags)
{
  uint _retval;
  uint _languageCount;
  _languageCount = cast(uint)languageTags.length;
  _retval = hb_ot_layout_script_get_language_tags(face ? cast(hb_face_t*)face._cPtr(No.Dup) : null, tableTag, scriptIndex, startOffset, &_languageCount, languageTags.ptr);
  return _retval;
}

/**
    Fetches the index of the first language tag fom language_tags that is present
    in the specified face's GSUB or GPOS table, underneath the specified script
    index.
    
    If none of the given language tags is found, `false` is returned and
    language_index is set to the default language index.

    Params:
      face = #hb_face_t to work upon
      tableTag = #HB_OT_TAG_GSUB or #HB_OT_TAG_GPOS
      scriptIndex = The index of the requested script tag
      languageTags = The array of language tags
      languageIndex = The index of the requested language
    Returns: `true` if one of the given language tags is found, `false` otherwise
*/
harfbuzz.types.Bool otLayoutScriptSelectLanguage(harfbuzz.face.Face face, harfbuzz.types.Tag tableTag, uint scriptIndex, harfbuzz.types.Tag[] languageTags, out uint languageIndex)
{
  harfbuzz.types.Bool _retval;
  uint _languageCount;
  if (languageTags)
    _languageCount = cast(uint)languageTags.length;

  auto _languageTags = cast(const(hb_tag_t)*)languageTags.ptr;
  _retval = hb_ot_layout_script_select_language(face ? cast(hb_face_t*)face._cPtr(No.Dup) : null, tableTag, scriptIndex, _languageCount, _languageTags, cast(uint*)&languageIndex);
  return _retval;
}

/**
    Fetches the index of the first language tag fom language_tags that is present
    in the specified face's GSUB or GPOS table, underneath the specified script
    index.
    
    If none of the given language tags is found, `false` is returned and
    language_index is set to #HB_OT_LAYOUT_DEFAULT_LANGUAGE_INDEX and
    chosen_language is set to #HB_TAG_NONE.

    Params:
      face = #hb_face_t to work upon
      tableTag = #HB_OT_TAG_GSUB or #HB_OT_TAG_GPOS
      scriptIndex = The index of the requested script tag
      languageTags = The array of language tags
      languageIndex = The index of the chosen language
      chosenLanguage = #hb_tag_t of the chosen language
    Returns: `true` if one of the given language tags is found, `false` otherwise
*/
harfbuzz.types.Bool otLayoutScriptSelectLanguage2(harfbuzz.face.Face face, harfbuzz.types.Tag tableTag, uint scriptIndex, harfbuzz.types.Tag[] languageTags, out uint languageIndex, out harfbuzz.types.Tag chosenLanguage)
{
  harfbuzz.types.Bool _retval;
  uint _languageCount;
  if (languageTags)
    _languageCount = cast(uint)languageTags.length;

  auto _languageTags = cast(const(hb_tag_t)*)languageTags.ptr;
  _retval = hb_ot_layout_script_select_language2(face ? cast(hb_face_t*)face._cPtr(No.Dup) : null, tableTag, scriptIndex, _languageCount, _languageTags, cast(uint*)&languageIndex, cast(hb_tag_t*)&chosenLanguage);
  return _retval;
}

/**
    Fetches a list of feature variations in the specified face's GSUB table
    or GPOS table, at the specified variation coordinates.

    Params:
      face = #hb_face_t to work upon
      tableTag = #HB_OT_TAG_GSUB or #HB_OT_TAG_GPOS
      coords = The variation coordinates to query
      variationsIndex = The array of feature variations found for the query
    Returns: `true` if feature variations were found, `false` otherwise.
*/
harfbuzz.types.Bool otLayoutTableFindFeatureVariations(harfbuzz.face.Face face, harfbuzz.types.Tag tableTag, int[] coords, out uint variationsIndex)
{
  harfbuzz.types.Bool _retval;
  uint _numCoords;
  if (coords)
    _numCoords = cast(uint)coords.length;

  auto _coords = cast(const(int)*)coords.ptr;
  _retval = hb_ot_layout_table_find_feature_variations(face ? cast(hb_face_t*)face._cPtr(No.Dup) : null, tableTag, _coords, _numCoords, cast(uint*)&variationsIndex);
  return _retval;
}

/**
    Fetches the index if a given script tag in the specified face's GSUB table
    or GPOS table.

    Params:
      face = #hb_face_t to work upon
      tableTag = #HB_OT_TAG_GSUB or #HB_OT_TAG_GPOS
      scriptTag = #hb_tag_t of the script tag requested
      scriptIndex = The index of the requested script tag
    Returns: `true` if the script is found, `false` otherwise
*/
harfbuzz.types.Bool otLayoutTableFindScript(harfbuzz.face.Face face, harfbuzz.types.Tag tableTag, harfbuzz.types.Tag scriptTag, out uint scriptIndex)
{
  harfbuzz.types.Bool _retval;
  _retval = hb_ot_layout_table_find_script(face ? cast(hb_face_t*)face._cPtr(No.Dup) : null, tableTag, scriptTag, cast(uint*)&scriptIndex);
  return _retval;
}

/**
    Fetches a list of all feature tags in the given face's GSUB or GPOS table.
    Note that there might be duplicate feature tags, belonging to different
    script/language-system pairs of the table.

    Params:
      face = #hb_face_t to work upon
      tableTag = #HB_OT_TAG_GSUB or #HB_OT_TAG_GPOS
      startOffset = offset of the first feature tag to retrieve
      featureTags = Array of feature tags found in the table
    Returns: Total number of feature tags.
*/
uint otLayoutTableGetFeatureTags(harfbuzz.face.Face face, harfbuzz.types.Tag tableTag, uint startOffset, ref harfbuzz.types.Tag[] featureTags)
{
  uint _retval;
  uint _featureCount;
  _featureCount = cast(uint)featureTags.length;
  _retval = hb_ot_layout_table_get_feature_tags(face ? cast(hb_face_t*)face._cPtr(No.Dup) : null, tableTag, startOffset, &_featureCount, featureTags.ptr);
  return _retval;
}

/**
    Fetches the total number of lookups enumerated in the specified
    face's GSUB table or GPOS table.

    Params:
      face = #hb_face_t to work upon
      tableTag = #HB_OT_TAG_GSUB or #HB_OT_TAG_GPOS
    Returns: Total number of lookups.
*/
uint otLayoutTableGetLookupCount(harfbuzz.face.Face face, harfbuzz.types.Tag tableTag)
{
  uint _retval;
  _retval = hb_ot_layout_table_get_lookup_count(face ? cast(hb_face_t*)face._cPtr(No.Dup) : null, tableTag);
  return _retval;
}

/**
    Fetches a list of all scripts enumerated in the specified face's GSUB table
    or GPOS table. The list returned will begin at the offset provided.

    Params:
      face = #hb_face_t to work upon
      tableTag = #HB_OT_TAG_GSUB or #HB_OT_TAG_GPOS
      startOffset = offset of the first script tag to retrieve
      scriptTags = The array of #hb_tag_t script tags found for the query
    Returns: Total number of script tags.
*/
uint otLayoutTableGetScriptTags(harfbuzz.face.Face face, harfbuzz.types.Tag tableTag, uint startOffset, ref harfbuzz.types.Tag[] scriptTags)
{
  uint _retval;
  uint _scriptCount;
  _scriptCount = cast(uint)scriptTags.length;
  _retval = hb_ot_layout_table_get_script_tags(face ? cast(hb_face_t*)face._cPtr(No.Dup) : null, tableTag, startOffset, &_scriptCount, scriptTags.ptr);
  return _retval;
}

/**
    Selects an OpenType script for table_tag from the script_tags array.
    
    If the table does not have any of the requested scripts, then `DFLT`,
    `dflt`, and `latn` tags are tried in that order. If the table still does not
    have any of these scripts, script_index is set to
    #HB_OT_LAYOUT_NO_SCRIPT_INDEX and chosen_script is set to #HB_TAG_NONE.

    Params:
      face = #hb_face_t to work upon
      tableTag = #HB_OT_TAG_GSUB or #HB_OT_TAG_GPOS
      scriptTags = Array of #hb_tag_t script tags
      scriptIndex = The index of the requested script
      chosenScript = #hb_tag_t of the requested script
    Returns: `true` if one of the requested scripts is selected, `false` if a fallback
      script is selected or if no scripts are selected.
*/
harfbuzz.types.Bool otLayoutTableSelectScript(harfbuzz.face.Face face, harfbuzz.types.Tag tableTag, harfbuzz.types.Tag[] scriptTags, out uint scriptIndex, out harfbuzz.types.Tag chosenScript)
{
  harfbuzz.types.Bool _retval;
  uint _scriptCount;
  if (scriptTags)
    _scriptCount = cast(uint)scriptTags.length;

  auto _scriptTags = cast(const(hb_tag_t)*)scriptTags.ptr;
  _retval = hb_ot_layout_table_select_script(face ? cast(hb_face_t*)face._cPtr(No.Dup) : null, tableTag, _scriptCount, _scriptTags, cast(uint*)&scriptIndex, cast(hb_tag_t*)&chosenScript);
  return _retval;
}

/**
    Fetches the specified math constant. For most constants, the value returned
    is an #hb_position_t.
    
    However, if the requested constant is #HB_OT_MATH_CONSTANT_SCRIPT_PERCENT_SCALE_DOWN,
    #HB_OT_MATH_CONSTANT_SCRIPT_SCRIPT_PERCENT_SCALE_DOWN or
    #HB_OT_MATH_CONSTANT_RADICAL_DEGREE_BOTTOM_RAISE_PERCENT, then the return value is
    an integer between 0 and 100 representing that percentage.

    Params:
      font = #hb_font_t to work upon
      constant = #hb_ot_math_constant_t the constant to retrieve
    Returns: the requested constant or zero
*/
harfbuzz.types.Position otMathGetConstant(harfbuzz.font.Font font, harfbuzz.types.OtMathConstant constant)
{
  harfbuzz.types.Position _retval;
  _retval = hb_ot_math_get_constant(font ? cast(hb_font_t*)font._cPtr(No.Dup) : null, constant);
  return _retval;
}

/**
    Fetches the GlyphAssembly for the specified font, glyph index, and direction.
    Returned are a list of #hb_ot_math_glyph_part_t glyph parts that can be
    used to draw the glyph and an italics-correction value (if one is defined
    in the font).
    
    <note>The direction parameter is only used to select between horizontal
    or vertical directions for the construction. Even though all #hb_direction_t
    values are accepted, only the result of #HB_DIRECTION_IS_HORIZONTAL is
    considered.</note>

    Params:
      font = #hb_font_t to work upon
      glyph = The index of the glyph to stretch
      direction = direction of the stretching (horizontal or vertical)
      startOffset = offset of the first glyph part to retrieve
      parts = the glyph parts returned
      italicsCorrection = italics correction of the glyph assembly
    Returns: the total number of parts in the glyph assembly
*/
uint otMathGetGlyphAssembly(harfbuzz.font.Font font, harfbuzz.types.Codepoint glyph, harfbuzz.types.Direction direction, uint startOffset, ref harfbuzz.types.OtMathGlyphPart[] parts, out harfbuzz.types.Position italicsCorrection)
{
  uint _retval;
  uint _partsCount;
  _partsCount = cast(uint)parts.length;
  _retval = hb_ot_math_get_glyph_assembly(font ? cast(hb_font_t*)font._cPtr(No.Dup) : null, glyph, direction, startOffset, &_partsCount, parts.ptr, cast(hb_position_t*)&italicsCorrection);
  return _retval;
}

/**
    Fetches an italics-correction value (if one exists) for the specified
    glyph index.

    Params:
      font = #hb_font_t to work upon
      glyph = The glyph index from which to retrieve the value
    Returns: the italics correction of the glyph or zero
*/
harfbuzz.types.Position otMathGetGlyphItalicsCorrection(harfbuzz.font.Font font, harfbuzz.types.Codepoint glyph)
{
  harfbuzz.types.Position _retval;
  _retval = hb_ot_math_get_glyph_italics_correction(font ? cast(hb_font_t*)font._cPtr(No.Dup) : null, glyph);
  return _retval;
}

/**
    Fetches the math kerning (cut-ins) value for the specified font, glyph index, and
    kern.
    
    If the MathKern table is found, the function examines it to find a height
    value that is greater or equal to correction_height. If such a height
    value is found, corresponding kerning value from the table is returned. If
    no such height value is found, the last kerning value is returned.

    Params:
      font = #hb_font_t to work upon
      glyph = The glyph index from which to retrieve the value
      kern = The #hb_ot_math_kern_t from which to retrieve the value
      correctionHeight = the correction height to use to determine the kerning.
    Returns: requested kerning value or zero
*/
harfbuzz.types.Position otMathGetGlyphKerning(harfbuzz.font.Font font, harfbuzz.types.Codepoint glyph, harfbuzz.types.OtMathKern kern, harfbuzz.types.Position correctionHeight)
{
  harfbuzz.types.Position _retval;
  _retval = hb_ot_math_get_glyph_kerning(font ? cast(hb_font_t*)font._cPtr(No.Dup) : null, glyph, kern, correctionHeight);
  return _retval;
}

/**
    Fetches the raw MathKern (cut-in) data for the specified font, glyph index,
    and kern. The corresponding list of kern values and correction heights is
    returned as a list of #hb_ot_math_kern_entry_t structs.
    
    See also #hb_ot_math_get_glyph_kerning, which handles selecting the
    appropriate kern value for a given correction height.
    
    <note>For a glyph with n defined kern values (where n > 0), there are only
    n−1 defined correction heights, as each correction height defines a boundary
    past which the next kern value should be selected. Therefore, only the
    #hb_ot_math_kern_entry_t.kern_value of the uppermost #hb_ot_math_kern_entry_t
    actually comes from the font; its corresponding
    #hb_ot_math_kern_entry_t.max_correction_height is always set to
    <code>INT32_MAX</code>.</note>

    Params:
      font = #hb_font_t to work upon
      glyph = The glyph index from which to retrieve the kernings
      kern = The #hb_ot_math_kern_t from which to retrieve the kernings
      startOffset = offset of the first kern entry to retrieve
      kernEntries = array of kern entries returned
    Returns: the total number of kern values available or zero
*/
uint otMathGetGlyphKernings(harfbuzz.font.Font font, harfbuzz.types.Codepoint glyph, harfbuzz.types.OtMathKern kern, uint startOffset, ref harfbuzz.types.OtMathKernEntry[] kernEntries)
{
  uint _retval;
  uint _entriesCount;
  _entriesCount = cast(uint)kernEntries.length;
  _retval = hb_ot_math_get_glyph_kernings(font ? cast(hb_font_t*)font._cPtr(No.Dup) : null, glyph, kern, startOffset, &_entriesCount, kernEntries.ptr);
  return _retval;
}

/**
    Fetches a top-accent-attachment value (if one exists) for the specified
    glyph index.
    
    For any glyph that does not have a top-accent-attachment value - that is,
    a glyph not covered by the `MathTopAccentAttachment` table (or, when
    font has no `MathTopAccentAttachment` table or no `MATH` table, any
    glyph) - the function synthesizes a value, returning the position at
    one-half the glyph's advance width.

    Params:
      font = #hb_font_t to work upon
      glyph = The glyph index from which to retrieve the value
    Returns: the top accent attachment of the glyph or 0.5 * the advance
                    width of glyph
*/
harfbuzz.types.Position otMathGetGlyphTopAccentAttachment(harfbuzz.font.Font font, harfbuzz.types.Codepoint glyph)
{
  harfbuzz.types.Position _retval;
  _retval = hb_ot_math_get_glyph_top_accent_attachment(font ? cast(hb_font_t*)font._cPtr(No.Dup) : null, glyph);
  return _retval;
}

/**
    Fetches the MathGlyphConstruction for the specified font, glyph index, and
    direction. The corresponding list of size variants is returned as a list of
    #hb_ot_math_glyph_variant_t structs.
    
    <note>The direction parameter is only used to select between horizontal
    or vertical directions for the construction. Even though all #hb_direction_t
    values are accepted, only the result of #HB_DIRECTION_IS_HORIZONTAL is
    considered.</note>

    Params:
      font = #hb_font_t to work upon
      glyph = The index of the glyph to stretch
      direction = The direction of the stretching (horizontal or vertical)
      startOffset = offset of the first variant to retrieve
      variants = array of variants returned
    Returns: the total number of size variants available or zero
*/
uint otMathGetGlyphVariants(harfbuzz.font.Font font, harfbuzz.types.Codepoint glyph, harfbuzz.types.Direction direction, uint startOffset, ref harfbuzz.types.OtMathGlyphVariant[] variants)
{
  uint _retval;
  uint _variantsCount;
  _variantsCount = cast(uint)variants.length;
  _retval = hb_ot_math_get_glyph_variants(font ? cast(hb_font_t*)font._cPtr(No.Dup) : null, glyph, direction, startOffset, &_variantsCount, variants.ptr);
  return _retval;
}

/**
    Fetches the MathVariants table for the specified font and returns the
    minimum overlap of connecting glyphs that are required to draw a glyph
    assembly in the specified direction.
    
    <note>The direction parameter is only used to select between horizontal
    or vertical directions for the construction. Even though all #hb_direction_t
    values are accepted, only the result of #HB_DIRECTION_IS_HORIZONTAL is
    considered.</note>

    Params:
      font = #hb_font_t to work upon
      direction = direction of the stretching (horizontal or vertical)
    Returns: requested minimum connector overlap or zero
*/
harfbuzz.types.Position otMathGetMinConnectorOverlap(harfbuzz.font.Font font, harfbuzz.types.Direction direction)
{
  harfbuzz.types.Position _retval;
  _retval = hb_ot_math_get_min_connector_overlap(font ? cast(hb_font_t*)font._cPtr(No.Dup) : null, direction);
  return _retval;
}

/**
    Tests whether a face has a `MATH` table.

    Params:
      face = #hb_face_t to test
    Returns: `true` if the table is found, `false` otherwise
*/
harfbuzz.types.Bool otMathHasData(harfbuzz.face.Face face)
{
  harfbuzz.types.Bool _retval;
  _retval = hb_ot_math_has_data(face ? cast(hb_face_t*)face._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Tests whether the given glyph index is an extended shape in the face.

    Params:
      face = #hb_face_t to work upon
      glyph = The glyph index to test
    Returns: `true` if the glyph is an extended shape, `false` otherwise
*/
harfbuzz.types.Bool otMathIsGlyphExtendedShape(harfbuzz.face.Face face, harfbuzz.types.Codepoint glyph)
{
  harfbuzz.types.Bool _retval;
  _retval = hb_ot_math_is_glyph_extended_shape(face ? cast(hb_face_t*)face._cPtr(No.Dup) : null, glyph);
  return _retval;
}

/**
    It fetches metadata entry of a given tag from a font.

    Params:
      face = a #hb_face_t object.
      metaTag = tag of metadata you like to have.
    Returns: A blob containing the blob.
*/
harfbuzz.blob.Blob otMetaReferenceEntry(harfbuzz.face.Face face, harfbuzz.types.OtMetaTag metaTag)
{
  hb_blob_t* _cretval;
  _cretval = hb_ot_meta_reference_entry(face ? cast(hb_face_t*)face._cPtr(No.Dup) : null, metaTag);
  auto _retval = _cretval ? new harfbuzz.blob.Blob(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Fetches metrics value corresponding to metrics_tag from font.

    Params:
      font = an #hb_font_t object.
      metricsTag = tag of metrics value you like to fetch.
      position = result of metrics value from the font.
    Returns: Whether found the requested metrics in the font.
*/
harfbuzz.types.Bool otMetricsGetPosition(harfbuzz.font.Font font, harfbuzz.types.OtMetricsTag metricsTag, out harfbuzz.types.Position position)
{
  harfbuzz.types.Bool _retval;
  _retval = hb_ot_metrics_get_position(font ? cast(hb_font_t*)font._cPtr(No.Dup) : null, metricsTag, cast(hb_position_t*)&position);
  return _retval;
}

/**
    Fetches metrics value corresponding to metrics_tag from font,
    and synthesizes a value if it the value is missing in the font.

    Params:
      font = an #hb_font_t object.
      metricsTag = tag of metrics value you like to fetch.
      position = result of metrics value from the font.
*/
void otMetricsGetPositionWithFallback(harfbuzz.font.Font font, harfbuzz.types.OtMetricsTag metricsTag, out harfbuzz.types.Position position)
{
  hb_ot_metrics_get_position_with_fallback(font ? cast(hb_font_t*)font._cPtr(No.Dup) : null, metricsTag, cast(hb_position_t*)&position);
}

/**
    Fetches metrics value corresponding to metrics_tag from font with the
    current font variation settings applied.

    Params:
      font = an #hb_font_t object.
      metricsTag = tag of metrics value you like to fetch.
    Returns: The requested metric value.
*/
float otMetricsGetVariation(harfbuzz.font.Font font, harfbuzz.types.OtMetricsTag metricsTag)
{
  float _retval;
  _retval = hb_ot_metrics_get_variation(font ? cast(hb_font_t*)font._cPtr(No.Dup) : null, metricsTag);
  return _retval;
}

/**
    Fetches horizontal metrics value corresponding to metrics_tag from font
    with the current font variation settings applied.

    Params:
      font = an #hb_font_t object.
      metricsTag = tag of metrics value you like to fetch.
    Returns: The requested metric value.
*/
harfbuzz.types.Position otMetricsGetXVariation(harfbuzz.font.Font font, harfbuzz.types.OtMetricsTag metricsTag)
{
  harfbuzz.types.Position _retval;
  _retval = hb_ot_metrics_get_x_variation(font ? cast(hb_font_t*)font._cPtr(No.Dup) : null, metricsTag);
  return _retval;
}

/**
    Fetches vertical metrics value corresponding to metrics_tag from font with
    the current font variation settings applied.

    Params:
      font = an #hb_font_t object.
      metricsTag = tag of metrics value you like to fetch.
    Returns: The requested metric value.
*/
harfbuzz.types.Position otMetricsGetYVariation(harfbuzz.font.Font font, harfbuzz.types.OtMetricsTag metricsTag)
{
  harfbuzz.types.Position _retval;
  _retval = hb_ot_metrics_get_y_variation(font ? cast(hb_font_t*)font._cPtr(No.Dup) : null, metricsTag);
  return _retval;
}

/**
    Converts an #hb_language_t to an #hb_tag_t.

    Params:
      language = an #hb_language_t to convert.
    Returns: 

    Deprecated: use [harfbuzz.global.otTagsFromScriptAndLanguage] instead
*/
harfbuzz.types.Tag otTagFromLanguage(harfbuzz.types.Language language)
{
  harfbuzz.types.Tag _retval;
  _retval = hb_ot_tag_from_language(language);
  return _retval;
}

/**
    Converts a language tag to an #hb_language_t.

    Params:
      tag = an language tag
    Returns: The #hb_language_t corresponding to tag.
*/
harfbuzz.types.Language otTagToLanguage(harfbuzz.types.Tag tag)
{
  auto _retval = hb_ot_tag_to_language(tag);
  return _retval;
}

/**
    Converts a script tag to an #hb_script_t.

    Params:
      tag = a script tag
    Returns: The #hb_script_t corresponding to tag.
*/
harfbuzz.types.Script otTagToScript(harfbuzz.types.Tag tag)
{
  hb_script_t _cretval;
  _cretval = hb_ot_tag_to_script(tag);
  harfbuzz.types.Script _retval = cast(harfbuzz.types.Script)_cretval;
  return _retval;
}

/**
    Converts an #hb_script_t to script tags.

    Params:
      script = an #hb_script_t to convert.
      scriptTag1 = output #hb_tag_t.
      scriptTag2 = output #hb_tag_t.

    Deprecated: use [harfbuzz.global.otTagsFromScriptAndLanguage] instead
*/
void otTagsFromScript(harfbuzz.types.Script script, out harfbuzz.types.Tag scriptTag1, out harfbuzz.types.Tag scriptTag2)
{
  hb_ot_tags_from_script(script, cast(hb_tag_t*)&scriptTag1, cast(hb_tag_t*)&scriptTag2);
}

/**
    Converts an #hb_script_t and an #hb_language_t to script and language tags.

    Params:
      script = an #hb_script_t to convert.
      language = an #hb_language_t to convert.
      scriptCount = maximum number of script tags to retrieve (IN)
        and actual number of script tags retrieved (OUT)
      scriptTags = array of size at least script_count to store the
        script tag results
      languageCount = maximum number of language tags to retrieve
        (IN) and actual number of language tags retrieved (OUT)
      languageTags = array of size at least language_count to store
        the language tag results
*/
void otTagsFromScriptAndLanguage(harfbuzz.types.Script script, harfbuzz.types.Language language, ref uint scriptCount, out harfbuzz.types.Tag scriptTags, ref uint languageCount, out harfbuzz.types.Tag languageTags)
{
  hb_ot_tags_from_script_and_language(script, language, cast(uint*)&scriptCount, cast(hb_tag_t*)&scriptTags, cast(uint*)&languageCount, cast(hb_tag_t*)&languageTags);
}

/**
    Converts a script tag and a language tag to an #hb_script_t and an
    #hb_language_t.

    Params:
      scriptTag = a script tag
      languageTag = a language tag
      script = the #hb_script_t corresponding to script_tag.
      language = the #hb_language_t corresponding to script_tag and
        language_tag.
*/
void otTagsToScriptAndLanguage(harfbuzz.types.Tag scriptTag, harfbuzz.types.Tag languageTag, out harfbuzz.types.Script script, out harfbuzz.types.Language language)
{
  hb_ot_tags_to_script_and_language(scriptTag, languageTag, &script, &language);
}

/**
    Fetches the variation-axis information corresponding to the specified axis tag
    in the specified face.

    Params:
      face = #hb_face_t to work upon
      axisTag = The #hb_tag_t of the variation axis to query
      axisInfo = The #hb_ot_var_axis_info_t of the axis tag queried
    Returns: `true` if data found, `false` otherwise
*/
harfbuzz.types.Bool otVarFindAxisInfo(harfbuzz.face.Face face, harfbuzz.types.Tag axisTag, out harfbuzz.types.OtVarAxisInfo axisInfo)
{
  harfbuzz.types.Bool _retval;
  _retval = hb_ot_var_find_axis_info(face ? cast(hb_face_t*)face._cPtr(No.Dup) : null, axisTag, &axisInfo);
  return _retval;
}

/**
    Fetches a list of all variation axes in the specified face. The list returned will begin
    at the offset provided.

    Params:
      face = #hb_face_t to work upon
      startOffset = offset of the first lookup to retrieve
      axesArray = The array of variation axes found
    Returns: 

    Deprecated: use [harfbuzz.global.otVarGetAxisInfos] instead
*/
uint otVarGetAxes(harfbuzz.face.Face face, uint startOffset, ref harfbuzz.types.OtVarAxis[] axesArray)
{
  uint _retval;
  uint _axesCount;
  _axesCount = cast(uint)axesArray.length;
  _retval = hb_ot_var_get_axes(face ? cast(hb_face_t*)face._cPtr(No.Dup) : null, startOffset, &_axesCount, axesArray.ptr);
  return _retval;
}

/**
    Fetches the number of OpenType variation axes included in the face.

    Params:
      face = The #hb_face_t to work on
    Returns: the number of variation axes defined
*/
uint otVarGetAxisCount(harfbuzz.face.Face face)
{
  uint _retval;
  _retval = hb_ot_var_get_axis_count(face ? cast(hb_face_t*)face._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Fetches a list of all variation axes in the specified face. The list returned will begin
    at the offset provided.

    Params:
      face = #hb_face_t to work upon
      startOffset = offset of the first lookup to retrieve
      axesArray = The array of variation axes found
    Returns: the number of variation axes in the face
*/
uint otVarGetAxisInfos(harfbuzz.face.Face face, uint startOffset, ref harfbuzz.types.OtVarAxisInfo[] axesArray)
{
  uint _retval;
  uint _axesCount;
  _axesCount = cast(uint)axesArray.length;
  _retval = hb_ot_var_get_axis_infos(face ? cast(hb_face_t*)face._cPtr(No.Dup) : null, startOffset, &_axesCount, axesArray.ptr);
  return _retval;
}

/**
    Fetches the number of named instances included in the face.

    Params:
      face = The #hb_face_t to work on
    Returns: the number of named instances defined
*/
uint otVarGetNamedInstanceCount(harfbuzz.face.Face face)
{
  uint _retval;
  _retval = hb_ot_var_get_named_instance_count(face ? cast(hb_face_t*)face._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Tests whether a face includes any OpenType variation data in the `fvar` table.

    Params:
      face = The #hb_face_t to work on
    Returns: `true` if data found, `false` otherwise
*/
harfbuzz.types.Bool otVarHasData(harfbuzz.face.Face face)
{
  harfbuzz.types.Bool _retval;
  _retval = hb_ot_var_has_data(face ? cast(hb_face_t*)face._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Fetches the design-space coordinates corresponding to the given
    named instance in the face.

    Params:
      face = The #hb_face_t to work on
      instanceIndex = The index of the named instance to query
      coords = The array of coordinates found for the query
    Returns: the number of variation axes in the face
*/
uint otVarNamedInstanceGetDesignCoords(harfbuzz.face.Face face, uint instanceIndex, ref float[] coords)
{
  uint _retval;
  uint _coordsLength;
  _coordsLength = cast(uint)coords.length;
  _retval = hb_ot_var_named_instance_get_design_coords(face ? cast(hb_face_t*)face._cPtr(No.Dup) : null, instanceIndex, &_coordsLength, coords.ptr);
  return _retval;
}

/**
    Fetches the `name` table Name ID that provides display names for
    the "PostScript name" defined for the given named instance in the face.

    Params:
      face = The #hb_face_t to work on
      instanceIndex = The index of the named instance to query
    Returns: the Name ID found for the PostScript name
*/
harfbuzz.types.OtNameId otVarNamedInstanceGetPostscriptNameId(harfbuzz.face.Face face, uint instanceIndex)
{
  harfbuzz.types.OtNameId _retval;
  _retval = hb_ot_var_named_instance_get_postscript_name_id(face ? cast(hb_face_t*)face._cPtr(No.Dup) : null, instanceIndex);
  return _retval;
}

/**
    Fetches the `name` table Name ID that provides display names for
    the "Subfamily name" defined for the given named instance in the face.

    Params:
      face = The #hb_face_t to work on
      instanceIndex = The index of the named instance to query
    Returns: the Name ID found for the Subfamily name
*/
harfbuzz.types.OtNameId otVarNamedInstanceGetSubfamilyNameId(harfbuzz.face.Face face, uint instanceIndex)
{
  harfbuzz.types.OtNameId _retval;
  _retval = hb_ot_var_named_instance_get_subfamily_name_id(face ? cast(hb_face_t*)face._cPtr(No.Dup) : null, instanceIndex);
  return _retval;
}

/**
    Normalizes the given design-space coordinates. The minimum and maximum
    values for the axis are mapped to the interval [-1,1], with the default
    axis value mapped to 0.
    
    The normalized values have 14 bits of fixed-point sub-integer precision as per
    OpenType specification.
    
    Any additional scaling defined in the face's `avar` table is also
    applied, as described at https://docs.microsoft.com/en-us/typography/opentype/spec/avar

    Params:
      face = The #hb_face_t to work on
      designCoords = The design-space coordinates to normalize
      normalizedCoords = The normalized coordinates
*/
void otVarNormalizeCoords(harfbuzz.face.Face face, float[] designCoords, out int normalizedCoords)
{
  uint _coordsLength;
  if (designCoords)
    _coordsLength = cast(uint)designCoords.length;

  auto _designCoords = cast(const(float)*)designCoords.ptr;
  hb_ot_var_normalize_coords(face ? cast(hb_face_t*)face._cPtr(No.Dup) : null, _coordsLength, _designCoords, cast(int*)&normalizedCoords);
}

/**
    Perform a "color" paint operation.

    Params:
      funcs = paint functions
      paintData = associated data passed by the caller
      isForeground = whether the color is the foreground
      color = The color to use
*/
void paintColor(harfbuzz.paint_funcs.PaintFuncs funcs, void* paintData, harfbuzz.types.Bool isForeground, harfbuzz.types.Color color)
{
  hb_paint_color(funcs ? cast(hb_paint_funcs_t*)funcs._cPtr(No.Dup) : null, paintData, isForeground, color);
}

/**
    Perform a "color-glyph" paint operation.

    Params:
      funcs = paint functions
      paintData = associated data passed by the caller
      glyph = the glyph ID
      font = the font
    Returns: 
*/
harfbuzz.types.Bool paintColorGlyph(harfbuzz.paint_funcs.PaintFuncs funcs, void* paintData, harfbuzz.types.Codepoint glyph, harfbuzz.font.Font font)
{
  harfbuzz.types.Bool _retval;
  _retval = hb_paint_color_glyph(funcs ? cast(hb_paint_funcs_t*)funcs._cPtr(No.Dup) : null, paintData, glyph, font ? cast(hb_font_t*)font._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Gets the custom palette color for color_index.

    Params:
      funcs = paint functions
      paintData = associated data passed by the caller
      colorIndex = color index
      color = fetched color
    Returns: `true` if found, `false` otherwise
*/
harfbuzz.types.Bool paintCustomPaletteColor(harfbuzz.paint_funcs.PaintFuncs funcs, void* paintData, uint colorIndex, out harfbuzz.types.Color color)
{
  harfbuzz.types.Bool _retval;
  _retval = hb_paint_custom_palette_color(funcs ? cast(hb_paint_funcs_t*)funcs._cPtr(No.Dup) : null, paintData, colorIndex, cast(hb_color_t*)&color);
  return _retval;
}

/**
    Creates a new #hb_paint_funcs_t structure of paint functions.
    
    The initial reference count of 1 should be released with [harfbuzz.global.paintFuncsDestroy]
    when you are done using the #hb_paint_funcs_t. This function never returns
    `NULL`. If memory cannot be allocated, a special singleton #hb_paint_funcs_t
    object will be returned.
    Returns: the paint-functions structure
*/
harfbuzz.paint_funcs.PaintFuncs paintFuncsCreate()
{
  hb_paint_funcs_t* _cretval;
  _cretval = hb_paint_funcs_create();
  auto _retval = _cretval ? new harfbuzz.paint_funcs.PaintFuncs(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Fetches the singleton empty paint-functions structure.
    Returns: The empty paint-functions structure
*/
harfbuzz.paint_funcs.PaintFuncs paintFuncsGetEmpty()
{
  hb_paint_funcs_t* _cretval;
  _cretval = hb_paint_funcs_get_empty();
  auto _retval = _cretval ? new harfbuzz.paint_funcs.PaintFuncs(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Tests whether a paint-functions structure is immutable.

    Params:
      funcs = The paint-functions structure
    Returns: `true` if funcs is immutable, `false` otherwise
*/
harfbuzz.types.Bool paintFuncsIsImmutable(harfbuzz.paint_funcs.PaintFuncs funcs)
{
  harfbuzz.types.Bool _retval;
  _retval = hb_paint_funcs_is_immutable(funcs ? cast(hb_paint_funcs_t*)funcs._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Makes a paint-functions structure immutable.
    
    After this call, all attempts to set one of the callbacks
    on funcs will fail.

    Params:
      funcs = The paint-functions structure
*/
void paintFuncsMakeImmutable(harfbuzz.paint_funcs.PaintFuncs funcs)
{
  hb_paint_funcs_make_immutable(funcs ? cast(hb_paint_funcs_t*)funcs._cPtr(No.Dup) : null);
}

/**
    Sets the paint-color callback on the paint functions struct.

    Params:
      funcs = A paint functions struct
      func = The paint-color callback
*/
void paintFuncsSetColorFunc(harfbuzz.paint_funcs.PaintFuncs funcs, harfbuzz.types.PaintColorFunc func)
{
  extern(C) void _funcCallback(hb_paint_funcs_t* funcs, void* paintData, hb_bool_t isForeground, hb_color_t color, void* userData)
  {
    auto _dlg = cast(harfbuzz.types.PaintColorFunc*)userData;

    (*_dlg)(funcs ? new harfbuzz.paint_funcs.PaintFuncs(cast(void*)funcs, No.Take) : null, paintData, isForeground, color);
  }
  auto _funcCB = func ? &_funcCallback : null;
  auto _func = func ? freezeDelegate(cast(void*)&func) : null;
  GDestroyNotify _funcDestroyCB = func ? &thawDelegate : null;
  hb_paint_funcs_set_color_func(funcs ? cast(hb_paint_funcs_t*)funcs._cPtr(No.Dup) : null, _funcCB, _func, _funcDestroyCB);
}

/**
    Sets the color-glyph callback on the paint functions struct.

    Params:
      funcs = A paint functions struct
      func = The color-glyph callback
*/
void paintFuncsSetColorGlyphFunc(harfbuzz.paint_funcs.PaintFuncs funcs, harfbuzz.types.PaintColorGlyphFunc func)
{
  extern(C) hb_bool_t _funcCallback(hb_paint_funcs_t* funcs, void* paintData, hb_codepoint_t glyph, hb_font_t* font, void* userData)
  {
    harfbuzz.types.Bool _dretval;
    auto _dlg = cast(harfbuzz.types.PaintColorGlyphFunc*)userData;

    _dretval = (*_dlg)(funcs ? new harfbuzz.paint_funcs.PaintFuncs(cast(void*)funcs, No.Take) : null, paintData, glyph, font ? new harfbuzz.font.Font(cast(void*)font, No.Take) : null);
    auto _retval = cast(hb_bool_t)_dretval;

    return _retval;
  }
  auto _funcCB = func ? &_funcCallback : null;
  auto _func = func ? freezeDelegate(cast(void*)&func) : null;
  GDestroyNotify _funcDestroyCB = func ? &thawDelegate : null;
  hb_paint_funcs_set_color_glyph_func(funcs ? cast(hb_paint_funcs_t*)funcs._cPtr(No.Dup) : null, _funcCB, _func, _funcDestroyCB);
}

/**
    Sets the custom-palette-color callback on the paint functions struct.

    Params:
      funcs = A paint functions struct
      func = The custom-palette-color callback
*/
void paintFuncsSetCustomPaletteColorFunc(harfbuzz.paint_funcs.PaintFuncs funcs, harfbuzz.types.PaintCustomPaletteColorFunc func)
{
  extern(C) hb_bool_t _funcCallback(hb_paint_funcs_t* funcs, void* paintData, uint colorIndex, hb_color_t* color, void* userData)
  {
    harfbuzz.types.Bool _dretval;
    auto _dlg = cast(harfbuzz.types.PaintCustomPaletteColorFunc*)userData;

    _dretval = (*_dlg)(funcs ? new harfbuzz.paint_funcs.PaintFuncs(cast(void*)funcs, No.Take) : null, paintData, colorIndex, *color);
    auto _retval = cast(hb_bool_t)_dretval;

    return _retval;
  }
  auto _funcCB = func ? &_funcCallback : null;
  auto _func = func ? freezeDelegate(cast(void*)&func) : null;
  GDestroyNotify _funcDestroyCB = func ? &thawDelegate : null;
  hb_paint_funcs_set_custom_palette_color_func(funcs ? cast(hb_paint_funcs_t*)funcs._cPtr(No.Dup) : null, _funcCB, _func, _funcDestroyCB);
}

/**
    Sets the paint-image callback on the paint functions struct.

    Params:
      funcs = A paint functions struct
      func = The paint-image callback
*/
void paintFuncsSetImageFunc(harfbuzz.paint_funcs.PaintFuncs funcs, harfbuzz.types.PaintImageFunc func)
{
  extern(C) hb_bool_t _funcCallback(hb_paint_funcs_t* funcs, void* paintData, hb_blob_t* image, uint width, uint height, hb_tag_t format, float slant, hb_glyph_extents_t* extents, void* userData)
  {
    harfbuzz.types.Bool _dretval;
    auto _dlg = cast(harfbuzz.types.PaintImageFunc*)userData;

    _dretval = (*_dlg)(funcs ? new harfbuzz.paint_funcs.PaintFuncs(cast(void*)funcs, No.Take) : null, paintData, image ? new harfbuzz.blob.Blob(cast(void*)image, No.Take) : null, width, height, format, slant, *cast(harfbuzz.types.GlyphExtents*)extents);
    auto _retval = cast(hb_bool_t)_dretval;

    return _retval;
  }
  auto _funcCB = func ? &_funcCallback : null;
  auto _func = func ? freezeDelegate(cast(void*)&func) : null;
  GDestroyNotify _funcDestroyCB = func ? &thawDelegate : null;
  hb_paint_funcs_set_image_func(funcs ? cast(hb_paint_funcs_t*)funcs._cPtr(No.Dup) : null, _funcCB, _func, _funcDestroyCB);
}

/**
    Sets the linear-gradient callback on the paint functions struct.

    Params:
      funcs = A paint functions struct
      func = The linear-gradient callback
*/
void paintFuncsSetLinearGradientFunc(harfbuzz.paint_funcs.PaintFuncs funcs, harfbuzz.types.PaintLinearGradientFunc func)
{
  extern(C) void _funcCallback(hb_paint_funcs_t* funcs, void* paintData, hb_color_line_t* colorLine, float x0, float y0, float x1, float y1, float x2, float y2, void* userData)
  {
    auto _dlg = cast(harfbuzz.types.PaintLinearGradientFunc*)userData;

    (*_dlg)(funcs ? new harfbuzz.paint_funcs.PaintFuncs(cast(void*)funcs, No.Take) : null, paintData, *cast(harfbuzz.types.ColorLine*)colorLine, x0, y0, x1, y1, x2, y2);
  }
  auto _funcCB = func ? &_funcCallback : null;
  auto _func = func ? freezeDelegate(cast(void*)&func) : null;
  GDestroyNotify _funcDestroyCB = func ? &thawDelegate : null;
  hb_paint_funcs_set_linear_gradient_func(funcs ? cast(hb_paint_funcs_t*)funcs._cPtr(No.Dup) : null, _funcCB, _func, _funcDestroyCB);
}

/**
    Sets the pop-clip callback on the paint functions struct.

    Params:
      funcs = A paint functions struct
      func = The pop-clip callback
*/
void paintFuncsSetPopClipFunc(harfbuzz.paint_funcs.PaintFuncs funcs, harfbuzz.types.PaintPopClipFunc func)
{
  extern(C) void _funcCallback(hb_paint_funcs_t* funcs, void* paintData, void* userData)
  {
    auto _dlg = cast(harfbuzz.types.PaintPopClipFunc*)userData;

    (*_dlg)(funcs ? new harfbuzz.paint_funcs.PaintFuncs(cast(void*)funcs, No.Take) : null, paintData);
  }
  auto _funcCB = func ? &_funcCallback : null;
  auto _func = func ? freezeDelegate(cast(void*)&func) : null;
  GDestroyNotify _funcDestroyCB = func ? &thawDelegate : null;
  hb_paint_funcs_set_pop_clip_func(funcs ? cast(hb_paint_funcs_t*)funcs._cPtr(No.Dup) : null, _funcCB, _func, _funcDestroyCB);
}

/**
    Sets the pop-group callback on the paint functions struct.

    Params:
      funcs = A paint functions struct
      func = The pop-group callback
*/
void paintFuncsSetPopGroupFunc(harfbuzz.paint_funcs.PaintFuncs funcs, harfbuzz.types.PaintPopGroupFunc func)
{
  extern(C) void _funcCallback(hb_paint_funcs_t* funcs, void* paintData, hb_paint_composite_mode_t mode, void* userData)
  {
    auto _dlg = cast(harfbuzz.types.PaintPopGroupFunc*)userData;

    (*_dlg)(funcs ? new harfbuzz.paint_funcs.PaintFuncs(cast(void*)funcs, No.Take) : null, paintData, mode);
  }
  auto _funcCB = func ? &_funcCallback : null;
  auto _func = func ? freezeDelegate(cast(void*)&func) : null;
  GDestroyNotify _funcDestroyCB = func ? &thawDelegate : null;
  hb_paint_funcs_set_pop_group_func(funcs ? cast(hb_paint_funcs_t*)funcs._cPtr(No.Dup) : null, _funcCB, _func, _funcDestroyCB);
}

/**
    Sets the pop-transform callback on the paint functions struct.

    Params:
      funcs = A paint functions struct
      func = The pop-transform callback
*/
void paintFuncsSetPopTransformFunc(harfbuzz.paint_funcs.PaintFuncs funcs, harfbuzz.types.PaintPopTransformFunc func)
{
  extern(C) void _funcCallback(hb_paint_funcs_t* funcs, void* paintData, void* userData)
  {
    auto _dlg = cast(harfbuzz.types.PaintPopTransformFunc*)userData;

    (*_dlg)(funcs ? new harfbuzz.paint_funcs.PaintFuncs(cast(void*)funcs, No.Take) : null, paintData);
  }
  auto _funcCB = func ? &_funcCallback : null;
  auto _func = func ? freezeDelegate(cast(void*)&func) : null;
  GDestroyNotify _funcDestroyCB = func ? &thawDelegate : null;
  hb_paint_funcs_set_pop_transform_func(funcs ? cast(hb_paint_funcs_t*)funcs._cPtr(No.Dup) : null, _funcCB, _func, _funcDestroyCB);
}

/**
    Sets the push-clip-glyph callback on the paint functions struct.

    Params:
      funcs = A paint functions struct
      func = The push-clip-glyph callback
*/
void paintFuncsSetPushClipGlyphFunc(harfbuzz.paint_funcs.PaintFuncs funcs, harfbuzz.types.PaintPushClipGlyphFunc func)
{
  extern(C) void _funcCallback(hb_paint_funcs_t* funcs, void* paintData, hb_codepoint_t glyph, hb_font_t* font, void* userData)
  {
    auto _dlg = cast(harfbuzz.types.PaintPushClipGlyphFunc*)userData;

    (*_dlg)(funcs ? new harfbuzz.paint_funcs.PaintFuncs(cast(void*)funcs, No.Take) : null, paintData, glyph, font ? new harfbuzz.font.Font(cast(void*)font, No.Take) : null);
  }
  auto _funcCB = func ? &_funcCallback : null;
  auto _func = func ? freezeDelegate(cast(void*)&func) : null;
  GDestroyNotify _funcDestroyCB = func ? &thawDelegate : null;
  hb_paint_funcs_set_push_clip_glyph_func(funcs ? cast(hb_paint_funcs_t*)funcs._cPtr(No.Dup) : null, _funcCB, _func, _funcDestroyCB);
}

/**
    Sets the push-clip-rect callback on the paint functions struct.

    Params:
      funcs = A paint functions struct
      func = The push-clip-rectangle callback
*/
void paintFuncsSetPushClipRectangleFunc(harfbuzz.paint_funcs.PaintFuncs funcs, harfbuzz.types.PaintPushClipRectangleFunc func)
{
  extern(C) void _funcCallback(hb_paint_funcs_t* funcs, void* paintData, float xmin, float ymin, float xmax, float ymax, void* userData)
  {
    auto _dlg = cast(harfbuzz.types.PaintPushClipRectangleFunc*)userData;

    (*_dlg)(funcs ? new harfbuzz.paint_funcs.PaintFuncs(cast(void*)funcs, No.Take) : null, paintData, xmin, ymin, xmax, ymax);
  }
  auto _funcCB = func ? &_funcCallback : null;
  auto _func = func ? freezeDelegate(cast(void*)&func) : null;
  GDestroyNotify _funcDestroyCB = func ? &thawDelegate : null;
  hb_paint_funcs_set_push_clip_rectangle_func(funcs ? cast(hb_paint_funcs_t*)funcs._cPtr(No.Dup) : null, _funcCB, _func, _funcDestroyCB);
}

/**
    Sets the push-group callback on the paint functions struct.

    Params:
      funcs = A paint functions struct
      func = The push-group callback
*/
void paintFuncsSetPushGroupFunc(harfbuzz.paint_funcs.PaintFuncs funcs, harfbuzz.types.PaintPushGroupFunc func)
{
  extern(C) void _funcCallback(hb_paint_funcs_t* funcs, void* paintData, void* userData)
  {
    auto _dlg = cast(harfbuzz.types.PaintPushGroupFunc*)userData;

    (*_dlg)(funcs ? new harfbuzz.paint_funcs.PaintFuncs(cast(void*)funcs, No.Take) : null, paintData);
  }
  auto _funcCB = func ? &_funcCallback : null;
  auto _func = func ? freezeDelegate(cast(void*)&func) : null;
  GDestroyNotify _funcDestroyCB = func ? &thawDelegate : null;
  hb_paint_funcs_set_push_group_func(funcs ? cast(hb_paint_funcs_t*)funcs._cPtr(No.Dup) : null, _funcCB, _func, _funcDestroyCB);
}

/**
    Sets the push-transform callback on the paint functions struct.

    Params:
      funcs = A paint functions struct
      func = The push-transform callback
*/
void paintFuncsSetPushTransformFunc(harfbuzz.paint_funcs.PaintFuncs funcs, harfbuzz.types.PaintPushTransformFunc func)
{
  extern(C) void _funcCallback(hb_paint_funcs_t* funcs, void* paintData, float xx, float yx, float xy, float yy, float dx, float dy, void* userData)
  {
    auto _dlg = cast(harfbuzz.types.PaintPushTransformFunc*)userData;

    (*_dlg)(funcs ? new harfbuzz.paint_funcs.PaintFuncs(cast(void*)funcs, No.Take) : null, paintData, xx, yx, xy, yy, dx, dy);
  }
  auto _funcCB = func ? &_funcCallback : null;
  auto _func = func ? freezeDelegate(cast(void*)&func) : null;
  GDestroyNotify _funcDestroyCB = func ? &thawDelegate : null;
  hb_paint_funcs_set_push_transform_func(funcs ? cast(hb_paint_funcs_t*)funcs._cPtr(No.Dup) : null, _funcCB, _func, _funcDestroyCB);
}

/**
    Sets the radial-gradient callback on the paint functions struct.

    Params:
      funcs = A paint functions struct
      func = The radial-gradient callback
*/
void paintFuncsSetRadialGradientFunc(harfbuzz.paint_funcs.PaintFuncs funcs, harfbuzz.types.PaintRadialGradientFunc func)
{
  extern(C) void _funcCallback(hb_paint_funcs_t* funcs, void* paintData, hb_color_line_t* colorLine, float x0, float y0, float r0, float x1, float y1, float r1, void* userData)
  {
    auto _dlg = cast(harfbuzz.types.PaintRadialGradientFunc*)userData;

    (*_dlg)(funcs ? new harfbuzz.paint_funcs.PaintFuncs(cast(void*)funcs, No.Take) : null, paintData, *cast(harfbuzz.types.ColorLine*)colorLine, x0, y0, r0, x1, y1, r1);
  }
  auto _funcCB = func ? &_funcCallback : null;
  auto _func = func ? freezeDelegate(cast(void*)&func) : null;
  GDestroyNotify _funcDestroyCB = func ? &thawDelegate : null;
  hb_paint_funcs_set_radial_gradient_func(funcs ? cast(hb_paint_funcs_t*)funcs._cPtr(No.Dup) : null, _funcCB, _func, _funcDestroyCB);
}

/**
    Sets the sweep-gradient callback on the paint functions struct.

    Params:
      funcs = A paint functions struct
      func = The sweep-gradient callback
*/
void paintFuncsSetSweepGradientFunc(harfbuzz.paint_funcs.PaintFuncs funcs, harfbuzz.types.PaintSweepGradientFunc func)
{
  extern(C) void _funcCallback(hb_paint_funcs_t* funcs, void* paintData, hb_color_line_t* colorLine, float x0, float y0, float startAngle, float endAngle, void* userData)
  {
    auto _dlg = cast(harfbuzz.types.PaintSweepGradientFunc*)userData;

    (*_dlg)(funcs ? new harfbuzz.paint_funcs.PaintFuncs(cast(void*)funcs, No.Take) : null, paintData, *cast(harfbuzz.types.ColorLine*)colorLine, x0, y0, startAngle, endAngle);
  }
  auto _funcCB = func ? &_funcCallback : null;
  auto _func = func ? freezeDelegate(cast(void*)&func) : null;
  GDestroyNotify _funcDestroyCB = func ? &thawDelegate : null;
  hb_paint_funcs_set_sweep_gradient_func(funcs ? cast(hb_paint_funcs_t*)funcs._cPtr(No.Dup) : null, _funcCB, _func, _funcDestroyCB);
}

/**
    Perform a "image" paint operation.

    Params:
      funcs = paint functions
      paintData = associated data passed by the caller
      image = image data
      width = width of the raster image in pixels, or 0
      height = height of the raster image in pixels, or 0
      format = the image format as a tag
      slant = the synthetic slant ratio to be applied to the image during rendering
      extents = the extents of the glyph
*/
void paintImage(harfbuzz.paint_funcs.PaintFuncs funcs, void* paintData, harfbuzz.blob.Blob image, uint width, uint height, harfbuzz.types.Tag format, float slant, harfbuzz.types.GlyphExtents extents)
{
  hb_paint_image(funcs ? cast(hb_paint_funcs_t*)funcs._cPtr(No.Dup) : null, paintData, image ? cast(hb_blob_t*)image._cPtr(No.Dup) : null, width, height, format, slant, &extents);
}

/**
    Perform a "linear-gradient" paint operation.

    Params:
      funcs = paint functions
      paintData = associated data passed by the caller
      colorLine = Color information for the gradient
      x0 = X coordinate of the first point
      y0 = Y coordinate of the first point
      x1 = X coordinate of the second point
      y1 = Y coordinate of the second point
      x2 = X coordinate of the third point
      y2 = Y coordinate of the third point
*/
void paintLinearGradient(harfbuzz.paint_funcs.PaintFuncs funcs, void* paintData, harfbuzz.types.ColorLine colorLine, float x0, float y0, float x1, float y1, float x2, float y2)
{
  hb_paint_linear_gradient(funcs ? cast(hb_paint_funcs_t*)funcs._cPtr(No.Dup) : null, paintData, &colorLine, x0, y0, x1, y1, x2, y2);
}

/**
    Perform a "pop-clip" paint operation.

    Params:
      funcs = paint functions
      paintData = associated data passed by the caller
*/
void paintPopClip(harfbuzz.paint_funcs.PaintFuncs funcs, void* paintData = null)
{
  hb_paint_pop_clip(funcs ? cast(hb_paint_funcs_t*)funcs._cPtr(No.Dup) : null, paintData);
}

/**
    Perform a "pop-group" paint operation.

    Params:
      funcs = paint functions
      paintData = associated data passed by the caller
      mode = the compositing mode to use
*/
void paintPopGroup(harfbuzz.paint_funcs.PaintFuncs funcs, void* paintData, harfbuzz.types.PaintCompositeMode mode)
{
  hb_paint_pop_group(funcs ? cast(hb_paint_funcs_t*)funcs._cPtr(No.Dup) : null, paintData, mode);
}

/**
    Perform a "pop-transform" paint operation.

    Params:
      funcs = paint functions
      paintData = associated data passed by the caller
*/
void paintPopTransform(harfbuzz.paint_funcs.PaintFuncs funcs, void* paintData = null)
{
  hb_paint_pop_transform(funcs ? cast(hb_paint_funcs_t*)funcs._cPtr(No.Dup) : null, paintData);
}

/**
    Perform a "push-clip-glyph" paint operation.

    Params:
      funcs = paint functions
      paintData = associated data passed by the caller
      glyph = the glyph ID
      font = the font
*/
void paintPushClipGlyph(harfbuzz.paint_funcs.PaintFuncs funcs, void* paintData, harfbuzz.types.Codepoint glyph, harfbuzz.font.Font font)
{
  hb_paint_push_clip_glyph(funcs ? cast(hb_paint_funcs_t*)funcs._cPtr(No.Dup) : null, paintData, glyph, font ? cast(hb_font_t*)font._cPtr(No.Dup) : null);
}

/**
    Perform a "push-clip-rect" paint operation.

    Params:
      funcs = paint functions
      paintData = associated data passed by the caller
      xmin = min X for the rectangle
      ymin = min Y for the rectangle
      xmax = max X for the rectangle
      ymax = max Y for the rectangle
*/
void paintPushClipRectangle(harfbuzz.paint_funcs.PaintFuncs funcs, void* paintData, float xmin, float ymin, float xmax, float ymax)
{
  hb_paint_push_clip_rectangle(funcs ? cast(hb_paint_funcs_t*)funcs._cPtr(No.Dup) : null, paintData, xmin, ymin, xmax, ymax);
}

/**
    Perform a "push-group" paint operation.

    Params:
      funcs = paint functions
      paintData = associated data passed by the caller
*/
void paintPushGroup(harfbuzz.paint_funcs.PaintFuncs funcs, void* paintData = null)
{
  hb_paint_push_group(funcs ? cast(hb_paint_funcs_t*)funcs._cPtr(No.Dup) : null, paintData);
}

/**
    Perform a "push-transform" paint operation.

    Params:
      funcs = paint functions
      paintData = associated data passed by the caller
      xx = xx component of the transform matrix
      yx = yx component of the transform matrix
      xy = xy component of the transform matrix
      yy = yy component of the transform matrix
      dx = dx component of the transform matrix
      dy = dy component of the transform matrix
*/
void paintPushTransform(harfbuzz.paint_funcs.PaintFuncs funcs, void* paintData, float xx, float yx, float xy, float yy, float dx, float dy)
{
  hb_paint_push_transform(funcs ? cast(hb_paint_funcs_t*)funcs._cPtr(No.Dup) : null, paintData, xx, yx, xy, yy, dx, dy);
}

/**
    Perform a "radial-gradient" paint operation.

    Params:
      funcs = paint functions
      paintData = associated data passed by the caller
      colorLine = Color information for the gradient
      x0 = X coordinate of the first circle's center
      y0 = Y coordinate of the first circle's center
      r0 = radius of the first circle
      x1 = X coordinate of the second circle's center
      y1 = Y coordinate of the second circle's center
      r1 = radius of the second circle
*/
void paintRadialGradient(harfbuzz.paint_funcs.PaintFuncs funcs, void* paintData, harfbuzz.types.ColorLine colorLine, float x0, float y0, float r0, float x1, float y1, float r1)
{
  hb_paint_radial_gradient(funcs ? cast(hb_paint_funcs_t*)funcs._cPtr(No.Dup) : null, paintData, &colorLine, x0, y0, r0, x1, y1, r1);
}

/**
    Perform a "sweep-gradient" paint operation.

    Params:
      funcs = paint functions
      paintData = associated data passed by the caller
      colorLine = Color information for the gradient
      x0 = X coordinate of the circle's center
      y0 = Y coordinate of the circle's center
      startAngle = the start angle
      endAngle = the end angle
*/
void paintSweepGradient(harfbuzz.paint_funcs.PaintFuncs funcs, void* paintData, harfbuzz.types.ColorLine colorLine, float x0, float y0, float startAngle, float endAngle)
{
  hb_paint_sweep_gradient(funcs ? cast(hb_paint_funcs_t*)funcs._cPtr(No.Dup) : null, paintData, &colorLine, x0, y0, startAngle, endAngle);
}

/**
    Converts an ISO 15924 script tag to a corresponding #hb_script_t.

    Params:
      tag = an #hb_tag_t representing an ISO 15924 tag.
    Returns: An #hb_script_t corresponding to the ISO 15924 tag.
*/
harfbuzz.types.Script scriptFromIso15924Tag(harfbuzz.types.Tag tag)
{
  hb_script_t _cretval;
  _cretval = hb_script_from_iso15924_tag(tag);
  harfbuzz.types.Script _retval = cast(harfbuzz.types.Script)_cretval;
  return _retval;
}

/**
    Converts a string str representing an ISO 15924 script tag to a
    corresponding #hb_script_t. Shorthand for [harfbuzz.global.tagFromString] then
    [harfbuzz.global.scriptFromIso15924Tag].

    Params:
      str = a string representing an
              ISO 15924 tag.
    Returns: An #hb_script_t corresponding to the ISO 15924 tag.
*/
harfbuzz.types.Script scriptFromString(ubyte[] str)
{
  hb_script_t _cretval;
  int _len;
  if (str)
    _len = cast(int)str.length;

  auto _str = cast(const(ubyte)*)str.ptr;
  _cretval = hb_script_from_string(_str, _len);
  harfbuzz.types.Script _retval = cast(harfbuzz.types.Script)_cretval;
  return _retval;
}

/**
    Fetches the #hb_direction_t of a script when it is
    set horizontally. All right-to-left scripts will return
    #HB_DIRECTION_RTL. All left-to-right scripts will return
    #HB_DIRECTION_LTR.  Scripts that can be written either
    horizontally or vertically will return #HB_DIRECTION_INVALID.
    Unknown scripts will return #HB_DIRECTION_LTR.

    Params:
      script = The #hb_script_t to query
    Returns: The horizontal #hb_direction_t of script
*/
harfbuzz.types.Direction scriptGetHorizontalDirection(harfbuzz.types.Script script)
{
  hb_direction_t _cretval;
  _cretval = hb_script_get_horizontal_direction(script);
  harfbuzz.types.Direction _retval = cast(harfbuzz.types.Direction)_cretval;
  return _retval;
}

/**
    Converts an #hb_script_t to a corresponding ISO 15924 script tag.

    Params:
      script = an #hb_script_t to convert.
    Returns: An #hb_tag_t representing an ISO 15924 script tag.
*/
harfbuzz.types.Tag scriptToIso15924Tag(harfbuzz.types.Script script)
{
  harfbuzz.types.Tag _retval;
  _retval = hb_script_to_iso15924_tag(script);
  return _retval;
}

/**
    Checks the equality of two #hb_segment_properties_t's.

    Params:
      a = first #hb_segment_properties_t to compare.
      b = second #hb_segment_properties_t to compare.
    Returns: `true` if all properties of `a` equal those of `b`, `false` otherwise.
*/
harfbuzz.types.Bool segmentPropertiesEqual(harfbuzz.segment_properties.SegmentProperties a, harfbuzz.segment_properties.SegmentProperties b)
{
  harfbuzz.types.Bool _retval;
  _retval = hb_segment_properties_equal(a ? cast(const(hb_segment_properties_t)*)a._cPtr(No.Dup) : null, b ? cast(const(hb_segment_properties_t)*)b._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Creates a hash representing `p`.

    Params:
      p = #hb_segment_properties_t to hash.
    Returns: A hash of `p`.
*/
uint segmentPropertiesHash(harfbuzz.segment_properties.SegmentProperties p)
{
  uint _retval;
  _retval = hb_segment_properties_hash(p ? cast(const(hb_segment_properties_t)*)p._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Fills in missing fields of `p` from src in a considered manner.
    
    First, if `p` does not have direction set, direction is copied from src.
    
    Next, if `p` and src have the same direction (which can be unset), if `p`
    does not have script set, script is copied from src.
    
    Finally, if `p` and src have the same direction and script (which either
    can be unset), if `p` does not have language set, language is copied from
    src.

    Params:
      p = #hb_segment_properties_t to fill in.
      src = #hb_segment_properties_t to fill in from.
*/
void segmentPropertiesOverlay(harfbuzz.segment_properties.SegmentProperties p, harfbuzz.segment_properties.SegmentProperties src)
{
  hb_segment_properties_overlay(p ? cast(hb_segment_properties_t*)p._cPtr(No.Dup) : null, src ? cast(const(hb_segment_properties_t)*)src._cPtr(No.Dup) : null);
}

/**
    Adds codepoint to set.

    Params:
      set = A set
      codepoint = The element to add to set
*/
void setAdd(harfbuzz.set.Set set, harfbuzz.types.Codepoint codepoint)
{
  hb_set_add(set ? cast(hb_set_t*)set._cPtr(No.Dup) : null, codepoint);
}

/**
    Adds all of the elements from first to last
    (inclusive) to set.

    Params:
      set = A set
      first = The first element to add to set
      last = The final element to add to set
*/
void setAddRange(harfbuzz.set.Set set, harfbuzz.types.Codepoint first, harfbuzz.types.Codepoint last)
{
  hb_set_add_range(set ? cast(hb_set_t*)set._cPtr(No.Dup) : null, first, last);
}

/**
    Adds num_codepoints codepoints to a set at once.
    The codepoints array must be in increasing order,
    with size at least num_codepoints.

    Params:
      set = A set
      sortedCodepoints = Array of codepoints to add
*/
void setAddSortedArray(harfbuzz.set.Set set, harfbuzz.types.Codepoint[] sortedCodepoints)
{
  uint _numCodepoints;
  if (sortedCodepoints)
    _numCodepoints = cast(uint)sortedCodepoints.length;

  auto _sortedCodepoints = cast(const(hb_codepoint_t)*)sortedCodepoints.ptr;
  hb_set_add_sorted_array(set ? cast(hb_set_t*)set._cPtr(No.Dup) : null, _sortedCodepoints, _numCodepoints);
}

/**
    Tests whether memory allocation for a set was successful.

    Params:
      set = A set
    Returns: `true` if allocation succeeded, `false` otherwise
*/
harfbuzz.types.Bool setAllocationSuccessful(harfbuzz.set.Set set)
{
  harfbuzz.types.Bool _retval;
  _retval = hb_set_allocation_successful(set ? cast(const(hb_set_t)*)set._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Clears out the contents of a set.

    Params:
      set = A set
*/
void setClear(harfbuzz.set.Set set)
{
  hb_set_clear(set ? cast(hb_set_t*)set._cPtr(No.Dup) : null);
}

/**
    Allocate a copy of set.

    Params:
      set = A set
    Returns: Newly-allocated set.
*/
harfbuzz.set.Set setCopy(harfbuzz.set.Set set)
{
  hb_set_t* _cretval;
  _cretval = hb_set_copy(set ? cast(const(hb_set_t)*)set._cPtr(No.Dup) : null);
  auto _retval = _cretval ? new harfbuzz.set.Set(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Creates a new, initially empty set.
    Returns: The new #hb_set_t
*/
harfbuzz.set.Set setCreate()
{
  hb_set_t* _cretval;
  _cretval = hb_set_create();
  auto _retval = _cretval ? new harfbuzz.set.Set(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Removes codepoint from set.

    Params:
      set = A set
      codepoint = Removes codepoint from set
*/
void setDel(harfbuzz.set.Set set, harfbuzz.types.Codepoint codepoint)
{
  hb_set_del(set ? cast(hb_set_t*)set._cPtr(No.Dup) : null, codepoint);
}

/**
    Removes all of the elements from first to last
    (inclusive) from set.
    
    If last is #HB_SET_VALUE_INVALID, then all values
    greater than or equal to first are removed.

    Params:
      set = A set
      first = The first element to remove from set
      last = The final element to remove from set
*/
void setDelRange(harfbuzz.set.Set set, harfbuzz.types.Codepoint first, harfbuzz.types.Codepoint last)
{
  hb_set_del_range(set ? cast(hb_set_t*)set._cPtr(No.Dup) : null, first, last);
}

/**
    Fetches the singleton empty #hb_set_t.
    Returns: The empty #hb_set_t
*/
harfbuzz.set.Set setGetEmpty()
{
  hb_set_t* _cretval;
  _cretval = hb_set_get_empty();
  auto _retval = _cretval ? new harfbuzz.set.Set(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Finds the largest element in the set.

    Params:
      set = A set
    Returns: maximum of set, or #HB_SET_VALUE_INVALID if set is empty.
*/
harfbuzz.types.Codepoint setGetMax(harfbuzz.set.Set set)
{
  harfbuzz.types.Codepoint _retval;
  _retval = hb_set_get_max(set ? cast(const(hb_set_t)*)set._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Finds the smallest element in the set.

    Params:
      set = A set
    Returns: minimum of set, or #HB_SET_VALUE_INVALID if set is empty.
*/
harfbuzz.types.Codepoint setGetMin(harfbuzz.set.Set set)
{
  harfbuzz.types.Codepoint _retval;
  _retval = hb_set_get_min(set ? cast(const(hb_set_t)*)set._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Returns the number of elements in the set.

    Params:
      set = A set
    Returns: The population of set
*/
uint setGetPopulation(harfbuzz.set.Set set)
{
  uint _retval;
  _retval = hb_set_get_population(set ? cast(const(hb_set_t)*)set._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Tests whether codepoint belongs to set.

    Params:
      set = A set
      codepoint = The element to query
    Returns: `true` if codepoint is in set, `false` otherwise
*/
harfbuzz.types.Bool setHas(harfbuzz.set.Set set, harfbuzz.types.Codepoint codepoint)
{
  harfbuzz.types.Bool _retval;
  _retval = hb_set_has(set ? cast(const(hb_set_t)*)set._cPtr(No.Dup) : null, codepoint);
  return _retval;
}

/**
    Creates a hash representing set.

    Params:
      set = A set
    Returns: A hash of set.
*/
uint setHash(harfbuzz.set.Set set)
{
  uint _retval;
  _retval = hb_set_hash(set ? cast(const(hb_set_t)*)set._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Makes set the intersection of set and other.

    Params:
      set = A set
      other = Another set
*/
void setIntersect(harfbuzz.set.Set set, harfbuzz.set.Set other)
{
  hb_set_intersect(set ? cast(hb_set_t*)set._cPtr(No.Dup) : null, other ? cast(const(hb_set_t)*)other._cPtr(No.Dup) : null);
}

/**
    Inverts the contents of set.

    Params:
      set = A set
*/
void setInvert(harfbuzz.set.Set set)
{
  hb_set_invert(set ? cast(hb_set_t*)set._cPtr(No.Dup) : null);
}

/**
    Tests whether a set is empty (contains no elements).

    Params:
      set = a set.
    Returns: `true` if set is empty
*/
harfbuzz.types.Bool setIsEmpty(harfbuzz.set.Set set)
{
  harfbuzz.types.Bool _retval;
  _retval = hb_set_is_empty(set ? cast(const(hb_set_t)*)set._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Tests whether set and other are equal (contain the same
    elements).

    Params:
      set = A set
      other = Another set
    Returns: `true` if the two sets are equal, `false` otherwise.
*/
harfbuzz.types.Bool setIsEqual(harfbuzz.set.Set set, harfbuzz.set.Set other)
{
  harfbuzz.types.Bool _retval;
  _retval = hb_set_is_equal(set ? cast(const(hb_set_t)*)set._cPtr(No.Dup) : null, other ? cast(const(hb_set_t)*)other._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Returns whether the set is inverted.

    Params:
      set = A set
    Returns: `true` if the set is inverted, `false` otherwise
*/
harfbuzz.types.Bool setIsInverted(harfbuzz.set.Set set)
{
  harfbuzz.types.Bool _retval;
  _retval = hb_set_is_inverted(set ? cast(const(hb_set_t)*)set._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Tests whether set is a subset of larger_set.

    Params:
      set = A set
      largerSet = Another set
    Returns: `true` if the set is a subset of (or equal to) larger_set, `false` otherwise.
*/
harfbuzz.types.Bool setIsSubset(harfbuzz.set.Set set, harfbuzz.set.Set largerSet)
{
  harfbuzz.types.Bool _retval;
  _retval = hb_set_is_subset(set ? cast(const(hb_set_t)*)set._cPtr(No.Dup) : null, largerSet ? cast(const(hb_set_t)*)largerSet._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Fetches the next element in set that is greater than current value of codepoint.
    
    Set codepoint to #HB_SET_VALUE_INVALID to get started.

    Params:
      set = A set
      codepoint = Input = Code point to query
                    Output = Code point retrieved
    Returns: `true` if there was a next value, `false` otherwise
*/
harfbuzz.types.Bool setNext(harfbuzz.set.Set set, ref harfbuzz.types.Codepoint codepoint)
{
  harfbuzz.types.Bool _retval;
  _retval = hb_set_next(set ? cast(const(hb_set_t)*)set._cPtr(No.Dup) : null, cast(hb_codepoint_t*)&codepoint);
  return _retval;
}

/**
    Finds the next element in set that is greater than codepoint. Writes out
    codepoints to out, until either the set runs out of elements, or size
    codepoints are written, whichever comes first.

    Params:
      set = A set
      codepoint = Outputting codepoints starting after this one.
                    Use #HB_SET_VALUE_INVALID to get started.
      out_ = An array of codepoints to write to.
    Returns: the number of values written.
*/
uint setNextMany(harfbuzz.set.Set set, harfbuzz.types.Codepoint codepoint, harfbuzz.types.Codepoint[] out_)
{
  uint _retval;
  uint _size;
  if (out_)
    _size = cast(uint)out_.length;

  auto _out_ = cast(hb_codepoint_t*)out_.ptr;
  _retval = hb_set_next_many(set ? cast(const(hb_set_t)*)set._cPtr(No.Dup) : null, codepoint, _out_, _size);
  return _retval;
}

/**
    Fetches the next consecutive range of elements in set that
    are greater than current value of last.
    
    Set last to #HB_SET_VALUE_INVALID to get started.

    Params:
      set = A set
      first = The first code point in the range
      last = Input = The current last code point in the range
                Output = The last code point in the range
    Returns: `true` if there was a next range, `false` otherwise
*/
harfbuzz.types.Bool setNextRange(harfbuzz.set.Set set, out harfbuzz.types.Codepoint first, ref harfbuzz.types.Codepoint last)
{
  harfbuzz.types.Bool _retval;
  _retval = hb_set_next_range(set ? cast(const(hb_set_t)*)set._cPtr(No.Dup) : null, cast(hb_codepoint_t*)&first, cast(hb_codepoint_t*)&last);
  return _retval;
}

/**
    Fetches the previous element in set that is lower than current value of codepoint.
    
    Set codepoint to #HB_SET_VALUE_INVALID to get started.

    Params:
      set = A set
      codepoint = Input = Code point to query
                    Output = Code point retrieved
    Returns: `true` if there was a previous value, `false` otherwise
*/
harfbuzz.types.Bool setPrevious(harfbuzz.set.Set set, ref harfbuzz.types.Codepoint codepoint)
{
  harfbuzz.types.Bool _retval;
  _retval = hb_set_previous(set ? cast(const(hb_set_t)*)set._cPtr(No.Dup) : null, cast(hb_codepoint_t*)&codepoint);
  return _retval;
}

/**
    Fetches the previous consecutive range of elements in set that
    are greater than current value of last.
    
    Set first to #HB_SET_VALUE_INVALID to get started.

    Params:
      set = A set
      first = Input = The current first code point in the range
                Output = The first code point in the range
      last = The last code point in the range
    Returns: `true` if there was a previous range, `false` otherwise
*/
harfbuzz.types.Bool setPreviousRange(harfbuzz.set.Set set, ref harfbuzz.types.Codepoint first, out harfbuzz.types.Codepoint last)
{
  harfbuzz.types.Bool _retval;
  _retval = hb_set_previous_range(set ? cast(const(hb_set_t)*)set._cPtr(No.Dup) : null, cast(hb_codepoint_t*)&first, cast(hb_codepoint_t*)&last);
  return _retval;
}

/**
    Makes the contents of set equal to the contents of other.

    Params:
      set = A set
      other = Another set
*/
void setSet(harfbuzz.set.Set set, harfbuzz.set.Set other)
{
  hb_set_set(set ? cast(hb_set_t*)set._cPtr(No.Dup) : null, other ? cast(const(hb_set_t)*)other._cPtr(No.Dup) : null);
}

/**
    Subtracts the contents of other from set.

    Params:
      set = A set
      other = Another set
*/
void setSubtract(harfbuzz.set.Set set, harfbuzz.set.Set other)
{
  hb_set_subtract(set ? cast(hb_set_t*)set._cPtr(No.Dup) : null, other ? cast(const(hb_set_t)*)other._cPtr(No.Dup) : null);
}

/**
    Makes set the symmetric difference of set
    and other.

    Params:
      set = A set
      other = Another set
*/
void setSymmetricDifference(harfbuzz.set.Set set, harfbuzz.set.Set other)
{
  hb_set_symmetric_difference(set ? cast(hb_set_t*)set._cPtr(No.Dup) : null, other ? cast(const(hb_set_t)*)other._cPtr(No.Dup) : null);
}

/**
    Makes set the union of set and other.

    Params:
      set = A set
      other = Another set
*/
void setUnion(harfbuzz.set.Set set, harfbuzz.set.Set other)
{
  hb_set_union(set ? cast(hb_set_t*)set._cPtr(No.Dup) : null, other ? cast(const(hb_set_t)*)other._cPtr(No.Dup) : null);
}

/**
    Shapes buffer using font turning its Unicode characters content to
    positioned glyphs. If features is not `NULL`, it will be used to control the
    features applied during shaping. If two features have the same tag but
    overlapping ranges the value of the feature with the higher index takes
    precedence.

    Params:
      font = an #hb_font_t to use for shaping
      buffer = an #hb_buffer_t to shape
      features = an array of user
           specified #hb_feature_t or `NULL`
*/
void shape(harfbuzz.font.Font font, harfbuzz.buffer.Buffer buffer, harfbuzz.feature.Feature[] features = null)
{
  uint _numFeatures;
  if (features)
    _numFeatures = cast(uint)features.length;

  auto _features = cast(const(hb_feature_t)*)features.ptr;
  hb_shape(font ? cast(hb_font_t*)font._cPtr(No.Dup) : null, buffer ? cast(hb_buffer_t*)buffer._cPtr(No.Dup) : null, _features, _numFeatures);
}

/**
    See [harfbuzz.global.shape] for details. If shaper_list is not `NULL`, the specified
    shapers will be used in the given order, otherwise the default shapers list
    will be used.

    Params:
      font = an #hb_font_t to use for shaping
      buffer = an #hb_buffer_t to shape
      features = an array of user
           specified #hb_feature_t or `NULL`
      shaperList = a `NULL`-terminated
           array of shapers to use or `NULL`
    Returns: false if all shapers failed, true otherwise
*/
harfbuzz.types.Bool shapeFull(harfbuzz.font.Font font, harfbuzz.buffer.Buffer buffer, harfbuzz.feature.Feature[] features = null, string[] shaperList = null)
{
  harfbuzz.types.Bool _retval;
  uint _numFeatures;
  if (features)
    _numFeatures = cast(uint)features.length;

  auto _features = cast(const(hb_feature_t)*)features.ptr;
  char*[] _tmpshaperList;
  foreach (s; shaperList)
    _tmpshaperList ~= s.toCString(No.Alloc);
  _tmpshaperList ~= null;
  const(char*)* _shaperList = _tmpshaperList.ptr;

  _retval = hb_shape_full(font ? cast(hb_font_t*)font._cPtr(No.Dup) : null, buffer ? cast(hb_buffer_t*)buffer._cPtr(No.Dup) : null, _features, _numFeatures, _shaperList);
  return _retval;
}

/**
    See [harfbuzz.global.shapeFull] for basic details. If shaper_list is not `NULL`, the specified
    shapers will be used in the given order, otherwise the default shapers list
    will be used.
    
    In addition, justify the shaping results such that the shaping results reach
    the target advance width/height, depending on the buffer direction.
    
    If the advance of the buffer shaped with [harfbuzz.global.shapeFull] is already known,
    put that in *advance. Otherwise set *advance to zero.
    
    This API is currently experimental and will probably change in the future.

    Params:
      font = a mutable #hb_font_t to use for shaping
      buffer = an #hb_buffer_t to shape
      features = an array of user
           specified #hb_feature_t or `NULL`
      shaperList = a `NULL`-terminated
           array of shapers to use or `NULL`
      minTargetAdvance = Minimum advance width/height to aim for.
      maxTargetAdvance = Maximum advance width/height to aim for.
      advance = Input/output advance width/height of the buffer.
      varTag = Variation-axis tag used for justification.
      varValue = Variation-axis value used to reach target justification.
    Returns: false if all shapers failed, true otherwise
      
      XSince: EXPERIMENTAL
*/
harfbuzz.types.Bool shapeJustify(harfbuzz.font.Font font, harfbuzz.buffer.Buffer buffer, harfbuzz.feature.Feature[] features, string[] shaperList, float minTargetAdvance, float maxTargetAdvance, ref float advance, out harfbuzz.types.Tag varTag, out float varValue)
{
  harfbuzz.types.Bool _retval;
  uint _numFeatures;
  if (features)
    _numFeatures = cast(uint)features.length;

  auto _features = cast(const(hb_feature_t)*)features.ptr;
  char*[] _tmpshaperList;
  foreach (s; shaperList)
    _tmpshaperList ~= s.toCString(No.Alloc);
  _tmpshaperList ~= null;
  const(char*)* _shaperList = _tmpshaperList.ptr;

  _retval = hb_shape_justify(font ? cast(hb_font_t*)font._cPtr(No.Dup) : null, buffer ? cast(hb_buffer_t*)buffer._cPtr(No.Dup) : null, _features, _numFeatures, _shaperList, minTargetAdvance, maxTargetAdvance, cast(float*)&advance, cast(hb_tag_t*)&varTag, cast(float*)&varValue);
  return _retval;
}

/**
    Retrieves the list of shapers supported by HarfBuzz.
    Returns: an array of
         constant strings
*/
string[] shapeListShapers()
{
  const(char*)* _cretval;
  _cretval = hb_shape_list_shapers();
  string[] _retval;

  if (_cretval)
  {
    uint _cretlength;
    while (_cretval[_cretlength] !is null)
      _cretlength++;
    _retval = new string[_cretlength];
    foreach (i; 0 .. _cretlength)
      _retval[i] = _cretval[i].fromCString(No.Free);
  }
  return _retval;
}

/**
    Constructs a shaping plan for a combination of face, user_features, props,
    and shaper_list.

    Params:
      face = #hb_face_t to use
      props = The #hb_segment_properties_t of the segment
      userFeatures = The list of user-selected features
      shaperList = List of shapers to try
    Returns: The shaping plan
*/
harfbuzz.shape_plan.ShapePlan shapePlanCreate(harfbuzz.face.Face face, harfbuzz.segment_properties.SegmentProperties props, harfbuzz.feature.Feature[] userFeatures, string[] shaperList)
{
  hb_shape_plan_t* _cretval;
  uint _numUserFeatures;
  if (userFeatures)
    _numUserFeatures = cast(uint)userFeatures.length;

  auto _userFeatures = cast(const(hb_feature_t)*)userFeatures.ptr;
  char*[] _tmpshaperList;
  foreach (s; shaperList)
    _tmpshaperList ~= s.toCString(No.Alloc);
  _tmpshaperList ~= null;
  const(char*)* _shaperList = _tmpshaperList.ptr;

  _cretval = hb_shape_plan_create(face ? cast(hb_face_t*)face._cPtr(No.Dup) : null, props ? cast(const(hb_segment_properties_t)*)props._cPtr(No.Dup) : null, _userFeatures, _numUserFeatures, _shaperList);
  auto _retval = _cretval ? new harfbuzz.shape_plan.ShapePlan(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    The variable-font version of #hb_shape_plan_create.
    Constructs a shaping plan for a combination of face, user_features, props,
    and shaper_list, plus the variation-space coordinates coords.

    Params:
      face = #hb_face_t to use
      props = The #hb_segment_properties_t of the segment
      userFeatures = The list of user-selected features
      coords = The list of variation-space coordinates
      shaperList = List of shapers to try
    Returns: The shaping plan
*/
harfbuzz.shape_plan.ShapePlan shapePlanCreate2(harfbuzz.face.Face face, harfbuzz.segment_properties.SegmentProperties props, harfbuzz.feature.Feature[] userFeatures, int[] coords, string[] shaperList)
{
  hb_shape_plan_t* _cretval;
  uint _numUserFeatures;
  if (userFeatures)
    _numUserFeatures = cast(uint)userFeatures.length;

  auto _userFeatures = cast(const(hb_feature_t)*)userFeatures.ptr;
  uint _numCoords;
  if (coords)
    _numCoords = cast(uint)coords.length;

  auto _coords = cast(const(int)*)coords.ptr;
  char*[] _tmpshaperList;
  foreach (s; shaperList)
    _tmpshaperList ~= s.toCString(No.Alloc);
  _tmpshaperList ~= null;
  const(char*)* _shaperList = _tmpshaperList.ptr;

  _cretval = hb_shape_plan_create2(face ? cast(hb_face_t*)face._cPtr(No.Dup) : null, props ? cast(const(hb_segment_properties_t)*)props._cPtr(No.Dup) : null, _userFeatures, _numUserFeatures, _coords, _numCoords, _shaperList);
  auto _retval = _cretval ? new harfbuzz.shape_plan.ShapePlan(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Creates a cached shaping plan suitable for reuse, for a combination
    of face, user_features, props, and shaper_list.

    Params:
      face = #hb_face_t to use
      props = The #hb_segment_properties_t of the segment
      userFeatures = The list of user-selected features
      shaperList = List of shapers to try
    Returns: The shaping plan
*/
harfbuzz.shape_plan.ShapePlan shapePlanCreateCached(harfbuzz.face.Face face, harfbuzz.segment_properties.SegmentProperties props, harfbuzz.feature.Feature[] userFeatures, string[] shaperList)
{
  hb_shape_plan_t* _cretval;
  uint _numUserFeatures;
  if (userFeatures)
    _numUserFeatures = cast(uint)userFeatures.length;

  auto _userFeatures = cast(const(hb_feature_t)*)userFeatures.ptr;
  char*[] _tmpshaperList;
  foreach (s; shaperList)
    _tmpshaperList ~= s.toCString(No.Alloc);
  _tmpshaperList ~= null;
  const(char*)* _shaperList = _tmpshaperList.ptr;

  _cretval = hb_shape_plan_create_cached(face ? cast(hb_face_t*)face._cPtr(No.Dup) : null, props ? cast(const(hb_segment_properties_t)*)props._cPtr(No.Dup) : null, _userFeatures, _numUserFeatures, _shaperList);
  auto _retval = _cretval ? new harfbuzz.shape_plan.ShapePlan(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    The variable-font version of #hb_shape_plan_create_cached.
    Creates a cached shaping plan suitable for reuse, for a combination
    of face, user_features, props, and shaper_list, plus the
    variation-space coordinates coords.

    Params:
      face = #hb_face_t to use
      props = The #hb_segment_properties_t of the segment
      userFeatures = The list of user-selected features
      coords = The list of variation-space coordinates
      shaperList = List of shapers to try
    Returns: The shaping plan
*/
harfbuzz.shape_plan.ShapePlan shapePlanCreateCached2(harfbuzz.face.Face face, harfbuzz.segment_properties.SegmentProperties props, harfbuzz.feature.Feature[] userFeatures, int[] coords, string[] shaperList)
{
  hb_shape_plan_t* _cretval;
  uint _numUserFeatures;
  if (userFeatures)
    _numUserFeatures = cast(uint)userFeatures.length;

  auto _userFeatures = cast(const(hb_feature_t)*)userFeatures.ptr;
  uint _numCoords;
  if (coords)
    _numCoords = cast(uint)coords.length;

  auto _coords = cast(const(int)*)coords.ptr;
  char*[] _tmpshaperList;
  foreach (s; shaperList)
    _tmpshaperList ~= s.toCString(No.Alloc);
  _tmpshaperList ~= null;
  const(char*)* _shaperList = _tmpshaperList.ptr;

  _cretval = hb_shape_plan_create_cached2(face ? cast(hb_face_t*)face._cPtr(No.Dup) : null, props ? cast(const(hb_segment_properties_t)*)props._cPtr(No.Dup) : null, _userFeatures, _numUserFeatures, _coords, _numCoords, _shaperList);
  auto _retval = _cretval ? new harfbuzz.shape_plan.ShapePlan(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Executes the given shaping plan on the specified buffer, using
    the given font and features.

    Params:
      shapePlan = A shaping plan
      font = The #hb_font_t to use
      buffer = The #hb_buffer_t to work upon
      features = Features to enable
    Returns: `true` if success, `false` otherwise.
*/
harfbuzz.types.Bool shapePlanExecute(harfbuzz.shape_plan.ShapePlan shapePlan, harfbuzz.font.Font font, harfbuzz.buffer.Buffer buffer, harfbuzz.feature.Feature[] features)
{
  harfbuzz.types.Bool _retval;
  uint _numFeatures;
  if (features)
    _numFeatures = cast(uint)features.length;

  auto _features = cast(const(hb_feature_t)*)features.ptr;
  _retval = hb_shape_plan_execute(shapePlan ? cast(hb_shape_plan_t*)shapePlan._cPtr(No.Dup) : null, font ? cast(hb_font_t*)font._cPtr(No.Dup) : null, buffer ? cast(hb_buffer_t*)buffer._cPtr(No.Dup) : null, _features, _numFeatures);
  return _retval;
}

/**
    Fetches the singleton empty shaping plan.
    Returns: The empty shaping plan
*/
harfbuzz.shape_plan.ShapePlan shapePlanGetEmpty()
{
  hb_shape_plan_t* _cretval;
  _cretval = hb_shape_plan_get_empty();
  auto _retval = _cretval ? new harfbuzz.shape_plan.ShapePlan(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Fetches the shaper from a given shaping plan.

    Params:
      shapePlan = A shaping plan
    Returns: The shaper
*/
string shapePlanGetShaper(harfbuzz.shape_plan.ShapePlan shapePlan)
{
  const(char)* _cretval;
  _cretval = hb_shape_plan_get_shaper(shapePlan ? cast(hb_shape_plan_t*)shapePlan._cPtr(No.Dup) : null);
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/**
    Searches variation axes of a #hb_font_t object for a specific axis first,
    if not set, then tries to get default style values from different
    tables of the font.

    Params:
      font = a #hb_font_t object.
      styleTag = a style tag.
    Returns: Corresponding axis or default value to a style tag.
*/
float styleGetValue(harfbuzz.font.Font font, harfbuzz.types.StyleTag styleTag)
{
  float _retval;
  _retval = hb_style_get_value(font ? cast(hb_font_t*)font._cPtr(No.Dup) : null, styleTag);
  return _retval;
}

/**
    Converts a string into an #hb_tag_t. Valid tags
    are four characters. Shorter input strings will be
    padded with spaces. Longer input strings will be
    truncated.

    Params:
      str = String to convert
    Returns: The #hb_tag_t corresponding to str
*/
harfbuzz.types.Tag tagFromString(ubyte[] str)
{
  harfbuzz.types.Tag _retval;
  int _len;
  if (str)
    _len = cast(int)str.length;

  auto _str = cast(const(ubyte)*)str.ptr;
  _retval = hb_tag_from_string(_str, _len);
  return _retval;
}

/**
    Retrieves the Canonical Combining Class (ccc) property
    of code point unicode.

    Params:
      ufuncs = The Unicode-functions structure
      unicode = The code point to query
    Returns: The #hb_unicode_combining_class_t of unicode
*/
harfbuzz.types.UnicodeCombiningClass unicodeCombiningClass(harfbuzz.unicode_funcs.UnicodeFuncs ufuncs, harfbuzz.types.Codepoint unicode)
{
  hb_unicode_combining_class_t _cretval;
  _cretval = hb_unicode_combining_class(ufuncs ? cast(hb_unicode_funcs_t*)ufuncs._cPtr(No.Dup) : null, unicode);
  harfbuzz.types.UnicodeCombiningClass _retval = cast(harfbuzz.types.UnicodeCombiningClass)_cretval;
  return _retval;
}

/**
    Fetches the composition of a sequence of two Unicode
    code points.
    
    Calls the composition function of the specified
    Unicode-functions structure ufuncs.

    Params:
      ufuncs = The Unicode-functions structure
      a = The first Unicode code point to compose
      b = The second Unicode code point to compose
      ab = The composition of `a`, `b`
    Returns: `true` if `a` and `b` composed, `false` otherwise
*/
harfbuzz.types.Bool unicodeCompose(harfbuzz.unicode_funcs.UnicodeFuncs ufuncs, harfbuzz.types.Codepoint a, harfbuzz.types.Codepoint b, out harfbuzz.types.Codepoint ab)
{
  harfbuzz.types.Bool _retval;
  _retval = hb_unicode_compose(ufuncs ? cast(hb_unicode_funcs_t*)ufuncs._cPtr(No.Dup) : null, a, b, cast(hb_codepoint_t*)&ab);
  return _retval;
}

/**
    Fetches the decomposition of a Unicode code point.
    
    Calls the decomposition function of the specified
    Unicode-functions structure ufuncs.

    Params:
      ufuncs = The Unicode-functions structure
      ab = Unicode code point to decompose
      a = The first code point of the decomposition of `a`b
      b = The second code point of the decomposition of `a`b
    Returns: `true` if `a`b was decomposed, `false` otherwise
*/
harfbuzz.types.Bool unicodeDecompose(harfbuzz.unicode_funcs.UnicodeFuncs ufuncs, harfbuzz.types.Codepoint ab, out harfbuzz.types.Codepoint a, out harfbuzz.types.Codepoint b)
{
  harfbuzz.types.Bool _retval;
  _retval = hb_unicode_decompose(ufuncs ? cast(hb_unicode_funcs_t*)ufuncs._cPtr(No.Dup) : null, ab, cast(hb_codepoint_t*)&a, cast(hb_codepoint_t*)&b);
  return _retval;
}

/**
    Fetches the compatibility decomposition of a Unicode
    code point. Deprecated.

    Params:
      ufuncs = The Unicode-functions structure
      u = Code point to decompose
      decomposed = Compatibility decomposition of `u`
    Returns: length of decomposed.
*/
uint unicodeDecomposeCompatibility(harfbuzz.unicode_funcs.UnicodeFuncs ufuncs, harfbuzz.types.Codepoint u, out harfbuzz.types.Codepoint decomposed)
{
  uint _retval;
  _retval = hb_unicode_decompose_compatibility(ufuncs ? cast(hb_unicode_funcs_t*)ufuncs._cPtr(No.Dup) : null, u, cast(hb_codepoint_t*)&decomposed);
  return _retval;
}

/**
    Don't use. Not used by HarfBuzz.

    Params:
      ufuncs = a Unicode-function structure
      unicode = The code point to query
    Returns: 
*/
uint unicodeEastasianWidth(harfbuzz.unicode_funcs.UnicodeFuncs ufuncs, harfbuzz.types.Codepoint unicode)
{
  uint _retval;
  _retval = hb_unicode_eastasian_width(ufuncs ? cast(hb_unicode_funcs_t*)ufuncs._cPtr(No.Dup) : null, unicode);
  return _retval;
}

/**
    Creates a new #hb_unicode_funcs_t structure of Unicode functions.

    Params:
      parent = Parent Unicode-functions structure
    Returns: The Unicode-functions structure
*/
harfbuzz.unicode_funcs.UnicodeFuncs unicodeFuncsCreate(harfbuzz.unicode_funcs.UnicodeFuncs parent = null)
{
  hb_unicode_funcs_t* _cretval;
  _cretval = hb_unicode_funcs_create(parent ? cast(hb_unicode_funcs_t*)parent._cPtr(No.Dup) : null);
  auto _retval = _cretval ? new harfbuzz.unicode_funcs.UnicodeFuncs(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Fetches a pointer to the default Unicode-functions structure that is used
    when no functions are explicitly set on #hb_buffer_t.
    Returns: a pointer to the #hb_unicode_funcs_t Unicode-functions structure
*/
harfbuzz.unicode_funcs.UnicodeFuncs unicodeFuncsGetDefault()
{
  hb_unicode_funcs_t* _cretval;
  _cretval = hb_unicode_funcs_get_default();
  auto _retval = _cretval ? new harfbuzz.unicode_funcs.UnicodeFuncs(cast(void*)_cretval, No.Take) : null;
  return _retval;
}

/**
    Fetches the singleton empty Unicode-functions structure.
    Returns: The empty Unicode-functions structure
*/
harfbuzz.unicode_funcs.UnicodeFuncs unicodeFuncsGetEmpty()
{
  hb_unicode_funcs_t* _cretval;
  _cretval = hb_unicode_funcs_get_empty();
  auto _retval = _cretval ? new harfbuzz.unicode_funcs.UnicodeFuncs(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Fetches the parent of the Unicode-functions structure
    ufuncs.

    Params:
      ufuncs = The Unicode-functions structure
    Returns: The parent Unicode-functions structure
*/
harfbuzz.unicode_funcs.UnicodeFuncs unicodeFuncsGetParent(harfbuzz.unicode_funcs.UnicodeFuncs ufuncs)
{
  hb_unicode_funcs_t* _cretval;
  _cretval = hb_unicode_funcs_get_parent(ufuncs ? cast(hb_unicode_funcs_t*)ufuncs._cPtr(No.Dup) : null);
  auto _retval = _cretval ? new harfbuzz.unicode_funcs.UnicodeFuncs(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Tests whether the specified Unicode-functions structure
    is immutable.

    Params:
      ufuncs = The Unicode-functions structure
    Returns: `true` if ufuncs is immutable, `false` otherwise
*/
harfbuzz.types.Bool unicodeFuncsIsImmutable(harfbuzz.unicode_funcs.UnicodeFuncs ufuncs)
{
  harfbuzz.types.Bool _retval;
  _retval = hb_unicode_funcs_is_immutable(ufuncs ? cast(hb_unicode_funcs_t*)ufuncs._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Makes the specified Unicode-functions structure
    immutable.

    Params:
      ufuncs = The Unicode-functions structure
*/
void unicodeFuncsMakeImmutable(harfbuzz.unicode_funcs.UnicodeFuncs ufuncs)
{
  hb_unicode_funcs_make_immutable(ufuncs ? cast(hb_unicode_funcs_t*)ufuncs._cPtr(No.Dup) : null);
}

/**
    Sets the implementation function for #hb_unicode_combining_class_func_t.

    Params:
      ufuncs = A Unicode-functions structure
      func = The callback function to assign
*/
void unicodeFuncsSetCombiningClassFunc(harfbuzz.unicode_funcs.UnicodeFuncs ufuncs, harfbuzz.types.UnicodeCombiningClassFunc func)
{
  extern(C) hb_unicode_combining_class_t _funcCallback(hb_unicode_funcs_t* ufuncs, hb_codepoint_t unicode, void* userData)
  {
    harfbuzz.types.UnicodeCombiningClass _dretval;
    auto _dlg = cast(harfbuzz.types.UnicodeCombiningClassFunc*)userData;

    _dretval = (*_dlg)(ufuncs ? new harfbuzz.unicode_funcs.UnicodeFuncs(cast(void*)ufuncs, No.Take) : null, unicode);
    auto _retval = cast(hb_unicode_combining_class_t)_dretval;

    return _retval;
  }
  auto _funcCB = func ? &_funcCallback : null;
  auto _func = func ? freezeDelegate(cast(void*)&func) : null;
  GDestroyNotify _funcDestroyCB = func ? &thawDelegate : null;
  hb_unicode_funcs_set_combining_class_func(ufuncs ? cast(hb_unicode_funcs_t*)ufuncs._cPtr(No.Dup) : null, _funcCB, _func, _funcDestroyCB);
}

/**
    Sets the implementation function for #hb_unicode_compose_func_t.

    Params:
      ufuncs = A Unicode-functions structure
      func = The callback function to assign
*/
void unicodeFuncsSetComposeFunc(harfbuzz.unicode_funcs.UnicodeFuncs ufuncs, harfbuzz.types.UnicodeComposeFunc func)
{
  extern(C) hb_bool_t _funcCallback(hb_unicode_funcs_t* ufuncs, hb_codepoint_t a, hb_codepoint_t b, hb_codepoint_t* ab, void* userData)
  {
    harfbuzz.types.Bool _dretval;
    auto _dlg = cast(harfbuzz.types.UnicodeComposeFunc*)userData;

    _dretval = (*_dlg)(ufuncs ? new harfbuzz.unicode_funcs.UnicodeFuncs(cast(void*)ufuncs, No.Take) : null, a, b, *ab);
    auto _retval = cast(hb_bool_t)_dretval;

    return _retval;
  }
  auto _funcCB = func ? &_funcCallback : null;
  auto _func = func ? freezeDelegate(cast(void*)&func) : null;
  GDestroyNotify _funcDestroyCB = func ? &thawDelegate : null;
  hb_unicode_funcs_set_compose_func(ufuncs ? cast(hb_unicode_funcs_t*)ufuncs._cPtr(No.Dup) : null, _funcCB, _func, _funcDestroyCB);
}

/**
    Sets the implementation function for #hb_unicode_decompose_func_t.

    Params:
      ufuncs = A Unicode-functions structure
      func = The callback function to assign
*/
void unicodeFuncsSetDecomposeFunc(harfbuzz.unicode_funcs.UnicodeFuncs ufuncs, harfbuzz.types.UnicodeDecomposeFunc func)
{
  extern(C) hb_bool_t _funcCallback(hb_unicode_funcs_t* ufuncs, hb_codepoint_t ab, hb_codepoint_t* a, hb_codepoint_t* b, void* userData)
  {
    harfbuzz.types.Bool _dretval;
    auto _dlg = cast(harfbuzz.types.UnicodeDecomposeFunc*)userData;

    _dretval = (*_dlg)(ufuncs ? new harfbuzz.unicode_funcs.UnicodeFuncs(cast(void*)ufuncs, No.Take) : null, ab, *a, *b);
    auto _retval = cast(hb_bool_t)_dretval;

    return _retval;
  }
  auto _funcCB = func ? &_funcCallback : null;
  auto _func = func ? freezeDelegate(cast(void*)&func) : null;
  GDestroyNotify _funcDestroyCB = func ? &thawDelegate : null;
  hb_unicode_funcs_set_decompose_func(ufuncs ? cast(hb_unicode_funcs_t*)ufuncs._cPtr(No.Dup) : null, _funcCB, _func, _funcDestroyCB);
}

/**
    Sets the implementation function for #hb_unicode_eastasian_width_func_t.

    Params:
      ufuncs = a Unicode-function structure
      func = The callback function to assign
*/
void unicodeFuncsSetEastasianWidthFunc(harfbuzz.unicode_funcs.UnicodeFuncs ufuncs, harfbuzz.types.UnicodeEastasianWidthFunc func)
{
  extern(C) uint _funcCallback(hb_unicode_funcs_t* ufuncs, hb_codepoint_t unicode, void* userData)
  {
    auto _dlg = cast(harfbuzz.types.UnicodeEastasianWidthFunc*)userData;

    uint _retval = (*_dlg)(ufuncs ? new harfbuzz.unicode_funcs.UnicodeFuncs(cast(void*)ufuncs, No.Take) : null, unicode);
    return _retval;
  }
  auto _funcCB = func ? &_funcCallback : null;
  auto _func = func ? freezeDelegate(cast(void*)&func) : null;
  GDestroyNotify _funcDestroyCB = func ? &thawDelegate : null;
  hb_unicode_funcs_set_eastasian_width_func(ufuncs ? cast(hb_unicode_funcs_t*)ufuncs._cPtr(No.Dup) : null, _funcCB, _func, _funcDestroyCB);
}

/**
    Sets the implementation function for #hb_unicode_general_category_func_t.

    Params:
      ufuncs = A Unicode-functions structure
      func = The callback function to assign
*/
void unicodeFuncsSetGeneralCategoryFunc(harfbuzz.unicode_funcs.UnicodeFuncs ufuncs, harfbuzz.types.UnicodeGeneralCategoryFunc func)
{
  extern(C) hb_unicode_general_category_t _funcCallback(hb_unicode_funcs_t* ufuncs, hb_codepoint_t unicode, void* userData)
  {
    harfbuzz.types.UnicodeGeneralCategory _dretval;
    auto _dlg = cast(harfbuzz.types.UnicodeGeneralCategoryFunc*)userData;

    _dretval = (*_dlg)(ufuncs ? new harfbuzz.unicode_funcs.UnicodeFuncs(cast(void*)ufuncs, No.Take) : null, unicode);
    auto _retval = cast(hb_unicode_general_category_t)_dretval;

    return _retval;
  }
  auto _funcCB = func ? &_funcCallback : null;
  auto _func = func ? freezeDelegate(cast(void*)&func) : null;
  GDestroyNotify _funcDestroyCB = func ? &thawDelegate : null;
  hb_unicode_funcs_set_general_category_func(ufuncs ? cast(hb_unicode_funcs_t*)ufuncs._cPtr(No.Dup) : null, _funcCB, _func, _funcDestroyCB);
}

/**
    Sets the implementation function for #hb_unicode_mirroring_func_t.

    Params:
      ufuncs = A Unicode-functions structure
      func = The callback function to assign
*/
void unicodeFuncsSetMirroringFunc(harfbuzz.unicode_funcs.UnicodeFuncs ufuncs, harfbuzz.types.UnicodeMirroringFunc func)
{
  extern(C) hb_codepoint_t _funcCallback(hb_unicode_funcs_t* ufuncs, hb_codepoint_t unicode, void* userData)
  {
    harfbuzz.types.Codepoint _dretval;
    auto _dlg = cast(harfbuzz.types.UnicodeMirroringFunc*)userData;

    _dretval = (*_dlg)(ufuncs ? new harfbuzz.unicode_funcs.UnicodeFuncs(cast(void*)ufuncs, No.Take) : null, unicode);
    auto _retval = cast(hb_codepoint_t)_dretval;

    return _retval;
  }
  auto _funcCB = func ? &_funcCallback : null;
  auto _func = func ? freezeDelegate(cast(void*)&func) : null;
  GDestroyNotify _funcDestroyCB = func ? &thawDelegate : null;
  hb_unicode_funcs_set_mirroring_func(ufuncs ? cast(hb_unicode_funcs_t*)ufuncs._cPtr(No.Dup) : null, _funcCB, _func, _funcDestroyCB);
}

/**
    Sets the implementation function for #hb_unicode_script_func_t.

    Params:
      ufuncs = A Unicode-functions structure
      func = The callback function to assign
*/
void unicodeFuncsSetScriptFunc(harfbuzz.unicode_funcs.UnicodeFuncs ufuncs, harfbuzz.types.UnicodeScriptFunc func)
{
  extern(C) hb_script_t _funcCallback(hb_unicode_funcs_t* ufuncs, hb_codepoint_t unicode, void* userData)
  {
    harfbuzz.types.Script _dretval;
    auto _dlg = cast(harfbuzz.types.UnicodeScriptFunc*)userData;

    _dretval = (*_dlg)(ufuncs ? new harfbuzz.unicode_funcs.UnicodeFuncs(cast(void*)ufuncs, No.Take) : null, unicode);
    auto _retval = cast(hb_script_t)_dretval;

    return _retval;
  }
  auto _funcCB = func ? &_funcCallback : null;
  auto _func = func ? freezeDelegate(cast(void*)&func) : null;
  GDestroyNotify _funcDestroyCB = func ? &thawDelegate : null;
  hb_unicode_funcs_set_script_func(ufuncs ? cast(hb_unicode_funcs_t*)ufuncs._cPtr(No.Dup) : null, _funcCB, _func, _funcDestroyCB);
}

/**
    Retrieves the General Category (gc) property
    of code point unicode.

    Params:
      ufuncs = The Unicode-functions structure
      unicode = The code point to query
    Returns: The #hb_unicode_general_category_t of unicode
*/
harfbuzz.types.UnicodeGeneralCategory unicodeGeneralCategory(harfbuzz.unicode_funcs.UnicodeFuncs ufuncs, harfbuzz.types.Codepoint unicode)
{
  hb_unicode_general_category_t _cretval;
  _cretval = hb_unicode_general_category(ufuncs ? cast(hb_unicode_funcs_t*)ufuncs._cPtr(No.Dup) : null, unicode);
  harfbuzz.types.UnicodeGeneralCategory _retval = cast(harfbuzz.types.UnicodeGeneralCategory)_cretval;
  return _retval;
}

/**
    Retrieves the Bi-directional Mirroring Glyph code
    point defined for code point unicode.

    Params:
      ufuncs = The Unicode-functions structure
      unicode = The code point to query
    Returns: The #hb_codepoint_t of the Mirroring Glyph for unicode
*/
harfbuzz.types.Codepoint unicodeMirroring(harfbuzz.unicode_funcs.UnicodeFuncs ufuncs, harfbuzz.types.Codepoint unicode)
{
  harfbuzz.types.Codepoint _retval;
  _retval = hb_unicode_mirroring(ufuncs ? cast(hb_unicode_funcs_t*)ufuncs._cPtr(No.Dup) : null, unicode);
  return _retval;
}

/**
    Retrieves the #hb_script_t script to which code
    point unicode belongs.

    Params:
      ufuncs = The Unicode-functions structure
      unicode = The code point to query
    Returns: The #hb_script_t of unicode
*/
harfbuzz.types.Script unicodeScript(harfbuzz.unicode_funcs.UnicodeFuncs ufuncs, harfbuzz.types.Codepoint unicode)
{
  hb_script_t _cretval;
  _cretval = hb_unicode_script(ufuncs ? cast(hb_unicode_funcs_t*)ufuncs._cPtr(No.Dup) : null, unicode);
  harfbuzz.types.Script _retval = cast(harfbuzz.types.Script)_cretval;
  return _retval;
}

/**
    Parses a string into a #hb_variation_t.
    
    The format for specifying variation settings follows. All valid CSS
    font-variation-settings values other than 'normal' and 'inherited' are also
    accepted, though, not documented below.
    
    The format is a tag, optionally followed by an equals sign, followed by a
    number. For example `wght=500`, or `slnt=-7.5`.

    Params:
      str = a string to parse
      variation = the #hb_variation_t to initialize with the parsed values
    Returns: `true` if str is successfully parsed, `false` otherwise
*/
harfbuzz.types.Bool variationFromString(ubyte[] str, out harfbuzz.variation.Variation variation)
{
  harfbuzz.types.Bool _retval;
  int _len;
  if (str)
    _len = cast(int)str.length;

  auto _str = cast(const(ubyte)*)str.ptr;
  _retval = hb_variation_from_string(_str, _len, cast(hb_variation_t*)&variation);
  return _retval;
}
