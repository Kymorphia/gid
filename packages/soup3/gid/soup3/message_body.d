/// Module for [MessageBody] class
module gid.soup3.message_body;

public import gid.core.basictypes;
import gid.core.gid;
import gid.glib2.bytes;
import gid.gobject2.boxed;
import gid.soup3.c.functions;
import gid.soup3.c.types;
import gid.soup3.types;

/**
    [gid.soup3.message_body.MessageBody] represents the request or response body of a
    [gid.soup3.message.Message].
    
    Note that while @length always reflects the full length of the
    message body, @data is normally null, and will only be filled in
    after [gid.soup3.message_body.MessageBody.flatten] is called. For client-side
    messages, this automatically happens for the response body after it
    has been fully read. Likewise, for server-side
    messages, the request body is automatically filled in after being
    read.
    
    As an added bonus, when @data is filled in, it is always terminated
    with a `\0` byte (which is not reflected in @length).
*/
class MessageBody : gid.gobject2.boxed.BoxedWrap!(soup_message_body_get_type)
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override MessageBody self() nothrow
  {
    return this;
  }

  /**
      Get `data` field.
      Returns: the data
  */
  @property ubyte[] data() nothrow
  {
    if (!(cast(SoupMessageBody*)this._cPtr).data)
      return null;

    return (cast(SoupMessageBody*)this._cPtr).data[0 .. (cast(SoupMessageBody*)this._cPtr).length].dup;
  }

  /**
      Creates a new [gid.soup3.message_body.MessageBody]
      
      [gid.soup3.message.Message] uses this internally; you
      will not normally need to call it yourself.
      Returns: a new #SoupMessageBody.
  */
  this() nothrow
  {
    SoupMessageBody* _cretval;
    _cretval = soup_message_body_new();
    this(_cretval, Yes.Take);
  }

  /**
      Appends the data from buffer to body.
  
      Params:
        buffer = a #GBytes
  */
  void appendBytes(gid.glib2.bytes.Bytes buffer) nothrow
  {
    soup_message_body_append_bytes(cast(SoupMessageBody*)this._cPtr, buffer ? cast(GBytes*)buffer._cPtr(No.Dup) : null);
  }

  /**
      Appends length bytes from data to body.
      
      This function is exactly equivalent to [gid.soup3.message_body.MessageBody.append]
      with [gid.soup3.types.MemoryUse.Take] as second argument; it exists mainly for
      convenience and simplifying language bindings.
  
      Params:
        data = data to append
  */
  void append(ubyte[] data) nothrow
  {
    size_t _length;
    if (data)
      _length = cast(size_t)data.length;

    auto _data = cast(ubyte*)gMalloc((data.length) * (ubyte).sizeof);
    _data[0 .. data.length] = data[];
    soup_message_body_append_take(cast(SoupMessageBody*)this._cPtr, _data, _length);
  }

  /**
      Tags body as being complete.
      
      Call this when using chunked encoding after you have appended the last chunk.
  */
  void complete() nothrow
  {
    soup_message_body_complete(cast(SoupMessageBody*)this._cPtr);
  }

  /**
      Fills in body's data field with a buffer containing all of the
      data in body.
      
      Adds an additional `\0` byte not counted by body's
      length field.
      Returns: a #GBytes containing the same data as body.
          (You must [gid.glib2.bytes.Bytes.unref] this if you do not want it.)
  */
  gid.glib2.bytes.Bytes flatten() nothrow
  {
    GBytes* _cretval;
    _cretval = soup_message_body_flatten(cast(SoupMessageBody*)this._cPtr);
    auto _retval = _cretval ? new gid.glib2.bytes.Bytes(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets the accumulate flag on body.
      
      See [methodMessageBody.set_accumulate. for details.
      Returns: the accumulate flag for body.
  */
  bool getAccumulate() nothrow
  {
    bool _retval;
    _retval = cast(bool)soup_message_body_get_accumulate(cast(SoupMessageBody*)this._cPtr);
    return _retval;
  }

  /**
      Gets a [gid.glib2.bytes.Bytes] containing data from body starting at offset.
      
      The size of the returned chunk is unspecified. You can iterate
      through the entire body by first calling
      [gid.soup3.message_body.MessageBody.getChunk] with an offset of 0, and then on each
      successive call, increment the offset by the length of the
      previously-returned chunk.
      
      If offset is greater than or equal to the total length of body,
      then the return value depends on whether or not
      [gid.soup3.message_body.MessageBody.complete] has been called or not; if it has,
      then [gid.soup3.message_body.MessageBody.getChunk] will return a 0-length chunk
      (indicating the end of body). If it has not, then
      [gid.soup3.message_body.MessageBody.getChunk] will return null (indicating that
      body may still potentially have more data, but that data is not
      currently available).
  
      Params:
        offset = an offset
      Returns: a #GBytes
  */
  gid.glib2.bytes.Bytes getChunk(long offset) nothrow
  {
    GBytes* _cretval;
    _cretval = soup_message_body_get_chunk(cast(SoupMessageBody*)this._cPtr, offset);
    auto _retval = _cretval ? new gid.glib2.bytes.Bytes(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Handles the [gid.soup3.message_body.MessageBody] part of receiving a chunk of data from
      the network.
      
      Normally this means appending chunk to body, exactly as with
      [gid.soup3.message_body.MessageBody.appendBytes], but if you have set body's accumulate
      flag to false, then that will not happen.
      
      This is a low-level method which you should not normally need to
      use.
  
      Params:
        chunk = a #GBytes received from the network
  */
  void gotChunk(gid.glib2.bytes.Bytes chunk) nothrow
  {
    soup_message_body_got_chunk(cast(SoupMessageBody*)this._cPtr, chunk ? cast(GBytes*)chunk._cPtr(No.Dup) : null);
  }

  /**
      Sets or clears the accumulate flag on body.
      
      (The default value is true.) If set to false, body's data field will not
      be filled in after the body is fully sent/received, and the chunks that make
      up body may be discarded when they are no longer needed.
      
      If you set the flag to false on the [gid.soup3.message.Message] request_body of a
      client-side message, it will block the accumulation of chunks into
      body's data field, but it will not normally cause the chunks to
      be discarded after being written like in the server-side
      [gid.soup3.message.Message] response_body case, because the request body needs to
      be kept around in case the request needs to be sent a second time
      due to redirection or authentication.
  
      Params:
        accumulate = whether or not to accumulate body chunks in body
  */
  void setAccumulate(bool accumulate) nothrow
  {
    soup_message_body_set_accumulate(cast(SoupMessageBody*)this._cPtr, accumulate);
  }

  /**
      Deletes all of the data in body.
  */
  void truncate() nothrow
  {
    soup_message_body_truncate(cast(SoupMessageBody*)this._cPtr);
  }

  /**
      Handles the [gid.soup3.message_body.MessageBody] part of writing a chunk of data to the
      network.
      
      Normally this is a no-op, but if you have set body's accumulate flag to
      false, then this will cause chunk to be discarded to free up memory.
      
      This is a low-level method which you should not need to use, and
      there are further restrictions on its proper use which are not
      documented here.
  
      Params:
        chunk = a #GBytes returned from [gid.soup3.message_body.MessageBody.getChunk]
  */
  void wroteChunk(gid.glib2.bytes.Bytes chunk) nothrow
  {
    soup_message_body_wrote_chunk(cast(SoupMessageBody*)this._cPtr, chunk ? cast(GBytes*)chunk._cPtr(No.Dup) : null);
  }
}
