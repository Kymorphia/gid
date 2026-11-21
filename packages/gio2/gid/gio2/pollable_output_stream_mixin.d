/// Module for [PollableOutputStream] interface mixin
module gid.gio2.pollable_output_stream_mixin;

public import gid.core.basictypes;
public import gid.gio2.pollable_output_stream_iface_proxy;
public import gid.core.gid;
public import gid.gio2.c.functions;
public import gid.gio2.c.types;
public import gid.gio2.cancellable;
public import gid.gio2.types;
public import gid.glib2.error;
public import gid.glib2.source;
public import gid.gobject2.gid_builder;

/**
    [gid.gio2.pollable_output_stream.PollableOutputStream] is implemented by [gid.gio2.output_stream.OutputStream]s that
    can be polled for readiness to write. This can be used when
    interfacing with a non-GIO API that expects
    UNIX-file-descriptor-style asynchronous I/O rather than GIO-style.
    
    Some classes may implement [gid.gio2.pollable_output_stream.PollableOutputStream] but have only certain
    instances of that class be pollable. If [gid.gio2.pollable_output_stream.PollableOutputStream.canPoll]
    returns false, then the behavior of other [gid.gio2.pollable_output_stream.PollableOutputStream] methods is
    undefined.
*/
template PollableOutputStreamT()
{

  /**
      Checks if stream is actually pollable. Some classes may implement
      #GPollableOutputStream but have only certain instances of that
      class be pollable. If this method returns false, then the behavior
      of other #GPollableOutputStream methods is undefined.
      
      For any given stream, the value returned by this method is constant;
      a stream cannot switch from pollable to non-pollable or vice versa.
      Returns: true if stream is pollable, false if not.
  */
  override bool canPoll() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_pollable_output_stream_can_poll(cast(GPollableOutputStream*)this._cPtr);
    return _retval;
  }

  /**
      Creates a #GSource that triggers when stream can be written, or
      cancellable is triggered or an error occurs. The callback on the
      source is of the #GPollableSourceFunc type.
      
      As with [gid.gio2.pollable_output_stream.PollableOutputStream.isWritable], it is possible that
      the stream may not actually be writable even after the source
      triggers, so you should use [gid.gio2.pollable_output_stream.PollableOutputStream.writeNonblocking]
      rather than [gid.gio2.output_stream.OutputStream.write] from the callback.
      
      The behaviour of this method is undefined if
      [gid.gio2.pollable_output_stream.PollableOutputStream.canPoll] returns false for stream.
  
      Params:
        cancellable = a #GCancellable, or null
      Returns: a new #GSource
  */
  override gid.glib2.source.Source createSource(gid.gio2.cancellable.Cancellable cancellable = null) nothrow
  {
    GSource* _cretval;
    _cretval = g_pollable_output_stream_create_source(cast(GPollableOutputStream*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gid.glib2.source.Source(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Checks if stream can be written.
      
      Note that some stream types may not be able to implement this 100%
      reliably, and it is possible that a call to [gid.gio2.output_stream.OutputStream.write]
      after this returns true would still block. To guarantee
      non-blocking behavior, you should always use
      [gid.gio2.pollable_output_stream.PollableOutputStream.writeNonblocking], which will return a
      [gid.gio2.types.IOErrorEnum.WouldBlock] error rather than blocking.
      
      The behaviour of this method is undefined if
      [gid.gio2.pollable_output_stream.PollableOutputStream.canPoll] returns false for stream.
      Returns: true if stream is writable, false if not. If an error
          has occurred on stream, this will result in
          [gid.gio2.pollable_output_stream.PollableOutputStream.isWritable] returning true, and the
          next attempt to write will return the error.
  */
  override bool isWritable() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_pollable_output_stream_is_writable(cast(GPollableOutputStream*)this._cPtr);
    return _retval;
  }

  /**
      Attempts to write up to count bytes from buffer to stream, as
      with [gid.gio2.output_stream.OutputStream.write]. If stream is not currently writable,
      this will immediately return [gid.gio2.types.IOErrorEnum.WouldBlock], and you can
      use [gid.gio2.pollable_output_stream.PollableOutputStream.createSource] to create a #GSource
      that will be triggered when stream is writable.
      
      Note that since this method never blocks, you cannot actually
      use cancellable to cancel it. However, it will return an error
      if cancellable has already been cancelled when you call, which
      may happen if you call this method after a source triggers due
      to having been cancelled.
      
      Also note that if [gid.gio2.types.IOErrorEnum.WouldBlock] is returned some underlying
      transports like D/TLS require that you re-send the same buffer and
      count in the next write call.
      
      The behaviour of this method is undefined if
      [gid.gio2.pollable_output_stream.PollableOutputStream.canPoll] returns false for stream.
  
      Params:
        buffer = a buffer to write
              data from
        cancellable = a #GCancellable, or null
      Returns: the number of bytes written, or -1 on error (including
          [gid.gio2.types.IOErrorEnum.WouldBlock]).
      Throws: [ErrorWrap]
  */
  override ptrdiff_t writeNonblocking(ubyte[] buffer, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    ptrdiff_t _retval;
    size_t _count;
    if (buffer)
      _count = cast(size_t)buffer.length;

    auto _buffer = cast(ubyte*)buffer.ptr;
    GError *_err;
    _retval = g_pollable_output_stream_write_nonblocking(cast(GPollableOutputStream*)this._cPtr, _buffer, _count, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Attempts to write the bytes contained in the n_vectors vectors to stream,
      as with [gid.gio2.output_stream.OutputStream.writev]. If stream is not currently writable,
      this will immediately return %G_POLLABLE_RETURN_WOULD_BLOCK, and you can
      use [gid.gio2.pollable_output_stream.PollableOutputStream.createSource] to create a #GSource
      that will be triggered when stream is writable. error will *not* be
      set in that case.
      
      Note that since this method never blocks, you cannot actually
      use cancellable to cancel it. However, it will return an error
      if cancellable has already been cancelled when you call, which
      may happen if you call this method after a source triggers due
      to having been cancelled.
      
      Also note that if [gid.gio2.types.PollableReturn.WouldBlock] is returned some underlying
      transports like D/TLS require that you re-send the same vectors and
      n_vectors in the next write call.
      
      The behaviour of this method is undefined if
      [gid.gio2.pollable_output_stream.PollableOutputStream.canPoll] returns false for stream.
  
      Params:
        vectors = the buffer containing the #GOutputVectors to write.
        bytesWritten = location to store the number of bytes that were
              written to the stream
        cancellable = a #GCancellable, or null
      Returns: %G_POLLABLE_RETURN_OK on success, [gid.gio2.types.PollableReturn.WouldBlock]
        if the stream is not currently writable (and error is *not* set), or
        [gid.gio2.types.PollableReturn.Failed] if there was an error in which case error will
        be set.
      Throws: [ErrorWrap]
  */
  override gid.gio2.types.PollableReturn writevNonblocking(gid.gio2.types.OutputVector[] vectors, out size_t bytesWritten, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    GPollableReturn _cretval;
    size_t _nVectors;
    if (vectors)
      _nVectors = cast(size_t)vectors.length;

    auto _vectors = cast(GOutputVector*)vectors.ptr;
    GError *_err;
    _cretval = g_pollable_output_stream_writev_nonblocking(cast(GPollableOutputStream*)this._cPtr, _vectors, _nVectors, cast(size_t*)&bytesWritten, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    gid.gio2.types.PollableReturn _retval = cast(gid.gio2.types.PollableReturn)_cretval;
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gio2.pollable_output_stream.PollableOutputStream]
template PollableOutputStreamGidBuilderT()
{
}
