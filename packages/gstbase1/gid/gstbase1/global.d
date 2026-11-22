/// Global functions for gstbase1 library
module gid.gstbase1.global;

import gid.core.utils;
import gid.gobject2.object;
import gid.gst1.buffer;
import gid.gst1.caps;
import gid.gst1.object;
import gid.gst1.pad;
import gid.gst1.type_find_factory;
import gid.gst1.types;
import gid.gstbase1.c.functions;
import gid.gstbase1.c.types;
import gid.gstbase1.types;


/**
    Tries to find what type of data is flowing from the given source #GstPad.
    
    Free-function: gst_caps_unref

    Params:
      src = A source #GstPad
      size = The length in bytes
    Returns: the #GstCaps corresponding to the data
          stream.  Returns null if no #GstCaps matches the data stream.
*/
gid.gst1.caps.Caps typeFindHelper(gid.gst1.pad.Pad src, ulong size) nothrow
{
  GstCaps* _cretval;
  _cretval = gst_type_find_helper(src ? cast(GstPad*)src._cPtr(No.Dup) : null, size);
  auto _retval = _cretval ? new gid.gst1.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Tries to find what type of data is contained in the given #GstBuffer, the
    assumption being that the buffer represents the beginning of the stream or
    file.
    
    All available typefinders will be called on the data in order of rank. If
    a typefinding function returns a probability of [gid.gst1.types.TypeFindProbability.Maximum],
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
          returned with [gid.gst1.caps.Caps.unref].
*/
gid.gst1.caps.Caps typeFindHelperForBuffer(gid.gst1.object.ObjectWrap obj, gid.gst1.buffer.Buffer buf, out gid.gst1.types.TypeFindProbability prob) nothrow
{
  GstCaps* _cretval;
  _cretval = gst_type_find_helper_for_buffer(obj ? cast(GstObject*)obj._cPtr(No.Dup) : null, buf ? cast(GstBuffer*)buf._cPtr(No.Dup) : null, &prob);
  auto _retval = _cretval ? new gid.gst1.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
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
          returned with [gid.gst1.caps.Caps.unref].
*/
gid.gst1.caps.Caps typeFindHelperForBufferWithCaps(gid.gst1.object.ObjectWrap obj, gid.gst1.buffer.Buffer buf, gid.gst1.caps.Caps caps, out gid.gst1.types.TypeFindProbability prob) nothrow
{
  GstCaps* _cretval;
  _cretval = gst_type_find_helper_for_buffer_with_caps(obj ? cast(GstObject*)obj._cPtr(No.Dup) : null, buf ? cast(GstBuffer*)buf._cPtr(No.Dup) : null, caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null, &prob);
  auto _retval = _cretval ? new gid.gst1.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Tries to find what type of data is contained in the given #GstBuffer, the
    assumption being that the buffer represents the beginning of the stream or
    file.
    
    All available typefinders will be called on the data in order of rank. If
    a typefinding function returns a probability of [gid.gst1.types.TypeFindProbability.Maximum],
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
          returned with [gid.gst1.caps.Caps.unref].
*/
gid.gst1.caps.Caps typeFindHelperForBufferWithExtension(gid.gst1.object.ObjectWrap obj, gid.gst1.buffer.Buffer buf, string extension, out gid.gst1.types.TypeFindProbability prob) nothrow
{
  GstCaps* _cretval;
  const(char)* _extension = extension.toCString!(No.Malloc, Yes.Nullable);
  _cretval = gst_type_find_helper_for_buffer_with_extension(obj ? cast(GstObject*)obj._cPtr(No.Dup) : null, buf ? cast(GstBuffer*)buf._cPtr(No.Dup) : null, _extension, &prob);
  auto _retval = _cretval ? new gid.gst1.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Tries to find what type of data is contained in the given data, the
    assumption being that the data represents the beginning of the stream or
    file.
    
    All available typefinders will be called on the data in order of rank. If
    a typefinding function returns a probability of [gid.gst1.types.TypeFindProbability.Maximum],
    typefinding is stopped immediately and the found caps will be returned
    right away. Otherwise, all available typefind functions will the tried,
    and the caps with the highest probability will be returned, or null if
    the content of data could not be identified.
    
    Free-function: gst_caps_unref

    Params:
      obj = object doing the typefinding, or null (used for logging)
      data = * a pointer with data to typefind
      prob = location to store the probability of the found
            caps, or null
    Returns: the #GstCaps corresponding to the data,
          or null if no type could be found. The caller should free the caps
          returned with [gid.gst1.caps.Caps.unref].
*/
gid.gst1.caps.Caps typeFindHelperForData(gid.gst1.object.ObjectWrap obj, ubyte[] data, out gid.gst1.types.TypeFindProbability prob) nothrow
{
  GstCaps* _cretval;
  size_t _size;
  if (data)
    _size = cast(size_t)data.length;

  auto _data = cast(ubyte*)data.ptr;
  _cretval = gst_type_find_helper_for_data(obj ? cast(GstObject*)obj._cPtr(No.Dup) : null, _data, _size, &prob);
  auto _retval = _cretval ? new gid.gst1.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
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
          returned with [gid.gst1.caps.Caps.unref].
*/
gid.gst1.caps.Caps typeFindHelperForDataWithCaps(gid.gst1.object.ObjectWrap obj, ubyte[] data, gid.gst1.caps.Caps caps, out gid.gst1.types.TypeFindProbability prob) nothrow
{
  GstCaps* _cretval;
  size_t _size;
  if (data)
    _size = cast(size_t)data.length;

  auto _data = cast(ubyte*)data.ptr;
  _cretval = gst_type_find_helper_for_data_with_caps(obj ? cast(GstObject*)obj._cPtr(No.Dup) : null, _data, _size, caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null, &prob);
  auto _retval = _cretval ? new gid.gst1.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Tries to find what type of data is contained in the given data, the
    assumption being that the data represents the beginning of the stream or
    file.
    
    All available typefinders will be called on the data in order of rank. If
    a typefinding function returns a probability of [gid.gst1.types.TypeFindProbability.Maximum],
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
      data = * a pointer with data to typefind
      extension = extension of the media, or null
      prob = location to store the probability of the found
            caps, or null
    Returns: the #GstCaps corresponding to the data,
          or null if no type could be found. The caller should free the caps
          returned with [gid.gst1.caps.Caps.unref].
*/
gid.gst1.caps.Caps typeFindHelperForDataWithExtension(gid.gst1.object.ObjectWrap obj, ubyte[] data, string extension, out gid.gst1.types.TypeFindProbability prob) nothrow
{
  GstCaps* _cretval;
  size_t _size;
  if (data)
    _size = cast(size_t)data.length;

  auto _data = cast(ubyte*)data.ptr;
  const(char)* _extension = extension.toCString!(No.Malloc, Yes.Nullable);
  _cretval = gst_type_find_helper_for_data_with_extension(obj ? cast(GstObject*)obj._cPtr(No.Dup) : null, _data, _size, _extension, &prob);
  auto _retval = _cretval ? new gid.gst1.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
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
          the caps returned with [gid.gst1.caps.Caps.unref].
*/
gid.gst1.caps.Caps typeFindHelperForExtension(gid.gst1.object.ObjectWrap obj, string extension) nothrow
{
  GstCaps* _cretval;
  const(char)* _extension = extension.toCString!(No.Malloc, No.Nullable);
  _cretval = gst_type_find_helper_for_extension(obj ? cast(GstObject*)obj._cPtr(No.Dup) : null, _extension);
  auto _retval = _cretval ? new gid.gst1.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Utility function to do pull-based typefinding. Unlike [gid.gstbase1.global.typeFindHelper]
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
gid.gst1.caps.Caps typeFindHelperGetRange(gid.gst1.object.ObjectWrap obj, gid.gst1.object.ObjectWrap parent, gid.gstbase1.types.TypeFindHelperGetRangeFunction func, ulong size, string extension, out gid.gst1.types.TypeFindProbability prob) nothrow
{
  static gid.gstbase1.types.TypeFindHelperGetRangeFunction _static_func;

  extern(C) GstFlowReturn _funcCallback(GstObject* obj, GstObject* parent, ulong offset, uint length, GstBuffer** buffer) nothrow
  {
    gid.gst1.types.FlowReturn _dretval;
    gid.gst1.buffer.Buffer _buffer;

    try
    {
      _dretval = _static_func(gid.gobject2.object.ObjectWrap._getDObject!(gid.gst1.object.ObjectWrap)(cast(void*)obj, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gst1.object.ObjectWrap)(cast(void*)parent, No.Take), offset, length, _buffer);
    }
    catch (Exception e)
    {
      gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.types.TypeFindHelperGetRangeFunction");
    }
    auto _retval = cast(GstFlowReturn)_dretval;
    *buffer = _buffer ? cast(GstBuffer*)_buffer._cPtr(Yes.Dup) : null;

    return _retval;
  }
  auto _funcCB = func ? &_funcCallback : null;
  _static_func = func;
  GstCaps* _cretval;
  const(char)* _extension = extension.toCString!(No.Malloc, Yes.Nullable);
  _cretval = gst_type_find_helper_get_range(obj ? cast(GstObject*)obj._cPtr(No.Dup) : null, parent ? cast(GstObject*)parent._cPtr(No.Dup) : null, _funcCB, size, _extension, &prob);
  _static_func = null;
  auto _retval = _cretval ? new gid.gst1.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Utility function to do pull-based typefinding. Unlike [gid.gstbase1.global.typeFindHelper]
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
    Returns: the last [gid.gst1.types.FlowReturn] from pulling a buffer or [gid.gst1.types.FlowReturn.Ok] if
               typefinding was successful.
*/
gid.gst1.types.FlowReturn typeFindHelperGetRangeFull(gid.gst1.object.ObjectWrap obj, gid.gst1.object.ObjectWrap parent, gid.gstbase1.types.TypeFindHelperGetRangeFunction func, ulong size, string extension, out gid.gst1.caps.Caps caps, out gid.gst1.types.TypeFindProbability prob) nothrow
{
  static gid.gstbase1.types.TypeFindHelperGetRangeFunction _static_func;

  extern(C) GstFlowReturn _funcCallback(GstObject* obj, GstObject* parent, ulong offset, uint length, GstBuffer** buffer) nothrow
  {
    gid.gst1.types.FlowReturn _dretval;
    gid.gst1.buffer.Buffer _buffer;

    try
    {
      _dretval = _static_func(gid.gobject2.object.ObjectWrap._getDObject!(gid.gst1.object.ObjectWrap)(cast(void*)obj, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gst1.object.ObjectWrap)(cast(void*)parent, No.Take), offset, length, _buffer);
    }
    catch (Exception e)
    {
      gidInvokeCallbackExceptionHandler(e, "gid.gstbase1.types.TypeFindHelperGetRangeFunction");
    }
    auto _retval = cast(GstFlowReturn)_dretval;
    *buffer = _buffer ? cast(GstBuffer*)_buffer._cPtr(Yes.Dup) : null;

    return _retval;
  }
  auto _funcCB = func ? &_funcCallback : null;
  _static_func = func;
  GstFlowReturn _cretval;
  const(char)* _extension = extension.toCString!(No.Malloc, Yes.Nullable);
  GstCaps* _caps;
  _cretval = gst_type_find_helper_get_range_full(obj ? cast(GstObject*)obj._cPtr(No.Dup) : null, parent ? cast(GstObject*)parent._cPtr(No.Dup) : null, _funcCB, size, _extension, &_caps, &prob);
  _static_func = null;
  gid.gst1.types.FlowReturn _retval = cast(gid.gst1.types.FlowReturn)_cretval;
  if (_caps)
    caps = new gid.gst1.caps.Caps(cast(void*)_caps, Yes.Take);
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
               found. Caller should free the returned list with [gid.glib2.list.List.free]
               and list elements with [gid.gst1.object.ObjectWrap.unref].
*/
gid.gst1.type_find_factory.TypeFindFactory[] typeFindListFactoriesForCaps(gid.gst1.object.ObjectWrap obj, gid.gst1.caps.Caps caps) nothrow
{
  GList* _cretval;
  _cretval = gst_type_find_list_factories_for_caps(obj ? cast(GstObject*)obj._cPtr(No.Dup) : null, caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null);
  auto _retval = gListToD!(gid.gst1.type_find_factory.TypeFindFactory, GidOwnership.Full)(cast(GList*)_cretval);
  return _retval;
}
