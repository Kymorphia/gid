/// Module for [MultipartInputStream] class
module soup.multipart_input_stream;

import gid.gid;
import gio.async_result;
import gio.cancellable;
import gio.filter_input_stream;
import gio.input_stream;
import gio.pollable_input_stream;
import gio.pollable_input_stream_mixin;
import gio.types;
import glib.error;
import gobject.object;
import soup.c.functions;
import soup.c.types;
import soup.message;
import soup.message_headers;
import soup.types;

/**
    Handles streams of multipart messages.
    
    This adds support for the multipart responses. For handling the
    multiple parts the user needs to wrap the [gio.input_stream.InputStream] obtained by
    sending the request with a `class@MultipartInputStream` and use
    [soup.multipart_input_stream.MultipartInputStream.nextPart] before reading. Responses
    which are not wrapped will be treated like non-multipart responses.
    
    Note that although #SoupMultipartInputStream is a [gio.input_stream.InputStream],
    you should not read directly from it, and the results are undefined
    if you do.
*/
class MultipartInputStream : gio.filter_input_stream.FilterInputStream, gio.pollable_input_stream.PollableInputStream
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())soup_multipart_input_stream_get_type != &gidSymbolNotFound ? soup_multipart_input_stream_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override MultipartInputStream self()
  {
    return this;
  }

  mixin PollableInputStreamT!();

  /**
      Creates a new #SoupMultipartInputStream that wraps the
      [gio.input_stream.InputStream] obtained by sending the `classMessage`.
      
      Reads should not be done directly through this object, use the input streams
      returned by [soup.multipart_input_stream.MultipartInputStream.nextPart] or its async
      counterpart instead.
  
      Params:
        msg = the #SoupMessage the response is related to.
        baseStream = the #GInputStream returned by sending the request.
      Returns: a new #SoupMultipartInputStream
  */
  this(soup.message.Message msg, gio.input_stream.InputStream baseStream)
  {
    SoupMultipartInputStream* _cretval;
    _cretval = soup_multipart_input_stream_new(msg ? cast(SoupMessage*)msg._cPtr(No.Dup) : null, baseStream ? cast(GInputStream*)baseStream._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Obtains the headers for the part currently being processed.
      
      Note that the `structMessageHeaders` that are returned are owned by the
      #SoupMultipartInputStream and will be replaced when a call is made to
      [soup.multipart_input_stream.MultipartInputStream.nextPart] or its async counterpart, so if
      keeping the headers is required, a copy must be made.
      
      Note that if a part had no headers at all an empty `structMessageHeaders`
      will be returned.
      Returns: a #SoupMessageHeaders
          containing the headers for the part currently being processed or
          null if the headers failed to parse.
  */
  soup.message_headers.MessageHeaders getHeaders()
  {
    SoupMessageHeaders* _cretval;
    _cretval = soup_multipart_input_stream_get_headers(cast(SoupMultipartInputStream*)this._cPtr);
    auto _retval = _cretval ? new soup.message_headers.MessageHeaders(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Obtains an input stream for the next part.
      
      When dealing with a multipart response the input stream needs to be wrapped
      in a #SoupMultipartInputStream and this function or its async counterpart
      need to be called to obtain the first part for reading.
      
      After calling this function,
      [soup.multipart_input_stream.MultipartInputStream.getHeaders] can be used to obtain the
      headers for the first part. A read of 0 bytes indicates the end of
      the part; a new call to this function should be done at that point,
      to obtain the next part.
  
      Params:
        cancellable = a #GCancellable
      Returns: a new #GInputStream, or
          null if there are no more parts
      Throws: [ErrorWrap]
  */
  gio.input_stream.InputStream nextPart(gio.cancellable.Cancellable cancellable = null)
  {
    GInputStream* _cretval;
    GError *_err;
    _cretval = soup_multipart_input_stream_next_part(cast(SoupMultipartInputStream*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.input_stream.InputStream)(cast(GInputStream*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Obtains a [gio.input_stream.InputStream] for the next request.
      
      See [soup.multipart_input_stream.MultipartInputStream.nextPart] for details on the workflow.
  
      Params:
        ioPriority = the I/O priority for the request.
        cancellable = a #GCancellable.
        callback = callback to call when request is satisfied.
  */
  void nextPartAsync(int ioPriority, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    soup_multipart_input_stream_next_part_async(cast(SoupMultipartInputStream*)this._cPtr, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an asynchronous request for the next part.
  
      Params:
        result = a #GAsyncResult.
      Returns: a newly created
          [gio.input_stream.InputStream] for reading the next part or null if there are no
          more parts.
      Throws: [ErrorWrap]
  */
  gio.input_stream.InputStream nextPartFinish(gio.async_result.AsyncResult result)
  {
    GInputStream* _cretval;
    GError *_err;
    _cretval = soup_multipart_input_stream_next_part_finish(cast(SoupMultipartInputStream*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.input_stream.InputStream)(cast(GInputStream*)_cretval, Yes.Take);
    return _retval;
  }
}
