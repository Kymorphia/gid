/// Module for [MessageBody] class
module soup.message_body;

import gid.gid;
import glib.bytes;
import gobject.boxed;
import soup.c.functions;
import soup.c.types;
import soup.types;

/**
    #SoupMessageBody represents the request or response body of a
    `class@Message`.
    
    Note that while @length always reflects the full length of the
    message body, @data is normally null, and will only be filled in
    after [soup.message_body.MessageBody.flatten] is called. For client-side
    messages, this automatically happens for the response body after it
    has been fully read. Likewise, for server-side
    messages, the request body is automatically filled in after being
    read.
    
    As an added bonus, when @data is filled in, it is always terminated
    with a `\0` byte (which is not reflected in @length).
*/
class MessageBody : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())soup_message_body_get_type != &gidSymbolNotFound ? soup_message_body_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override MessageBody self()
  {
    return this;
  }

  /**
      Get `length` field.
      Returns: length of @data
  */
  @property long length()
  {
    return (cast(SoupMessageBody*)this._cPtr).length;
  }

  /**
      Set `length` field.
      Params:
        propval = length of @data
  */
  @property void length(long propval)
  {
    (cast(SoupMessageBody*)this._cPtr).length = propval;
  }

  /**
      Creates a new #SoupMessageBody.
      
      `classMessage` uses this internally; you
      will not normally need to call it yourself.
      Returns: a new #SoupMessageBody.
  */
  this()
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
  void appendBytes(glib.bytes.Bytes buffer)
  {
    soup_message_body_append_bytes(cast(SoupMessageBody*)this._cPtr, buffer ? cast(GBytes*)buffer._cPtr(No.Dup) : null);
  }

  /**
      Tags body as being complete.
      
      Call this when using chunked encoding after you have appended the last chunk.
  */
  void complete()
  {
    soup_message_body_complete(cast(SoupMessageBody*)this._cPtr);
  }

  /**
      Fills in body's data field with a buffer containing all of the
      data in body.
      
      Adds an additional `\0` byte not counted by body's
      length field.
      Returns: a #GBytes containing the same data as body.
          (You must [glib.bytes.Bytes.unref] this if you do not want it.)
  */
  glib.bytes.Bytes flatten()
  {
    GBytes* _cretval;
    _cretval = soup_message_body_flatten(cast(SoupMessageBody*)this._cPtr);
    auto _retval = _cretval ? new glib.bytes.Bytes(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets the accumulate flag on body.
      
      See [methodMessageBody.set_accumulate. for details.
      Returns: the accumulate flag for body.
  */
  bool getAccumulate()
  {
    bool _retval;
    _retval = cast(bool)soup_message_body_get_accumulate(cast(SoupMessageBody*)this._cPtr);
    return _retval;
  }

  /**
      Gets a [glib.bytes.Bytes] containing data from body starting at offset.
      
      The size of the returned chunk is unspecified. You can iterate
      through the entire body by first calling
      [soup.message_body.MessageBody.getChunk] with an offset of 0, and then on each
      successive call, increment the offset by the length of the
      previously-returned chunk.
      
      If offset is greater than or equal to the total length of body,
      then the return value depends on whether or not
      [soup.message_body.MessageBody.complete] has been called or not; if it has,
      then [soup.message_body.MessageBody.getChunk] will return a 0-length chunk
      (indicating the end of body). If it has not, then
      [soup.message_body.MessageBody.getChunk] will return null (indicating that
      body may still potentially have more data, but that data is not
      currently available).
  
      Params:
        offset = an offset
      Returns: a #GBytes
  */
  glib.bytes.Bytes getChunk(long offset)
  {
    GBytes* _cretval;
    _cretval = soup_message_body_get_chunk(cast(SoupMessageBody*)this._cPtr, offset);
    auto _retval = _cretval ? new glib.bytes.Bytes(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Handles the #SoupMessageBody part of receiving a chunk of data from
      the network.
      
      Normally this means appending chunk to body, exactly as with
      [soup.message_body.MessageBody.appendBytes], but if you have set body's accumulate
      flag to false, then that will not happen.
      
      This is a low-level method which you should not normally need to
      use.
  
      Params:
        chunk = a #GBytes received from the network
  */
  void gotChunk(glib.bytes.Bytes chunk)
  {
    soup_message_body_got_chunk(cast(SoupMessageBody*)this._cPtr, chunk ? cast(GBytes*)chunk._cPtr(No.Dup) : null);
  }

  /**
      Sets or clears the accumulate flag on body.
      
      (The default value is true.) If set to false, body's data field will not
      be filled in after the body is fully sent/received, and the chunks that make
      up body may be discarded when they are no longer needed.
      
      If you set the flag to false on the `classMessage` request_body of a
      client-side message, it will block the accumulation of chunks into
      body's data field, but it will not normally cause the chunks to
      be discarded after being written like in the server-side
      `classMessage` response_body case, because the request body needs to
      be kept around in case the request needs to be sent a second time
      due to redirection or authentication.
  
      Params:
        accumulate = whether or not to accumulate body chunks in body
  */
  void setAccumulate(bool accumulate)
  {
    soup_message_body_set_accumulate(cast(SoupMessageBody*)this._cPtr, accumulate);
  }

  /**
      Deletes all of the data in body.
  */
  void truncate()
  {
    soup_message_body_truncate(cast(SoupMessageBody*)this._cPtr);
  }

  /**
      Handles the #SoupMessageBody part of writing a chunk of data to the
      network.
      
      Normally this is a no-op, but if you have set body's accumulate flag to
      false, then this will cause chunk to be discarded to free up memory.
      
      This is a low-level method which you should not need to use, and
      there are further restrictions on its proper use which are not
      documented here.
  
      Params:
        chunk = a #GBytes returned from [soup.message_body.MessageBody.getChunk]
  */
  void wroteChunk(glib.bytes.Bytes chunk)
  {
    soup_message_body_wrote_chunk(cast(SoupMessageBody*)this._cPtr, chunk ? cast(GBytes*)chunk._cPtr(No.Dup) : null);
  }
}
