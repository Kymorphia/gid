/// Module for [PollableOutputStream] interface mixin
module gid.gio2.pollable_output_stream_mixin;

public import gid.core.basictypes;
public import gid.gio2.pollable_output_stream_iface_proxy;
public import gid.core.utils;
public import gid.gio2.c.functions;
public import gid.gio2.c.types;
public import gid.gio2.cancellable;
public import gid.gio2.types;
public import gid.glib2.error;
public import gid.glib2.source;
public import gid.gobject2.c.functions;
public import gid.gobject2.c.types;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;

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
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncCanPoll`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncCanPoll()
  {
    auto _klass = cast(GPollableOutputStreamInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.pollable_output_stream.PollableOutputStream._getGType);
    if (!_klass || !_klass.canPoll)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.canPoll(cast(GPollableOutputStream*)this._cPtr);
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
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncCreateSource`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.glib2.source.Source vfuncCreateSource(gid.gio2.cancellable.Cancellable cancellable = null)
  {
    auto _klass = cast(GPollableOutputStreamInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.pollable_output_stream.PollableOutputStream._getGType);
    if (!_klass || !_klass.createSource)
      return typeof(return).init;

    GSource* _cretval;
    _cretval = _klass.createSource(cast(GPollableOutputStream*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null);
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
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncIsWritable`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncIsWritable()
  {
    auto _klass = cast(GPollableOutputStreamInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.pollable_output_stream.PollableOutputStream._getGType);
    if (!_klass || !_klass.isWritable)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.isWritable(cast(GPollableOutputStream*)this._cPtr);
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
      Returns: the number of bytes written, or -1 on error (including
          [gid.gio2.types.IOErrorEnum.WouldBlock]).
      Throws: [ErrorWrap]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncWriteNonblocking`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected ptrdiff_t vfuncWriteNonblocking(ubyte[] buffer = null)
  {
    auto _klass = cast(GPollableOutputStreamInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.pollable_output_stream.PollableOutputStream._getGType);
    if (!_klass || !_klass.writeNonblocking)
      return typeof(return).init;

    ptrdiff_t _retval;
    size_t _count;
    if (buffer)
      _count = cast(size_t)buffer.length;

    auto _buffer = cast(ubyte*)buffer.ptr;
    GError *_err;
    _retval = _klass.writeNonblocking(cast(GPollableOutputStream*)this._cPtr, _buffer, _count, &_err);
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
      Returns: %G_POLLABLE_RETURN_OK on success, [gid.gio2.types.PollableReturn.WouldBlock]
        if the stream is not currently writable (and error is *not* set), or
        [gid.gio2.types.PollableReturn.Failed] if there was an error in which case error will
        be set.
      Throws: [ErrorWrap]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncWritevNonblocking`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gio2.types.PollableReturn vfuncWritevNonblocking(gid.gio2.types.OutputVector[] vectors, out size_t bytesWritten)
  {
    auto _klass = cast(GPollableOutputStreamInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.pollable_output_stream.PollableOutputStream._getGType);
    if (!_klass || !_klass.writevNonblocking)
      return typeof(return).init;

    GPollableReturn _cretval;
    size_t _nVectors;
    if (vectors)
      _nVectors = cast(size_t)vectors.length;

    auto _vectors = cast(GOutputVector*)vectors.ptr;
    GError *_err;
    _cretval = _klass.writevNonblocking(cast(GPollableOutputStream*)this._cPtr, _vectors, _nVectors, cast(size_t*)&bytesWritten, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    gid.gio2.types.PollableReturn _retval = cast(gid.gio2.types.PollableReturn)_cretval;
    return _retval;
  }

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

  /// True if the D class T overrides any vfunc method of gid.gio2.pollable_output_stream.PollableOutputStream (DiG)
  enum bool _ifaceVfuncsOverridden_gid_gio2_pollable_output_stream_PollableOutputStream(T) = !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncCanPoll", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncCreateSource", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncIsWritable", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncWriteNonblocking", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncWritevNonblocking", true)[0], gid.gobject2.object.GidIfaceVfunc);

  /**
      Install the C trampolines of the gid.gio2.pollable_output_stream.PollableOutputStream vfunc methods which a D class overrides into the interface
      structure of its GType (DiG, see gobject.object.GObjectSubclass). Overriding a vfunc method which has no
      trampoline is a compile error.
      Params:
        T = D class
        iface = Interface structure of the GType registered for T
  */
  static void _installIfaceVfuncs_gid_gio2_pollable_output_stream_PollableOutputStream(T)(void* iface) nothrow
  {
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncCanPoll", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_pollable_output_stream_PollableOutputStream(iface, "can_poll");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncCreateSource", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_pollable_output_stream_PollableOutputStream(iface, "create_source");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncIsWritable", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_pollable_output_stream_PollableOutputStream(iface, "is_writable");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncWriteNonblocking", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_pollable_output_stream_PollableOutputStream(iface, "write_nonblocking");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncWritevNonblocking", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_pollable_output_stream_PollableOutputStream(iface, "writev_nonblocking");
  }

  private static void _installIfaceVfunc_gid_gio2_pollable_output_stream_PollableOutputStream(void* iface, string vfunc) nothrow
  {
    auto _klass = cast(GPollableOutputStreamInterface*)iface;

    switch (vfunc)
    {
      case "can_poll":
      {
        static extern(C) gboolean _vfuncCanPollTramp(GPollableOutputStream* stream) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)stream);
          if (!_obj)
          {
            auto _klass = cast(GPollableOutputStreamInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)stream), gid.gio2.pollable_output_stream.PollableOutputStream._getGType);
            if (_klass && _klass.canPoll)
              return (cast(typeof(&_vfuncCanPollTramp))_klass.canPoll)(stream);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncCanPoll();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.pollable_output_stream.PollableOutputStream.vfuncCanPoll");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.canPoll = cast(typeof(_klass.canPoll))&_vfuncCanPollTramp;
        break;
      }
      case "create_source":
      {
        static extern(C) GSource* _vfuncCreateSourceTramp(GPollableOutputStream* stream, GCancellable* cancellable) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)stream);
          if (!_obj)
          {
            auto _klass = cast(GPollableOutputStreamInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)stream), gid.gio2.pollable_output_stream.PollableOutputStream._getGType);
            if (_klass && _klass.createSource)
              return (cast(typeof(&_vfuncCreateSourceTramp))_klass.createSource)(stream, cancellable);
            return typeof(return).init;
          }

          gid.glib2.source.Source _dretval;

          try
          {
            _dretval = _obj.vfuncCreateSource(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.cancellable.Cancellable)(cast(void*)cancellable, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.pollable_output_stream.PollableOutputStream.vfuncCreateSource");
          }
          auto _retval = _dretval ? cast(GSource*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.createSource = cast(typeof(_klass.createSource))&_vfuncCreateSourceTramp;
        break;
      }
      case "is_writable":
      {
        static extern(C) gboolean _vfuncIsWritableTramp(GPollableOutputStream* stream) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)stream);
          if (!_obj)
          {
            auto _klass = cast(GPollableOutputStreamInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)stream), gid.gio2.pollable_output_stream.PollableOutputStream._getGType);
            if (_klass && _klass.isWritable)
              return (cast(typeof(&_vfuncIsWritableTramp))_klass.isWritable)(stream);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncIsWritable();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.pollable_output_stream.PollableOutputStream.vfuncIsWritable");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.isWritable = cast(typeof(_klass.isWritable))&_vfuncIsWritableTramp;
        break;
      }
      case "write_nonblocking":
      {
        static extern(C) ptrdiff_t _vfuncWriteNonblockingTramp(GPollableOutputStream* stream, void* buffer, size_t count, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)stream);
          if (!_obj)
          {
            auto _klass = cast(GPollableOutputStreamInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)stream), gid.gio2.pollable_output_stream.PollableOutputStream._getGType);
            if (_klass && _klass.writeNonblocking)
              return (cast(typeof(&_vfuncWriteNonblockingTramp))_klass.writeNonblocking)(stream, buffer, count, _err);
            return typeof(return).init;
          }

          ptrdiff_t _retval;
          ubyte[] _buffer;
          _buffer.length = count;
          _buffer[0 .. count] = (cast(const(ubyte)*)buffer)[0 .. count];

          try
          {
            _retval = _obj.vfuncWriteNonblocking(_buffer);
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          return _retval;
        }

        _klass.writeNonblocking = cast(typeof(_klass.writeNonblocking))&_vfuncWriteNonblockingTramp;
        break;
      }
      case "writev_nonblocking":
      {
        static extern(C) GPollableReturn _vfuncWritevNonblockingTramp(GPollableOutputStream* stream, const(GOutputVector)* vectors, size_t nVectors, size_t* bytesWritten, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)stream);
          if (!_obj)
          {
            auto _klass = cast(GPollableOutputStreamInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)stream), gid.gio2.pollable_output_stream.PollableOutputStream._getGType);
            if (_klass && _klass.writevNonblocking)
              return (cast(typeof(&_vfuncWritevNonblockingTramp))_klass.writevNonblocking)(stream, vectors, nVectors, bytesWritten, _err);
            return typeof(return).init;
          }

          typeof(*bytesWritten) _bytesWrittenNull;
          if (!bytesWritten)
            bytesWritten = &_bytesWrittenNull;

          gid.gio2.types.PollableReturn _dretval;
          gid.gio2.types.OutputVector[] _vectors;
          _vectors.length = nVectors;
          _vectors[0 .. nVectors] = vectors[0 .. nVectors];

          try
          {
            _dretval = _obj.vfuncWritevNonblocking(_vectors, *bytesWritten);
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = cast(GPollableReturn)_dretval;

          return _retval;
        }

        _klass.writevNonblocking = cast(typeof(_klass.writevNonblocking))&_vfuncWritevNonblockingTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gio2.pollable_output_stream.PollableOutputStream]
template PollableOutputStreamGidBuilderT()
{
}
