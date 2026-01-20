/// Global functions for gstbase1 library
module gstbase.global;

import gid.gid;
import gobject.object;
import gst.buffer;
import gst.caps;
import gst.object;
import gst.pad;
import gst.type_find_factory;
import gst.types;
import gstbase.c.functions;
import gstbase.c.types;
import gstbase.types;


/**
    Tries to find what type of data is flowing from the given source #GstPad.
    
    Free-function: gst_caps_unref

    Params:
      src = A source #GstPad
      size = The length in bytes
    Returns: the #GstCaps corresponding to the data
          stream.  Returns null if no #GstCaps matches the data stream.
*/
gst.caps.Caps typeFindHelper(gst.pad.Pad src, ulong size)
{
  GstCaps* _cretval;
  _cretval = gst_type_find_helper(src ? cast(GstPad*)src._cPtr(No.Dup) : null, size);
  auto _retval = _cretval ? new gst.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Tries to find what type of data is contained in the given #GstBuffer, the
    assumption being that the buffer represents the beginning of the stream or
    file.
    
    All available typefinders will be called on the data in order of rank. If
    a typefinding function returns a probability of [gst.types.TypeFindProbability.Maximum],
    typefinding is stopped immediately and the found caps will be returned
    right away. Otherwise, all available typefind functions will the tried,
    and the caps with the highest probability will be returned, or null if
    the content of the buffer could not be identified.
    
    Free-function: gst_caps_unref

    Params:
      obj = object doing the typefinding, or null (used for logging)
      buf = a #GstBuffer with data to typefind
      prob = location to store the probability of the found
            caps, or null
    Returns: the #GstCaps corresponding to the data,
          or null if no type could be found. The caller should free the caps
          returned with gst_caps_unref().
*/
gst.caps.Caps typeFindHelperForBuffer(gst.object.ObjectWrap obj, gst.buffer.Buffer buf, out gst.types.TypeFindProbability prob)
{
  GstCaps* _cretval;
  _cretval = gst_type_find_helper_for_buffer(obj ? cast(GstObject*)obj._cPtr(No.Dup) : null, buf ? cast(GstBuffer*)buf._cPtr(No.Dup) : null, &prob);
  auto _retval = _cretval ? new gst.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Tries to find if type of media contained in the given #GstBuffer, matches
    caps specified, assumption being that the buffer represents the beginning
    of the stream or file.
    
    Tries to find what type of data is contained in the given data, the
    assumption being that the data represents the beginning of the stream or
    file.
    
    Only the typefinder matching the given caps will be called, if found. The
    caps with the highest probability will be returned, or null if the content
    of the data could not be identified.
    
    Free-function: gst_caps_unref

    Params:
      obj = object doing the typefinding, or null (used for logging)
      buf = a #GstBuffer with data to typefind
      caps = caps of the media
      prob = location to store the probability of the found
            caps, or null
    Returns: the #GstCaps corresponding to the data,
          or null if no type could be found. The caller should free the caps
          returned with gst_caps_unref().
*/
gst.caps.Caps typeFindHelperForBufferWithCaps(gst.object.ObjectWrap obj, gst.buffer.Buffer buf, gst.caps.Caps caps, out gst.types.TypeFindProbability prob)
{
  GstCaps* _cretval;
  _cretval = gst_type_find_helper_for_buffer_with_caps(obj ? cast(GstObject*)obj._cPtr(No.Dup) : null, buf ? cast(GstBuffer*)buf._cPtr(No.Dup) : null, caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null, &prob);
  auto _retval = _cretval ? new gst.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Tries to find what type of data is contained in the given #GstBuffer, the
    assumption being that the buffer represents the beginning of the stream or
    file.
    
    All available typefinders will be called on the data in order of rank. If
    a typefinding function returns a probability of [gst.types.TypeFindProbability.Maximum],
    typefinding is stopped immediately and the found caps will be returned
    right away. Otherwise, all available typefind functions will the tried,
    and the caps with the highest probability will be returned, or null if
    the content of the buffer could not be identified.
    
    When extension is not null, this function will first try the typefind
    functions for the given extension, which might speed up the typefinding
    in many cases.
    
    Free-function: gst_caps_unref

    Params:
      obj = object doing the typefinding, or null (used for logging)
      buf = a #GstBuffer with data to typefind
      extension = extension of the media, or null
      prob = location to store the probability of the found
            caps, or null
    Returns: the #GstCaps corresponding to the data,
          or null if no type could be found. The caller should free the caps
          returned with gst_caps_unref().
*/
gst.caps.Caps typeFindHelperForBufferWithExtension(gst.object.ObjectWrap obj, gst.buffer.Buffer buf, string extension, out gst.types.TypeFindProbability prob)
{
  GstCaps* _cretval;
  const(char)* _extension = extension.toCString(No.Alloc);
  _cretval = gst_type_find_helper_for_buffer_with_extension(obj ? cast(GstObject*)obj._cPtr(No.Dup) : null, buf ? cast(GstBuffer*)buf._cPtr(No.Dup) : null, _extension, &prob);
  auto _retval = _cretval ? new gst.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Tries to find what type of data is contained in the given data, the
    assumption being that the data represents the beginning of the stream or
    file.
    
    All available typefinders will be called on the data in order of rank. If
    a typefinding function returns a probability of [gst.types.TypeFindProbability.Maximum],
    typefinding is stopped immediately and the found caps will be returned
    right away. Otherwise, all available typefind functions will the tried,
    and the caps with the highest probability will be returned, or null if
    the content of data could not be identified.
    
    Free-function: gst_caps_unref

    Params:
      obj = object doing the typefinding, or null (used for logging)
      data = $(LIST
          * a pointer with data to typefind
        )
      prob = location to store the probability of the found
            caps, or null
    Returns: the #GstCaps corresponding to the data,
          or null if no type could be found. The caller should free the caps
          returned with gst_caps_unref().
*/
gst.caps.Caps typeFindHelperForData(gst.object.ObjectWrap obj, ubyte[] data, out gst.types.TypeFindProbability prob)
{
  GstCaps* _cretval;
  size_t _size;
  if (data)
    _size = cast(size_t)data.length;

  auto _data = cast(const(ubyte)*)data.ptr;
  _cretval = gst_type_find_helper_for_data(obj ? cast(GstObject*)obj._cPtr(No.Dup) : null, _data, _size, &prob);
  auto _retval = _cretval ? new gst.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Tries to find if type of media contained in the given data, matches the
    caps specified, assumption being that the data represents the beginning
    of the stream or file.
    
    Only the typefinder matching the given caps will be called, if found. The
    caps with the highest probability will be returned, or null if the content
    of the data could not be identified.
    
    Free-function: gst_caps_unref

    Params:
      obj = object doing the typefinding, or null (used for logging)
      data = a pointer with data to typefind
      caps = caps of the media
      prob = location to store the probability of the found
            caps, or null
    Returns: the #GstCaps corresponding to the data,
          or null if no type could be found. The caller should free the caps
          returned with gst_caps_unref().
*/
gst.caps.Caps typeFindHelperForDataWithCaps(gst.object.ObjectWrap obj, ubyte[] data, gst.caps.Caps caps, out gst.types.TypeFindProbability prob)
{
  GstCaps* _cretval;
  size_t _size;
  if (data)
    _size = cast(size_t)data.length;

  auto _data = cast(const(ubyte)*)data.ptr;
  _cretval = gst_type_find_helper_for_data_with_caps(obj ? cast(GstObject*)obj._cPtr(No.Dup) : null, _data, _size, caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null, &prob);
  auto _retval = _cretval ? new gst.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Tries to find what type of data is contained in the given data, the
    assumption being that the data represents the beginning of the stream or
    file.
    
    All available typefinders will be called on the data in order of rank. If
    a typefinding function returns a probability of [gst.types.TypeFindProbability.Maximum],
    typefinding is stopped immediately and the found caps will be returned
    right away. Otherwise, all available typefind functions will the tried,
    and the caps with the highest probability will be returned, or null if
    the content of data could not be identified.
    
    When extension is not null, this function will first try the typefind
    functions for the given extension, which might speed up the typefinding
    in many cases.
    
    Free-function: gst_caps_unref

    Params:
      obj = object doing the typefinding, or null (used for logging)
      data = $(LIST
          * a pointer with data to typefind
        )
      extension = extension of the media, or null
      prob = location to store the probability of the found
            caps, or null
    Returns: the #GstCaps corresponding to the data,
          or null if no type could be found. The caller should free the caps
          returned with gst_caps_unref().
*/
gst.caps.Caps typeFindHelperForDataWithExtension(gst.object.ObjectWrap obj, ubyte[] data, string extension, out gst.types.TypeFindProbability prob)
{
  GstCaps* _cretval;
  size_t _size;
  if (data)
    _size = cast(size_t)data.length;

  auto _data = cast(const(ubyte)*)data.ptr;
  const(char)* _extension = extension.toCString(No.Alloc);
  _cretval = gst_type_find_helper_for_data_with_extension(obj ? cast(GstObject*)obj._cPtr(No.Dup) : null, _data, _size, _extension, &prob);
  auto _retval = _cretval ? new gst.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Tries to find the best #GstCaps associated with extension.
    
    All available typefinders will be checked against the extension in order
    of rank. The caps of the first typefinder that can handle extension will be
    returned.
    
    Free-function: gst_caps_unref

    Params:
      obj = object doing the typefinding, or null (used for logging)
      extension = an extension
    Returns: the #GstCaps corresponding to
          extension, or null if no type could be found. The caller should free
          the caps returned with gst_caps_unref().
*/
gst.caps.Caps typeFindHelperForExtension(gst.object.ObjectWrap obj, string extension)
{
  GstCaps* _cretval;
  const(char)* _extension = extension.toCString(No.Alloc);
  _cretval = gst_type_find_helper_for_extension(obj ? cast(GstObject*)obj._cPtr(No.Dup) : null, _extension);
  auto _retval = _cretval ? new gst.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Utility function to do pull-based typefinding. Unlike [gstbase.global.typeFindHelper]
    however, this function will use the specified function func to obtain the
    data needed by the typefind functions, rather than operating on a given
    source pad. This is useful mostly for elements like tag demuxers which
    strip off data at the beginning and/or end of a file and want to typefind
    the stripped data stream before adding their own source pad (the specified
    callback can then call the upstream peer pad with offsets adjusted for the
    tag size, for example).
    
    When extension is not null, this function will first try the typefind
    functions for the given extension, which might speed up the typefinding
    in many cases.
    
    Free-function: gst_caps_unref

    Params:
      obj = A #GstObject that will be passed as first argument to func
      parent = the parent of obj or null
      func = A generic #GstTypeFindHelperGetRangeFunction that will
               be used to access data at random offsets when doing the typefinding
      size = The length in bytes
      extension = extension of the media, or null
      prob = location to store the probability of the found
            caps, or null
    Returns: the #GstCaps corresponding to the data
          stream.  Returns null if no #GstCaps matches the data stream.
*/
gst.caps.Caps typeFindHelperGetRange(gst.object.ObjectWrap obj, gst.object.ObjectWrap parent, gstbase.types.TypeFindHelperGetRangeFunction func, ulong size, string extension, out gst.types.TypeFindProbability prob)
{
  static gstbase.types.TypeFindHelperGetRangeFunction _static_func;

  extern(C) GstFlowReturn _funcCallback(GstObject* obj, GstObject* parent, ulong offset, uint length, GstBuffer** buffer)
  {
    gst.types.FlowReturn _dretval;
    auto _buffer = new gst.buffer.Buffer(buffer, No.Take);

    _dretval = _static_func(gobject.object.ObjectWrap._getDObject!(gst.object.ObjectWrap)(cast(void*)obj, No.Take), gobject.object.ObjectWrap._getDObject!(gst.object.ObjectWrap)(cast(void*)parent, No.Take), offset, length, _buffer);
    auto _retval = cast(GstFlowReturn)_dretval;
    *buffer = *cast(GstBuffer**)_buffer._cPtr;

    return _retval;
  }
  auto _funcCB = func ? &_funcCallback : null;
  _static_func = func;
  GstCaps* _cretval;
  const(char)* _extension = extension.toCString(No.Alloc);
  _cretval = gst_type_find_helper_get_range(obj ? cast(GstObject*)obj._cPtr(No.Dup) : null, parent ? cast(GstObject*)parent._cPtr(No.Dup) : null, _funcCB, size, _extension, &prob);
  _static_func = null;
  auto _retval = _cretval ? new gst.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Utility function to do pull-based typefinding. Unlike [gstbase.global.typeFindHelper]
    however, this function will use the specified function func to obtain the
    data needed by the typefind functions, rather than operating on a given
    source pad. This is useful mostly for elements like tag demuxers which
    strip off data at the beginning and/or end of a file and want to typefind
    the stripped data stream before adding their own source pad (the specified
    callback can then call the upstream peer pad with offsets adjusted for the
    tag size, for example).
    
    When extension is not null, this function will first try the typefind
    functions for the given extension, which might speed up the typefinding
    in many cases.

    Params:
      obj = A #GstObject that will be passed as first argument to func
      parent = the parent of obj or null
      func = A generic #GstTypeFindHelperGetRangeFunction that will
               be used to access data at random offsets when doing the typefinding
      size = The length in bytes
      extension = extension of the media, or null
      caps = returned caps
      prob = location to store the probability of the found
            caps, or null
    Returns: the last [gst.types.FlowReturn] from pulling a buffer or [gst.types.FlowReturn.Ok] if
               typefinding was successful.
*/
gst.types.FlowReturn typeFindHelperGetRangeFull(gst.object.ObjectWrap obj, gst.object.ObjectWrap parent, gstbase.types.TypeFindHelperGetRangeFunction func, ulong size, string extension, out gst.caps.Caps caps, out gst.types.TypeFindProbability prob)
{
  static gstbase.types.TypeFindHelperGetRangeFunction _static_func;

  extern(C) GstFlowReturn _funcCallback(GstObject* obj, GstObject* parent, ulong offset, uint length, GstBuffer** buffer)
  {
    gst.types.FlowReturn _dretval;
    auto _buffer = new gst.buffer.Buffer(buffer, No.Take);

    _dretval = _static_func(gobject.object.ObjectWrap._getDObject!(gst.object.ObjectWrap)(cast(void*)obj, No.Take), gobject.object.ObjectWrap._getDObject!(gst.object.ObjectWrap)(cast(void*)parent, No.Take), offset, length, _buffer);
    auto _retval = cast(GstFlowReturn)_dretval;
    *buffer = *cast(GstBuffer**)_buffer._cPtr;

    return _retval;
  }
  auto _funcCB = func ? &_funcCallback : null;
  _static_func = func;
  GstFlowReturn _cretval;
  const(char)* _extension = extension.toCString(No.Alloc);
  GstCaps* _caps;
  _cretval = gst_type_find_helper_get_range_full(obj ? cast(GstObject*)obj._cPtr(No.Dup) : null, parent ? cast(GstObject*)parent._cPtr(No.Dup) : null, _funcCB, size, _extension, &_caps, &prob);
  _static_func = null;
  gst.types.FlowReturn _retval = cast(gst.types.FlowReturn)_cretval;
  caps = new gst.caps.Caps(cast(void*)_caps, Yes.Take);
  return _retval;
}

/**
    Tries to find the best #GstTypeFindFactory associated with caps.
    
    The typefinder that can handle caps will be returned.
    
    Free-function: g_list_free

    Params:
      obj = object doing the typefinding, or null (used for logging)
      caps = caps of the media
    Returns: the list of #GstTypeFindFactory
               corresponding to caps, or null if no typefinder could be
               found. Caller should free the returned list with [glib.list.List.free]
               and list elements with [gst.object.ObjectWrap.unref].
*/
gst.type_find_factory.TypeFindFactory[] typeFindListFactoriesForCaps(gst.object.ObjectWrap obj, gst.caps.Caps caps)
{
  GList* _cretval;
  _cretval = gst_type_find_list_factories_for_caps(obj ? cast(GstObject*)obj._cPtr(No.Dup) : null, caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null);
  auto _retval = gListToD!(gst.type_find_factory.TypeFindFactory, GidOwnership.Full)(cast(GList*)_cretval);
  return _retval;
}
