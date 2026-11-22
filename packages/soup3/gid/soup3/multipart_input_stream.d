/// Module for [MultipartInputStream] class
module gid.soup3.multipart_input_stream;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.async_result;
import gid.gio2.cancellable;
import gid.gio2.filter_input_stream;
import gid.gio2.input_stream;
import gid.gio2.pollable_input_stream;
import gid.gio2.pollable_input_stream_mixin;
import gid.gio2.types;
import gid.glib2.error;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.soup3.c.functions;
import gid.soup3.c.types;
import gid.soup3.message;
import gid.soup3.message_headers;
import gid.soup3.types;

/**
    Handles streams of multipart messages.
    
    This adds support for the multipart responses. For handling the
    multiple parts the user needs to wrap the [gid.gio2.input_stream.InputStream] obtained by
    sending the request with a [gid.soup3.multipart_input_stream.MultipartInputStream] and use
    [gid.soup3.multipart_input_stream.MultipartInputStream.nextPart] before reading. Responses
    which are not wrapped will be treated like non-multipart responses.
    
    Note that although [gid.soup3.multipart_input_stream.MultipartInputStream] is a [gid.gio2.input_stream.InputStream],
    you should not read directly from it, and the results are undefined
    if you do.
*/
class MultipartInputStream : gid.gio2.filter_input_stream.FilterInputStream, gid.gio2.pollable_input_stream.PollableInputStream
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())soup_multipart_input_stream_get_type != &gidSymbolNotFound ? soup_multipart_input_stream_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "SoupMultipartInputStream";
  }

  /** Returns `this`, for use in `with` statements. */
  override MultipartInputStream self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.soup3.multipart_input_stream.MultipartInputStream]
      Returns: New builder object
  */
  static MultipartInputStreamGidBuilder builder() nothrow
  {
    return new MultipartInputStreamGidBuilder;
  }

  /**
      Get `message` property.
      Returns: The [gid.soup3.message.Message].
  */
  @property gid.soup3.message.Message message() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.soup3.message.Message)("message");
  }

  mixin PollableInputStreamT!();

  /**
      Creates a new [gid.soup3.multipart_input_stream.MultipartInputStream] that wraps the
      [gid.gio2.input_stream.InputStream] obtained by sending the [gid.soup3.message.Message].
      
      Reads should not be done directly through this object, use the input streams
      returned by [gid.soup3.multipart_input_stream.MultipartInputStream.nextPart] or its async
      counterpart instead.
  
      Params:
        msg = the #SoupMessage the response is related to.
        baseStream = the #GInputStream returned by sending the request.
      Returns: a new #SoupMultipartInputStream
  */
  this(gid.soup3.message.Message msg, gid.gio2.input_stream.InputStream baseStream) nothrow
  {
    SoupMultipartInputStream* _cretval;
    _cretval = soup_multipart_input_stream_new(msg ? cast(SoupMessage*)msg._cPtr(No.Dup) : null, baseStream ? cast(GInputStream*)baseStream._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Obtains the headers for the part currently being processed.
      
      Note that the [gid.soup3.message_headers.MessageHeaders] that are returned are owned by the
      [gid.soup3.multipart_input_stream.MultipartInputStream] and will be replaced when a call is made to
      [gid.soup3.multipart_input_stream.MultipartInputStream.nextPart] or its async counterpart, so if
      keeping the headers is required, a copy must be made.
      
      Note that if a part had no headers at all an empty [gid.soup3.message_headers.MessageHeaders]
      will be returned.
      Returns: a #SoupMessageHeaders
          containing the headers for the part currently being processed or
          null if the headers failed to parse.
  */
  gid.soup3.message_headers.MessageHeaders getHeaders() nothrow
  {
    SoupMessageHeaders* _cretval;
    _cretval = soup_multipart_input_stream_get_headers(cast(SoupMultipartInputStream*)this._cPtr);
    auto _retval = _cretval ? new gid.soup3.message_headers.MessageHeaders(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Obtains an input stream for the next part.
      
      When dealing with a multipart response the input stream needs to be wrapped
      in a [gid.soup3.multipart_input_stream.MultipartInputStream] and this function or its async counterpart
      need to be called to obtain the first part for reading.
      
      After calling this function,
      [gid.soup3.multipart_input_stream.MultipartInputStream.getHeaders] can be used to obtain the
      headers for the first part. A read of 0 bytes indicates the end of
      the part; a new call to this function should be done at that point,
      to obtain the next part.
      
      error will only be set if an error happens during a read, null
      is a valid return value otherwise.
  
      Params:
        cancellable = a #GCancellable
      Returns: a new #GInputStream, or
          null if there are no more parts
      Throws: [ErrorWrap]
  */
  gid.gio2.input_stream.InputStream nextPart(gid.gio2.cancellable.Cancellable cancellable = null)
  {
    GInputStream* _cretval;
    GError *_err;
    _cretval = soup_multipart_input_stream_next_part(cast(SoupMultipartInputStream*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.input_stream.InputStream)(cast(GInputStream*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Obtains a [gid.gio2.input_stream.InputStream] for the next request.
      
      See [gid.soup3.multipart_input_stream.MultipartInputStream.nextPart] for details on the workflow.
  
      Params:
        ioPriority = the I/O priority for the request.
        cancellable = a #GCancellable.
        callback = callback to call when request is satisfied.
  */
  void nextPartAsync(int ioPriority, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data) nothrow
    {
      ptrThawGC(data);
      auto _dlg = cast(gid.gio2.types.AsyncReadyCallback*)data;

      try
      {
        (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)res, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.types.AsyncReadyCallback");
      }
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
          [gid.gio2.input_stream.InputStream] for reading the next part or null if there are no
          more parts.
      Throws: [ErrorWrap]
  */
  gid.gio2.input_stream.InputStream nextPartFinish(gid.gio2.async_result.AsyncResult result)
  {
    GInputStream* _cretval;
    GError *_err;
    _cretval = soup_multipart_input_stream_next_part_finish(cast(SoupMultipartInputStream*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.input_stream.InputStream)(cast(GInputStream*)_cretval, Yes.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.soup3.multipart_input_stream.MultipartInputStream]
class MultipartInputStreamGidBuilderImpl(T) : gid.gio2.filter_input_stream.FilterInputStreamGidBuilderImpl!T, gid.gio2.pollable_input_stream.PollableInputStreamGidBuilderImpl!T
{

  mixin PollableInputStreamGidBuilderT!();

  /**
      Set `message` property.
      Params:
        propval = The [gid.soup3.message.Message].
      Returns: Builder instance for fluent chaining
  */
  T message(gid.soup3.message.Message propval) nothrow
  {
    return setProperty("message", propval);
  }
}

/// Fluent builder for [gid.soup3.multipart_input_stream.MultipartInputStream]
final class MultipartInputStreamGidBuilder : MultipartInputStreamGidBuilderImpl!MultipartInputStreamGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  MultipartInputStream build() nothrow
  {
    return new MultipartInputStream(cast(void*)createGObject(MultipartInputStream._getGType), Yes.Take);
  }
}
